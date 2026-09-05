-- Ṛtam — photos for 5 of the 6 new Saptha Sthana Mylapore temples added
-- in migration 0064. No free-licensed photo found for Theerthapaleeswarar
-- Temple, Triplicane.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Karaneeswarar Temple, Mylapore'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Mylaporekaraneesvarartemple.jpg/1280px-Mylaporekaraneesvarartemple.jpg',
  'Entrance, Karaneeswarar Temple, Mylapore',
  'பா.ஜம்புலிங்கம், via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mylaporekaraneesvarartemple.jpg'
),
(
  (select id from public.temples where name = 'Malleeswarar Temple, Mylapore'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Mylaporemalleesvarartemple.jpg/1280px-Mylaporemalleesvarartemple.jpg',
  'Entrance, Malleeswarar Temple, Mylapore',
  'பா.ஜம்புலிங்கம், via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mylaporemalleesvarartemple.jpg'
),
(
  (select id from public.temples where name = 'Velleeswarar Temple, Mylapore'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Mylaporevelleesvarartemple.jpg/1280px-Mylaporevelleesvarartemple.jpg',
  'Entrance, Velleeswarar Temple, Mylapore',
  'பா.ஜம்புலிங்கம், via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mylaporevelleesvarartemple.jpg'
),
(
  (select id from public.temples where name = 'Valeeswarar Temple, Mylapore'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Mylaporevaleesvarartemple.jpg/1280px-Mylaporevaleesvarartemple.jpg',
  'Valeeswarar Temple, Mylapore',
  'பா.ஜம்புலிங்கம், via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mylaporevaleesvarartemple.jpg'
),
(
  (select id from public.temples where name = 'Virupakshiswarar Temple, Mylapore'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/Mylaporevirupacheesvarartemple.jpg/1280px-Mylaporevirupacheesvarartemple.jpg',
  'Entrance, Virupakshiswarar Temple, Mylapore',
  'பா.ஜம்புலிங்கம், via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mylaporevirupacheesvarartemple.jpg'
);
