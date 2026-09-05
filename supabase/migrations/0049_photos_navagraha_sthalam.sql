-- Ṛtam — photos for all 8 temples added in migration 0048.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Suryanar Kovil'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Suryanar_Koil_in_Tamil_Nadu_JEG6875.jpg/1280px-Suryanar_Koil_in_Tamil_Nadu_JEG6875.jpg',
  'Suryanar Kovil temple entrance',
  'PJeganathan, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Suryanar_Koil_in_Tamil_Nadu_JEG6875.jpg'
),
(
  (select id from public.temples where name = 'Kailasanathar Temple, Thingalur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/93/Kailasanathar_Temple%2C_Thingalur_%284%29.jpg/1280px-Kailasanathar_Temple%2C_Thingalur_%284%29.jpg',
  'Kailasanathar Temple, Thingalur',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kailasanathar_Temple,_Thingalur_(4).jpg'
),
(
  (select id from public.temples where name = 'Swetharanyeswarar Temple, Thiruvenkadu'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Swetharanyeswarar_Temple2.jpg/1280px-Swetharanyeswarar_Temple2.jpg',
  'Swetharanyeswarar Temple, Thiruvenkadu — front inner view',
  'பா.ஜம்புலிங்கம், via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Swetharanyeswarar_Temple2.jpg'
),
(
  (select id from public.temples where name = 'Apatsahayesvarar Temple, Alangudi'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Aalangudi_Temple.jpg/1280px-Aalangudi_Temple.jpg',
  'Apatsahayesvarar (Alangudi) Temple',
  'Rasnaboy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Aalangudi_Temple.jpg'
),
(
  (select id from public.temples where name = 'Agneeswarar Temple, Kanjanur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Shukra_graha_temple_Kanjanur_Near_kumbakonam_%283%29.jpg/1280px-Shukra_graha_temple_Kanjanur_Near_kumbakonam_%283%29.jpg',
  'Agneeswarar (Sukra graha) Temple, Kanjanur',
  'Muralikrishna m, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Shukra_graha_temple_Kanjanur_Near_kumbakonam_(3).jpg'
),
(
  (select id from public.temples where name = 'Tirunallar Dharbaranyeswarar Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Thirunallar_Dharbaranyeeswarar_Temple_and_Tank.jpg/1280px-Thirunallar_Dharbaranyeeswarar_Temple_and_Tank.jpg',
  'Tirunallar Dharbaranyeswarar Temple and its tank',
  'VasuVR, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Thirunallar_Dharbaranyeeswarar_Temple_and_Tank.jpg'
),
(
  (select id from public.temples where name = 'Tirunageswaram Naganathar Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/TNK24-A-02-Tirunageswaram-Gopuram_view_from_inside_3D.jpg/1280px-TNK24-A-02-Tirunageswaram-Gopuram_view_from_inside_3D.jpg',
  'Tirunageswaram Naganathar Temple — gopuram viewed from inside',
  'VasuVR, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:TNK24-A-02-Tirunageswaram-Gopuram_view_from_inside_3D.jpg'
),
(
  (select id from public.temples where name = 'Nagannathaswamy Temple, Keelaperumpallam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Kethu_sthal.JPG/1280px-Kethu_sthal.JPG',
  'Ketu shrine, Nagannathaswamy Temple, Keelaperumpallam',
  'Rsmn, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Kethu_sthal.JPG'
);
