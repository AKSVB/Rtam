-- Ṛtam — photos for 5 of the 6 temples added in migration 0046. No
-- free-licensed photo found for Uma Devi Temple, Karnaprayag; the
-- Vishnuprayag, Nandaprayag and Karnaprayag photos show the sacred
-- confluence itself rather than the small shrine beside it, since that is
-- what most public photography of these sites documents.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Vishnu Temple, Vishnuprayag'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Vishnuprayag.jpg/1280px-Vishnuprayag.jpg',
  'Vishnuprayag, confluence of the Alaknanda and Dhauliganga',
  'Shmilyshy, via Wikimedia Commons',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Vishnuprayag.jpg'
),
(
  (select id from public.temples where name = 'Nand Temple, Nandaprayag'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/NandprayagConfluence.JPG/1280px-NandprayagConfluence.JPG',
  'Nandaprayag, confluence of the Nandakini and Alaknanda',
  'Fowler&fowler, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:NandprayagConfluence.JPG'
),
(
  (select id from public.temples where name = 'Karna Temple, Karnaprayag'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/KarnaprayagConfluence.JPG/1280px-KarnaprayagConfluence.JPG',
  'Karnaprayag, confluence of the Alaknanda and Pindar',
  'Fowler&fowler, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:KarnaprayagConfluence.JPG'
),
(
  (select id from public.temples where name = 'Chamunda Devi Temple, Rudraprayag'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/P1000137-41-rudraprayag-pano-g.jpg/1280px-P1000137-41-rudraprayag-pano-g.jpg',
  'Rudraprayag: confluence of the Alaknanda and Mandakini, with the Chamunda Devi temple',
  'Mukerjee, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:P1000137-41-rudraprayag-pano-g.jpg'
),
(
  (select id from public.temples where name = 'Raghunath Temple, Devprayag'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/Raghunathji_temple1.JPG/1280px-Raghunathji_temple1.JPG',
  'Raghunathji Temple, Devprayag',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Raghunathji_temple1.JPG'
);
