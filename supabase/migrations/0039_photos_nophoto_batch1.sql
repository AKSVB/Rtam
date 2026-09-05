-- Ṛtam — first-pass photos for temples that had none at all.
--
-- Excluded: Adi Badri Temple — the only match, again, was via the general
-- "Sapta Badri" Wikipedia article, whose pageimage is a photo of the main
-- Badrinath Temple itself (same false match already caught and excluded
-- in migration 0037). The remaining 26 photo-less temples from this pass
-- had no Wikipedia pageimage at all; a second, Commons-search-based pass
-- is being tried separately for the more prominent ones among them.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Bhoramdeo Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Bhoramdeo_Temple%2C_Kawardha.jpg/1280px-Bhoramdeo_Temple%2C_Kawardha.jpg',
  'Bhoramdeo Temple',
  'Pankaj Oudhia, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Bhoramdeo_Temple%2C_Kawardha.jpg'
),
(
  (select id from public.temples where name = 'Chintamani Temple, Theur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Shri_Cintamani_of_Theur.jpg/1280px-Shri_Cintamani_of_Theur.jpg',
  'Chintamani Temple, Theur',
  'Borayin Maitreya Larios, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Shri_Cintamani_of_Theur.jpg'
),
(
  (select id from public.temples where name = 'Gokarna Mahabaleshwar Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Main_entry_to_the_Mahabaleshwar_Temple_at_Gokaran.jpg/1280px-Main_entry_to_the_Mahabaleshwar_Temple_at_Gokaran.jpg',
  'Gokarna Mahabaleshwar Temple',
  'Nvvchar, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Main_entry_to_the_Mahabaleshwar_Temple_at_Gokaran.jpg'
),
(
  (select id from public.temples where name = 'Kankalitala Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Kankalitala_Temple_complex%2C_Birbhum%2C_West_Bengal_05.jpg/1280px-Kankalitala_Temple_complex%2C_Birbhum%2C_West_Bengal_05.jpg',
  'Kankalitala Temple complex',
  'Pinakpani, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kankalitala_Temple_complex%2C_Birbhum%2C_West_Bengal_05.jpg'
),
(
  (select id from public.temples where name = 'Kodandarama Temple, Vontimitta'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Sri_Kodanda_Rama_Swamy_Temple%2C_Vontimitta%2C_Kadapa.jpg/1280px-Sri_Kodanda_Rama_Swamy_Temple%2C_Vontimitta%2C_Kadapa.jpg',
  'Kodandarama Temple, Vontimitta',
  'Kashyap Kondamudi, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Sri_Kodanda_Rama_Swamy_Temple%2C_Vontimitta%2C_Kadapa.jpg'
),
(
  (select id from public.temples where name = 'Pitambara Peeth, Datia'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Shri_Peetambra_Peetha%2C_Datia_entrance_gate.jpg/1280px-Shri_Peetambra_Peetha%2C_Datia_entrance_gate.jpg',
  'Pitambara Peeth, Datia — entrance gate',
  'Suyash Dwivedi, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Shri_Peetambra_Peetha%2C_Datia_entrance_gate.jpg'
),
(
  (select id from public.temples where name = 'Srivilliputhur Andal Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Srivilliputhur_Andal_temple_%2829%29.jpg/1280px-Srivilliputhur_Andal_temple_%2829%29.jpg',
  'Srivilliputhur Andal Temple',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Srivilliputhur_Andal_temple_(29).jpg'
);
