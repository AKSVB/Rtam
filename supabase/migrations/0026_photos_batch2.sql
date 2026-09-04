-- Ṛtam — cover photos for the temples added in migration 0025
--
-- Same approach as 0023: each temple's own Wikipedia infobox image,
-- cross-checked against Commons license metadata, only free licenses
-- accepted.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url)
values
(
  (select id from public.temples where name = 'Gangotri Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Gangotri_%28ganga_river%29.jpg/1280px-Gangotri_%28ganga_river%29.jpg',
  null,
  'Dhwani Shree',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Gangotri_(ganga_river).jpg'
),
(
  (select id from public.temples where name = 'Yamunotri Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Yamunotri_temple_and_ashram.jpg/1280px-Yamunotri_temple_and_ashram.jpg',
  null,
  'Atarax42',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Yamunotri_temple_and_ashram.jpg'
),
(
  (select id from public.temples where name = 'Naimisharanya'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Naimisanatha_mandir.jpg/1280px-Naimisanatha_mandir.jpg',
  null,
  'T.sujatha',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Naimisanatha_mandir.jpg'
),
(
  (select id from public.temples where name = 'Mehandipur Balaji Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Mehandipur_Balaji_idol.jpg/1280px-Mehandipur_Balaji_idol.jpg',
  null,
  null,
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Mehandipur_Balaji_idol.jpg'
),
(
  (select id from public.temples where name = 'Amareswara Temple, Amaravati'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Gopuramxx.jpg/1280px-Gopuramxx.jpg',
  null,
  'Rammohan65',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Gopuramxx.jpg'
),
(
  (select id from public.temples where name = 'Mundeshwari Devi Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Maa_Mundeshwari_Devi.jpg/1280px-Maa_Mundeshwari_Devi.jpg',
  null,
  'Lakshya',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Maa_Mundeshwari_Devi.jpg'
),
(
  (select id from public.temples where name = 'Chengannur Mahadeva Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/Chengannur_Mahadeva4.JPG/1280px-Chengannur_Mahadeva4.JPG',
  null,
  'Ssriram mt',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Chengannur_Mahadeva4.JPG'
),
(
  (select id from public.temples where name = 'Kudroli Gokarnanatheshwara Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Gokarnatheshwara_Temple_7042008.jpg/1280px-Gokarnatheshwara_Temple_7042008.jpg',
  null,
  'Premkudva',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Gokarnatheshwara_Temple_7042008.jpg'
),
(
  (select id from public.temples where name = 'Vaitheeswaran Koil'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Vaitheeswarankovil5.JPG/1280px-Vaitheeswarankovil5.JPG',
  null,
  'Ssriram mt',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Vaitheeswarankovil5.JPG'
);
