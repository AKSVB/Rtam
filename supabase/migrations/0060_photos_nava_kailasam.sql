-- Ṛtam — photos for 5 of the 9 Nava Kailasam temples added in migration
-- 0059. No free-licensed photo found for Murappanadu, Thenthiruperai,
-- Rajapathy, or Senthapoomangalam. Papanasam's is a public-domain 1800
-- engraving (the only depiction found of that specific temple), captioned
-- accordingly rather than passed off as a modern photo.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Papanasanathar Temple, Papanasam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/0048_Pagoda_of_Papanassum_%281800%29.jpg/1280px-0048_Pagoda_of_Papanassum_%281800%29.jpg',
  '"Pagoda of Papanassum" — an 1800 engraving of the temple',
  'James Welsh (artist) / Robert Havell Jr. (engraver), via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:0048_Pagoda_of_Papanassum_(1800).jpg'
),
(
  (select id from public.temples where name = 'Ammainathar Kailasanathar Temple, Cheranmahadevi'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/Cheranmahadevi_Ammainathar_Temple.jpg/1280px-Cheranmahadevi_Ammainathar_Temple.jpg',
  'Ammainathar Kailasanathar Temple, Cheranmahadevi',
  'Booradleyp1, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Cheranmahadevi_Ammainathar_Temple.jpg'
),
(
  (select id from public.temples where name = 'Kailasanathar Temple, Kodaganallur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Kodaganallur_Kailasanathar_Temple.jpg/1280px-Kodaganallur_Kailasanathar_Temple.jpg',
  'Kailasanathar Temple, Kodaganallur — main entrance',
  'Booradleyp1, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kodaganallur_Kailasanathar_Temple.jpg'
),
(
  (select id from public.temples where name = 'Kotha Parameswarar Temple, Kunnathur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Kunnathur_Kotha_parameswarar_temple.jpg/1280px-Kunnathur_Kotha_parameswarar_temple.jpg',
  'Kotha Parameswarar Temple, Kunnathur',
  'Booradleyp1, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kunnathur_Kotha_parameswarar_temple.jpg'
),
(
  (select id from public.temples where name = 'Kailasanathar Temple, Srivaikuntam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Kailasanathar_srivaikuntam1.jpg/1280px-Kailasanathar_srivaikuntam1.jpg',
  'Kailasanathar Temple, Srivaikuntam',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kailasanathar_srivaikuntam1.jpg'
);
