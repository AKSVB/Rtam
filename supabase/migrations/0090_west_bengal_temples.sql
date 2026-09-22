-- Ṛtam — 4 more West Bengal temples beyond Tarapith, Bakreshwar,
-- Kankalitala, Dakshineswar and Kalighat — all confirmed already live
-- via a direct database query before writing this batch.
--
-- Mayapur is stated plainly as a work in progress: the grand Temple of
-- the Vedic Planetarium is still under construction (scheduled to open
-- 2027), so deity/architecture describe what's actually there today —
-- the existing Chandrodaya Mandir complex — rather than the finished
-- building. Several practical fields here (timings especially) rest on
-- third-party tourism aggregators rather than each institution's own
-- published schedule, and that's said explicitly rather than smoothed
-- into false precision; a couple of distance figures that weren't
-- reliably sourced are left null rather than guessed.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Belur Math, Howrah', 'Sri Ramakrishna Paramahamsa (his relics enshrined in the main temple); also shrines to Sarada Devi and Swami Vivekananda within the complex', null, array['Ramakrishna Math and Mission headquarters']::text[], 'India', 'West Bengal', 'Howrah', 'Belur', 22.63250, 88.35639, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Hooghly', 0, 'Kumari Puja and the birthday observances of Sri Ramakrishna, Sarada Devi and Swami Vivekananda are especially significant here, alongside Durga Puja, Kali Puja, Janmashtami and Shivaratri.',
  $$The land was purchased on 4 March 1897 by Swami Vivekananda; Sri Ramakrishna's relics were installed on 9 December 1898, and the main temple was consecrated on 14 January 1938 — all well-documented institutional history, not legend.$$,
  'Ramakrishna Math and Mission institutional records', 'A deliberately syncretic "Symphony in Architecture" completed 1935–1938: a South Indian gopuram-style entrance, Buddhist stupa elements, a Renaissance dome modelled on Florence Cathedral, a Christian-cross ground plan, and Rajput elements, meant to symbolise the unity of religions. 34.3m tall, built largely of Chunar stone.', 20,
  null,
  'Approximate hours per tourism sources, not an official published schedule: April–Sept roughly 6am–11:30am and 4–7pm; Oct–March roughly 6:30am–11:30am and 3:30–6pm; sandhya arati around 5:30pm.',
  'Reachable by EMU suburban train to Belur Math railway station (adjacent to the complex), by ferry across the Hooghly from the Dakshineswar/Kolkata side, or by road from Howrah.',
  'Netaji Subhas Chandra Bose International Airport, Kolkata', 20, 'Belur Math railway station', 0.5, 'approved'
),
(
  'Jor Bangla Temple, Bishnupur', 'Keshto Ray (a form of Krishna)', 'Vaishnava', array['Terracotta temple architecture', 'ASI Monument of National Importance', 'UNESCO tentative list']::text[], 'India', 'West Bengal', 'Bankura', 'Bishnupur', 23.07171, 87.32679, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$Built in 1655 (961 in the Mallabda calendar) by Raghunath Singha, the 51st ruler of the Mallabhum (Malla) dynasty (reigned 1626–1656), per the temple's own inscriptional plaque — well-documented, not legendary.$$,
  'Temple inscriptional plaque', 'Jor-Bangla (twin-hut/chala) style: two chala roofs joined side by side and topped with a single ratna tower, built of brick and terracotta, roughly 11.8×11.7×10.7m on a 15.6×15.7m stone platform with three arched south-facing entrances. Covered floor-to-roof with terracotta panels depicting the Ramayana, Mahabharata and Krishna-lila. The largest surviving Jor-Bangla temple in Bengal.', 17,
  null,
  null,
  null,
  'Netaji Subhas Chandra Bose International Airport, Kolkata', 140, 'Bishnupur railway station', 6, 'approved'
),
(
  'ISKCON Sri Sri Radha Madhava Temple, Mayapur', 'Radha-Madhava (Radha and Krishna) with the Ashta-sakhis, worshipped today in the existing Chandrodaya Mandir complex; the site also has separate altars for the Pancha-tattva (Chaitanya Mahaprabhu and associates) and Narasimhadeva. A much larger building, the Temple of the Vedic Planetarium, is under construction nearby and not yet open.', 'Vaishnava', array['ISKCON headquarters complex']::text[], 'India', 'West Bengal', 'Nadia', 'Mayapur', 23.42490, 88.38920, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Ganges (at its confluence with the Jalangi)', 1, 'Gaura Purnima (Chaitanya Mahaprabhu''s appearance day) is the major festival, marked by a multi-day Navadvipa-mandala parikrama; Chandan Yatra, Ratha Yatra and Radhashtami are also observed.',
  $$Identified by Bhaktivinoda Thakur in 1894 as the birthplace of Chaitanya Mahaprabhu — a matter of religious tradition and identification, not archaeological certainty. Founded by A. C. Bhaktivedanta Swami Prabhupada as a planned pilgrimage site and headquarters for ISKCON; construction of the Temple of the Vedic Planetarium began in 2009 and is scheduled to open in 2027, after which it is intended to be the largest religious monument in the world.$$,
  'Bhaktivinoda Thakur (1894 identification); ISKCON/Mayapur project records', 'The planned Temple of the Vedic Planetarium is a large blue-domed structure incorporating Vedic cosmological elements — a representation of Mount Meru and a "universal chandelier" — blending temple form with planetarium functionality; still under construction.', null,
  null,
  'Darshan is commonly cited as roughly 7am–12:30pm and 4–8pm, with a detailed daily aarti schedule (mangala arati around 4:30am through sandhya arati around 6:30pm) — sourced from third-party tourism aggregators rather than the temple''s own published schedule, so treat as approximate.',
  'ISKCON operates on-campus guesthouses for pilgrims; reachable by road and by rail via Nabadwip Dham railway station.',
  'Netaji Subhas Chandra Bose International Airport, Kolkata', 110, 'Nabadwip Dham railway station', null, 'approved'
),
(
  'Naba Kailash Mandir (108 Shiva Temples), Kalna', 'Shiva — 108 individual lingas, one per shrine; inner-circle lingas are white (Sadashiva), outer-circle lingas alternate black and white (Rudra)', 'Shaiva', array['108 Shiva shrines']::text[], 'India', 'West Bengal', 'Purba Bardhaman', 'Kalna', 23.22028, 88.36472, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bhagirathi (Hooghly)', 0.3, 'Maha Shivaratri is the major festival.',
  $$Built by Maharaja Teja Chandra Bahadur of the Burdwan Raj, completed in 1809 — well-documented, not legendary.$$,
  'Burdwan Raj institutional records', 'Two concentric circles of small at-chala/chala-style shrines — 74 in the outer circle, 34 in the inner — plus one pancha-ratna shrine (Jaleswar Mandir) on the west side of the outer circle. Inner circle roughly 102m in circumference, outer roughly 220m; standard shrines about 20ft tall, the Jaleswar Mandir about 35ft; laid out so all 108 lingas are visible from the centre.', 19,
  null,
  null,
  null,
  'Netaji Subhas Chandra Bose International Airport, Kolkata', 85, 'Ambika Kalna railway station', 1, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Belur Math, Howrah'),
  'https://upload.wikimedia.org/wikipedia/commons/0/01/Belur_Math_Howrah.jpg',
  'Belur Math, Howrah',
  'Kinjal bose 78, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Belur_Math_Howrah.jpg'
),
(
  (select id from public.temples where name = 'Jor Bangla Temple, Bishnupur'),
  'https://upload.wikimedia.org/wikipedia/commons/5/54/Jor_Bangla_Temple_2_Bishnupur.JPG',
  'Jor Bangla Temple, Bishnupur',
  'Amartyabag, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Jor_Bangla_Temple_2_Bishnupur.JPG'
),
(
  (select id from public.temples where name = 'ISKCON Sri Sri Radha Madhava Temple, Mayapur'),
  'https://upload.wikimedia.org/wikipedia/commons/a/ad/Chandrodaya_temple_at_ISKCON%2C_Mayapur_in_Nadia_District%2C_West_Bengal%2C_India_10.jpg',
  'Chandrodaya Temple at ISKCON, Mayapur',
  'Amitabha Gupta, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Chandrodaya_temple_at_ISKCON,_Mayapur_in_Nadia_District,_West_Bengal,_India_10.jpg'
),
(
  (select id from public.temples where name = 'Naba Kailash Mandir (108 Shiva Temples), Kalna'),
  'https://upload.wikimedia.org/wikipedia/commons/1/14/108_Shiva_Temple%2C_Ambika-Kalna%2C_Bardhaman%2C_West_Bengal.jpg',
  '108 Shiva Temples, Ambika Kalna',
  'Sucheta Nag, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:108_Shiva_Temple,_Ambika-Kalna,_Bardhaman,_West_Bengal.jpg'
);
