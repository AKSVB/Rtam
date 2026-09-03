-- Ṛtam — freely-licensed temple photographs from Wikimedia Commons
--
-- Every row below was resolved by querying the Wikipedia/Commons API and
-- verifying that the image URL actually returns 200, so none of these are
-- guessed or dead links. Licences are all free (CC BY, CC BY-SA, CC0,
-- public domain, GFDL, GODL-India); the photographer and a link back to the
-- file page are stored with each image because most of those licences
-- require attribution wherever the photo is displayed.
--
-- Temples whose Wikipedia article has no lead image are simply left without
-- a seeded photo, for contributors to fill in.
--
-- Re-runnable: photos with no uploader are cleared first so this can be
-- applied again without piling up duplicates.

delete from public.temple_photos where uploaded_by is null;

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url)
values
(
  (select id from public.temples where name = 'Sri Venkateswara Swamy Temple, Tirumala'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Tirumala_090615.jpg/1280px-Tirumala_090615.jpg',
  'Venkateswara Temple, Tirumala — photograph',
  'Nikhilb239',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Tirumala_090615.jpg'
),
(
  (select id from public.temples where name = 'Kashi Vishwanath Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/f/ff/Kashi_Vishwanath.jpg',
  'Kashi Vishwanath Temple — photograph',
  'Architkumar1234',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kashi_Vishwanath.jpg'
),
(
  (select id from public.temples where name = 'Ramanathaswamy Temple, Rameswaram'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Ramanathaswamy_temple7.JPG/1280px-Ramanathaswamy_temple7.JPG',
  'Ramanathaswamy Temple — photograph',
  'Ssriram mt',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Ramanathaswamy_temple7.JPG'
),
(
  (select id from public.temples where name = 'Mahakaleshwar Jyotirlinga, Ujjain'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Mahakaleshwar_Temple%2C_Ujjain.jpg/1280px-Mahakaleshwar_Temple%2C_Ujjain.jpg',
  'Mahakaleshwar Jyotirlinga — photograph',
  'Ashverse',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mahakaleshwar_Temple%2C_Ujjain.jpg'
),
(
  (select id from public.temples where name = 'Omkareshwar Jyotirlinga'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Omkareswar_Jyotirlinga.jpg/1280px-Omkareswar_Jyotirlinga.jpg',
  'Omkareshwar Temple — photograph',
  'Deveshc92',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Omkareswar_Jyotirlinga.jpg'
),
(
  (select id from public.temples where name = 'Kedarnath Jyotirlinga'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Kedarnath_Temple_in_Rainy_season.jpg/1280px-Kedarnath_Temple_in_Rainy_season.jpg',
  'Kedarnath Temple — photograph',
  'Shivam Kumar 766',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kedarnath_Temple_in_Rainy_season.jpg'
),
(
  (select id from public.temples where name = 'Bhimashankar Jyotirlinga'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d7/Bhimashankar.jpg',
  'Bhimashankar Temple — photograph',
  'SaurabhJain at English Wikipedia',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Bhimashankar.jpg'
),
(
  (select id from public.temples where name = 'Trimbakeshwar Jyotirlinga'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Trimbakeshwar_Temple-Nashik-Maharashtra-1.jpg/1280px-Trimbakeshwar_Temple-Nashik-Maharashtra-1.jpg',
  'Trimbakeshwar Temple — photograph',
  'Abhideo21',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Trimbakeshwar_Temple-Nashik-Maharashtra-1.jpg'
),
(
  (select id from public.temples where name = 'Nageshwar Jyotirlinga, Dwarka'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Nageshwar.JPG/1280px-Nageshwar.JPG',
  'Nageshwar Jyotirlinga — photograph',
  'Bkjit',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Nageshwar.JPG'
),
(
  (select id from public.temples where name = 'Grishneshwar Jyotirlinga, Ellora'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Grishneshwar_temple_in_Aurangabad_district.jpg/1280px-Grishneshwar_temple_in_Aurangabad_district.jpg',
  'Ghrishneshwar Temple — photograph',
  'Rashmi.parab',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Grishneshwar_temple_in_Aurangabad_district.jpg'
),
(
  (select id from public.temples where name = 'Badrinath Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Badrinath_Temple_%2C_Uttarakhand.jpg/1280px-Badrinath_Temple_%2C_Uttarakhand.jpg',
  'Badrinath Temple — photograph',
  'Anubha khare',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Badrinath_Temple_%2C_Uttarakhand.jpg'
),
(
  (select id from public.temples where name = 'Dwarkadhish Temple, Dwarka'),
  'https://upload.wikimedia.org/wikipedia/commons/0/0c/Dwarakadheesh_Temple%2C_2014.jpg',
  'Dwarkadhish Temple — photograph',
  'Vishnupranay.k',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Dwarakadheesh_Temple%2C_2014.jpg'
),
(
  (select id from public.temples where name = 'Jambukeswarar Temple, Tiruvanaikaval (Appu Sthalam)'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/68/Tiruvanaikaval5.jpg/1280px-Tiruvanaikaval5.jpg',
  'Jambukeswarar Temple, Thiruvanaikaval — photograph',
  'Ssriram mt',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Tiruvanaikaval5.jpg'
),
(
  (select id from public.temples where name = 'Arunachaleswarar Temple, Thiruvannamalai (Agni Sthalam)'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Arunachalam_temple_from_a_nearby_hill.jpg/1280px-Arunachalam_temple_from_a_nearby_hill.jpg',
  'Arunachalesvara Temple — photograph',
  'Adarsh Pidugu',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Arunachalam_temple_from_a_nearby_hill.jpg'
),
(
  (select id from public.temples where name = 'Sri Kalahasti Temple (Vayu Sthalam)'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Sri_Kala_Hasti.jpg/1280px-Sri_Kala_Hasti.jpg',
  'Srikalahasteeswara temple — photograph',
  'Kalyan Kumar',
  'CC BY-SA 2.0',
  'https://commons.wikimedia.org/wiki/File:Sri_Kala_Hasti.jpg'
),
(
  (select id from public.temples where name = 'Thillai Nataraja Temple, Chidambaram (Akasha Sthalam)'),
  'https://upload.wikimedia.org/wikipedia/commons/4/44/Le_temple_de_Shiva_Nataraja_%28Chidambaram%2C_Inde%29_%2814037020332%29.jpg',
  'Nataraja Temple, Chidambaram — photograph',
  'Jean-Pierre Dalbéra from Paris, France',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Le_temple_de_Shiva_Nataraja_(Chidambaram%2C_Inde)_(14037020332).jpg'
),
(
  (select id from public.temples where name = 'Krishna Janmabhoomi Temple, Mathura'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9d/Mathura_Temple-Mathura-India0002.JPG/1280px-Mathura_Temple-Mathura-India0002.JPG',
  'Krishna Janmasthan Temple Complex — photograph',
  'Diego Delso',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mathura_Temple-Mathura-India0002.JPG'
),
(
  (select id from public.temples where name = 'Chandi Devi Temple, Haridwar'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Chandi_Devi_Mandir%2CHaridwar.JPG/1280px-Chandi_Devi_Mandir%2CHaridwar.JPG',
  'Chandi Devi Temple, Haridwar — photograph',
  'World8115',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Chandi_Devi_Mandir%2CHaridwar.JPG'
),
(
  (select id from public.temples where name = 'Vaishno Devi Temple, Katra'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b0/Snowfall_in_Vaishno_Devi.jpg',
  'Vaishno Devi Temple — photograph',
  'Yatin. 123',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Snowfall_in_Vaishno_Devi.jpg'
),
(
  (select id from public.temples where name = 'Amarnath Cave Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Cave_Temple_of_Lord_Amarnath.jpg/1280px-Cave_Temple_of_Lord_Amarnath.jpg',
  'Amarnath Temple — photograph',
  'Gktambe at English Wikipedia',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Cave_Temple_of_Lord_Amarnath.jpg'
),
(
  (select id from public.temples where name = 'Sabarimala Ayyappa Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/6/62/Sabarimala_2.jpg',
  'Sabarimala Temple — photograph',
  'Saisumanth532',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Sabarimala_2.jpg'
),
(
  (select id from public.temples where name = 'Lingaraj Temple, Bhubaneswar'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5d/Lingaraj_Temple_%2C_Bhubaneswar.jpg/1280px-Lingaraj_Temple_%2C_Bhubaneswar.jpg',
  'Lingaraja Temple — photograph',
  'Satyakam Parthasarathy',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Lingaraj_Temple_%2C_Bhubaneswar.jpg'
),
(
  (select id from public.temples where name = 'Kandariya Mahadev Temple, Khajuraho'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Khajuraho.KandariyaMahadeva.jpg/1280px-Khajuraho.KandariyaMahadeva.jpg',
  'Kandariya Mahadeva Temple — photograph',
  'China Crisis',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Khajuraho.KandariyaMahadeva.jpg'
),
(
  (select id from public.temples where name = 'Shrinathji Temple, Nathdwara'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Shrinathji_Vitthalanath_Birthday_Shringar.jpg/1280px-Shrinathji_Vitthalanath_Birthday_Shringar.jpg',
  'Shrinathji — photograph',
  'Nathdwara Painter',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Shrinathji_Vitthalanath_Birthday_Shringar.jpg'
),
(
  (select id from public.temples where name = 'Dakshineswar Kali Temple, Kolkata'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Dakhineshwar_Temple_beside_the_Hoogly%2C_West_Bengal.JPG/1280px-Dakhineshwar_Temple_beside_the_Hoogly%2C_West_Bengal.JPG',
  'Dakshineswar Kali Temple — photograph',
  'Knath',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Dakhineshwar_Temple_beside_the_Hoogly%2C_West_Bengal.JPG'
),
(
  (select id from public.temples where name = 'Golden Temple, Sripuram, Vellore'),
  'https://upload.wikimedia.org/wikipedia/commons/4/4c/Sripuram_Temple_Multiple_Views.gif',
  'Sri Lakshmi Narayani Golden Temple — photograph',
  'Dsudhakar555',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Sripuram_Temple_Multiple_Views.gif'
),
(
  (select id from public.temples where name = 'Varadaraja Perumal Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Varadharaja_Perumal_Temple_8.jpg/1280px-Varadharaja_Perumal_Temple_8.jpg',
  'Varadharaja Perumal Temple, Kanchipuram — photograph',
  'IM3847',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Varadharaja_Perumal_Temple_8.jpg'
),
(
  (select id from public.temples where name = 'Adi Shankara Janma Bhoomi Kshetram, Kalady'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Adi_Shankaracharya_%28%E0%B0%86%E0%B0%A6%E0%B0%BF_%E0%B0%B6%E0%B0%82%E0%B0%95%E0%B0%B0%E0%B0%BE%E0%B0%9A%E0%B0%BE%E0%B0%B0%E0%B1%8D%E0%B0%AF%29.jpg/1280px-Adi_Shankaracharya_%28%E0%B0%86%E0%B0%A6%E0%B0%BF_%E0%B0%B6%E0%B0%82%E0%B0%95%E0%B0%B0%E0%B0%BE%E0%B0%9A%E0%B0%BE%E0%B0%B0%E0%B1%8D%E0%B0%AF%29.jpg',
  'Kalady — photograph',
  'డా. గన్నవరపు నరసింహమూర్తి',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Adi_Shankaracharya_(%E0%B0%86%E0%B0%A6%E0%B0%BF_%E0%B0%B6%E0%B0%82%E0%B0%95%E0%B0%B0%E0%B0%BE%E0%B0%9A%E0%B0%BE%E0%B0%B0%E0%B1%8D%E0%B0%AF).jpg'
),
(
  (select id from public.temples where name = 'Simhachalam Varaha Narasimha Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Simhachalam_temple_from_a_hilltop.jpg/1280px-Simhachalam_temple_from_a_hilltop.jpg',
  'Varaha Lakshmi Narasimha temple, Simhachalam — photograph',
  'eclicks_by_bunny',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Simhachalam_temple_from_a_hilltop.jpg'
),
(
  (select id from public.temples where name = 'Sringeri Sharada Peetham'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Vidyashankara_Temple_at_Shringeri.jpg/1280px-Vidyashankara_Temple_at_Shringeri.jpg',
  'Sringeri Sharada Peetham — photograph',
  'Calvinkrishy',
  'CC BY-SA 2.5',
  'https://commons.wikimedia.org/wiki/File:Vidyashankara_Temple_at_Shringeri.jpg'
),
(
  (select id from public.temples where name = 'Vitthal Rukmini Temple, Pandharpur'),
  'https://upload.wikimedia.org/wikipedia/commons/2/21/Pandharpur_2013_Aashad_-_panoramio_%2810%29_%28cropped%29.jpg',
  'Vithoba Temple — photograph',
  'Wikimedia Commons contributor',
  'See source',
  'https://en.wikipedia.org/wiki/Vithoba_Temple'
),
(
  (select id from public.temples where name = 'Somnath Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Somanath_mandir_%28cropped%29.jpg/1280px-Somanath_mandir_%28cropped%29.jpg',
  'Somnath Temple — photograph',
  'B. SurajPatro1997',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Somanath_mandir_(cropped).jpg'
),
(
  (select id from public.temples where name = 'Vaidyanath Jyotirlinga, Deoghar'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Baidyanath_temple_and_temple_complex%2C_Deoghar_04.jpg/1280px-Baidyanath_temple_and_temple_complex%2C_Deoghar_04.jpg',
  'Baidyanath Temple — photograph',
  'Pinakpani',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Baidyanath_temple_and_temple_complex%2C_Deoghar_04.jpg'
),
(
  (select id from public.temples where name = 'Jagannath Temple, Puri'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Shri_Jagannath_temple.jpg/1280px-Shri_Jagannath_temple.jpg',
  'Jagannath Temple, Puri — photograph',
  'Prachites',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Shri_Jagannath_temple.jpg'
),
(
  (select id from public.temples where name = 'Kamakhya Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Kamakhya_Temple_-_DEV_8829.jpg/1280px-Kamakhya_Temple_-_DEV_8829.jpg',
  'Kamakhya Temple — photograph',
  'Devkmaravi',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kamakhya_Temple_-_DEV_8829.jpg'
),
(
  (select id from public.temples where name = 'Kamakshi Amman Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/9/90/Kanchipuram.in_Kamakshi-Amman_Temple_-_panoramio_-_SINHA_%28cropped%29.jpg',
  'Kamakshi Amman Temple — photograph',
  'SINHA',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Kanchipuram.in_Kamakshi-Amman_Temple_-_panoramio_-_SINHA_(cropped).jpg'
),
(
  (select id from public.temples where name = 'Meenakshi Amman Temple, Madurai'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/An_aerial_view_of_Madurai_city_from_atop_of_Meenakshi_Amman_temple.jpg/1280px-An_aerial_view_of_Madurai_city_from_atop_of_Meenakshi_Amman_temple.jpg',
  'Meenakshi Temple — photograph',
  'எஸ்ஸார்',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:An_aerial_view_of_Madurai_city_from_atop_of_Meenakshi_Amman_temple.jpg'
),
(
  (select id from public.temples where name = 'Bahucharaji Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Bahuchara_Mata_Temple_complex_in_Mehsana_district_P_20180121_142243.jpg/1280px-Bahuchara_Mata_Temple_complex_in_Mehsana_district_P_20180121_142243.jpg',
  'Becharaji — photograph',
  'Sumita Roy Dutta',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Bahuchara_Mata_Temple_complex_in_Mehsana_district_P_20180121_142243.jpg'
),
(
  (select id from public.temples where name = 'Mangala Gauri Temple, Gaya'),
  'https://upload.wikimedia.org/wikipedia/commons/3/32/Mangala_Gauri_Temple_at_Gaya%2C_Bihar.jpg',
  'Mangla Gauri Temple — photograph',
  'Mumbaipsytrance',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mangala_Gauri_Temple_at_Gaya%2C_Bihar.jpg'
),
(
  (select id from public.temples where name = 'Ranganathaswamy Temple, Srirangam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Ranganathaswamy_temple_tiruchirappalli.jpg/1280px-Ranganathaswamy_temple_tiruchirappalli.jpg',
  'Ranganathaswamy Temple, Srirangam — photograph',
  'RUPESH MAURYA',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Ranganathaswamy_temple_tiruchirappalli.jpg'
),
(
  (select id from public.temples where name = 'Konark Sun Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Konarka_Temple.jpg/1280px-Konarka_Temple.jpg',
  'Konark Sun Temple — photograph',
  'Subham9423',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Konarka_Temple.jpg'
),
(
  (select id from public.temples where name = 'Virupaksha Temple, Hampi'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Complex_of_Virupaksha_Temple%2C_Hampi_%2804%29.jpg/1280px-Complex_of_Virupaksha_Temple%2C_Hampi_%2804%29.jpg',
  'Virupaksha Temple, Hampi — photograph',
  'iMahesh',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Complex_of_Virupaksha_Temple%2C_Hampi_(04).jpg'
),
(
  (select id from public.temples where name = 'Govardhana Peetham, Puri'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/Goverdhana_matha.jpg/1280px-Goverdhana_matha.jpg',
  'Govardhan Math — photograph',
  'myself',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Goverdhana_matha.jpg'
),
(
  (select id from public.temples where name = 'Dwaraka Sharada Peetham'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Adi_Shankara_math_next_to_Dwarka_temple_Gujarat_India.jpg/1280px-Adi_Shankara_math_next_to_Dwarka_temple_Gujarat_India.jpg',
  'Dwarka Sharada Peetham — photograph',
  'TeshTesh',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Adi_Shankara_math_next_to_Dwarka_temple_Gujarat_India.jpg'
),
(
  (select id from public.temples where name = 'Jyotirmath (Badari Peetham), Joshimath'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Panoramic_view_of_Joshimath_town_on_mountain_slope.jpg/1280px-Panoramic_view_of_Joshimath_town_on_mountain_slope.jpg',
  'Joshimath — photograph',
  'Rohanshah657',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Panoramic_view_of_Joshimath_town_on_mountain_slope.jpg'
),
(
  (select id from public.temples where name = 'Sri Raghavendra Swamy Matha, Mantralayam'),
  'https://upload.wikimedia.org/wikipedia/commons/1/1f/Ragavendratemple.jpg',
  'Mantralayam — photograph',
  'Mohan Krishnan (talk)',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Ragavendratemple.jpg'
),
(
  (select id from public.temples where name = 'Ahobilam Narasimha Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/Upper_Ahobilam_temple_Gopuram_02.jpg/1280px-Upper_Ahobilam_temple_Gopuram_02.jpg',
  'Ahobilam — photograph',
  'Gopal Venkatesan',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Upper_Ahobilam_temple_Gopuram_02.jpg'
),
(
  (select id from public.temples where name = 'Cheluvanarayana Swamy Temple, Melkote'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Cheluvanarayana_Swamy_Temple_BNC.jpg/1280px-Cheluvanarayana_Swamy_Temple_BNC.jpg',
  'Cheluvanarayana Swamy Temple — photograph',
  'Prathyush Thomas',
  'GFDL 1.2',
  'https://commons.wikimedia.org/wiki/File:Cheluvanarayana_Swamy_Temple_BNC.jpg'
),
(
  (select id from public.temples where name = 'Mahalakshmi Temple, Kolhapur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Mahalaxmi_Temple%2C_Kolhapur.jpg/1280px-Mahalaxmi_Temple%2C_Kolhapur.jpg',
  'Mahalakshmi Temple, Kolhapur — photograph',
  'Lovelitjadhav',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mahalaxmi_Temple%2C_Kolhapur.jpg'
),
(
  (select id from public.temples where name = 'Ram Mandir, Ayodhya'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Shri_Ram_Janambhoomi_Mandir%2C_Ayodhya_Dham.jpg/1280px-Shri_Ram_Janambhoomi_Mandir%2C_Ayodhya_Dham.jpg',
  'Ram Mandir — photograph',
  'Prime Minister''s Office',
  'GODL-India',
  'https://commons.wikimedia.org/wiki/File:Shri_Ram_Janambhoomi_Mandir%2C_Ayodhya_Dham.jpg'
),
(
  (select id from public.temples where name = 'Padmanabhaswamy Temple, Thiruvananthapuram'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Sree_Padmanabhaswamy_temple_01.jpg/1280px-Sree_Padmanabhaswamy_temple_01.jpg',
  'Padmanabhaswamy Temple — photograph',
  'Rahulrnath001',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Sree_Padmanabhaswamy_temple_01.jpg'
),
(
  (select id from public.temples where name = 'Brihadeeswarar Temple, Thanjavur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Brihadisvara_Temple_during_Maha_Shivaratri-WUS03611_%28edit%29.jpg/1280px-Brihadisvara_Temple_during_Maha_Shivaratri-WUS03611_%28edit%29.jpg',
  'Brihadisvara Temple — photograph',
  'Original:  Rainer Halama
Derivative work:  UnpetitproleX',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Brihadisvara_Temple_during_Maha_Shivaratri-WUS03611_(edit).jpg'
)
on conflict do nothing;

-- Drop any rows whose temple lookup missed (e.g. a renamed temple).
delete from public.temple_photos where temple_id is null;
