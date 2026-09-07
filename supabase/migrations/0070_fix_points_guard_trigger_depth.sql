-- Ṛtam — fix a latent bug in guard_profile_privileges() that silently
-- broke the entire contribution-points system for any non-moderator
-- member: it exempted a contribution_points/role change only when
-- auth.uid() is null or the caller is a moderator, but auth.uid() reflects
-- the original request's JWT for the whole transaction regardless of
-- SECURITY DEFINER escalation — so award_points() (called from every
-- points_on_* trigger: photos, reviews, status reports, edit suggestions,
-- dharmic activities, and now community posts) still saw the ordinary
-- contributor's own id and got blocked with "Contribution points are
-- awarded automatically and cannot be set directly", rolling back the
-- whole insert.
--
-- Caught via a real report: a brand-new, non-moderator user tried to post
-- to the Dharma Wall three times; the photo uploaded to storage fine each
-- time (a separate, unguarded operation) but the community_posts insert
-- rolled back every time with Postgres error P0001 — confirmed via the
-- project's edge logs (response.headers.proxy_status: 'PostgREST;
-- error=P0001'), then traced to this function.
--
-- Fix: also exempt when pg_trigger_depth() > 1, i.e. this update to
-- user_profiles is a side effect of another trigger already running
-- (award_points() being called from points_on_* on a different table)
-- rather than a client directly touching their own profile row. A direct
-- client PATCH to their own profile still fires this guard at depth 1 and
-- is still blocked exactly as intended.

create or replace function public.guard_profile_privileges()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if pg_trigger_depth() > 1 or auth.uid() is null or public.is_moderator() then
    return new;
  end if;
  if new.role is distinct from old.role then
    raise exception 'You cannot change your own role.';
  end if;
  if new.contribution_points is distinct from old.contribution_points then
    raise exception 'Contribution points are awarded automatically and cannot be set directly.';
  end if;
  if new.sandhya_tejas_points is distinct from old.sandhya_tejas_points
    or new.last_tejas_milestone is distinct from old.last_tejas_milestone then
    raise exception 'Sandhya Tejas points are awarded automatically and cannot be set directly.';
  end if;
  return new;
end;
$$;
