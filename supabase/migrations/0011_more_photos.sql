-- Ṛtam — cover photos for the temples added in 0010_more_temples.sql
--
-- Sourced from Wikimedia Commons via the Wikipedia REST API; every URL below
-- was resolved and its license/credit verified against Commons imageinfo
-- before being included here. Temples whose article had no usable lead
-- image are simply left without a seeded photo, for contributors to fill in.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url)
values
(
  (select id from public.temples where name = 'Bhadrachalam Sita Ramachandraswamy Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/9/93/Sri_sita_rama_temple_bhadrachalam_temple_view.jpg',
  null,
  'WithShivaram',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Sri_sita_rama_temple_bhadrachalam_temple_view.jpg'
),
(
  (select id from public.temples where name = 'Kanaka Durga Temple, Vijayawada'),
  'https://upload.wikimedia.org/wikipedia/commons/b/ba/Kanakadurga_Temple_gopuram.jpg',
  null,
  'Srikar Kashyap',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kanakadurga_Temple_gopuram.jpg'
),
(
  (select id from public.temples where name = 'Kalkaji Mandir, Delhi'),
  'https://upload.wikimedia.org/wikipedia/commons/e/e2/Kalkaji-shrine.jpg',
  null,
  'Wikimedia Commons contributor',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Kalkaji-shrine.jpg'
),
(
  (select id from public.temples where name = 'Durgiana Temple, Amritsar'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d8/Many_of_the_locals_we_had_spoken_to_were_delighted_that_the_Govt_has_sanctioned_funds_for_renovation_of_this_temple_%2838049489065%29.jpg',
  null,
  'shankar s. from Dubai, united arab emirates',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Many_of_the_locals_we_had_spoken_to_were_delighted_that_the_Govt_has_sanctioned_funds_for_renovation_of_this_temple_(38049489065).jpg'
),
(
  (select id from public.temples where name = 'Danteshwari Temple, Dantewada'),
  'https://upload.wikimedia.org/wikipedia/commons/f/f6/Danteswari_Temple_0034.jpg',
  null,
  'Ratnesh1948',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Danteswari_Temple_0034.jpg'
),
(
  (select id from public.temples where name = 'Shantadurga Temple, Kavalem'),
  'https://upload.wikimedia.org/wikipedia/commons/5/56/Shantadurga_temple.jpg',
  null,
  'Nkodikal',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Shantadurga_temple.jpg'
),
(
  (select id from public.temples where name = 'Eklingji Temple, Kailashpuri'),
  'https://upload.wikimedia.org/wikipedia/commons/2/28/Meera_temple_Eklingji.jpg',
  null,
  'Nikhil Varma at English Wikipedia',
  'CC BY 2.5',
  'https://commons.wikimedia.org/wiki/File:Meera_temple_Eklingji.jpg'
),
(
  (select id from public.temples where name = 'Karni Mata Temple, Deshnoke'),
  'https://upload.wikimedia.org/wikipedia/commons/6/64/20191212_%C5%9Awi%C4%85tynia_Karni_Maty_w_De%C5%9Bnok_1031_8078_DxO.jpg',
  null,
  'Jakub Hałun',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:20191212_Świątynia_Karni_Maty_w_Deśnok_1031_8078_DxO.jpg'
),
(
  (select id from public.temples where name = 'Khatu Shyam Ji Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/2/2d/Shyam-baba-live-darshan-photo.jpg',
  null,
  'PraveenKumarGiluka',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Shyam-baba-live-darshan-photo.jpg'
),
(
  (select id from public.temples where name = 'Pushkar Brahma Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/3/39/Brahma_Temple%2C_Pushkar.jpg',
  null,
  'https://www.flickr.com/photos/vasantv/',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Brahma_Temple,_Pushkar.jpg'
),
(
  (select id from public.temples where name = 'Dharmasthala Manjunatha Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d1/Dharmasthala_Temple.jpg',
  null,
  'Vedamurthy J',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Dharmasthala_Temple.jpg'
),
(
  (select id from public.temples where name = 'Vadakkunnathan Temple, Thrissur'),
  'https://upload.wikimedia.org/wikipedia/commons/0/0f/%E0%B4%B5%E0%B4%9F%E0%B4%95%E0%B5%8D%E0%B4%95%E0%B5%81%E0%B4%82%E0%B4%A8%E0%B4%BE%E0%B4%A5%E0%B4%95%E0%B5%8D%E0%B4%B7%E0%B5%87%E0%B4%A4%E0%B5%8D%E0%B4%B0%E0%B4%82-%E0%B4%A4%E0%B5%86%E0%B4%95%E0%B5%8D%E0%B4%95%E0%B5%87%E0%B4%97%E0%B5%8B%E0%B4%AA%E0%B5%81%E0%B4%B0%E0%B4%82.jpg',
  null,
  'Challiyan at Malayalam Wikipedia',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:വടക്കുംനാഥക്ഷേത്രം-തെക്കേഗോപുരം.jpg'
),
(
  (select id from public.temples where name = 'Chottanikkara Devi Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/a/ae/Chottanikkara_Temple.jpg',
  null,
  'Roney Maxwell',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Chottanikkara_Temple.jpg'
),
(
  (select id from public.temples where name = 'Attukal Bhagavathy Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d1/Attukal_temple.jpg',
  null,
  'Vijayakumarblathur',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Attukal_temple.jpg'
),
(
  (select id from public.temples where name = 'Adi Kumbeswarar Temple, Kumbakonam'),
  'https://upload.wikimedia.org/wikipedia/commons/3/3c/Kumbakonam_Mahamaham_Tank.jpg',
  null,
  'Trawell.in',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kumbakonam_Mahamaham_Tank.jpg'
),
(
  (select id from public.temples where name = 'Suchindram Thanumalayan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/a/ae/Oor_koodi_therr_illuthal.JPG',
  null,
  'Ganesan',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Oor_koodi_therr_illuthal.JPG'
),
(
  (select id from public.temples where name = 'Bakreshwar Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/c/c9/Bakreswar_Temples_and_Hot_spring_12.jpg',
  null,
  'Pinakpani',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Bakreswar_Temples_and_Hot_spring_12.jpg'
),
(
  (select id from public.temples where name = 'Biraja Temple, Jajpur'),
  'https://upload.wikimedia.org/wikipedia/commons/a/a5/Biraja_Temple%2C_Jajpur%2C_Odisha%2C_India%2C_13th_century.jpg',
  null,
  'Odisha1',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Biraja_Temple,_Jajpur,_Odisha,_India,_13th_century.jpg'
),
(
  (select id from public.temples where name = 'Mallikarjuna Jyotirlinga, Srisailam'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b0/Srisailam-temple-entrance.jpg',
  null,
  'Chintohere',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Srisailam-temple-entrance.jpg'
),
(
  (select id from public.temples where name = 'Chintpurni Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/3/3f/Chintpurni.jpg',
  null,
  'Hemant banswal',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Chintpurni.jpg'
),
(
  (select id from public.temples where name = 'Sri Krishna Matha, Udupi'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7d/Udupi_Sri_Krishna_Matha_Temple.jpg',
  null,
  'Ashok Prabhakaran from Chennai, India',
  'CC BY-SA 2.0',
  'https://commons.wikimedia.org/wiki/File:Udupi_Sri_Krishna_Matha_Temple.jpg'
),
(
  (select id from public.temples where name = 'Guruvayur Sri Krishna Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/1/17/Guruvayoor_Temple_1.jpg',
  null,
  'Susmitanair',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Guruvayoor_Temple_1.jpg'
),
(
  (select id from public.temples where name = 'Tripura Sundari Temple, Udaipur'),
  'https://upload.wikimedia.org/wikipedia/commons/b/be/Tripura_Sundari_Temple%2C_Udaipur.jpg',
  null,
  'No machine-readable author provided. Soman assumed (based on copyright claims).',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tripura_Sundari_Temple,_Udaipur.jpg'
),
(
  (select id from public.temples where name = 'Tarapith Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/3/36/Maa_Tara_Temple.jpg',
  null,
  'Pinakpani',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Maa_Tara_Temple.jpg'
);
