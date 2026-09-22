-- Ṛtam — 4 more Odisha temples beyond the original Jagannath (Puri),
-- Konark Sun Temple and Lingaraj (Bhubaneswar) seeded earlier. Odisha's
-- Kalinga-style temple architecture is unusually well dated by art
-- historians, so construction centuries here are on firmer ground than
-- in several earlier batches — still noted as stylistic/scholarly dating
-- rather than inscriptional certainty where that's the actual basis.
--
-- Two of these four are not conventional living-worship temples, and
-- that's stated plainly rather than smoothed over: Rajarani's sanctum is
-- empty and it functions as an ASI monument, and the Chausath Yogini
-- shrine at Hirapur is a Tantric, non-mainstream worship site.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Mukteswara Temple, Bhubaneswar', 'Shiva (Mukteshwara)', 'Shaiva', array['Kalinga architecture landmark']::text[], 'India', 'Odisha', 'Khurda', 'Bhubaneswar', 20.24270, 85.84039, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The Mukteswar Dance Festival, an annual Odissi dance and music festival, is held here in winter.',
  $$Built around 950–975 CE, this compact temple is considered the earliest major work of the Somavamshi dynasty period, marking — per art historians including Percy Brown — the culmination of earlier Kalinga temple development and the start of a century of architectural experimentation that led to Rajarani and Lingaraj. It is celebrated above all for its ornate free-standing torana (arched gateway), thought to show Buddhist architectural influence. This dating rests on stylistic analysis rather than inscriptional proof — scholarly consensus, not epigraphic certainty.$$,
  'Art-historical scholarship (Percy Brown and others); Wikipedia', 'Kalinga style, 10th century CE, celebrated for compact ornate carving and its torana', 10, 'approved'
),
(
  'Rajarani Temple, Bhubaneswar', 'None today — originally dedicated to Shiva as Indreshvara; no longer an active place of worship', null, array['ASI monument, not an active temple']::text[], 'India', 'Odisha', 'Khurda', 'Bhubaneswar', 20.24344, 85.84352, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The Rajarani Music Festival (Hindustani, Carnatic and Odissi performances), held annually 18–20 January, is a cultural event here rather than a religious one — consistent with the temple''s non-worship status.',
  $$Originally known as Indreshvara and dedicated to Shiva, the sanctum today holds no deity image, and the site is maintained as a ticketed ASI monument rather than a place of worship. Its name comes from the reddish-gold ("raja") and yellow sandstone it's built from, not from any royal couple. Dated to the mid-11th century CE on stylistic grounds, it's known for a tall clustered spire and richly carved feminine and erotic figures — earning it the local nickname "the love temple" — and some scholars see its style as influential on temples later built around Khajuraho, though the direction and degree of that influence is debated. Its jagamohana (porch) had collapsed at some point and was restored in 1903.$$,
  'Art-historical scholarship; Wikipedia', 'Kalinga pancharatha style; reddish-gold and yellow sandstone, roughly 18m clustered shikhara spire', 11, 'approved'
),
(
  'Gundicha Temple, Puri', 'Jagannath, with Balabhadra and Subhadra (present only during Rath Yatra — the temple is unoccupied the rest of the year)', 'Vaishnava', array['Rath Yatra']::text[], 'India', 'Odisha', 'Puri', 'Puri', 19.81692, 85.84036, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'This is the temple of the Rath Yatra itself (usually Jun–Jul, per the Odia lunar calendar), when the three deities are pulled here from the main Jagannath Temple in massive chariots and stay for seven days before returning via the Bahuda Yatra. Sub-festivals during the stay include Hera Panchami (5th day) and Dakshina Moda (6th day).',
  $$Temple legend attributes the founding to King Indradyumna, the legendary founder of the main Jagannath Temple, naming it for his queen Gundicha — presented here as sthala purana, not independently verified history. The building itself is dated by scholars to the 12th century CE, built under the Eastern Ganga king Anantavarman Chodaganga Deva (whose reign, roughly 1078–1150 CE, also produced the main Jagannath Temple). Each year the three deities travel here in their chariots and are installed for a week, in what's popularly called Lord Jagannath's "Garden House" or, less formally, his aunt's house.$$,
  'Temple tradition (Indradyumna legend); Eastern Ganga dynasty records', 'Kalinga Deula, pidha (pyramidal-roof) style; grey sandstone ashlar masonry with iron dowels', 12, 'approved'
),
(
  'Chausath Yogini Temple, Hirapur', 'The 64 Yoginis (Shakta-Tantric tradition), with a central Mahamaya/Kali image — 56 of the original 64 stone idols survive', 'Shakta', array['Tantric shrine', 'Hypaethral (roofless) temple']::text[], 'India', 'Odisha', 'Khurda', 'Hirapur', 20.22651, 85.87560, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Kali Puja is the principal festival here; worship at this Tantric site is non-mainstream compared to typical temple puja.',
  $$Built around 864 CE and attributed to Hiradevi, a queen of the Bhauma-Kara dynasty and mother of King Subhakaradeva II, this is considered by most scholarly accounts to be India's earliest known Chausath Yogini temple — though the precise 9th-century dating rests on limited epigraphic and traditional evidence rather than firm inscription. It is a rare circular, roofless (hypaethral) shrine only about 7.6m across, reflecting Tantric ritual practice that calls for open-sky worship invoking the five elements, with 64 individual yogini niches set into the circular stone wall. In the 16th century, the shrine's idols were reportedly damaged in a raid attributed to the general Kalapahad — a traditional attribution, treated here with appropriate caution rather than as settled fact.$$,
  'Bhauma-Kara dynasty tradition; art-historical scholarship', 'Rare circular hypaethral (roofless) shrine, sandstone construction', 9, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Mukteswara Temple, Bhubaneswar'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Muktesvar_Temple.jpg',
  'Mukteswara Temple, Bhubaneswar',
  'Robin Mohapatra, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Muktesvar_Temple.jpg'
),
(
  (select id from public.temples where name = 'Rajarani Temple, Bhubaneswar'),
  'https://upload.wikimedia.org/wikipedia/commons/9/9b/Rajarani_Temple_2.jpg',
  'Rajarani Temple, Bhubaneswar',
  'Amartyabag, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Rajarani_Temple_2.jpg'
),
(
  (select id from public.temples where name = 'Gundicha Temple, Puri'),
  'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gundicha_Temple%2C_Puri%2C_Odisha1.JPG',
  'Gundicha Temple, Puri',
  'Aditya Mahar, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Gundicha_Temple,_Puri,_Odisha1.JPG'
),
(
  (select id from public.temples where name = 'Chausath Yogini Temple, Hirapur'),
  'https://upload.wikimedia.org/wikipedia/commons/3/3b/Chausath_Yogini_Temple_-_Outside.JPG',
  'Chausath Yogini Temple, Hirapur',
  'Rohit Agarwal, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Chausath_Yogini_Temple_-_Outside.JPG'
);
