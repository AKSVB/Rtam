-- Ṛtam — 11 new temples: Chennakeshava (Somanathapura), Pattadakal, Durga
-- Temple (Aihole), Kadri Manjunatha and Mangaladevi (Mangaluru), Dodda Basavana
-- Gudi (Bengaluru), Ramappa (Telangana), Kondagattu Anjaneya (Telangana),
-- Thirunelli, Janardanaswamy (Varkala) and Rajarajeshwara (Taliparamba) in
-- Kerala. Checked against the live temples list before writing: none of these
-- existed (Chennakeshava at Belur and Hoysaleswara at Halebidu are separate
-- temples and already present).
--
-- Facts and coordinates come from Wikipedia's article for each temple and were
-- not independently re-verified against a second geodata source. Only claims
-- stated there are used; fields the source does not state are left null/unknown.
-- Photo licences were individually verified via the Wikimedia Commons API. The
-- only photo found for Dodda Basavana Gudi shows its Ganesha shrine, not the
-- Nandi, so that temple has no photo yet.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Chennakeshava Temple, Somanathapura', 'Kesava (Vishnu), with Janardhana and Venugopala in the side sanctums', 'Vaishnava', array[]::text[], 'India', 'Karnataka', 'Mysuru', 'Somanathapura', 12.27569, 76.88165, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Kaveri River', null, null,
  $$Consecrated in 1258 CE by Somanatha Dandanayaka, a general of the Hoysala king Narasimha III, on the banks of the Kaveri about 38 km east of Mysuru. The ornate temple stands on a high star-shaped platform with three symmetrical sanctums around a shared pillared hall: the western for Kesava (the image is missing), the northern for Janardhana and the southern for Venugopala. A pillared corridor of small shrines (damaged) encloses the courtyard, and the walls, pillars and ceilings carry dense carved iconography.$$,
  'Wikipedia (Chennakesava Temple, Somanathapura)', 'Hoysala; trikuta (three-sanctum) plan on a star-shaped platform', 13,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Pattadakal Group of Monuments', 'Shiva, across several temples; one Jain shrine', 'Shaiva', array[]::text[], 'India', 'Karnataka', 'Bagalkot', 'Pattadakal', 15.95139, 75.81472, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Malaprabha River', null, null,
  $$A complex of 7th–8th century CE Hindu and Jain temples on the west bank of the Malaprabha, about 23 km from Badami and 9.7 km from Aihole. It is a UNESCO World Heritage Site and an ASI-protected monument. UNESCO describes it as a harmonious blend of northern and southern Indian architectural forms. The Hindu temples are generally dedicated to Shiva, with Vaishnava and Shakta elements, and their friezes depict episodes from the Ramayana, Mahabharata and Bhagavata Purana; the one Jain temple is dedicated to a single Jina.$$,
  'Wikipedia (Pattadakal)', 'Early Chalukya, blending northern (Nagara) and southern (Dravida) forms; ASI-managed UNESCO site', 8,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Durga Temple, Aihole', 'Originally Surya; now named for Durga', 'Saura', array[]::text[], 'India', 'Karnataka', 'Bagalkot', 'Aihole', 16.02067, 75.88194, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$An early 8th-century temple, originally dedicated to Surya. It is called Durga because a durg (fortified lookout) was built on top of it after the 13th century, during the wars between Hindu kingdoms and the Sultanates; that structure has since been removed and the temple restored. It has the largest and most embellished relief panels in Aihole, depicting Shaiva, Vaishnava, Shakta and Vedic themes, and is a rare apsidal-plan example among early Chalukya temples. It is part of a pending UNESCO World Heritage nomination.$$,
  'Wikipedia (Durga temple, Aihole)', 'Early Chalukya; apsidal plan', 8,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Kadri Manjunatha Temple, Mangaluru', 'Manjunatha (Shiva)', 'Shaiva', array[]::text[], 'India', 'Karnataka', 'Dakshina Kannada', 'Mangaluru', 12.88578, 74.85558, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$A historic temple in Mangaluru. According to Wikipedia, its in-charge and priests are Shivalli Madhva Brahmins. Little else is recorded in the source, so this entry is deliberately brief.$$,
  'Wikipedia (Kadri Manjunath Temple)', null, null,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Mangaladevi Temple, Mangaluru', 'Mangaladevi (Shakti)', 'Shakta', array[]::text[], 'India', 'Karnataka', 'Dakshina Kannada', 'Bolara, Mangaluru', 12.8491, 74.8432, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$About 3 km southwest of the city centre, dedicated to Shakti as Mangaladevi, the presiding deity from whom the city takes its name. Tradition says it was built in the 9th century by the Alupa king Kundavarman under the patronage of Matsyendranath; another account credits Parashurama, with Kundavarman later expanding it. The deity sits in the central shrine, with surrounding shrines for other deities. It is run by trustees.$$,
  'Wikipedia (Mangaladevi Temple)', null, 9,
  null, 'Open daily 6 am–1 pm and 4 pm–8:30 pm (per Wikipedia; confirm locally before travelling).', null,
  null, null, null, null, 'approved'
),
(
  'Dodda Basavana Gudi (Bull Temple), Bengaluru', 'Nandi, the bull of Shiva', 'Shaiva', array[]::text[], 'India', 'Karnataka', 'Bengaluru Urban', 'Basavanagudi, Bengaluru', 12.94289, 77.56821, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$A temple to Nandi inside the Bugle Rock park in Basavanagudi, said to be among the largest Nandi temples anywhere. The monolithic stone Nandi is kept continually covered with fresh layers of butter (benne). A Ganesha shrine stands close by. On the last Monday and Tuesday of the month of Karthika a groundnut fair, Kadalekaayi Parishe, is held in the premises and groundnuts are offered to the deity.$$,
  'Wikipedia (Dodda Basavana Gudi)', null, null,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Ramappa Temple (Rudreshwara), Palampet', 'Shiva as Rudreshwara (Ramalingeshwara)', 'Shaiva', array[]::text[], 'India', 'Telangana', 'Mulugu', 'Palampet', 18.25917, 79.94333, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$An inscription on a basalt pillar in a nearby courtyard records that the temple was commissioned in 1213 by Recherla Rudra, a general of the Kakatiya king Ganapati, and built over about 40 years. Of red sandstone with carved pillars and brackets of granite and dolerite, it blends Dravidian and Chalukyan elements. Its vimana is built of lightweight, buoyant clay bricks on a "sandbox" foundation designed to absorb seismic loads. It suffered minor damage in Malik Kafur's 1310 invasion of Warangal and deteriorated after the Kakatiya decline.$$,
  'Wikipedia (Ramappa Temple)', 'Kakatiya, combining Dravidian and Chalukyan elements', 13,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Kondagattu Anjaneya Swamy Temple', 'Anjaneya (Hanuman)', null, array[]::text[], 'India', 'Telangana', 'Jagtial', 'Muthyumpeta (Mallial mandal)', 18.4045, 78.5521, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$A well-known Anjaneya Swamy temple (Telugu: కొండగట్టు ఆంజనేయస్వామి ఆలయం) in Muthyumpeta village, Mallial mandal, Jagtial district, about 15 km from Jagtial and 35 km from Karimnagar.$$,
  'Wikipedia (Kondagattu Anjaneya Swamy Temple)', null, null,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Thirunelli Temple', 'Maha Vishnu', 'Vaishnava', array[]::text[], 'India', 'Kerala', 'Wayanad', 'Thirunelli', 11.91173, 75.99583, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$An ancient Maha Vishnu temple on the slope of Brahmagiri hill in north Wayanad, near the Karnataka border, at about 900 m altitude and 32 km from Mananthavady. It is counted among the 108 Abhimana Kshetrams of the Vaishnava tradition.$$,
  'Wikipedia (Thirunelli Temple)', null, null,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Janardanaswamy Temple, Varkala', 'Vishnu as Janardanaswamy (Varkaleswara)', 'Vaishnava', array[]::text[], 'India', 'Kerala', 'Thiruvananthapuram', 'Varkala', 8.73189, 76.71, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$Located in Janardhanapuram, Varkala, and known locally as Varkaleswara, "the lord of Varkala". Wikipedia describes the temple as thousands of years old and renowned within its locality.$$,
  'Wikipedia (Janardanaswamy Temple)', null, null,
  null, null, null,
  null, null, null, null, 'approved'
),
(
  'Rajarajeshwara Temple, Taliparamba', 'Shiva as Rajarajeshwara', 'Shaiva', array[]::text[], 'India', 'Kerala', 'Kannur', 'Taliparamba', 12.04838, 75.35558, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$One of the 108 ancient Shiva temples of Kerala, about 2 km from Taliparamba town. A 14-foot bronze Shiva weighing 4,200 kg has been installed in the premises, believed to be the largest bronze Shiva idol in India.$$,
  'Wikipedia (Rajarajeshwara Temple)', null, null,
  'Per Wikipedia, women are not permitted in the inner enclosure (Nalambalam) during the daytime, and non-Hindus are not permitted to enter the temple.', null, null,
  null, null, null, null, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Chennakeshava Temple, Somanathapura'),
  'https://upload.wikimedia.org/wikipedia/commons/b/bd/Le_temple_de_Chennakesava_%28Somanathapura%2C_Inde%29_%2814465165685%29.jpg',
  'The Chennakesava Temple, Somanathapura', 'Jean-Pierre Dalbéra, via Wikimedia Commons', 'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Le_temple_de_Chennakesava_(Somanathapura,_Inde)_(14465165685).jpg'
),
(
  (select id from public.temples where name = 'Pattadakal Group of Monuments'),
  'https://upload.wikimedia.org/wikipedia/commons/0/03/Pattadakal_000.JPG',
  'The Pattadakal temple group', 'Nithin bolar k, via Wikimedia Commons', 'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Pattadakal_000.JPG'
),
(
  (select id from public.temples where name = 'Durga Temple, Aihole'),
  'https://upload.wikimedia.org/wikipedia/commons/9/9d/Durga_Temple_-_General_View.jpg',
  'The Durga Temple, Aihole', 'Itsmalay, via Wikimedia Commons', 'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Durga_Temple_-_General_View.jpg'
),
(
  (select id from public.temples where name = 'Kadri Manjunatha Temple, Mangaluru'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d4/Kadri_temple_entrance_mangalore.jpg',
  'Entrance of the Kadri Manjunatha Temple', 'Surfmaster23, via Wikimedia Commons', 'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Kadri_temple_entrance_mangalore.jpg'
),
(
  (select id from public.temples where name = 'Mangaladevi Temple, Mangaluru'),
  'https://upload.wikimedia.org/wikipedia/commons/1/1f/Mangaladevi_Temple_Mangalore_2.jpg',
  'The Mangaladevi Temple', 'Vinay bhat, via Wikimedia Commons', 'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mangaladevi_Temple_Mangalore_2.jpg'
),
(
  (select id from public.temples where name = 'Ramappa Temple (Rudreshwara), Palampet'),
  'https://upload.wikimedia.org/wikipedia/commons/2/29/Ramappa_Temple_%28Human_Scale%29.jpg',
  'The Ramappa Temple at Palampet', 'Nirav Lad, via Wikimedia Commons', 'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Ramappa_Temple_(Human_Scale).jpg'
),
(
  (select id from public.temples where name = 'Kondagattu Anjaneya Swamy Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b4/Kondagattu_temple_near_Karimnagar%2C_India.jpg',
  'Kondagattu temple near Karimnagar', 'Manasa.mani, via Wikimedia Commons', 'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kondagattu_temple_near_Karimnagar,_India.jpg'
),
(
  (select id from public.temples where name = 'Thirunelli Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/6/6b/Thirunelli_Temple%2C_Brahmagiri_2007.jpg',
  'Thirunelli Temple beneath Brahmagiri', 'Shinekarthikeyan, via Wikimedia Commons', 'Public domain',
  'https://commons.wikimedia.org/wiki/File:Thirunelli_Temple,_Brahmagiri_2007.jpg'
),
(
  (select id from public.temples where name = 'Janardanaswamy Temple, Varkala'),
  'https://upload.wikimedia.org/wikipedia/commons/8/8a/Janardhana_swamy_temple.jpg',
  'The Janardanaswamy Temple, Varkala', 'Dev, via Wikimedia Commons', 'CC0',
  'https://commons.wikimedia.org/wiki/File:Janardhana_swamy_temple.jpg'
),
(
  (select id from public.temples where name = 'Rajarajeshwara Temple, Taliparamba'),
  'https://upload.wikimedia.org/wikipedia/commons/6/6e/Outer_wall_Rajarajeshwara_Taliparamba.jpg',
  'Outer wall of the Rajarajeshwara Temple', 'Ajith U, via Wikimedia Commons', 'CC BY-SA 2.0',
  'https://commons.wikimedia.org/wiki/File:Outer_wall_Rajarajeshwara_Taliparamba.jpg'
);
