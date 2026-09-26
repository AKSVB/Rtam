-- Ṛtam — 6 more Andhra Pradesh temples, including Penchalakona:
-- Penchalakona Lakshmi Narasimha, Padmavathi (Tiruchanur), Govindaraja
-- (Tirupati), Dwaraka Tirumala, Antarvedi and Mukhalingam. None existed live,
-- confirmed by a direct database query before writing this batch.
--
-- Coordinates for most of these are village-level, not a surveyed temple
-- pin, and are flagged approximate in the text. Dwaraka Tirumala had two
-- conflicting coordinates in Wikipedia; the temple-level one (16.95, 81.2667)
-- is used because the other is inconsistent with its stated 42 km distance
-- to Eluru. Penchalakona is deliberately NOT tagged "Nava Narasimha": that
-- circuit in this database is the Ahobilam group, a different list.
-- No photo for Penchalakona (the only Commons hit is captioned just
-- "location photograph", unconfirmed as the temple) or Antarvedi (a weak
-- public-domain claim). Unverifiable fields are left null.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Penchalakona Lakshmi Narasimha Swamy Temple', 'Lakshmi Narasimha, worshipped as Swayambhu (self-manifested); also called Penusila Lakshmi Narasimha', 'Vaishnava', array[]::text[], 'India', 'Andhra Pradesh', 'Nellore', 'Penchalakona', 14.3365, 79.4104, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The five-day Brahmotsavam begins on Vaisakha Shuddha Ekadashi (April–May); Narasimha Jayanti is also observed.',
  $$After slaying Hiranyakashipu, Narasimha could not calm his anger and wandered the forest. Lakshmi came as the Chenchu tribal woman Chenchu Lakshmi and embraced him; the embrace (penu vesukonuta) and the rock (sila) give the name Penusila, later Penchalakona. Sources differ in detail — one says the Lord married Chenchu Lakshmi, the daughter of the Chenchu chief, and turned to rock; others say she simply embraced and calmed him — so this is recorded as tradition, not history. The place is also linked to the sage Kanva's penance. The temple is said to date from the Krita yuga, a mythic claim; no date for the present structure was found. Coordinates are approximate.$$,
  'Nellore district administration site; Wikipedia (Penchalakona)', null, null,
  null,
  'Per the Nellore district tourism site, not the temple''s own schedule: roughly 6:30am–12:30pm and 3–7:30pm.',
  null,
  'Tirupati (Renigunta) Airport', null, null, null, 'approved'
),
(
  'Padmavathi Ammavari Temple, Tiruchanur', 'Padmavathi (Alamelu Manga), consort of Venkateswara', 'Vaishnava', array[]::text[], 'India', 'Andhra Pradesh', 'Tirupati', 'Tiruchanur', 13.60781, 79.45011, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The Karthika Brahmotsavam (about nine days) is the major festival, alongside Vasanthotsavam, Teppotsavam, Varalakshmi Vratam and Navaratri.',
  $$Per one account, King Akasharaja found an infant girl in a golden lotus in a pond, named her Padmavathi, and she later married Srinivasa at Narayanavanam before residing at Tiruchanur. A related tradition holds that Lakshmi performed twelve years of penance in the temple tank and emerged from a golden lotus in the month of Karthika, which is why it is called Padma Sarovaram. These are two tellings of the origin rather than a contradiction, and both are tradition.$$,
  'Wikipedia (Padmavati Temple); TTD-derived accounts', 'Dravidian / Vijayanagara style with a five-tier rajagopuram and the Padma Sarovaram tank', null,
  null,
  'Wikipedia lists roughly 4:50am (3:30am on Fridays) to 9:30pm; this is not a confirmed TTD schedule, so check tirumala.org.',
  null,
  'Tirupati Airport', null, 'Tiruchanur Railway Station', null, 'approved'
),
(
  'Govindaraja Swamy Temple, Tirupati', 'Govindaraja (Vishnu), reclining in yoga-nidra and facing east', 'Vaishnava', array[]::text[], 'India', 'Andhra Pradesh', 'Tirupati', 'Tirupati', 13.68325, 79.34719, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Brahmotsavam and Vaikuntha Ekadasi are the major occasions.',
  $$Consecrated in 1130 CE by Ramanujacharya (the temple's official site and Wikipedia agree), with some structures inside dated to the 9th–10th centuries; Parthasarathy was the earlier presiding deity. Sources describe the ritual tradition variously as Vaikhanasa, with Vadakalai worship and Tenkalai influence — the affiliation is contested, so it is not narrowed further. The seven-storey rajagopuram (about 50 m) is attributed to Matla Anantaraja. Administered by the Tirumala Tirupati Devasthanams.$$,
  'Wikipedia (Govindaraja Temple, Tirupati); Tirupati district site', 'Dravidian; seven-storey rajagopuram with Ramayana scenes and two enclosures', 12,
  null, null, null,
  'Tirupati Airport', null, 'Tirupati Railway Station', 1, 'approved'
),
(
  'Venkateswara Swamy Temple, Dwaraka Tirumala', 'Venkateswara; the sanctum holds two idols under one vimana', 'Vaishnava', array[]::text[], 'India', 'Andhra Pradesh', 'Eluru', 'Dwaraka Tirumala', 16.95, 81.2667, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Tiru Kalyanotsavam is held twice a year (Vaisakha and Aswayuja); Giripradakshina in January and Teppotsavam in November are also observed.',
  $$Tradition holds that the sage Dwaraka meditated here and found a self-manifested idol in an anthill; only its upper half was visible, so a second idol was installed to allow worship of the feet. The main structures are attributed to Dharma Appa Rao (fl. 1762–c.1827), and Rani Chinnamma Rao of Mylavaram (1877–1902) donated its gold ornaments and silver vahanas. The origin date is not established. Wikipedia gives two conflicting coordinates for the temple; the temple-level one is used and is approximate.$$,
  'Wikipedia (Venkateswara Temple, Dwaraka Tirumala); Eluru tourism site', 'Dravidian; five-storey rajagopuram with three smaller gopurams', null,
  null, null, null,
  null, null, 'Bhimadole Railway Station', 15, 'approved'
),
(
  'Lakshmi Narasimha Swamy Temple, Antarvedi', 'Lakshmi Narasimha, with Rajyalakshmi', 'Vaishnava', array[]::text[], 'India', 'Andhra Pradesh', 'Dr. B. R. Ambedkar Konaseema', 'Antarvedi', 16.3333, 81.7333, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The Kalyanotsavam falls in the month of Magha, beginning around Ratha Saptami, with the Lord''s wedding on Magha Shukla Dashami; Narasimha Jayanti in Vaisakha is also observed.',
  $$Tradition says the sage Vasishta founded an ashram here after bringing a branch of the Godavari to the sea, that Brahma installed the deity, that Narasimha fought the demon Raktavilochana (giving the Raktakulya river its name), and that a cowherd named Kesavadas rediscovered the temple in the Kali Yuga. The temple's construction dates conflict: Wikipedia credits Kopanathi Krishnamma with completing it in Saka 1745 (1823 CE), while the district site records a major reconstruction in 1923 — neither is stated as fact here. Coordinates are village-level.$$,
  'East Godavari district site; Wikipedia (Lakshmi Narasimha Temple, Antarvedi)', null, null,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Mukhalingam Temples (Madhukeshwara)', 'Shiva, as Madhukeshwara (Mukhalingeswara), with a faceted linga; the group includes Someswara and Bhimeswara temples', 'Shaiva', array[]::text[], 'India', 'Andhra Pradesh', 'Srikakulam', 'Mukhalingam', 18.6, 83.9667, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Vamsadhara', null, null,
  $$Mukhalingam, on the left bank of the Vamsadhara, was historically Kalinganagari, capital of the Eastern Gangas from the 6th to the 12th century until the capital moved to Cuttack in 1122. Scholars date the temples to between the late 8th and early 11th century, and the dating is contested, so no single century is given. Patronage of the principal temple is credited to Kamarnava Deva II. Coordinates are village-level.$$,
  'Wikipedia (Mukhalingam)', 'Kalinga architecture', null,
  null, null, null,
  null, null, null, null, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Padmavathi Ammavari Temple, Tiruchanur'),
  'https://upload.wikimedia.org/wikipedia/commons/2/23/Padmavathi_Ammavari_Temple.JPG',
  'Padmavathi Ammavari Temple, Tiruchanur',
  'Vedamurthy.j, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Padmavathi_Ammavari_Temple.JPG'
),
(
  (select id from public.temples where name = 'Govindaraja Swamy Temple, Tirupati'),
  'https://upload.wikimedia.org/wikipedia/commons/3/30/Tirupathi_%286337140675%29.jpg',
  'Govindaraja Swamy Temple, Tirupati',
  'Arian Zwegers, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Tirupathi_(6337140675).jpg'
),
(
  (select id from public.temples where name = 'Venkateswara Swamy Temple, Dwaraka Tirumala'),
  'https://upload.wikimedia.org/wikipedia/commons/f/f1/East_Gopuram_of_Dwaraka_Tirumala_Temple.jpg',
  'East gopuram, Dwaraka Tirumala Temple',
  'iMahesh, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:East_Gopuram_of_Dwaraka_Tirumala_Temple.jpg'
),
(
  (select id from public.temples where name = 'Mukhalingam Temples (Madhukeshwara)'),
  'https://upload.wikimedia.org/wikipedia/commons/4/4d/700_CE_Mukhalingeswara_Temples_Group%2C_Kalinga_architecture%2C_Mukhalingam%2C_Andhra_Pradesh_-_65.jpg',
  'Mukhalingeswara Temples group, Mukhalingam',
  'G.N. Subrahmanyam, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:700_CE_Mukhalingeswara_Temples_Group,_Kalinga_architecture,_Mukhalingam,_Andhra_Pradesh_-_65.jpg'
);
