-- Ṛtam — sthala puranam + properly credited photographs
--
-- Adds the traditional temple legend (sthala purana) to temples, and the
-- licence/attribution fields that free-licensed photographs require. Most
-- Wikimedia Commons images are CC BY-SA, which obliges us to name the
-- photographer and state the licence wherever the image is shown — so the
-- schema makes that information mandatory to carry alongside the URL.

alter table public.temples
  add column if not exists sthala_purana text;

comment on column public.temples.sthala_purana is
  'The temple''s traditional origin legend, as recorded in its sthala purana.';

alter table public.temple_photos
  add column if not exists caption text,
  add column if not exists credit text,
  add column if not exists license text,
  add column if not exists source_url text;

comment on column public.temple_photos.credit is
  'Photographer/author, required for CC BY and CC BY-SA images.';
comment on column public.temple_photos.source_url is
  'Link back to the original file page, required by most CC licences.';
