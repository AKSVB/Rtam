-- Ṛtam — photos for 3 of the 4 temples added in migration 0044, plus the
-- Kashi Vishalakshi front view found via a follow-up Tamil-title search.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Renuka Devi Temple, Mahur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Renukadevi_mahur.JPG/1280px-Renukadevi_mahur.JPG',
  'Renuka Devi Temple, Mahur',
  'V.narsikar, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Renukadevi_mahur.JPG'
),
(
  (select id from public.temples where name = 'Puruhutika Devi Temple, Pithapuram'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Puruhutika_Devi_Sakthi_Peetam_Temple_in_Pithapuram.jpg/1280px-Puruhutika_Devi_Sakthi_Peetam_Temple_in_Pithapuram.jpg',
  'Puruhutika Devi Temple, Pithapuram',
  'Adityamadhav83, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Puruhutika_Devi_Sakthi_Peetam_Temple_in_Pithapuram.jpg'
),
(
  (select id from public.temples where name = 'Alopi Devi Mandir, Prayagraj'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Alop_Shankari_Devi_Mandir%2C_Prayagraj_-_Far_view.jpg/1280px-Alop_Shankari_Devi_Mandir%2C_Prayagraj_-_Far_view.jpg',
  'Alopi Devi Mandir, Prayagraj',
  'Ashish Bhatnagar, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Alop_Shankari_Devi_Mandir,_Prayagraj_-_Far_view.jpg'
),
(
  (select id from public.temples where name = 'Vishalakshi Temple, Varanasi'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/%E0%AE%95%E0%AE%BE%E0%AE%9A%E0%AE%BF_%E0%AE%B5%E0%AE%BF%E0%AE%9A%E0%AE%BE%E0%AE%B2%E0%AE%BE%E0%AE%9F%E0%AF%8D%E0%AE%9A%E0%AE%BF_%E0%AE%95%E0%AF%8B%E0%AE%AF%E0%AE%BF%E0%AE%B2%E0%AF%8D.jpg/1280px-%E0%AE%95%E0%AE%BE%E0%AE%9A%E0%AE%BF_%E0%AE%B5%E0%AE%BF%E0%AE%9A%E0%AE%BE%E0%AE%B2%E0%AE%BE%E0%AE%9F%E0%AF%8D%E0%AE%9A%E0%AE%BF_%E0%AE%95%E0%AF%8B%E0%AE%AF%E0%AE%BF%E0%AE%B2%E0%AF%8D.jpg',
  'Vishalakshi Temple, Varanasi',
  'Kailash PL, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:%E0%AE%95%E0%AE%BE%E0%AE%9A%E0%AE%BF_%E0%AE%B5%E0%AE%BF%E0%AE%9A%E0%AE%BE%E0%AE%B2%E0%AE%BE%E0%AE%9F%E0%AF%8D%E0%AE%9A%E0%AE%BF_%E0%AE%95%E0%AF%8B%E0%AE%AF%E0%AE%BF%E0%AE%B2%E0%AF%8D.jpg'
);
