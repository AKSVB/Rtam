-- Ṛtam — table grants for the anon/authenticated API roles
--
-- Enabling RLS (migration 0002) restricts which ROWS a role can see or
-- change, but Postgres still requires the base GRANT before RLS policies
-- even get evaluated. Because this project was created with "Automatically
-- expose new tables" turned off (recommended, so access is controlled
-- deliberately rather than by default), those grants need to be explicit.
-- RLS policies still do the real row-level restriction on top of these.

grant usage on schema public to anon, authenticated;

grant select on
  public.user_profiles,
  public.temples,
  public.temple_stays,
  public.temple_photos,
  public.temple_reviews
to anon, authenticated;

grant insert, update, delete on
  public.user_profiles,
  public.temples,
  public.temple_stays,
  public.temple_photos,
  public.temple_reviews,
  public.trip_lists
to authenticated;

grant select on public.trip_lists to authenticated;
