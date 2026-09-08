-- Ṛtam — one real photo recovered for a temple that had been on the
-- generic painting fallback. A fourth search pass (checking Wikimedia
-- Commons for a category literally named after the temple, rather than
-- relying on ranked search) turned up "Category:Amirthakadeswarar
-- Temple, Selaiyur" with 18 well-documented photos — a strong,
-- unambiguous match (the same uploader also photographed and correctly
-- categorised the temple's river-goddess statue collection). Replaces
-- the generic Shiva painting with two real photos of the temple.
--
-- The same fourth-pass method (and two other search strategies tried
-- alongside it) found nothing else new for the other 62 temples still on
-- a painting fallback — see the code review/session notes for what was
-- tried. Those temples appear to be genuinely undocumented on the open
-- web under any searchable name/spelling variant.

delete from public.temple_photos
where temple_id = (select id from public.temples where name = 'Sri Abirami Ambal Samedha Amirdhakadeshwarar Temple, Selaiyur')
  and caption like 'Traditional%';

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Sri Abirami Ambal Samedha Amirdhakadeshwarar Temple, Selaiyur'),
  'https://upload.wikimedia.org/wikipedia/commons/7/73/Rajagopuram-Amirthakadeswarar_koil%2C_Selaiyur.jpg',
  'Rajagopuram, Amirthakadeswarar Temple, Selaiyur',
  'Booradleyp1, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Rajagopuram-Amirthakadeswarar_koil,_Selaiyur.jpg'
),
(
  (select id from public.temples where name = 'Sri Abirami Ambal Samedha Amirdhakadeshwarar Temple, Selaiyur'),
  'https://upload.wikimedia.org/wikipedia/commons/0/01/Entrance-Amirthakadeswarar_koil.jpg',
  'Entrance, Amirthakadeswarar Temple, Selaiyur',
  'Booradleyp1, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Entrance-Amirthakadeswarar_koil.jpg'
);
