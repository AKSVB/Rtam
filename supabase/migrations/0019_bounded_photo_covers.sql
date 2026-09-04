-- Ṛtam — bound the temple-card cover-photo query to one row per temple
--
-- useTemplePhotoCovers previously fetched every row in temple_photos on
-- every homepage load, then picked the first photo per temple in JS. That
-- scales with total *photos*, not total *temples* — once contributors
-- start uploading several photos per temple, this grows unbounded even
-- though the homepage only ever needs one image per card. This view does
-- the same "oldest photo wins" pick inside Postgres instead, so the API
-- response is bounded by the number of temples that have at least one
-- photo, not by how many photos exist in total.
--
-- security_invoker makes the view apply RLS using the querying role's own
-- permissions (the "Photos on visible temples are publicly readable"
-- policy on temple_photos) rather than the view owner's — without it, a
-- view silently runs with the creator's privileges and could leak photos
-- on pending/rejected temples to anonymous visitors.
create view public.temple_photo_covers
with (security_invoker = on) as
select distinct on (temple_id) temple_id, url, credit, license
from public.temple_photos
order by temple_id, created_at asc;

grant select on public.temple_photo_covers to anon, authenticated;
