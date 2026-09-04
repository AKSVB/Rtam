-- Ṛtam — in-app user management for admins
--
-- Two things were missing: a way for an admin to change someone else's
-- role (the existing self-update policy only ever let a user touch their
-- own row), and a way to stop a problem account from contributing without
-- needing the Supabase dashboard's service-role access to actually delete
-- an auth.users row. This adds a soft "banned_at" flag instead of true
-- deletion — reversible, and doesn't orphan or destroy anything the person
-- already contributed (their temples/photos stay live, just unattributed
-- if the profile is later removed by other means).

alter table public.user_profiles
  add column if not exists banned_at timestamptz;

comment on column public.user_profiles.banned_at is
  'When set, the account is signed out on next load and blocked from all writes. Set/cleared by admins only.';

create or replace function public.is_admin()
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select exists (
    select 1 from public.user_profiles
    where id = auth.uid() and role = 'admin'
  );
$$;

create or replace function public.is_banned()
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select exists (
    select 1 from public.user_profiles
    where id = auth.uid() and banned_at is not null
  );
$$;

-- The existing "Users can update their own profile" policy only matches
-- auth.uid() = id, so an admin editing a *different* user's role/ban status
-- was invisible to RLS regardless of what the guard trigger allowed.
create policy "Admins can update any profile"
  on public.user_profiles for update
  to authenticated
  using (public.is_admin())
  with check (public.is_admin());

-- ── block writes from banned accounts (defense in depth) ─────────────────
-- The client signs a banned user out as soon as it notices banned_at, but
-- RLS is what actually stops a stale session (e.g. an already-open tab)
-- from writing anything in the meantime.

drop policy if exists "Authenticated users can submit temples" on public.temples;
create policy "Authenticated users can submit temples"
  on public.temples for insert
  to authenticated
  with check (submitted_by = auth.uid() and status = 'pending' and not public.is_banned());

drop policy if exists "Owners can edit their own pending or rejected temples" on public.temples;
create policy "Owners can edit their own pending or rejected temples"
  on public.temples for update
  using (submitted_by = auth.uid() and status in ('pending', 'rejected'))
  with check (submitted_by = auth.uid() and status = 'pending' and not public.is_banned());

drop policy if exists "Authenticated users can submit stays" on public.temple_stays;
create policy "Authenticated users can submit stays"
  on public.temple_stays for insert
  to authenticated
  with check (submitted_by = auth.uid() and status = 'pending' and not public.is_banned());

drop policy if exists "Authenticated users can upload photos" on public.temple_photos;
create policy "Authenticated users can upload photos"
  on public.temple_photos for insert
  to authenticated
  with check (uploaded_by = auth.uid() and not public.is_banned());

drop policy if exists "Authenticated users can add reviews" on public.temple_reviews;
create policy "Authenticated users can add reviews"
  on public.temple_reviews for insert
  to authenticated
  with check (user_id = auth.uid() and not public.is_banned());

drop policy if exists "Users can edit their own reviews" on public.temple_reviews;
create policy "Users can edit their own reviews"
  on public.temple_reviews for update
  using (user_id = auth.uid())
  with check (user_id = auth.uid() and not public.is_banned());

drop policy if exists "Authenticated users can upload temple photo files" on storage.objects;
create policy "Authenticated users can upload temple photo files"
  on storage.objects for insert
  to authenticated
  with check (bucket_id = 'temple-photos' and not public.is_banned());
