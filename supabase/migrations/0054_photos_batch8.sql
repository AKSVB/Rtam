-- Ṛtam — photos for 10 of the 15 temples with no photo at all. No
-- free-licensed photo found for: Kanaka Mahalakshmi Temple (Visakhapatnam),
-- Bhavishya Badri Temple, Vridha Badri Temple, Uma Devi Temple (Karnaprayag),
-- Kaleshwara Mukteshwara Swamy Temple.
--
-- Adi Badri's photo shows the wider group of temples at the site (a group
-- of 16 stone shrines), since no single-shrine photo was found — distinct
-- from the earlier false match issue where a different, unrelated temple's
-- photo was mislabeled as Adi Badri.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Moreshwar Temple, Morgaon'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Moreshwar.jpg/1280px-Moreshwar.jpg',
  'Moreshwar Temple, Morgaon',
  'Mayujagtap, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Moreshwar.jpg'
),
(
  (select id from public.temples where name = 'Thiruparankundram Murugan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Thiruparankundram_Murugan_temple_and_rock_hill.jpg/1280px-Thiruparankundram_Murugan_temple_and_rock_hill.jpg',
  'Thiruparankundram Murugan Temple and rock hill',
  'Mani chiral, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Thiruparankundram_Murugan_temple_and_rock_hill.jpg'
),
(
  (select id from public.temples where name = 'Badami Banashankari Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Enne_Kambha%2C_Badami_Banashankari_Temple.jpg/1280px-Enne_Kambha%2C_Badami_Banashankari_Temple.jpg',
  'Enne Kambha (oil-lamp pillar), Badami Banashankari Temple',
  'Mallikarjunasj, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Enne_Kambha,_Badami_Banashankari_Temple.jpg'
),
(
  (select id from public.temples where name = 'Adi Badri Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/005242023_Adi_Badri_group_of_temples%2C_Uttarakhand_007.jpg/1280px-005242023_Adi_Badri_group_of_temples%2C_Uttarakhand_007.jpg',
  'The Adi Badri group of temples, Uttarakhand',
  'Ms Sarah Welch, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:005242023_Adi_Badri_group_of_temples,_Uttarakhand_007.jpg'
),
(
  (select id from public.temples where name = 'Jogulamba Temple, Alampur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Jogulamba_temple_alampur.JPG/1280px-Jogulamba_temple_alampur.JPG',
  'Jogulamba Temple, Alampur',
  'రహ్మానుద్దీన్, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Jogulamba_temple_alampur.JPG'
),
(
  (select id from public.temples where name = 'Aravindalochanar Temple, Tholaivillimangalam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Aravinda_Lochanar_temple2.jpg/1280px-Aravinda_Lochanar_temple2.jpg',
  'Aravindalochanar Temple, Tholaivillimangalam',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Aravinda_Lochanar_temple2.jpg'
),
(
  (select id from public.temples where name = 'Jwalamukhi Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fb/Jwala_mukhi_Temple_Kangra.jpg/1280px-Jwala_mukhi_Temple_Kangra.jpg',
  'Jwalamukhi Temple, Kangra',
  'Mani kopalle, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Jwala_mukhi_Temple_Kangra.jpg'
),
(
  (select id from public.temples where name = 'Raja Rajeshwara Temple, Vemulawada'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Sri_Raja_Rajeshwara_temple.jpg/1280px-Sri_Raja_Rajeshwara_temple.jpg',
  'Raja Rajeshwara Temple, Vemulawada',
  'Thistheyear2023, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Sri_Raja_Rajeshwara_temple.jpg'
),
(
  (select id from public.temples where name = 'Kottarakkara Ganapathy Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Kottarakkara_Ganapathi_Temple_2022_September.jpg/1280px-Kottarakkara_Ganapathi_Temple_2022_September.jpg',
  'Kottarakkara Ganapathy Temple',
  'Akhilan, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kottarakkara_Ganapathi_Temple_2022_September.jpg'
),
(
  (select id from public.temples where name = 'Varadavinayak Temple, Mahad'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Varad_Vinayak_Temple_Mahad.jpg/1280px-Varad_Vinayak_Temple_Mahad.jpg',
  'Varadavinayak Temple, Mahad',
  'Pradeep717, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Varad_Vinayak_Temple_Mahad.jpg'
);
