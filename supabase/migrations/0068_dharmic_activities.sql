-- Ṛtam — Samishti Sandhyavandanam proposals + a general dharmic-activities
-- feed (pravachanams, anugraha bhashanams, utsavams...). Both live in one
-- table since they're the same shape (a dated happening at a place, with
-- an "interested" count) and only differ by activity_type — a dedicated
-- page filters to samishti_sandhyavandanam for the focused propose/upvote
-- flow, while a general feed page shows every type sorted by date/
-- proximity.
--
-- Follows the existing crowdsourcing model exactly: any authenticated,
-- non-banned member can submit; a moderator has final say; points only
-- ever move through award_points(). Not wired to any external listing
-- service — every row here comes from a person, the same as every other
-- table in this schema.

create table public.dharmic_activities (
  id uuid primary key default gen_random_uuid(),
  activity_type text not null check (
    activity_type in (
      'samishti_sandhyavandanam',
      'pravachanam',
      'anugraha_bhashanam',
      'bhajan_utsavam',
      'other'
    )
  ),
  title text not null,
  speaker_name text,
  -- Samishti Sandhyavandanam always happens at a listed temple. Other
  -- activity types may cite one too, or a freeform venue instead — either
  -- way latitude/longitude/state/town are always populated directly
  -- (copied from the temple at submission time, or entered by hand) so
  -- every row can be proximity-sorted with no join required.
  temple_id uuid references public.temples(id) on delete cascade,
  venue_name text,
  latitude double precision not null,
  longitude double precision not null,
  state text not null,
  town text not null,
  activity_date date not null,
  activity_time time,
  description text,
  source_url text,
  submitted_by uuid not null references public.user_profiles(id) on delete cascade,
  status public.submission_status not null default 'pending',
  moderator_note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint dharmic_activity_needs_temple check (
    activity_type <> 'samishti_sandhyavandanam' or temple_id is not null
  )
);

create index dharmic_activities_status_idx on public.dharmic_activities (status);
create index dharmic_activities_type_idx on public.dharmic_activities (activity_type);
create index dharmic_activities_date_idx on public.dharmic_activities (activity_date);
create index dharmic_activities_temple_id_idx on public.dharmic_activities (temple_id);

create trigger set_updated_at before update on public.dharmic_activities
  for each row execute function public.set_updated_at();

alter table public.dharmic_activities enable row level security;

create policy "Approved activities are public, own/pending visible to owner and mods"
  on public.dharmic_activities for select
  using (status = 'approved' or submitted_by = auth.uid() or public.is_moderator());

create policy "Authenticated users can propose a dharmic activity"
  on public.dharmic_activities for insert
  to authenticated
  with check (submitted_by = auth.uid() and status = 'pending' and not public.is_banned());

create policy "Owners can edit their own pending activity"
  on public.dharmic_activities for update
  using (submitted_by = auth.uid() and status = 'pending')
  with check (submitted_by = auth.uid() and status = 'pending');

create policy "Moderators can review any activity"
  on public.dharmic_activities for update
  using (public.is_moderator())
  with check (public.is_moderator());

create policy "Owners can withdraw their own pending activity"
  on public.dharmic_activities for delete
  using (submitted_by = auth.uid() and status = 'pending');

create policy "Moderators can delete any activity"
  on public.dharmic_activities for delete
  using (public.is_moderator());

grant select, insert, update, delete on public.dharmic_activities to authenticated;
grant select on public.dharmic_activities to anon;

-- +15 for a Samishti Sandhyavandanam proposal (organising a group gathering
-- is more effort than posting an announcement), +8 for any other activity
-- type — mirrors the weighted-points pattern in points_on_edit_suggestion.
create or replace function public.points_on_dharmic_activity()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  pts int := case when new.activity_type = 'samishti_sandhyavandanam' then 15 else 8 end;
begin
  if new.status = 'approved' and old.status is distinct from 'approved' then
    perform public.award_points(new.submitted_by, pts);
  elsif old.status = 'approved' and new.status is distinct from 'approved' then
    perform public.award_points(new.submitted_by, -pts);
  end if;
  return new;
end;
$$;

create trigger dharmic_activity_points
  after update of status on public.dharmic_activities
  for each row execute function public.points_on_dharmic_activity();

-- ── interest / upvotes ──────────────────────────────────────────────────

create table public.dharmic_activity_votes (
  activity_id uuid not null references public.dharmic_activities(id) on delete cascade,
  user_id uuid not null references public.user_profiles(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (activity_id, user_id)
);

create index dharmic_activity_votes_activity_id_idx on public.dharmic_activity_votes (activity_id);

alter table public.dharmic_activity_votes enable row level security;

-- Kept narrower than the activities table itself: a vote pairs a person
-- with what they're interested in, so only the voter (or a moderator) can
-- read the raw row. Everyone else sees only the aggregate count, via the
-- view below.
create policy "Users can see their own votes, moderators any"
  on public.dharmic_activity_votes for select
  using (user_id = auth.uid() or public.is_moderator());

create policy "Authenticated users can mark interest in an approved activity"
  on public.dharmic_activity_votes for insert
  to authenticated
  with check (
    user_id = auth.uid()
    and not public.is_banned()
    and exists (select 1 from public.dharmic_activities a where a.id = activity_id and a.status = 'approved')
  );

create policy "Users can remove their own vote"
  on public.dharmic_activity_votes for delete
  using (user_id = auth.uid());

grant select, insert, delete on public.dharmic_activity_votes to authenticated;

create view public.dharmic_activity_vote_counts as
  select activity_id, count(*)::int as votes_count
  from public.dharmic_activity_votes
  group by activity_id;

grant select on public.dharmic_activity_vote_counts to anon, authenticated;
