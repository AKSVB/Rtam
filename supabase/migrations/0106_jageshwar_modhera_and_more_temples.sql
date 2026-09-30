-- Ṛtam — 7 new temples: Jageshwar Temple Complex (Uttarakhand), Sun Temple
-- Ranakpur (Rajasthan), Sun Temple Modhera (Gujarat), Mahakuta Group of
-- Temples (Karnataka), Tara Tarini Mandir (Odisha), Dakshineswar Kali Temple
-- (West Bengal) and Bhadrakali Temple Warangal (Telangana). None existed
-- live, confirmed by a direct database query before this batch (Ettumanoor,
-- also surfaced by research, was skipped as a duplicate — already enriched
-- in migration 0105).
--
-- Coordinates are Wikipedia-sourced (generally citing ASI/Survey of India)
-- and were not independently re-verified against a second geodata source.
-- Where sources disagree or a claim is local tradition rather than settled
-- fact (Jageshwar's Jyotirlinga status; Ettumanoor/Soundarya Lahari legend,
-- not relevant here since that temple already exists), the conflict is
-- stated, not resolved. Photo licenses were individually verified via the
-- Wikimedia Commons API before use.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Jageshwar Temple Complex', 'Shiva, worshipped across a cluster of 125+ shrines', 'Shaiva', array[]::text[], 'India', 'Uttarakhand', 'Almora', 'Jageshwar', 29.633, 79.850, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'A high-altitude Himalayan site (about 1,870 m); best visited outside the harsh Himalayan winter.',
  $$The complex is a grouping of more than 125 stone temples, mostly dedicated to Shiva, built up over roughly the 7th to 14th centuries CE — among the largest single clusters of stone temples anywhere. Some sources, including Uttarakhand's own tourism department, describe it as one of the twelve Jyotirlingas; Wikipedia treats this more cautiously, calling it a major Kumaon Shiva pilgrimage site without asserting canonical Jyotirlinga status. The two claims are presented here as a live disagreement, not resolved.$$,
  'Wikipedia (Jageshwar); Uttarakhand government temple site (jageshwar-jyotirlinga.uk.gov.in)', 'Nagara (North Indian) style with some hill-temple influence; ASI-protected, with an on-site ASI museum', null,
  null, null, null,
  'Uttarakhand', null, 'Kathgodam railway station', null, 'approved'
),
(
  'Sun Temple, Ranakpur', 'Surya, depicted on a horse-drawn chariot', 'Saura', array[]::text[], 'India', 'Rajasthan', 'Pali', 'Ranakpur', 25.135, 73.447, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$Located about 500 m from the famous Ranakpur Jain temple complex, this smaller Surya shrine has a Nagara-style shikhara over its sanctum and an octagonal mandapa, built of pale marble and facing east with a carved image of Surya on his horse-drawn chariot.$$,
  'Wikipedia (Ranakpur)', 'Nagara-style shikhara, octagonal mandapa, pale marble, east-facing', 13,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Sun Temple, Modhera', 'Surya', 'Saura', array[]::text[], 'India', 'Gujarat', 'Mehsana', 'Modhera', 23.5838, 72.1327, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Pushpavati River', null, null,
  $$Built in 1026–27 CE under Bhima I of the Chaulukya (Solanki) dynasty, on the bank of the Pushpavati river. It is no longer used for active worship and is maintained by the ASI as a protected monument, comparable in stature to the sun temples at Konark (Odisha) and Martand (Kashmir).$$,
  'Wikipedia (Sun Temple, Modhera); Gujarat Tourism', 'Māru-Gurjara (Chaulukya) style', 11,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Mahakuta Group of Temples', 'Shiva, across a cluster of shrines', 'Shaiva', array[]::text[], 'India', 'Karnataka', 'Bagalkot', 'Mahakuta', 15.9328, 75.7217, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$A cluster of temples built by the early Badami Chalukya dynasty in the 6th–7th centuries CE, dated by the Mahakuta Pillar inscription (595–602 CE) and a later Vinapoti inscription (696–733 CE). It remains an active Shaiva monastery site and is stylistically linked to the nearby temples of Aihole.$$,
  'Wikipedia (Mahakuta group of temples)', 'Early Chalukya style', 7,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Tara Tarini Mandir', 'Tara and Tarini, twin goddess forms; a Shakti Pitha', 'Shakta', array[]::text[], 'India', 'Odisha', 'Ganjam', 'Purushottampur', 19.4897, 84.8998, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Rushikulya River', null, null,
  $$Sited on the Kumari Hills above the Rushikulya river, about 28 km from Brahmapur. Legend attributes its founding to King Indradyumna, though the era of that account is mythical rather than historical; the current structure dates largely from the 17th century, under the Basupraharaj rulers. It is counted among the Shakti Pithas.$$,
  'Wikipedia (Tara Tarini Mandir); livehistoryindia.com', 'Kalinga style; the complex has five temples', 17,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Dakshineswar Kali Temple', 'Kali (Bhavatarini)', 'Shakta', array[]::text[], 'India', 'West Bengal', 'North 24 Parganas', 'Dakshineswar, Kolkata', 22.655, 88.3578, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Hooghly River', 0, null,
  $$Built in 1855 by Rani Rashmoni on the east bank of the Hooghly. Far more recent than most temples in this directory, but devotionally significant for its close association with the 19th-century mystic Sri Ramakrishna Paramahamsa, who served as a priest here.$$,
  'Wikipedia (Dakshineswar Kali Temple)', 'Navaratna (nine-spire) style; the complex includes twelve riverside Shiva shrines, a Radha-Krishna temple and a bathing ghat', 19,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Bhadrakali Temple, Warangal', 'Bhadrakali', 'Shakta', array[]::text[], 'India', 'Telangana', 'Warangal', 'Warangal', 17.995, 79.5828, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$Traditionally dated to 625 CE and said to have been built by the Chalukya king Pulakeshin II to commemorate a military victory; the Kakatiya dynasty later adopted the goddess as their kuladevata (family deity). The square stone image, about 2.7 m across, has eight arms. An adjacent lake was built by the Kakatiya king Ganapati-deva; the temple itself was renovated in 1950.$$,
  'Wikipedia (Bhadrakali Temple, Warangal); Telangana Tourism', null, 7,
  null, null, null,
  null, null, null, null, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Jageshwar Temple Complex'),
  'https://upload.wikimedia.org/wikipedia/commons/c/c8/Complete_pic_of_Jageshwar_temple.jpg',
  'The Jageshwar temple cluster', 'Sutharsan Shekhar, via Wikimedia Commons', 'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Complete_pic_of_Jageshwar_temple.jpg'
),
(
  (select id from public.temples where name = 'Sun Temple, Ranakpur'),
  'https://upload.wikimedia.org/wikipedia/commons/3/3a/Sculpture_of_Ganpati_at_Surya_Mandir%2C_Ranakpur%2C_Rajasthan_by_Harshil_Mehta.jpg',
  'A carved Ganesha panel at the Surya Mandir, Ranakpur', 'Harshil Mehta, via Wikimedia Commons', 'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Sculpture_of_Ganpati_at_Surya_Mandir,_Ranakpur,_Rajasthan_by_Harshil_Mehta.jpg'
),
(
  (select id from public.temples where name = 'Sun Temple, Modhera'),
  'https://upload.wikimedia.org/wikipedia/commons/6/66/Modhera_Sun_Temple%2C_Gujarat.jpg',
  'The Sun Temple at Modhera', 'Mayank Soni, via Wikimedia Commons', 'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Modhera_Sun_Temple,_Gujarat.jpg'
),
(
  (select id from public.temples where name = 'Mahakuta Group of Temples'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b1/Mahakuta_group_of_temples_at_Mahakuta.jpg',
  'The Mahakuta group of temples', 'Dineshkannambadi, via Wikimedia Commons', 'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Mahakuta_group_of_temples_at_Mahakuta.jpg'
),
(
  (select id from public.temples where name = 'Tara Tarini Mandir'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7f/Tara_Tarini_Temple_Ganjam.jpg',
  'Tara Tarini Mandir on the Kumari Hills', 'Government of Odisha, via Wikimedia Commons', 'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Tara_Tarini_Temple_Ganjam.jpg'
),
(
  (select id from public.temples where name = 'Dakshineswar Kali Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/3/32/Dakhineshwar_Temple_beside_the_Hoogly%2C_West_Bengal.JPG',
  'Dakshineswar Kali Temple on the bank of the Hooghly', 'Knath, via Wikimedia Commons', 'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Dakhineshwar_Temple_beside_the_Hoogly,_West_Bengal.JPG'
),
(
  (select id from public.temples where name = 'Bhadrakali Temple, Warangal'),
  'https://upload.wikimedia.org/wikipedia/commons/4/44/Bhadrakali_Temple%2C_Warangal.jpg',
  'Bhadrakali Temple, Warangal', 'Warangalite, via Wikimedia Commons', 'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Bhadrakali_Temple,_Warangal.jpg'
);
