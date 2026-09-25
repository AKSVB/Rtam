-- Ṛtam — 3 Delhi and 2 Puducherry temples (Delhi previously had only
-- Kalkaji Mandir and Puducherry only Tirunallar Dharbaranyeswarar Temple,
-- confirmed via a live database query before writing this batch).
--
-- Fields the research could not verify from a source (most accessibility
-- notes, several airport/railway distances, ASI-protection claims) are
-- deliberately left null rather than filled from memory. Timings are all
-- from tourism/aggregator sites, not official temple schedules, and say so.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Chhatarpur Mandir (Shri Aadya Katyayani Shakti Peeth), Delhi', 'Katyayani — a form of Durga', 'Shakta', array[]::text[], 'India', 'Delhi', 'South Delhi', 'Chhatarpur', 28.5019, 77.1794, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Navratri, held twice a year, is the major festival and draws very large crowds, with a community kitchen (langar) running for visitors.',
  $$Established in 1974 by Baba Sant Nagpal ji, who died in 1998 and whose samadhi is within the complex. A large modern temple complex rather than an ancient site.$$,
  'Wikipedia (Chhatarpur Temple)', 'South Indian (Chola-style) temple within a large modern complex', 20,
  'Photography is not permitted in the prayer hall. The Katyayani shrine is opened only during the two Navratri periods.',
  'Per an aggregator site, not an official schedule: roughly 6am–10pm, evening aarti around 7pm.',
  null,
  'Indira Gandhi International Airport, Delhi', 12, null, null, 'approved'
),
(
  'Laxminarayan Temple (Birla Mandir), Delhi', 'Lakshmi and Narayana (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Delhi', 'Central Delhi', 'New Delhi', 28.6328, 77.1989, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Janmashtami and Diwali draw the largest crowds.',
  $$Built between 1933 and 1939 by the industrialist Jugal Kishore Birla with his father Baldeo Das Birla; the foundation stone was laid by Maharaj Udaybhanu Singh. Gandhi inaugurated the temple in 1939 on the condition that people of all castes be admitted.$$,
  'Wikipedia (Laxminarayan Temple); Delhi Tourism', 'Nagara (northern) style', 20,
  'Photography, mobile phones and cameras are not allowed inside the temple.',
  'Per Delhi Tourism (a tourism source, not the temple''s own schedule): roughly 4:30am–1:30pm and 2:30–9pm; free entry.',
  null,
  null, null, null, null, 'approved'
),
(
  'Yogmaya Temple, Mehrauli', 'Yogmaya — described in tradition as an aspect of Maya and sister of Krishna', 'Shakta', array[]::text[], 'India', 'Delhi', 'South Delhi', 'Mehrauli', 28.525, 77.1825, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The interfaith Phool Walon Ki Sair festival, held here since 1812, falls in roughly September to November — sources differ on the exact month, so check locally.',
  $$Tradition holds that the Pandavas built the temple after the Mahabharata war, but this is unproven and archaeological evidence points to a more recent date. It is said to have been damaged and rebuilt several times over the centuries; the present structure dates to a restoration in 1827.$$,
  'Wikipedia (Yogmaya Temple); traditional Pandava attribution is unproven', 'Copper-plated tower over a small square sanctum; black stone idol set in a marble well', 19,
  null,
  'Per aggregator sites, not an official schedule: roughly 4:30am–8:30pm, with aarti around 5am and 8pm.',
  null,
  null, null, null, null, 'approved'
),
(
  'Vedapureeswarar Temple, Puducherry', 'Vedapurishvarar (Shiva) and Tripurasundari (Parvati)', 'Shaiva', array[]::text[], 'India', 'Puducherry', 'Puducherry', 'Puducherry', 11.9399, 79.8298, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Brahmotsavam in Vaikasi (May–June), Annabhishekam in Aippasi (Oct–Nov) and Maha Shivaratri in Masi (Feb–Mar) are the major festivals.',
  $$Per Wikipedia the temple dates to 1674, was destroyed in 1748 by French troops during religious riots, and was rebuilt in 1788 by Divan Kandappa Mudaliar through public contributions. Only one source was checked for this account.$$,
  'Wikipedia (Vedapureeswarar Temple, Pondicherry)', 'Dravidian; seven-tiered rajagopuram of about 23 m, granite enclosure and a temple tank', 18,
  null,
  'Per aggregator sites, not an official schedule: roughly 6am–12:30pm and 4:30–8pm.',
  null,
  'Puducherry Airport', 5, 'Puducherry Railway Station', 2, 'approved'
),
(
  'Varadharaja Perumal Temple, Puducherry', 'Varadharaja Perumal (Vishnu) with Perundevi Thayar (Lakshmi); the main idol is a five-foot standing granite figure', 'Vaishnava', array[]::text[], 'India', 'Puducherry', 'Puducherry', 'Puducherry', 11.9408, 79.83, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Ten-day Brahmotsavam in Chithrai (Apr–May), five-day Pavitrotsavam in Avani (Aug–Sep), and a 25-day Rama–Sita wedding festival in Chithrai.',
  $$Tradition attributes the temple to the Cholas around the 11th century, with later Pandya expansion, but that attribution is repeated mainly by tourism sources and is not a dated fact. The temple was reportedly damaged and rebuilt during 17th–18th century conflicts, and statues of Rama, Sita, Hanuman and Krishna were unearthed and reinstalled in 1902. Sources differ slightly on which subsidiary idols are installed.$$,
  'Wikipedia (Varadharaja Perumal Temple, Puducherry); Chola attribution is traditional and unverified', 'Dravidian; five-tiered rajagopuram of about 34 m with a granite enclosure wall', null,
  null,
  'Per Pondicherry Tourism (a commercial tourism site, not the temple''s own schedule): roughly 6am–12pm and 4–9pm; free entry.',
  null,
  null, null, 'Puducherry Railway Station', 2, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Chhatarpur Mandir (Shri Aadya Katyayani Shakti Peeth), Delhi'),
  'https://upload.wikimedia.org/wikipedia/commons/e/e9/Chattarpur_Temple.jpg',
  'Chhatarpur Mandir, Delhi',
  'Sujit kumar, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Chattarpur_Temple.jpg'
),
(
  (select id from public.temples where name = 'Laxminarayan Temple (Birla Mandir), Delhi'),
  'https://upload.wikimedia.org/wikipedia/commons/3/37/Laxminarayan_Temple_in_New_Delhi_03-2016.jpg',
  'Laxminarayan Temple, New Delhi',
  'A.Savin, via Wikimedia Commons',
  'Free Art License',
  'https://commons.wikimedia.org/wiki/File:Laxminarayan_Temple_in_New_Delhi_03-2016.jpg'
),
(
  (select id from public.temples where name = 'Yogmaya Temple, Mehrauli'),
  'https://upload.wikimedia.org/wikipedia/commons/f/fc/Entry_Door_to_the_Yogmaya_precincts.JPG',
  'Entrance to the Yogmaya Temple precincts, Mehrauli',
  'Nvvchar, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Entry_Door_to_the_Yogmaya_precincts.JPG'
),
(
  (select id from public.temples where name = 'Vedapureeswarar Temple, Puducherry'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b6/Vedapureeswarar_temple%2C_Pondicherry_%287%29.jpg',
  'Vedapureeswarar Temple, Puducherry',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Vedapureeswarar_temple,_Pondicherry_(7).jpg'
),
(
  (select id from public.temples where name = 'Varadharaja Perumal Temple, Puducherry'),
  'https://upload.wikimedia.org/wikipedia/commons/4/44/Varadharajaperumal_temple%2C_Puducherry_%281%29.jpg',
  'Varadharaja Perumal Temple, Puducherry',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Varadharajaperumal_temple,_Puducherry_(1).jpg'
);
