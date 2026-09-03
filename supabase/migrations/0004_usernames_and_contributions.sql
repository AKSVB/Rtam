-- Ṛtam — usernames + contribution recognition
--
-- Two goals:
--   1. Every contributor gets a public @username, so their work is
--      attributable and visible rather than anonymous.
--   2. contribution_points actually means something. Until now the column
--      existed but nothing ever incremented it. Points are awarded by
--      database triggers rather than client code, so they can't be forged
--      by anyone calling the API directly.

-- ── usernames ────────────────────────────────────────────────────────────

alter table public.user_profiles
  add column if not exists username text;

-- Backfill existing rows from display_name before enforcing NOT NULL.
-- Lowercase, strip anything that isn't a-z/0-9/underscore, then de-duplicate
-- by appending a counter.
do $$
declare
  profile record;
  base_name text;
  candidate text;
  suffix integer;
begin
  for profile in select id, display_name from public.user_profiles where username is null loop
    base_name := regexp_replace(lower(coalesce(profile.display_name, 'seeker')), '[^a-z0-9_]', '', 'g');
    if length(base_name) < 3 then
      base_name := 'seeker' || substr(profile.id::text, 1, 6);
    end if;
    base_name := substr(base_name, 1, 24);

    candidate := base_name;
    suffix := 1;
    while exists (select 1 from public.user_profiles where lower(username) = candidate) loop
      suffix := suffix + 1;
      candidate := substr(base_name, 1, 24 - length(suffix::text)) || suffix::text;
    end loop;

    update public.user_profiles set username = candidate where id = profile.id;
  end loop;
end $$;

alter table public.user_profiles
  alter column username set not null;

-- 3–30 chars, letters/digits/underscore only. Stored lowercase so that
-- @Ravi and @ravi can never be two different people.
alter table public.user_profiles
  add constraint user_profiles_username_format
  check (username ~ '^[a-z0-9_]{3,30}$');

create unique index if not exists user_profiles_username_key
  on public.user_profiles (username);

-- ── signup trigger: capture the username chosen at sign-up ──────────────

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  desired_username text;
  base_name text;
  candidate text;
  suffix integer := 1;
begin
  desired_username := lower(coalesce(new.raw_user_meta_data ->> 'username', ''));
  base_name := regexp_replace(desired_username, '[^a-z0-9_]', '', 'g');

  -- Fall back to the email local-part if no usable username was supplied.
  if length(base_name) < 3 then
    base_name := regexp_replace(lower(split_part(new.email, '@', 1)), '[^a-z0-9_]', '', 'g');
  end if;
  if length(base_name) < 3 then
    base_name := 'seeker' || substr(new.id::text, 1, 6);
  end if;
  base_name := substr(base_name, 1, 24);

  candidate := base_name;
  while exists (select 1 from public.user_profiles where username = candidate) loop
    suffix := suffix + 1;
    candidate := substr(base_name, 1, 24 - length(suffix::text)) || suffix::text;
  end loop;

  insert into public.user_profiles (id, display_name, username)
  values (
    new.id,
    coalesce(nullif(new.raw_user_meta_data ->> 'display_name', ''), split_part(new.email, '@', 1)),
    candidate
  );
  return new;
end;
$$;

-- ── contribution points ─────────────────────────────────────────────────
-- Awarded server-side only. Values are deliberately weighted so that a
-- fully-documented temple (the expensive contribution) outweighs a review.

create or replace function public.award_points(target_user uuid, amount integer)
returns void
language sql
security definer
set search_path = public
as $$
  update public.user_profiles
  set contribution_points = greatest(0, contribution_points + amount)
  where id = target_user;
$$;

-- +25 when a submitted temple is approved (and -25 if later un-approved,
-- so points reflect what is actually live).
create or replace function public.points_on_temple_review()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if new.submitted_by is null then
    return new;
  end if;

  if new.status = 'approved' and old.status is distinct from 'approved' then
    perform public.award_points(new.submitted_by, 25);
  elsif old.status = 'approved' and new.status is distinct from 'approved' then
    perform public.award_points(new.submitted_by, -25);
  end if;

  return new;
end;
$$;

create trigger temple_approval_points
  after update of status on public.temples
  for each row execute function public.points_on_temple_review();

-- +5 per photo
create or replace function public.points_on_photo()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if tg_op = 'INSERT' and new.uploaded_by is not null then
    perform public.award_points(new.uploaded_by, 5);
  elsif tg_op = 'DELETE' and old.uploaded_by is not null then
    perform public.award_points(old.uploaded_by, -5);
  end if;
  return null;
end;
$$;

create trigger photo_points
  after insert or delete on public.temple_photos
  for each row execute function public.points_on_photo();

-- +3 per review
create or replace function public.points_on_review()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if tg_op = 'INSERT' then
    perform public.award_points(new.user_id, 3);
  elsif tg_op = 'DELETE' then
    perform public.award_points(old.user_id, -3);
  end if;
  return null;
end;
$$;

create trigger review_points
  after insert or delete on public.temple_reviews
  for each row execute function public.points_on_review();

-- ── backfill points for anything already contributed ────────────────────

update public.user_profiles p
set contribution_points =
  coalesce((select count(*) * 25 from public.temples t
            where t.submitted_by = p.id and t.status = 'approved'), 0)
  + coalesce((select count(*) * 5 from public.temple_photos ph where ph.uploaded_by = p.id), 0)
  + coalesce((select count(*) * 3 from public.temple_reviews r where r.user_id = p.id), 0);

comment on column public.user_profiles.username is
  'Public handle, lowercase, unique. Shown as @username on contributions.';

-- ── fix: self-profile update policy ─────────────────────────────────────
--
-- The original policy was `with check (auth.uid() = id and role = 'member')`,
-- which had two problems:
--   1. It locked moderators/admins out of editing their OWN profile at all,
--      because their resulting row has role <> 'member'.
--   2. It did nothing to stop a member writing their own contribution_points,
--      so points could be forged straight through the REST API.
--
-- Replace it with a plain ownership check, and enforce the "you may not
-- change your own role or points" rule in a trigger, which (unlike an RLS
-- WITH CHECK clause) can compare OLD against NEW.

drop policy if exists "Users can update their own profile" on public.user_profiles;

create policy "Users can update their own profile"
  on public.user_profiles for update
  using (auth.uid() = id)
  with check (auth.uid() = id);

create or replace function public.guard_profile_privileges()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  -- Anything running as the service role (server-side admin work, our own
  -- SECURITY DEFINER point triggers) is allowed through untouched.
  if auth.uid() is null or public.is_moderator() then
    return new;
  end if;

  if new.role is distinct from old.role then
    raise exception 'You cannot change your own role.';
  end if;

  if new.contribution_points is distinct from old.contribution_points then
    raise exception 'Contribution points are awarded automatically and cannot be set directly.';
  end if;

  return new;
end;
$$;

create trigger guard_profile_privileges
  before update on public.user_profiles
  for each row execute function public.guard_profile_privileges();
