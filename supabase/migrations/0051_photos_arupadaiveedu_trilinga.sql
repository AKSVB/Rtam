-- Ṛtam — photo for Thiruthani Murugan Temple (migration 0050). No
-- free-licensed photo found for Kaleshwara Mukteshwara Swamy Temple.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Thiruthani Murugan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Thiruthani_Murugan_Temple.jpg/1280px-Thiruthani_Murugan_Temple.jpg',
  'Thiruthani Murugan Temple',
  'Srithern, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thiruthani_Murugan_Temple.jpg'
);
