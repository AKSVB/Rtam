-- Ṛtam — 6 temples: Shankaracharya Temple (Srinagar), Martand Sun Temple
-- (Anantnag), Kheer Bhawani (Ganderbal), Jagannath Temple (Ranchi), Deo Sun
-- Temple (Aurangabad, Bihar) and the Masroor Rock-cut Temples (Kangra). None
-- existed live, confirmed by a direct database query before this batch.
--
-- Held back: Bijli Mahadev (no coordinates could be sourced) and Renuka Ji
-- (too thinly documented as a temple rather than a lake). Where sources
-- conflict (the Shankaracharya Temple's age, Martand's destruction accounts,
-- Deo's origin, Kheer Bhawani's distance from Srinagar) the conflict is
-- stated, not resolved. Coordinates are from Wikipedia and approximate.
-- Photos are confirmed only by Commons category and filename, and Deo's
-- only usable image is an 18th-century painting, captioned as such; a
-- second Deo file was left out over its licence provenance.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Shankaracharya Temple (Jyeshteshwara), Srinagar', 'Shiva, as Jyeshteshwara, with a lingam encircled by a snake', 'Shaiva', array[]::text[], 'India', 'Jammu and Kashmir', 'Srinagar', 'Srinagar', 34.0789, 74.8436, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Maha Shivaratri (Herath) is the major festival; the temple is also part of the Amarnath Yatra tradition of the new-moon mace.',
  $$Kalhana's Rajatarangini names the hill Gopadri and has King Gopaditya build a Jyeshtheshvara shrine there, which Wikipedia dates to about 371 BCE; tradition also credits Jaloka, a son of Ashoka. Dating of the standing structure is disputed: Fergusson placed it in the 17th–18th century, while Aurel Stein held that the superstructure is recent but the base and stairs are much older, and there is no scholarly consensus. Kashmiri Hindu tradition links the hill to Adi Shankara and to the composition of the Saundarya Lahari. Gulab Singh built steps from the Durga Naag side, and the temple has been managed by the Dharmarth Trust since the 19th century.$$,
  'Wikipedia (Shankaracharya Temple); Kalhana''s Rajatarangini as reported there', 'Octagonal base of about 20 ft with a square building above and a circular inner chamber; an ASI-protected monument', null,
  null, null,
  'About 240 steps lead to the sanctum. A 5.6 km road built in 1969 serves the hill, but part of it is closed to the public. Wheelchair access is not verified.',
  null, null, null, null, 'approved'
),
(
  'Martand Sun Temple, Mattan', 'Surya (Martanda)', 'Saura', array[]::text[], 'India', 'Jammu and Kashmir', 'Anantnag', 'Mattan', 33.7456, 75.2203, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$Kalhana attributes the temple to Lalitaditya Muktapida in the 8th century CE. Later chronicles (Jonaraja, Hasan Ali) say Sikandar Shah Miri destroyed it, though Wikipedia notes scholars caution against taking these accounts at face value; earthquakes caused further damage. It stands today as a ruin, and it is not established whether worship currently takes place there.$$,
  'Wikipedia (Martand Sun Temple); Kalhana''s Rajatarangini as reported there', 'Kashmiri style, blending Gandharan and Gupta influences; a ruined colonnaded courtyard of about 220 ft by 142 ft with a central shrine and 84 smaller shrines. ASI centrally protected', 8,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Kheer Bhawani Temple (Ragnya Devi), Tulmulla', 'Kheer Bhawani (Ragnya Devi), worshipped over a heptagonal spring; the kuladevi of most Kashmiri Hindus', 'Shakta', array[]::text[], 'India', 'Jammu and Kashmir', 'Ganderbal', 'Tulmulla', 34.2211, 74.73, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The Kheer Bhawani Mela on Jyeshtha Ashtami is one of the largest gatherings of Kashmiri Hindus after the Amarnath Yatra.',
  $$Kalhana's Rajatarangini and the Bhrigu Samhita mention the site, and Abul Fazl's Ain-i-Akbari describes the marshy area. A legend says the yogi Krishna Pandit Taploo found the spring after a dream. Maharaja Ranbir Singh built a dharamshala; the present spring, pond and temple date from the 1910s under Maharaja Pratap Singh, and Hari Singh renovated it later. The legend was not independently verified.$$,
  'Wikipedia (Kheer Bhawani Temple); Ganderbal district site', 'Grey stone temple built over a spring', 20,
  'Devotees offer milk and kheer to the spring, and pilgrims sit or sleep on grass mats under the chinar trees.',
  'Per commercial travel sources, not an official schedule: roughly 6am–8pm.',
  null,
  'Srinagar Airport', 47, null, null, 'approved'
),
(
  'Jagannath Temple, Dhurwa (Ranchi)', 'Jagannath', 'Vaishnava', array[]::text[], 'India', 'Jharkhand', 'Ranchi', 'Dhurwa', 23.3169, 85.2817, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Rath Yatra, with an annual fair in Ashadha, is the major festival.',
  $$Wikipedia records the temple as built by Thakur Ani Nath Shahdeo of Barkagarh and completed in December 1691; its claim that Aurangzeb desecrated it in the same year is questionable and not repeated here. The temple collapsed on 6 August 1990 and was rebuilt, reopening in February 1992, so the standing building is a 1990s reconstruction of the original.$$,
  'Wikipedia (Jagannath Temple, Ranchi)', 'Kalinga style, a smaller version of the Puri temple', 17,
  null,
  'Per a search summary, not an official schedule: roughly 5am–12pm and 3–6pm.',
  'The temple stands on a hillock reached by a staircase or a motorable path; the number of steps and wheelchair access are not verified.',
  'Birsa Munda Airport', 6, 'Ranchi Junction', 11, 'approved'
),
(
  'Deo Sun Temple (Deo Surya Mandir)', 'Surya, in a west-facing shrine', 'Saura', array[]::text[], 'India', 'Bihar', 'Aurangabad', 'Deo', 24.6588, 84.437, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Chhath, when lakhs of devotees bathe in the temple''s kunds and offer arghya to the sun, is the major occasion.',
  $$Accounts conflict and no single one is asserted. Oral tradition says Vishwakarma built the temple in a single night. The Aurangabad district site attributes it to Bhairavendra, a Chandravanshi king of Umga, in the 15th century, and Wikipedia cites an inscription of 1437 recording his dedication; a 642 CE Gupta-era inscription mentions sun worship in the area but not this temple. Some scholars think it may originally have been a Buddhist temple. The complex has the Brahma, Rudra and Surya kunds.$$,
  'Wikipedia (Deo Surya Mandir); Aurangabad district site', 'Described as a mix of Nagara, Dravidian and Vesara elements (Wikipedia); the district site gives a height of about 100 ft', null,
  null, null, null,
  null, null, 'Anugrah Narayan Road Railway Station', 20, 'approved'
),
(
  'Masroor Rock-cut Temples, Kangra', 'Shiva (a linga stands in the sanctum), in a multi-shrine complex; Vishnu, Devi and Surya associations are also noted', 'Shaiva', array[]::text[], 'India', 'Himachal Pradesh', 'Kangra', 'Masrur', 32.0726, 76.1371, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Beas', null, null,
  $$The complex was first reported by Henry Shuttleworth in 1913 and surveyed by Harold Hargreaves of the ASI in 1915, who corrected the earlier description of it as a Vaishnava temple by noting the Shiva linga. Michael Meister dates it to the first half of the 8th century. It was never completed and was damaged by earthquake. A local attribution to the Pandavas is common but was not sourced.$$,
  'Wikipedia (Masrur Temples); Kangra district site', 'Monolithic rock-cut Nagara-style shikhara temples on a square mandala plan, with a sacred pool. An ASI-protected monument', 8,
  null, null, null,
  'Gaggal Airport, Kangra', 35.6, null, null, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Shankaracharya Temple (Jyeshteshwara), Srinagar'),
  'https://upload.wikimedia.org/wikipedia/commons/6/6d/7th_century_Sankaracharya_temple%2C_Gopagiri_Srinagar%2C_Jammu_%26_Kashmir.jpg',
  'Shankaracharya Temple on Gopadri hill, Srinagar',
  'Ms Sarah Welch, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:7th_century_Sankaracharya_temple,_Gopagiri_Srinagar,_Jammu_%26_Kashmir.jpg'
),
(
  (select id from public.temples where name = 'Shankaracharya Temple (Jyeshteshwara), Srinagar'),
  'https://upload.wikimedia.org/wikipedia/commons/0/07/Kashmir._Temple_of_Jyeshteswara_-Shankaracharya-%2C_on_the_Takht-i-Suliman_Hill%2C_near_Srinagar._Probable_date_220_B.C._1.jpg',
  'The temple on the Takht-i-Suliman hill, 1868 photograph',
  'John Burke (1868), via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Kashmir._Temple_of_Jyeshteswara_-Shankaracharya-,_on_the_Takht-i-Suliman_Hill,_near_Srinagar._Probable_date_220_B.C._1.jpg'
),
(
  (select id from public.temples where name = 'Martand Sun Temple, Mattan'),
  'https://upload.wikimedia.org/wikipedia/commons/f/fc/Details_-_Martand_Temple.JPG',
  'Carved details at the Martand Sun Temple ruins',
  'Gaurav Kumar, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Details_-_Martand_Temple.JPG'
),
(
  (select id from public.temples where name = 'Martand Sun Temple, Mattan'),
  'https://upload.wikimedia.org/wikipedia/commons/f/fa/1_Sun_Temple_Martand_Jammu_Kashmir_India_ancient_Hindu_temple_in_ruins.jpg',
  'Martand Sun Temple, an ancient Hindu temple in ruins',
  'Ankur P, via Wikimedia Commons',
  'CC BY-SA 2.0',
  'https://commons.wikimedia.org/wiki/File:1_Sun_Temple_Martand_Jammu_Kashmir_India_ancient_Hindu_temple_in_ruins.jpg'
),
(
  (select id from public.temples where name = 'Kheer Bhawani Temple (Ragnya Devi), Tulmulla'),
  'https://upload.wikimedia.org/wikipedia/commons/9/9a/Kheer_Bhawani.jpg',
  'Kheer Bhawani Temple, Tulmulla',
  'Akshey25, via Wikimedia Commons',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Kheer_Bhawani.jpg'
),
(
  (select id from public.temples where name = 'Kheer Bhawani Temple (Ragnya Devi), Tulmulla'),
  'https://upload.wikimedia.org/wikipedia/commons/1/14/Kheer_Bhawani-2.jpg',
  'The spring shrine at Kheer Bhawani',
  'Akshey25, via Wikimedia Commons',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Kheer_Bhawani-2.jpg'
),
(
  (select id from public.temples where name = 'Jagannath Temple, Dhurwa (Ranchi)'),
  'https://upload.wikimedia.org/wikipedia/commons/4/4a/1_Jagganath_temple_Ranchi_Jharkhand.jpg',
  'Jagannath Temple, Ranchi',
  'Ms Sarah Welch, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:1_Jagganath_temple_Ranchi_Jharkhand.jpg'
),
(
  (select id from public.temples where name = 'Jagannath Temple, Dhurwa (Ranchi)'),
  'https://upload.wikimedia.org/wikipedia/commons/9/95/17th_century_Jagannath_temple_Ranchi_Jharkhand_-_9.jpg',
  'Jagannath Temple on its hillock, Ranchi',
  'Ms Sarah Welch, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:17th_century_Jagannath_temple_Ranchi_Jharkhand_-_9.jpg'
),
(
  (select id from public.temples where name = 'Deo Sun Temple (Deo Surya Mandir)'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d6/Oriental_Scenery_Part_5_Fig_5.jpg',
  'The Deo Sun Temple, an 18th-century painting by Thomas Daniell',
  'Thomas Daniell, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Oriental_Scenery_Part_5_Fig_5.jpg'
),
(
  (select id from public.temples where name = 'Masroor Rock-cut Temples, Kangra'),
  'https://upload.wikimedia.org/wikipedia/commons/2/2c/Carving_at_Masrur_Temple_in_Himachal_Pradesh.JPG',
  'Carving at the Masroor Temples',
  'Prakash1972 2000, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Carving_at_Masrur_Temple_in_Himachal_Pradesh.JPG'
),
(
  (select id from public.temples where name = 'Masroor Rock-cut Temples, Kangra'),
  'https://upload.wikimedia.org/wikipedia/commons/b/bb/005132023_Masroor_group_of_temples%2C_Himachal_Pradesh.jpg',
  'Masroor group of temples',
  'Ms Sarah Welch, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:005132023_Masroor_group_of_temples,_Himachal_Pradesh.jpg'
);
