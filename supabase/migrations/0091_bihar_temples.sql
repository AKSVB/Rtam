-- Ṛtam — 4 more Bihar temples beyond Vishnupad (Gaya), Mundeshwari Devi
-- and Mangala Gauri (Gaya) — all confirmed already live via a direct
-- database query before writing this batch.
--
-- Sitamarhi genuinely has two rival "birthplace of Sita" sites — Janaki
-- Sthan (older, more documented succession history) and Punaura Dham
-- (the more commonly cited popular site, now the location of a large
-- new temple complex still under construction). Rather than pick one
-- and erase the other, this entry uses Punaura Dham's better-sourced
-- coordinates but describes both sites and the ongoing construction
-- honestly in the text; the photo actually depicts Janaki Sthan
-- specifically and is captioned as such rather than mislabeled.
-- Several distance figures across this batch had conflicting sources
-- and are left null rather than guessed.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Mahavir Mandir, Patna', 'Hanuman, worshipped as Sankat Mochan — unusually, two Hanuman idols share the sanctum, one in a blessing pose and one in meditation', null, array[]::text[], 'India', 'Bihar', 'Patna', 'Patna', 25.60389, 85.13639, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Ram Navami (queues reportedly exceeding 1km) and Hanuman Jayanti are the major festivals; Tuesdays and Saturdays are the traditional heavy-worship days for Hanuman.',
  $$A 1948 Patna High Court ruling recorded that the temple "has existed since time immemorial," but its documented modern establishment traces to the Ramanandi ascetic Swami Balanand, around 1730 CE — the "time immemorial" framing is tradition, not verified history. It rose to prominence after 1947 as Partition refugees settled in Patna, and courts declared it a public temple in 1948. The old structure was demolished; the current marble temple, run since by the Shri Mahavir Sthan Nyas Samiti trust under Acharya Kishore Kunal, was completed in 1987. The trust reportedly has the second-highest temple-trust budget in North India after Vaishno Devi, and funds hospitals including the Mahavir Cancer Institute.$$,
  '1948 Patna High Court ruling; Shri Mahavir Sthan Nyas Samiti records', 'Nagara style, marble construction, roughly 57m (187ft) tall', 20,
  null,
  'Per third-party temple-info sources, not the trust''s own official statement: open roughly 5am–10pm daily, with morning darshan 5am–1pm, a midday closure, and evening darshan 3–10pm. Mangala Aarti around 5am, evening Aarti roughly 7:30–8pm (varies seasonally).',
  null,
  'Jay Prakash Narayan International Airport, Patna', 6, 'Patna Junction', 0.1, 'approved'
),
(
  'Janaki Temple, Sitamarhi', 'Sita (Janaki), traditionally revered at the site as her birthplace', 'Vaishnava', array[]::text[], 'India', 'Bihar', 'Sitamarhi', 'Sitamarhi', 26.58650, 85.46680, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Janaki Navami, Vivaha Panchami and Ram Navami are the major festivals.',
  $$Sitamarhi genuinely has two separate sites associated with Sita's birth, and this entry doesn't try to erase that. Janaki Sthan, in Sitamarhi town itself, is the older and better-documented site: land was endowed here in 1599 CE by King Narpati Singh of the Darbhanga Raj, with the first Mahant, Hiraram Das of Revasa Math, and a recorded 1923 Patna High Court succession case. Punaura Dham, a few kilometres away, is the more commonly cited site in popular/tourism tradition — per the Valmiki Ramayana, King Janaka found an infant girl in a furrow (sita) while ploughing near sage Pundrik's ashram during a famine-year yajna, giving her the names Sita and Janaki; this is scriptural legend, not archaeological history. A large new temple complex, the Janaki Janmasthali Mandir, is under construction at Punaura Dham (foundation stones laid December 2023 and August 2025, built by the Mahavir Mandir Trust) and is not yet operational — visitors today see the existing, smaller shrines at both sites, not the finished complex.$$,
  'Darbhanga Raj and Patna High Court records (Janaki Sthan); Valmiki Ramayana (Punaura Dham legend); Mahavir Mandir Trust project records', null, null,
  null,
  null,
  null,
  null, null, 'Sitamarhi Junction', 2.5, 'approved'
),
(
  'Ajgaibinath Temple, Sultanganj', 'Shiva, as a swayambhu (self-manifested) linga continuously bathed by the Ganga', 'Shaiva', array['Kanwar pilgrimage']::text[], 'India', 'Bihar', 'Bhagalpur', 'Sultanganj', 25.25240, 86.73430, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Ganga', 0, 'The Shravani Mela during Sawan (the monsoon month) is central here — Kanwariyas collect Ganga water at this spot, traditionally called Uttar Vahini Ganga, as the starting point of the roughly 105km walk to Baidyanath Dham, Deoghar (some continue on to Basukinath, already in this database, which names Ajgaibinath as one of the region''s three major Shiva temples).',
  $$Tradition, set in the Treta Yuga, holds that Rama worshipped Shiva here before the battle with Ravana — legend, not verifiable history. The shrine sits on a rocky island in the Ganges, shaped like a boat; its current Nagara-style shikhara was rebuilt and donated in 1885 by Rani Kalavati of the local royal family, which is the documented architectural date.$$,
  'Local tradition (Treta Yuga legend); 1885 donation records', 'Rock-built Nagara-style shrine on a river-island rock outcrop, shaped like a boat', 19,
  null,
  null,
  'Reaching the island shrine requires a boat or ferry crossing, typically from Murli Hills, Sultanganj.',
  null, null, 'Sultanganj railway station', 1.5, 'approved'
),
(
  'Badi Patan Devi Temple, Patna', 'Devi Sati, as a Shakti Peetha (the temple holds images of Mahakali, Mahalakshmi and Mahasaraswati, with Bhairav as guardian deity); a linked second shrine, Chhoti Patan Devi, stands about 4km away in Patna''s Chowk area', 'Shakta', array['Shakti Peetha']::text[], 'India', 'Bihar', 'Patna', 'Patna', 25.60531, 85.20629, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Durga Puja (Saptami–Navami) is the major festival, with reportedly around 1,000 daily visitors during it, and a Vijayadashami mela.',
  $$Puranic Shakti Peetha tradition holds that Sati's right thigh fell here after Vishnu's Sudarshan Chakra cut her body — legend, not documented history. Patna's own name is popularly said to derive from "Patan Devi," though that etymology is folk tradition rather than settled linguistics. Documented history is thinner: the current Badi Patan Devi structure is associated with the British-era figure Badrinath Chaudhary, while the linked Chhoti Patan Devi shrine (an ASI-listed monument) may date its rebuilding to the 16th–17th century, with some sources speculating an original core from the 9th–11th century — genuinely uncertain, and flagged as such by the sources themselves. Chhoti Patan Devi also holds older Brahmanical images (Ganesh, Vishnu, Surya) and architectural fragments, suggesting reuse of earlier material.$$,
  'Puranic Shakti Peetha tradition; local/folk etymology; ASI listing (Chhoti Patan Devi)', 'Small stone and brick shrine structures; black-stone deity images on raised simhasans', null,
  null,
  'Per a third-party temple-info aggregator, not an official source: daily roughly 6am–10pm, with Tuesdays especially busy.',
  null,
  null, null, 'Patna Junction', 10, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Mahavir Mandir, Patna'),
  'https://upload.wikimedia.org/wikipedia/commons/5/5f/Mahavir_Mandir%2C_patna.JPG',
  'Mahavir Mandir, Patna',
  'Rheashita12345, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Mahavir_Mandir,_patna.JPG'
),
(
  (select id from public.temples where name = 'Janaki Temple, Sitamarhi'),
  'https://upload.wikimedia.org/wikipedia/commons/d/da/Janakisthan%2C_Sitamarhi%2C_Bihar.jpg',
  'Janaki Sthan, Sitamarhi — one of the two temples in the town associated with the birthplace of Sita',
  'Mala chaubey, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Janakisthan,_Sitamarhi,_Bihar.jpg'
),
(
  (select id from public.temples where name = 'Ajgaibinath Temple, Sultanganj'),
  'https://upload.wikimedia.org/wikipedia/commons/4/4a/Ajgabinath.JPG',
  'Ajgaibinath Temple, Sultanganj',
  'Svarya, via Wikimedia Commons',
  'Public Domain',
  'https://commons.wikimedia.org/wiki/File:Ajgabinath.JPG'
),
(
  (select id from public.temples where name = 'Badi Patan Devi Temple, Patna'),
  'https://upload.wikimedia.org/wikipedia/commons/4/44/Patan_Devi.jpg',
  'Badi Patan Devi Temple, Patna',
  'Shivam Setu, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Patan_Devi.jpg'
);
