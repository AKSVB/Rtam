-- Ṛtam — photos for 9 of the 14 temples added in migration 0036
--
-- Sourced from Wikipedia pageimages + Wikimedia Commons license metadata.
--
-- Deliberately excluded:
--   - Adi Badri Temple: the only match found was via the general "Sapta
--     Badri" Wikipedia article, whose pageimage is a photo of the main
--     Badrinath Temple itself — a different shrine entirely. Not used.
--   - Bhavishya Badri Temple, Vridha Badri Temple, Bhoramdeo Temple,
--     Pitambara Peeth (Datia): no Wikipedia pageimage found at all.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Tungnath Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Tungnath_temple.jpg/1280px-Tungnath_temple.jpg',
  'Tungnath Temple',
  'Varun Shiv Kapur, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Tungnath_temple.jpg'
),
(
  (select id from public.temples where name = 'Rudranath Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Rudranath_temple.jpg/1280px-Rudranath_temple.jpg',
  'Rudranath Temple',
  'rolling on, via Wikimedia Commons',
  'CC BY-SA 2.0',
  'https://commons.wikimedia.org/wiki/File:Rudranath_temple.jpg'
),
(
  (select id from public.temples where name = 'Madhyamaheshwar Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Madhyamaheshwar_Temple%2C_Uttarakhand.JPG/1280px-Madhyamaheshwar_Temple%2C_Uttarakhand.JPG',
  'Madhyamaheshwar Temple',
  'Bodhisattwa, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Madhyamaheshwar_Temple%2C_Uttarakhand.JPG'
),
(
  (select id from public.temples where name = 'Kalpeshwar Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/Kalpehswar.jpg/1280px-Kalpehswar.jpg',
  'Kalpeshwar Temple',
  'rolling on, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Kalpehswar.jpg'
),
(
  (select id from public.temples where name = 'Yogadhyan Badri Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/0052923_Yog_Badri_temple_to_the_right%2C_Narayana_Vasudeva_temple_to_the_left%2C_Panch_Badri_Pandukeshwar_Uttarakhand.jpg/1280px-0052923_Yog_Badri_temple_to_the_right%2C_Narayana_Vasudeva_temple_to_the_left%2C_Panch_Badri_Pandukeshwar_Uttarakhand.jpg',
  'Yogadhyan Badri Temple (right), beside the Narayana Vasudeva temple, Pandukeshwar',
  'Ms Sarah Welch, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:0052923_Yog_Badri_temple_to_the_right%2C_Narayana_Vasudeva_temple_to_the_left%2C_Panch_Badri_Pandukeshwar_Uttarakhand.jpg'
),
(
  (select id from public.temples where name = 'Someswara Swamy Temple, Bhimavaram'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/SomeswaraSwamy-5.JPG/1280px-SomeswaraSwamy-5.JPG',
  'Someswara Swamy Temple, Bhimavaram',
  'PV Bhaskar, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:SomeswaraSwamy-5.JPG'
),
(
  (select id from public.temples where name = 'Kumararama Bhimeswara Swamy Temple, Samalkota'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Kumararama_Bhimesvara_temple_outside_view%2Csamalkota.jpg/1280px-Kumararama_Bhimesvara_temple_outside_view%2Csamalkota.jpg',
  'Kumararama Bhimeswara Swamy Temple, Samalkota',
  'Palagiri, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Kumararama_Bhimesvara_temple_outside_view%2Csamalkota.jpg'
),
(
  (select id from public.temples where name = 'Ksheerarama Temple, Palakollu'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/CompleteTempleComplex.jpg/1280px-CompleteTempleComplex.jpg',
  'Ksheerarama Temple complex, Palakollu',
  'Gopal vemu, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:CompleteTempleComplex.jpg'
),
(
  (select id from public.temples where name = 'Salasar Balaji Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Salasar_balaji_02.jpg/1280px-Salasar_balaji_02.jpg',
  'Salasar Balaji Temple',
  'Dausaanoop, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Salasar_balaji_02.jpg'
);
