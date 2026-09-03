-- Ṛtam — Row Level Security policies

alter table public.user_profiles enable row level security;
alter table public.temples enable row level security;
alter table public.temple_stays enable row level security;
alter table public.temple_photos enable row level security;
alter table public.temple_reviews enable row level security;
alter table public.trip_lists enable row level security;

-- ── helper: is the current user a moderator or admin? ──────────────────

create or replace function public.is_moderator()
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select exists (
    select 1 from public.user_profiles
    where id = auth.uid() and role in ('moderator', 'admin')
  );
$$;

-- ── user_profiles ────────────────────────────────────────────────────────

create policy "Profiles are publicly readable"
  on public.user_profiles for select
  using (true);

create policy "Users can update their own profile"
  on public.user_profiles for update
  using (auth.uid() = id)
  with check (auth.uid() = id and role = 'member');
  -- role changes must go through an admin using the service role; members
  -- cannot self-promote via the public update policy above.

-- ── temples ──────────────────────────────────────────────────────────────

create policy "Approved temples are publicly readable"
  on public.temples for select
  using (
    status = 'approved'
    or submitted_by = auth.uid()
    or public.is_moderator()
  );

create policy "Authenticated users can submit temples"
  on public.temples for insert
  to authenticated
  with check (submitted_by = auth.uid() and status = 'pending');

create policy "Owners can edit their own pending temple submissions"
  on public.temples for update
  using (submitted_by = auth.uid() and status = 'pending')
  with check (submitted_by = auth.uid() and status = 'pending');

create policy "Moderators can edit any temple"
  on public.temples for update
  using (public.is_moderator())
  with check (public.is_moderator());

create policy "Owners can delete their own pending temple submissions"
  on public.temples for delete
  using (submitted_by = auth.uid() and status = 'pending');

create policy "Moderators can delete any temple"
  on public.temples for delete
  using (public.is_moderator());

-- ── temple_stays ─────────────────────────────────────────────────────────

create policy "Approved stays are publicly readable"
  on public.temple_stays for select
  using (
    status = 'approved'
    or submitted_by = auth.uid()
    or public.is_moderator()
  );

create policy "Authenticated users can submit stays"
  on public.temple_stays for insert
  to authenticated
  with check (submitted_by = auth.uid() and status = 'pending');

create policy "Owners can edit their own pending stay submissions"
  on public.temple_stays for update
  using (submitted_by = auth.uid() and status = 'pending')
  with check (submitted_by = auth.uid() and status = 'pending');

create policy "Moderators can edit any stay"
  on public.temple_stays for update
  using (public.is_moderator())
  with check (public.is_moderator());

create policy "Owners can delete their own pending stay submissions"
  on public.temple_stays for delete
  using (submitted_by = auth.uid() and status = 'pending');

create policy "Moderators can delete any stay"
  on public.temple_stays for delete
  using (public.is_moderator());

-- ── temple_photos ────────────────────────────────────────────────────────

create policy "Photos on visible temples are publicly readable"
  on public.temple_photos for select
  using (
    exists (
      select 1 from public.temples t
      where t.id = temple_id
        and (t.status = 'approved' or t.submitted_by = auth.uid() or public.is_moderator())
    )
  );

create policy "Authenticated users can upload photos"
  on public.temple_photos for insert
  to authenticated
  with check (uploaded_by = auth.uid());

create policy "Owners can delete their own photos"
  on public.temple_photos for delete
  using (uploaded_by = auth.uid());

create policy "Moderators can delete any photo"
  on public.temple_photos for delete
  using (public.is_moderator());

-- ── temple_reviews ───────────────────────────────────────────────────────

create policy "Reviews are publicly readable"
  on public.temple_reviews for select
  using (true);

create policy "Authenticated users can add reviews"
  on public.temple_reviews for insert
  to authenticated
  with check (user_id = auth.uid());

create policy "Users can edit their own reviews"
  on public.temple_reviews for update
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

create policy "Users can delete their own reviews"
  on public.temple_reviews for delete
  using (user_id = auth.uid());

create policy "Moderators can delete any review"
  on public.temple_reviews for delete
  using (public.is_moderator());

-- ── trip_lists ───────────────────────────────────────────────────────────

create policy "Users manage their own trip lists"
  on public.trip_lists for all
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

-- ── storage: temple-photos bucket ───────────────────────────────────────
-- Run after creating a public bucket named 'temple-photos' in Supabase Storage.

insert into storage.buckets (id, name, public)
values ('temple-photos', 'temple-photos', true)
on conflict (id) do nothing;

create policy "Temple photo files are publicly readable"
  on storage.objects for select
  using (bucket_id = 'temple-photos');

create policy "Authenticated users can upload temple photo files"
  on storage.objects for insert
  to authenticated
  with check (bucket_id = 'temple-photos');

create policy "Owners can delete their own temple photo files"
  on storage.objects for delete
  to authenticated
  using (bucket_id = 'temple-photos' and owner = auth.uid());
