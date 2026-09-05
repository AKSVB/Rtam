-- Ṛtam — photos for 8 of the 9 Nava Narasimha temples added in
-- migration 0061. No free-licensed photo found for Yogananda Narasimha.
-- Also fills in construction_century for Ahobila Narasimha, confirmed
-- 14th-century by the Commons photo description found while sourcing.

update public.temples
  set architecture_style = 'Dravidian, carved into the hillside',
      construction_century = 14
  where name = 'Ahobila Narasimha Temple, Upper Ahobilam';

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Ahobila Narasimha Temple, Upper Ahobilam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/14th_century_Ahobila_Narasimha_Swamy_temple%2C_Upper_Ahobilam%2C_Andhra_Pradesh_India_-_05.jpg/1280px-14th_century_Ahobila_Narasimha_Swamy_temple%2C_Upper_Ahobilam%2C_Andhra_Pradesh_India_-_05.jpg',
  'Ahobila Narasimha (Ugra Narasimha) Temple, Upper Ahobilam',
  'P. Madhusudan, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:14th_century_Ahobila_Narasimha_Swamy_temple,_Upper_Ahobilam,_Andhra_Pradesh_India_-_05.jpg'
),
(
  (select id from public.temples where name = 'Kroda Narasimha Temple, Upper Ahobilam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Ahobilam-kroda-narasimha-temple-1.jpg/1280px-Ahobilam-kroda-narasimha-temple-1.jpg',
  'Kroda Narasimha Temple, Ahobilam',
  'Naikahobilam, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Ahobilam-kroda-narasimha-temple-1.jpg'
),
(
  (select id from public.temples where name = 'Malola Narasimha Temple, Upper Ahobilam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Malola_Narasimha_Temple%2C_Ahobilam%2C_January_2020_%283%29.jpg/1280px-Malola_Narasimha_Temple%2C_Ahobilam%2C_January_2020_%283%29.jpg',
  'Entrance of Malola Narasimha Temple, Ahobilam',
  'Veera Narayana, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Malola_Narasimha_Temple,_Ahobilam,_January_2020_(3).jpg'
),
(
  (select id from public.temples where name = 'Jwala Narasimha Temple, Upper Ahobilam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Jwala_Narasimha_Temple_at_Ahobilam_-1.jpg/1280px-Jwala_Narasimha_Temple_at_Ahobilam_-1.jpg',
  'Jwala Narasimha Temple, Upper Ahobilam',
  'Chaduvari, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Jwala_Narasimha_Temple_at_Ahobilam_-1.jpg'
),
(
  (select id from public.temples where name = 'Chatravata Narasimha Temple, Lower Ahobilam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Chatravata_Narasimha_Temple%2C_Ahobilam_in_February_2024_%282%29.jpg/1280px-Chatravata_Narasimha_Temple%2C_Ahobilam_in_February_2024_%282%29.jpg',
  'Chatravata Narasimha Temple, Ahobilam',
  'Veera Narayana, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Chatravata_Narasimha_Temple,_Ahobilam_in_February_2024_(2).jpg'
),
(
  (select id from public.temples where name = 'Pavana Narasimha Temple, Lower Ahobilam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/APAHO-06-Ahobilam-Pavana_Narasimha_Swamy_temple.jpg/1280px-APAHO-06-Ahobilam-Pavana_Narasimha_Swamy_temple.jpg',
  'Pavana Narasimha Swamy Temple, Ahobilam',
  'VasuVR, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:APAHO-06-Ahobilam-Pavana_Narasimha_Swamy_temple.jpg'
),
(
  (select id from public.temples where name = 'Bhargava Narasimha Temple, Lower Ahobilam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Bhargava_Narasimha_Temple_way.jpg/1280px-Bhargava_Narasimha_Temple_way.jpg',
  'Steps leading to Bhargava Narasimha Temple, Ahobilam',
  'RameshSharma1, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Bhargava_Narasimha_Temple_way.jpg'
),
(
  (select id from public.temples where name = 'Karanja Narasimha Temple, Lower Ahobilam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Karanja_Narasimha_Temple%2C_Ahobilam%2C_January_2020_%282%29.jpg/1280px-Karanja_Narasimha_Temple%2C_Ahobilam%2C_January_2020_%282%29.jpg',
  'Entrance of Karanja Narasimha Temple, Ahobilam',
  'Veera Narayana, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Karanja_Narasimha_Temple,_Ahobilam,_January_2020_(2).jpg'
);
