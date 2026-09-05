-- Ṛtam — contributor edit suggestions, live open/closed status reports,
-- and profile pictures.
--
-- Three additions, all following the existing crowdsourcing model
-- (submit as an authenticated, non-banned user; a moderator/admin has the
-- final say; contribution_points are only ever awarded by a trigger):
--
--   1. temple_edit_suggestions — until now there was no way for anyone but
--      the original submitter (and only before/after their own temple was
--      approved) to correct so much as a typo on a live temple. This table
--      holds a proposed patch (`changes`, a jsonb object whose keys are
--      always restricted client-side to a fixed allowlist of editable
--      Temple columns — see src/constants/editableTempleFields.ts) against
--      an already-approved temple. A moderator applies it or rejects it;
--      nothing here writes to the live `temples` row directly.
--
--   2. temple_status_reports — a lightweight time series of "a visitor says
--      this temple is open/closed right now", since the existing
--      morning/evening timing columns are static schedule data, not a live
--      signal. One report per person per temple per IST calendar day, so
--      the same visitor can't flood the feed.
--
--   3. user_profiles.avatar_url — profile pictures, uploaded to a new
--      `avatars` storage bucket, one folder per user.

-- ── avatars ──────────────────────────────────────────────────────────────

alter table public.user_profiles
  add column if not exists avatar_url text;

insert into storage.buckets (id, name, public)
values ('avatars', 'avatars', true)
on conflict (id) do nothing;

create policy "Avatar files are publicly readable"
  on storage.objects for select
  using (bucket_id = 'avatars');

create policy "Users can upload their own avatar file"
  on storage.objects for insert
  to authenticated
  with check (
    bucket_id = 'avatars'
    and (storage.foldername(name))[1] = auth.uid()::text
    and not public.is_banned()
  );

create policy "Users can replace their own avatar file"
  on storage.objects for update
  to authenticated
  using (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text)
  with check (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text);

create policy "Users can delete their own avatar file"
  on storage.objects for delete
  to authenticated
  using (bucket_id = 'avatars' and (storage.foldername(name))[1] = auth.uid()::text);

-- ── temple_edit_suggestions ──────────────────────────────────────────────

create table public.temple_edit_suggestions (
  id uuid primary key default gen_random_uuid(),
  temple_id uuid not null references public.temples(id) on delete cascade,
  submitted_by uuid not null references public.user_profiles(id) on delete cascade,
  changes jsonb not null,
  note text,
  status public.submission_status not null default 'pending',
  moderator_note text,
  reviewed_by uuid references public.user_profiles(id),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index temple_edit_suggestions_temple_id_idx on public.temple_edit_suggestions (temple_id);
create index temple_edit_suggestions_status_idx on public.temple_edit_suggestions (status);
create index temple_edit_suggestions_submitted_by_idx on public.temple_edit_suggestions (submitted_by);

create trigger set_updated_at before update on public.temple_edit_suggestions
  for each row execute function public.set_updated_at();

alter table public.temple_edit_suggestions enable row level security;

create policy "Contributors can read their own edit suggestions"
  on public.temple_edit_suggestions for select
  using (submitted_by = auth.uid() or public.is_moderator());

create policy "Authenticated users can suggest edits to approved temples"
  on public.temple_edit_suggestions for insert
  to authenticated
  with check (
    submitted_by = auth.uid()
    and status = 'pending'
    and not public.is_banned()
    and exists (select 1 from public.temples t where t.id = temple_id and t.status = 'approved')
  );

create policy "Owners can withdraw their own pending edit suggestions"
  on public.temple_edit_suggestions for delete
  using (submitted_by = auth.uid() and status = 'pending');

create policy "Moderators can review any edit suggestion"
  on public.temple_edit_suggestions for update
  using (public.is_moderator())
  with check (public.is_moderator());

create policy "Moderators can delete any edit suggestion"
  on public.temple_edit_suggestions for delete
  using (public.is_moderator());

grant select, insert, update, delete on public.temple_edit_suggestions to authenticated;

-- +10 when a suggestion is accepted (and -10 if a moderator ever reverses
-- that), mirroring the temple-approval points pattern but weighted lower
-- since a suggestion touches one existing temple rather than documenting
-- a whole new one.
create or replace function public.points_on_edit_suggestion()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if new.status = 'approved' and old.status is distinct from 'approved' then
    perform public.award_points(new.submitted_by, 10);
  elsif old.status = 'approved' and new.status is distinct from 'approved' then
    perform public.award_points(new.submitted_by, -10);
  end if;
  return new;
end;
$$;

create trigger edit_suggestion_points
  after update of status on public.temple_edit_suggestions
  for each row execute function public.points_on_edit_suggestion();

-- ── temple_status_reports ────────────────────────────────────────────────

create table public.temple_status_reports (
  id uuid primary key default gen_random_uuid(),
  temple_id uuid not null references public.temples(id) on delete cascade,
  reported_by uuid not null references public.user_profiles(id) on delete cascade,
  is_open boolean not null,
  note text,
  created_at timestamptz not null default now(),
  -- IST calendar day, since every temple here is in India — used to cap
  -- reports at one per person per temple per day regardless of which UTC
  -- day now() happens to fall on near midnight.
  report_date date generated always as ((created_at at time zone 'Asia/Kolkata')::date) stored
);

create unique index temple_status_reports_one_per_day
  on public.temple_status_reports (temple_id, reported_by, report_date);

create index temple_status_reports_temple_id_idx
  on public.temple_status_reports (temple_id, created_at desc);

alter table public.temple_status_reports enable row level security;

create policy "Status reports on visible temples are publicly readable"
  on public.temple_status_reports for select
  using (
    exists (
      select 1 from public.temples t
      where t.id = temple_id
        and (t.status = 'approved' or t.submitted_by = auth.uid() or public.is_moderator())
    )
  );

create policy "Authenticated users can report a temple's live status"
  on public.temple_status_reports for insert
  to authenticated
  with check (
    reported_by = auth.uid()
    and not public.is_banned()
    and exists (select 1 from public.temples t where t.id = temple_id and t.status = 'approved')
  );

create policy "Reporters can delete their own status reports"
  on public.temple_status_reports for delete
  using (reported_by = auth.uid());

create policy "Moderators can delete any status report"
  on public.temple_status_reports for delete
  using (public.is_moderator());

grant select, insert, delete on public.temple_status_reports to anon, authenticated;

-- +1 for checking a temple's status in — small and quick, so weighted
-- accordingly. Insert/delete only (reports are point-in-time facts, never
-- edited), so no separate "un-award" transition to handle beyond delete.
create or replace function public.points_on_status_report()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if tg_op = 'INSERT' then
    perform public.award_points(new.reported_by, 1);
  elsif tg_op = 'DELETE' then
    perform public.award_points(old.reported_by, -1);
  end if;
  return null;
end;
$$;

create trigger status_report_points
  after insert or delete on public.temple_status_reports
  for each row execute function public.points_on_status_report();
