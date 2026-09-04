-- Ṛtam — photos for 8 of the 14 temples added in migration 0030
--
-- Sourced from Wikipedia pageimages + Wikimedia Commons license metadata,
-- same verification discipline as prior photo batches: only free-licensed
-- images, and only where the Commons file/article title clearly matches
-- the specific temple (not a namesake elsewhere, not a generic townscape).
--
-- Deliberately excluded from this batch:
--   - Kodandarama Temple, Vontimitta (Andhra Pradesh): the only Commons
--     match found was "Kodandarama Temple, Hiremagalur" — a different,
--     unrelated temple in Karnataka. Wrong temple, not used.
--   - Narmada Udgam Temple, Amarkantak: the only match was a file titled
--     generically "A Hindu temple, Amarkantak Madhya Pradesh India" with
--     no way to confirm it depicts the actual Narmada Udgam/Kalachuri
--     temple cluster rather than some other shrine in the town. Too
--     uncertain to use.
--   - Thiruparankundram Murugan Temple, Kottarakkara Ganapathy Temple,
--     Hanuman Garhi Temple, Kankalitala Temple: no Wikipedia pageimage
--     found at all.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Tiruchendur Murugan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/Thiruchendur11.jpg/1280px-Thiruchendur11.jpg',
  'Tiruchendur Murugan Temple',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thiruchendur11.jpg'
),
(
  (select id from public.temples where name = 'Swamimalai Murugan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Swamimalai_Murugan_Temple.jpg/1280px-Swamimalai_Murugan_Temple.jpg',
  'Swamimalai Murugan Temple',
  'Ravichandar84, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Swamimalai_Murugan_Temple.jpg'
),
(
  (select id from public.temples where name = 'Pazhamudircholai Murugan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Pazhamuthir_solai_Murugan_1.JPG/1280px-Pazhamuthir_solai_Murugan_1.JPG',
  'Pazhamudircholai Murugan Temple',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Pazhamuthir_solai_Murugan_1.JPG'
),
(
  (select id from public.temples where name = 'Vaidyeshwara Temple, Talakadu'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Vaidyeshvara_Temple_%281000_AD%29_at_Talakad.JPG/1280px-Vaidyeshvara_Temple_%281000_AD%29_at_Talakad.JPG',
  'Vaidyeshwara Temple, Talakadu',
  'Dineshkannambadi, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Vaidyeshvara_Temple_(1000_AD)_at_Talakad.JPG'
),
(
  (select id from public.temples where name = 'Parassinikadavu Muthappan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Parassini.jpg/1280px-Parassini.jpg',
  'Parassinikadavu Muthappan Temple',
  'Sreelalpp, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Parassini.jpg'
),
(
  (select id from public.temples where name = 'Galtaji Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Zanana_Kund_Aur_Galta_Ji_Ka_Mandir_-_edited.jpg/1280px-Zanana_Kund_Aur_Galta_Ji_Ka_Mandir_-_edited.jpg',
  'Galtaji Temple',
  'Sharvarism, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Zanana_Kund_Aur_Galta_Ji_Ka_Mandir_-_edited.jpg'
),
(
  (select id from public.temples where name = 'Kalika Mata Temple, Chittorgarh Fort'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Chittorgarh%2C_Kalikamata-Tempel_%281999%29.jpg/1280px-Chittorgarh%2C_Kalikamata-Tempel_%281999%29.jpg',
  'Kalika Mata Temple, Chittorgarh Fort',
  'ArnoldBetten, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Chittorgarh%2C_Kalikamata-Tempel_(1999).jpg'
),
(
  (select id from public.temples where name = 'Jyotiba Temple, Kolhapur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/Jyotiba1.jpg/1280px-Jyotiba1.jpg',
  'Jyotiba Temple, Kolhapur',
  'Nilesh2 str, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Jyotiba1.jpg'
);
