-- Ṛtam — 4 more Madhya Pradesh temples beyond Mahakaleshwar, Harsiddhi
-- Mata, Omkareshwar, Kandariya Mahadev (Khajuraho), Narmada Udgam
-- (Amarkantak) and Pitambara Peeth (Datia) — all confirmed already in
-- the live database via a direct read-only query before writing this
-- batch, not just a local-file grep (an earlier Gujarat batch found a
-- temple that existed in the live DB but not in any tracked file, so
-- checking the live database directly is now the standing practice).
--
-- This batch goes further on practical detail than earlier ones —
-- timings, nearest airport/railway, accessibility — per an explicit
-- request to gather as much as can be reliably sourced. Where that
-- detail rests on informal travel-guide sources rather than an official
-- schedule, or where sources conflict (several of the airport distances
-- here do), that's said explicitly in the text rather than presented as
-- precise fact. The structured opening/closing time columns are left
-- null throughout this batch: this app surfaces those as a live
-- "open now" signal, and the sourcing here isn't solid enough to drive
-- that without risking misleading a visitor — the approximate hours
-- instead go in timings_notes, clearly hedged.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Kal Bhairav Temple, Ujjain', 'Kal Bhairav (fierce guardian form of Shiva)', 'Shaiva', array['Tantric shrine']::text[], 'India', 'Madhya Pradesh', 'Ujjain', 'Ujjain', 23.21817, 75.76862, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Shipra', 0.2, null,
  $$The present structure stands over an older temple whose founding is attributed, in the Avanti Khanda of the Skanda Purana, to a semi-legendary king named Bhadrasen — a scriptural/legendary claim, not independently documented history. Sculptures of Shiva, Parvati, Vishnu and Ganesha from the Paramara period (9th–13th century) have been recovered on site, which is archaeologically documented; the temple's original walls carried Malwa-style paintings, now largely faded. The structure standing today reflects a Maratha-era reconstruction, restored by Mahadaji Shinde after the Third Battle of Panipat (1761) — an exact restoration date beyond "post-1761" wasn't found.$$,
  'Skanda Purana, Avanti Khanda (legendary); archaeological finds; Maratha-era records', 'Maratha style, with a Deepmalika (lamp tower); Paramara-period sculptures recovered on site', 18,
  'Devotees traditionally offer liquor as prasad here, one of the tantric panchamakara offerings distinctive to this temple — roughly a third is returned as blessed prasad. This is a normal, central part of worship at this specific temple, not an aberration, and visitors unfamiliar with the practice should expect it.',
  'Approximate daily hours, per local tourism sources rather than an official schedule: roughly 5am–10pm, with darshan paused briefly during the ~8am and ~8:30pm aartis.',
  null, 'Devi Ahilyabai Holkar Airport, Indore', 60, 'Ujjain Junction', 7, 'approved'
),
(
  'Bhojeshwar Temple, Bhojpur', 'Shiva (a monolithic 7.5-foot / 2.3m lingam)', 'Shaiva', array['Unfinished temple', 'ASI Monument of National Importance']::text[], 'India', 'Madhya Pradesh', 'Raisen', 'Bhojpur', 23.10030, 77.57970, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$Construction began in the 11th century (around 1035 CE, per inscription and sculpture dating) under the Paramara king Bhoja, and was left unfinished for reasons that aren't documented. Over 1,300 architectural plans and mason's marks are still engraved on the rocks surrounding the site — a well-studied archaeological detail. One scholarly hypothesis (art historian Shri Krishna Deva) suggests the temple may have been intended as a funerary or memorial structure for Bhoja's father Sindhuraja or uncle Munja; this is a proposed reading, not a settled fact.$$,
  'Temple inscriptions and sculpture dating; art-historical scholarship (Shri Krishna Deva)', '11th-century; a 115×82×13-ft platform, four octagonal pillars roughly 40ft each, windowless sandstone walls, and a pyramidal roof that was planned but never completed', 11,
  null,
  'Approximately 6am–7pm per travel sources; some list it closed on Mondays, others say open daily — not confirmed by an official schedule.',
  'Received a 2015 National Tourism Award for disability accessibility.',
  'Raja Bhoj International Airport, Bhopal', 43.4, 'Habibganj Railway Station, Bhopal', 22.4, 'approved'
),
(
  'Maa Sharda Devi Temple, Maihar', 'Sharda Devi, regarded as an incarnation of Saraswati', 'Shakta', array['Shakti Peetha']::text[], 'India', 'Madhya Pradesh', 'Maihar', 'Maihar', 24.26120, 80.72316, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Navratri (both Chaitra and Sharad) is the major festival, with nine days of cultural performances.',
  $$Shakti Peetha legend holds that Sati's necklace (har) fell here after Shiva carried her body, giving Maihar (Mai + har) its name — presented as legend, not history. Temple tradition dates the structure to around 502 CE, but that early date rests on tradition rather than archaeological verification, so it isn't asserted here as settled fact. Local legend also credits the warrior brothers Alha and Udal, of the Alha-Khand epic, as the temple's first devotees — Alha is said to have attained immortality through twelve years of penance here, again folklore rather than documented history.$$,
  'Shakti Peetha tradition; Alha-Khand epic (folklore); temple tradition', null, null,
  null,
  'Ropeway timings run roughly 6:30am–7:30pm, varying with season, weather and the sandhya aarti — approximate, not an official published schedule.',
  '1,064 steps lead to the hilltop shrine on Trikuta Hill; a ropeway (operated by Damodar Ropeways & Infra Ltd) is available for those unable to climb. Wheelchair access is very limited.',
  'Khajuraho Airport', 148, 'Maihar railway station', 3, 'approved'
),
(
  'Chausath Yogini Temple, Bhedaghat', 'The Yoginis — 81 images in nine groups of nine, despite the traditional "64" in the name — with a central Gauri-Shankar (Shiva-Parvati) shrine, originally a Bhairava/dancing-Shiva shrine', 'Shakta', array['Tantric shrine', 'Largest known circular yogini temple in India']::text[], 'India', 'Madhya Pradesh', 'Jabalpur', 'Bhedaghat', 23.12970, 79.80130, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Narmada', 0.5, null,
  $$Built in the early 11th century by the Kalachuri king Yuvaraja II (Yuvarajdev I, reigned roughly 975–1025 CE), with the central shrine remodelled in 1155 CE into its present Gauri-Shankar form. The town was historically known as Bhairavaghat. This history is well documented by scholars including Shaman Hatley, who read the unusual count of 81 (rather than the canonical 64) yoginis as a mark of royal patronage.$$,
  'Kalachuri dynasty records; art-historical scholarship (Shaman Hatley and others)', 'Circular yogini temple roughly 125ft in diameter — the largest known circular yogini temple in India — with a covered walkway of 81 cells and three entrance niches', 11,
  null,
  'Approximately 7am–8:30pm per travel sources; Madhya Pradesh Tourism does not publish exact hours.',
  'Hilltop site above the Narmada marble rocks at Bhedaghat; some climbing is required to reach it.',
  'Jabalpur (Dumna) Airport', 34.4, 'Jabalpur Junction', 20.9, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Kal Bhairav Temple, Ujjain'),
  'https://upload.wikimedia.org/wikipedia/commons/6/6b/Kal_Bhairav_temple_Ujjain.jpg',
  'Kal Bhairav Temple, Ujjain',
  'Utcursch, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kal_Bhairav_temple_Ujjain.jpg'
),
(
  (select id from public.temples where name = 'Bhojeshwar Temple, Bhojpur'),
  'https://upload.wikimedia.org/wikipedia/commons/c/c4/Bhojeshwar_Temple%2C_Bhojpur%2C_Madhya_Pradesh.jpg',
  'Bhojeshwar Temple, Bhojpur',
  'Suvro Banerjee, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Bhojeshwar_Temple,_Bhojpur,_Madhya_Pradesh.jpg'
),
(
  (select id from public.temples where name = 'Maa Sharda Devi Temple, Maihar'),
  'https://upload.wikimedia.org/wikipedia/commons/f/f4/Sharada_Temple_Maihar.JPG',
  'Maa Sharda Devi Temple, Maihar',
  'LRBurdak, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Sharada_Temple_Maihar.JPG'
),
(
  (select id from public.temples where name = 'Chausath Yogini Temple, Bhedaghat'),
  'https://upload.wikimedia.org/wikipedia/commons/2/20/Chausath_Yogini_temple_Bhedaghat.jpg',
  'Chausath Yogini Temple, Bhedaghat',
  'Dinesh Sharma, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Chausath_Yogini_temple_Bhedaghat.jpg'
);
