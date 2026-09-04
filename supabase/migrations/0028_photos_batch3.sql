-- Ṛtam — more cover photos for temples that still had none
--
-- Same Wikipedia-infobox + Commons-license approach as before. Three
-- candidates this round were caught and excluded after checking the
-- actual filenames rather than trusting the title match: a Kanaka
-- Mahalakshmi (Visakhapatnam) lookup matched the city's own Wikipedia
-- page and returned a shipyard photo; Srikanteshwara (Nanjangud) matched
-- the town page and returned an administrative taluk photo; Panakala
-- Narasimha (Mangalagiri) matched a generic town-area photo. None of the
-- three are the temple.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url)
values
(
  (select id from public.temples where name = 'Chennakeshava Temple, Belur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/The_Courtyard_of_Chennakesava_Temple_-_Belur.jpg/1280px-The_Courtyard_of_Chennakesava_Temple_-_Belur.jpg',
  null,
  'Bikashrd',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:The_Courtyard_of_Chennakesava_Temple_-_Belur.jpg'
),
(
  (select id from public.temples where name = 'Draksharamam Bhimeswara Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Draksharama_temple_entrance_02.JPG/1280px-Draksharama_temple_entrance_02.JPG',
  null,
  'Adityamadhav83',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Draksharama_temple_entrance_02.JPG'
),
(
  (select id from public.temples where name = 'Kalika Mata Temple, Pavagadh'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Top_of_Pavadagh_hill.JPG/1280px-Top_of_Pavadagh_hill.JPG',
  null,
  'Phso2',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Top_of_Pavadagh_hill.JPG'
),
(
  (select id from public.temples where name = 'Khandoba Temple, Jejuri'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Khandoba_temple_Pune.jpg/1280px-Khandoba_temple_Pune.jpg',
  null,
  'PKharote',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Khandoba_temple_Pune.jpg'
),
(
  (select id from public.temples where name = 'Murudeshwara Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dc/Shiva_Statue_Murdeshwara_Temple.jpg/1280px-Shiva_Statue_Murdeshwara_Temple.jpg',
  null,
  'Nkodikal',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Shiva_Statue_Murdeshwara_Temple.jpg'
),
(
  (select id from public.temples where name = 'Vindhyavasini Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b0/Vindhyavasini_mata.jpg/1280px-Vindhyavasini_mata.jpg',
  null,
  'Raj lakshya',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Vindhyavasini_mata.jpg'
),
(
  (select id from public.temples where name = 'Yaganti Uma Maheshwara Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Uma-Maheswaraswami_Temple.jpg/1280px-Uma-Maheswaraswami_Temple.jpg',
  null,
  'Saisumanth532',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Uma-Maheswaraswami_Temple.jpg'
);
