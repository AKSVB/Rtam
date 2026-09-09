-- Ṛtam — a second real photo for 24 of the most famous temples in the
-- database (the 12 Jyotirlingas, Pancha Bhoota Sthalam, Char Dham, and
-- Sapta Puri circuits), all richly documented on Wikimedia Commons.
-- Every photo here is distinct from the temple's existing one and from
-- every other photo added in this batch — verified by license before
-- use.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Jambukeswarar Temple, Tiruvanaikaval (Appu Sthalam)'),
  'https://upload.wikimedia.org/wikipedia/commons/6/69/Jambukeswarar_Temple_surroundings%2C_Thiruvanaikaval_ttkcvrvb122k23pxl_%281%29.jpg',
  'Jambukeswarar Temple',
  'Vinayaraj, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Jambukeswarar_Temple_surroundings,_Thiruvanaikaval_ttkcvrvb122k23pxl_(1).jpg'
),
(
  (select id from public.temples where name = 'Mahakaleshwar Jyotirlinga, Ujjain'),
  'https://upload.wikimedia.org/wikipedia/commons/7/71/Shri_mahakaleshwar_jyotirlinga_temple_Ujjain_02.jpg',
  'Mahakaleshwar Jyotirlinga',
  'Anchal lilhare, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Shri_mahakaleshwar_jyotirlinga_temple_Ujjain_02.jpg'
),
(
  (select id from public.temples where name = 'Nageshwar Jyotirlinga, Dwarka'),
  'https://upload.wikimedia.org/wikipedia/commons/8/8f/Shree_Nageshwar_Jyotirling_temple%2C_Dwarka%2C_Gujarat.jpg',
  'Nageshwar Jyotirlinga',
  'VISHALnpn, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Shree_Nageshwar_Jyotirling_temple,_Dwarka,_Gujarat.jpg'
),
(
  (select id from public.temples where name = 'Arunachaleswarar Temple, Thiruvannamalai (Agni Sthalam)'),
  'https://upload.wikimedia.org/wikipedia/commons/0/09/Thiruvannamalai_Arunachaleswarar_Temple_Rajagopuram.jpg',
  'Arunachaleswarar Temple',
  'N. Vivekananthamoorthy, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thiruvannamalai_Arunachaleswarar_Temple_Rajagopuram.jpg'
),
(
  (select id from public.temples where name = 'Ramanathaswamy Temple, Rameswaram'),
  'https://upload.wikimedia.org/wikipedia/commons/c/c4/Ramanathaswamy_Temple_Rameswaram_%281%29.jpg',
  'Ramanathaswamy Temple',
  'Muralikrishna m, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Ramanathaswamy_Temple_Rameswaram_(1).jpg'
),
(
  (select id from public.temples where name = 'Chandi Devi Temple, Haridwar'),
  'https://upload.wikimedia.org/wikipedia/commons/8/8a/Chandidevi_temple2.JPG',
  'Chandi Devi Temple',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Chandidevi_temple2.JPG'
),
(
  (select id from public.temples where name = 'Bhimashankar Jyotirlinga'),
  'https://upload.wikimedia.org/wikipedia/commons/6/63/Bhima_Shankar%2C_Maharashtra.jpg',
  'Bhimashankar Jyotirlinga',
  'Madhusudana_reddy_Singana, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Bhima_Shankar,_Maharashtra.jpg'
),
(
  (select id from public.temples where name = 'Sri Kalahasti Temple (Vayu Sthalam)'),
  'https://upload.wikimedia.org/wikipedia/commons/e/e7/India_-_TN-AP_Circuit_-_003_-_Elephant_and_bustle_of_Sri_Kalahasti_temple_%281981860753%29.jpg',
  'Sri Kalahasti Temple',
  'McKay Savage from London, UK, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:India_-_TN-AP_Circuit_-_003_-_Elephant_and_bustle_of_Sri_Kalahasti_temple_(1981860753).jpg'
),
(
  (select id from public.temples where name = 'Grishneshwar Jyotirlinga, Ellora'),
  'https://upload.wikimedia.org/wikipedia/commons/9/9f/Grishneshvara_Temple_si0351.jpg',
  'Grishneshwar Jyotirlinga',
  'G41rn8, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Grishneshvara_Temple_si0351.jpg'
),
(
  (select id from public.temples where name = 'Krishna Janmabhoomi Temple, Mathura'),
  'https://upload.wikimedia.org/wikipedia/commons/2/2f/Keshav_Dev_Temple_at_the_Shri_Krishna_Janma-Bhoomi_-_Mathura_-_India_-_2013-03_096_%2811552205214%29.jpg',
  'Krishna Janmabhoomi Temple',
  'Edmund Gall, via Wikimedia Commons',
  'CC BY-SA 2.0',
  'https://commons.wikimedia.org/wiki/File:Keshav_Dev_Temple_at_the_Shri_Krishna_Janma-Bhoomi_-_Mathura_-_India_-_2013-03_096_(11552205214).jpg'
),
(
  (select id from public.temples where name = 'Thillai Nataraja Temple, Chidambaram (Akasha Sthalam)'),
  'https://upload.wikimedia.org/wikipedia/commons/4/47/Thillai_Nataraja_Temple_%28Chidambaram_Nataraja_Temple%29.jpg',
  'Thillai Nataraja Temple',
  'Anonymous0006, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Thillai_Nataraja_Temple_(Chidambaram_Nataraja_Temple).jpg'
),
(
  (select id from public.temples where name = 'Badrinath Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/8/85/Badri_35.JPG',
  'Badrinath Temple',
  'Guptaele, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Badri_35.JPG'
),
(
  (select id from public.temples where name = 'Omkareshwar Jyotirlinga'),
  'https://upload.wikimedia.org/wikipedia/commons/a/a9/0102621_Omkareswar_Jyothirlinga_temple%2C_Mandhata_Madhya_Pradesh_005.jpg',
  'Omkareshwar Jyotirlinga',
  'Ms Sarah Welch, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:0102621_Omkareswar_Jyothirlinga_temple,_Mandhata_Madhya_Pradesh_005.jpg'
),
(
  (select id from public.temples where name = 'Vaidyanath Jyotirlinga, Deoghar'),
  'https://upload.wikimedia.org/wikipedia/commons/0/05/Baidyanath_Dham.jpg',
  'Vaidyanath Jyotirlinga',
  'Subrata Ghanty, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Baidyanath_Dham.jpg'
),
(
  (select id from public.temples where name = 'Trimbakeshwar Jyotirlinga'),
  'https://upload.wikimedia.org/wikipedia/commons/6/66/Trimbakeshwar_Shiva_Temple%2C_Trimbak%2C_Nashik_District%2C_Maharastra_%282%29.jpg',
  'Trimbakeshwar Jyotirlinga',
  'K.Venkataramana, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Trimbakeshwar_Shiva_Temple,_Trimbak,_Nashik_District,_Maharastra_(2).jpg'
),
(
  (select id from public.temples where name = 'Kedarnath Jyotirlinga'),
  'https://upload.wikimedia.org/wikipedia/commons/c/c3/1882_Photograph_of_Kedarnath.jpg',
  'Kedarnath Jyotirlinga',
  'Geological Survey of India, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:1882_Photograph_of_Kedarnath.jpg'
),
(
  (select id from public.temples where name = 'Ekambareswarar Temple, Kanchipuram (Prithvi Sthalam)'),
  'https://upload.wikimedia.org/wikipedia/commons/7/77/Ekambareswarar_temple_%281%29.jpg',
  'Ekambareswarar Temple',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Ekambareswarar_temple_(1).jpg'
),
(
  (select id from public.temples where name = 'Jagannath Temple, Puri'),
  'https://upload.wikimedia.org/wikipedia/commons/f/f2/Jagannath_Temple_Puri.jpg',
  'Jagannath Temple',
  'Hellohappy, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Jagannath_Temple_Puri.jpg'
),
(
  (select id from public.temples where name = 'Somnath Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/9/99/Guj21_Somnath_Temple_built_by_Ahilya_Bai_Holkar.jpg',
  'Somnath Temple',
  'VasuVR, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Guj21_Somnath_Temple_built_by_Ahilya_Bai_Holkar.jpg'
),
(
  (select id from public.temples where name = 'Kashi Vishwanath Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/6/65/Ganga_Dwar%2C_Gateway_of_Corridor_of_Kashi_Vishwanath_Temple%2C_Varanasi.webp',
  'Kashi Vishwanath Temple',
  'Ashvin Kaitabhya, clicked by Abhishek Pandey, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Ganga_Dwar,_Gateway_of_Corridor_of_Kashi_Vishwanath_Temple,_Varanasi.webp'
),
(
  (select id from public.temples where name = 'Dwarkadhish Temple, Dwarka'),
  'https://upload.wikimedia.org/wikipedia/commons/0/02/Dwarkadhish_Temple_20.jpg',
  'Dwarkadhish Temple',
  'Kridha20, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Dwarkadhish_Temple_20.jpg'
),
(
  (select id from public.temples where name = 'Kamakshi Amman Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/7/75/Kamakshi_Amman_Temple_East_Gopuram.jpg',
  'Kamakshi Amman Temple',
  'Shivashanky, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kamakshi_Amman_Temple_East_Gopuram.jpg'
),
(
  (select id from public.temples where name = 'Mallikarjuna Jyotirlinga, Srisailam'),
  'https://upload.wikimedia.org/wikipedia/commons/2/2a/Mallikarjuna_Temple_-_Srisailam.jpg',
  'Mallikarjuna Jyotirlinga',
  'B.K.Viswanadh, via Wikimedia Commons',
  'CC BY 2.5',
  'https://commons.wikimedia.org/wiki/File:Mallikarjuna_Temple_-_Srisailam.jpg'
),
(
  (select id from public.temples where name = 'Ram Mandir, Ayodhya'),
  'https://upload.wikimedia.org/wikipedia/commons/0/0d/Shri_Ram_Janmabhoomi_Mandir%2C_Ayodhya_25.jpg',
  'Ram Mandir',
  'Vice President''s Secretariat, via Wikimedia Commons',
  'GODL-India',
  'https://commons.wikimedia.org/wiki/File:Shri_Ram_Janmabhoomi_Mandir,_Ayodhya_25.jpg'
);
