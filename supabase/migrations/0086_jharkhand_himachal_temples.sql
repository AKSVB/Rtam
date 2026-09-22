-- Ṛtam — first real batch for Jharkhand and Himachal Pradesh: both states
-- previously had only their single Jyotirlinga/Shakti Peetha entry from
-- the original seed (Vaidyanath, Deoghar; Naina Devi, Jwalamukhi,
-- Chintpurni), and nothing else. 4 more temples each here.
--
-- As with the AP/Telangana batch, every fact was checked against
-- Wikipedia; where a founding date or origin story is genuinely
-- uncertain or legendary in the sources themselves (Rajrappa's exact
-- founding, Pahari Mandir's colonial-era history, Jakhu's undocumented
-- origin, Deori's disputed century range, Bhimakali's approximate 13th-
-- century dating), that's phrased as traditional/approximate and
-- construction_century is left null where the dispute is real. Baijnath
-- is the one temple in this batch with a genuinely solid inscription-
-- dated founding year (1204 CE).

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Chhinnamastika Temple, Rajrappa', 'Chhinnamasta (Devi, one of the ten Mahavidyas)', 'Shakta', array['Tantric shrine']::text[], 'India', 'Jharkhand', 'Ramgarh', 'Rajrappa', 23.63222, 85.69389, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Damodar (confluence with the Bhairavi)', 0.1, 'Busiest at Makar Sankranti (mid-Jan), Maha Shivaratri and Vijayadashami, and on every full and new moon.',
  $$Set at the confluence of the Damodar and Bhairavi rivers, this is a recognised centre of Chhinnamasta worship, one of the ten tantric Mahavidyas, depicted self-decapitated and holding her own severed head. Unusually, the deity is represented not by a carved idol but by a natural rock covered in an ashtadhatu (eight-metal alloy) kavacha. The site's association with tantric and tribal worship is old, and it was well established as a centre of Chhinnamasta worship by the 18th century, though an exact founding date is not reliably documented.$$,
  'Wikipedia; local tradition', 'Tantric-style temple architecture', null, 'approved'
),
(
  'Pahari Mandir, Ranchi', 'Shiva (Shivalinga)', 'Shaiva', array['Freedom struggle site']::text[], 'India', 'Jharkhand', 'Ranchi', 'Ranchi', 23.37500, 85.31100, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Shravan (Jul–Aug) and Maha Shivaratri (Feb–Mar) draw the largest crowds, reportedly up to a lakh of devotees on Shivaratri.',
  $$This hilltop shrine sits on what was originally called Tiriburu hill; local tradition holds it earned the grim name "Hanging Gallows" under British rule, when freedom fighters were reportedly hanged there. After independence, freedom fighter K. C. Das is said to have hoisted the national flag at the site, and it is locally described as among the first temples in India to fly the tricolour alongside religious flags on Independence Day and Republic Day — a distinctive, locally-attested history rather than an independently footnoted academic record.$$,
  'Local history and tradition', null, null, 'approved'
),
(
  'Basukinath Temple, Dumka', 'Shiva (Baba Basukinath)', 'Shaiva', array['Kanwar pilgrimage']::text[], 'India', 'Jharkhand', 'Dumka', 'Basukinath', 24.66222, 87.15250, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The month-long Shravani Mela (Jul–Aug) and Maha Shivaratri (Feb–Mar) are the major seasons.',
  $$One of three major Shiva temples of the Bihar–Jharkhand region, alongside Baidyanath Temple at Deoghar and Ajgaibinath Temple. Basukinath is traditionally the second leg of the Kanwar/Shravani pilgrimage: devotees first offer jal at Baidyanath Dham, Deoghar, then travel roughly 45 km here to complete the ritual. The 30-shrine complex is built in Nagara style with a pyramid-shaped shikhara; an exact founding century is not reliably documented.$$,
  'Wikipedia; regional pilgrimage tradition', 'Nagara style, pyramid-shaped shikhara', null, 'approved'
),
(
  'Maa Dewri Temple, Deori', 'Maa Dewri (16-armed "Solha Bhuji" form of Durga/Devi)', 'Shakta', array['Adivasi priesthood']::text[], 'India', 'Jharkhand', 'Ranchi', 'Deori', 23.04611, 85.68278, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Navratri is the major festival.',
  $$Local tradition holds the temple was built around 1300 CE by Kera, a Munda (Adivasi) king, after the goddess reportedly helped him regain power following a military defeat — presented here as legend, since sources give an inconsistent range (some place the temple's origins as early as the 10th–12th century) rather than a settled date. The sanctum's roughly three-foot murti is locally said to be some 700 years old. Built from dry-stone construction — interlocking stones with no mortar — the temple is unusual in Jharkhand for still being served by Pahan (tribal) priests alongside a Brahmin priest tradition.$$,
  'Local tradition', 'Ancient dry-stone construction (interlocking stones, no mortar)', null, 'approved'
),
(
  'Hidimba Devi Temple, Manali', 'Hidimba / Hidimbi (Devi; the Rakshasi of the Mahabharata who married Bhima)', 'Shakta', array['Cave temple']::text[], 'India', 'Himachal Pradesh', 'Kullu', 'Manali', 32.24228, 77.18737, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Dhungri Mela (mid-May) and Navratri are the major festivals.',
  $$Built in 1553 CE under Raja Bahadur Singh, the temple encloses a natural cave-like rock formation where Hidimba is said to have meditated; there is no carved idol in the main sanctum, only a footprint relic and a small brass image. The underlying legend is itself from the Mahabharata — Hidimba, a Rakshasi, married the Pandava Bhima here and bore their son Ghatotkacha — epic tradition rather than verifiable history, distinct from the temple structure's own well-attested 16th-century construction date.$$,
  'Wikipedia; temple records', 'Wooden pagoda-style shikhara — a roughly 24m tiered timber tower with an elaborately carved wooden doorway', 16, 'approved'
),
(
  'Bhimakali Temple, Sarahan', 'Bhimakali (Devi)', 'Shakta', array['Shakti Peetha']::text[], 'India', 'Himachal Pradesh', 'Shimla', 'Sarahan', 31.44943, 77.63087, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Navratri and Dussehra are the major festivals.',
  $$Traditionally the tutelary temple of the former Bushahr princely state's ruling family, and regarded by tradition as one of the 51 Shakti Peethas. Sources place its origin around the 13th century, though that date is approximate rather than inscription-fixed. The temple survived the 1905 Kangra earthquake — its main tower reportedly tilted and was later straightened — and underwent major reconstruction under Raja Padam Singh in the 1920s.$$,
  'Wikipedia; Bushahr state tradition', 'Kath-Kuni style (alternating timber-and-stone construction), twin towers, three courtyards', 13, 'approved'
),
(
  'Jakhu Temple, Shimla', 'Hanuman', null, array['108-ft Hanuman statue']::text[], 'India', 'Himachal Pradesh', 'Shimla', 'Shimla', 31.10117, 77.18183, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Tied historically to Shimla''s Dussehra observances.',
  $$Sited on Jakhu Hill, Shimla's highest point. Local legend, drawn from the Ramayana, holds that Hanuman rested here while searching for the Sanjeevani herb — legend, not historical record. The temple's actual founding date is not reliably documented; it is known to have been well established by the early 20th century (a 1912 postcard shows it standing). It is best known today for a 108-foot (33m) Hanuman statue, one of the tallest in the world, unveiled on 4 November 2010 and visible from much of Shimla.$$,
  'Wikipedia; local tradition', 'Kath-Kuni-influenced hill-temple construction', null, 'approved'
),
(
  'Baijnath Temple, Kangra', 'Shiva (Vaidyanath / Baijnath, "Lord of Physicians")', 'Shaiva', array[]::text[], 'India', 'Himachal Pradesh', 'Kangra', 'Baijnath', 32.08361, 76.96639, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Maha Shivaratri and Makar/Vaisakha Sankranti are the major festivals; unusually, Dussehra is not celebrated here, per a local legend concerning Ravana.',
  $$One of the more reliably dated ancient temples in the region: two long Sanskrit inscriptions in Sharada script on the mandapa walls record that the present structure was built in 1204 CE by two local merchant brothers, Ahuka and Manyuka, to house a Shivalinga that reportedly already existed at the site. It was restored in 1786 under Raja Sansar Chand's priest Ganga Ram, including rebuilding the spire, and survived the 1905 Kangra earthquake with only minor damage.$$,
  'Temple mandapa inscriptions (Sharada script)', 'Nagara-style stone shikhara temple', 13, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Chhinnamastika Temple, Rajrappa'),
  'https://upload.wikimedia.org/wikipedia/commons/e/ed/Chhinnamastika_Temple_Rajrappa.jpg',
  'Chhinnamastika Temple, Rajrappa',
  'Flashthomsom, via Wikimedia Commons',
  'CC0 1.0',
  'https://commons.wikimedia.org/wiki/File:Chhinnamastika_Temple_Rajrappa.jpg'
),
(
  (select id from public.temples where name = 'Pahari Mandir, Ranchi'),
  'https://upload.wikimedia.org/wikipedia/commons/0/0d/Pahari_Mandir_-_Ranchi_Hill_9243.JPG',
  'Pahari Mandir, Ranchi',
  'Biswarup Ganguly, via Wikimedia Commons',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Pahari_Mandir_-_Ranchi_Hill_9243.JPG'
),
(
  (select id from public.temples where name = 'Basukinath Temple, Dumka'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7e/Baba_Basukinath_Temple_complex_at_Basukinath%2C_Jharkhand_09.jpg',
  'Baba Basukinath Temple complex, Basukinath',
  'Pinakpani, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Baba_Basukinath_Temple_complex_at_Basukinath,_Jharkhand_09.jpg'
),
(
  (select id from public.temples where name = 'Maa Dewri Temple, Deori'),
  'https://upload.wikimedia.org/wikipedia/commons/b/bc/Maa_Dewri_Mandir.jpg',
  'Maa Dewri Temple, Deori',
  'TribhuwanKumar, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Maa_Dewri_Mandir.jpg'
),
(
  (select id from public.temples where name = 'Hidimba Devi Temple, Manali'),
  'https://upload.wikimedia.org/wikipedia/commons/a/a8/Hidimba_Devi_Temple_Manali.jpg',
  'Hidimba Devi Temple, Manali',
  'Thelazyworker, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Hidimba_Devi_Temple_Manali.jpg'
),
(
  (select id from public.temples where name = 'Bhimakali Temple, Sarahan'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b7/Bhimakali_temple.jpg',
  'Bhimakali Temple, Sarahan',
  'Abhishekptlbbk, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Bhimakali_temple.jpg'
),
(
  (select id from public.temples where name = 'Jakhu Temple, Shimla'),
  'https://upload.wikimedia.org/wikipedia/commons/1/1c/Jakhoo_temple.jpg',
  'Jakhu Temple, Shimla',
  'Rohan1331, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Jakhoo_temple.jpg'
),
(
  (select id from public.temples where name = 'Baijnath Temple, Kangra'),
  'https://upload.wikimedia.org/wikipedia/commons/5/57/Baijnath_Temple_Kangra.jpg',
  'Baijnath Temple, Kangra',
  'Arshiya Mehta, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Baijnath_Temple_Kangra.jpg'
);
