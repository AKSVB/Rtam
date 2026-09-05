-- Ṛtam — photos for 12 of the 13 temples added in migration 0042.
--
-- Excluded: Aravindalochanar Temple, Tholaivillimangalam — no free-licensed
-- photo found (its twin shrine at the same site, Devapiran Temple, does
-- have one below).

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Srivaikuntanathan Perumal Temple, Srivaikuntam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/49/Srivaikuntam6.jpg/1280px-Srivaikuntam6.jpg',
  'Srivaikuntanathan Perumal Temple, Srivaikuntam',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Srivaikuntam6.jpg'
),
(
  (select id from public.temples where name = 'Vijayasana Perumal Temple, Natham'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Varagunamangai2.jpg/1280px-Varagunamangai2.jpg',
  'Vijayasana Perumal Temple, Natham (Thiruvaragunamangai)',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Varagunamangai2.jpg'
),
(
  (select id from public.temples where name = 'Vaithamanidhi Perumal Temple, Thirukkolur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ed/Thirukkolur3.jpg/1280px-Thirukkolur3.jpg',
  'Vaithamanidhi Perumal Temple, Thirukkolur',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thirukkolur3.jpg'
),
(
  (select id from public.temples where name = 'Thirupuliyangudi Perumal Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Thirupuliyangudi3.jpg/1280px-Thirupuliyangudi3.jpg',
  'Thirupuliyangudi Perumal Temple',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thirupuliyangudi3.jpg'
),
(
  (select id from public.temples where name = 'Adinatha Perumal Temple, Alwarthirunagari'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Azhwar_Thirunagari9.jpg/1280px-Azhwar_Thirunagari9.jpg',
  'Adinatha Perumal Temple, Alwarthirunagari',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Azhwar_Thirunagari9.jpg'
),
(
  (select id from public.temples where name = 'Makara Nedunkuzhaikathar Temple, Thenthiruperai'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Chithira_Kavi_Cart%2C_Thenthiruperai_Temple.jpg/1280px-Chithira_Kavi_Cart%2C_Thenthiruperai_Temple.jpg',
  'Temple festival cart, Makara Nedunkuzhaikathar Temple, Thenthiruperai',
  'Jagadeeswaran Natarajan, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Chithira_Kavi_Cart%2C_Thenthiruperai_Temple.jpg'
),
(
  (select id from public.temples where name = 'Mayakoothan Perumal Temple, Perunkulam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1d/Thirukulandhai1.jpg/1280px-Thirukulandhai1.jpg',
  'Mayakoothan Perumal Temple, Perunkulam (Thirukulandhai)',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thirukulandhai1.jpg'
),
(
  (select id from public.temples where name = 'Devapiran Temple, Tholaivillimangalam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8d/Devapiran_temple1.jpg/1280px-Devapiran_temple1.jpg',
  'Devapiran Temple, Tholaivillimangalam',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Devapiran_temple1.jpg'
),
(
  (select id from public.temples where name = 'Ranganathaswamy Temple, Srirangapatna'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Sri_Ranganathaswami_Temple%2C_Srirangaptna.jpg/1280px-Sri_Ranganathaswami_Temple%2C_Srirangaptna.jpg',
  'Ranganathaswamy Temple, Srirangapatna',
  'Prakruth Gowda, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Sri_Ranganathaswami_Temple%2C_Srirangaptna.jpg'
),
(
  (select id from public.temples where name = 'Ranganathaswamy Temple, Shivanasamudra'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Madyaranga_Ranganatha_temple.JPG/1280px-Madyaranga_Ranganatha_temple.JPG',
  'Ranganathaswamy Temple, Shivanasamudra (Madhya Ranga)',
  'Wkacnt, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Madyaranga_Ranganatha_temple.JPG'
),
(
  (select id from public.temples where name = 'Appakkudathaan Perumal Temple, Koviladi'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Koviladi1.jpg/1280px-Koviladi1.jpg',
  'Appakkudathaan Perumal Temple, Koviladi',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Koviladi1.jpg'
),
(
  (select id from public.temples where name = 'Sarangapani Temple, Kumbakonam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Kumbakonam-Sarangapani_Temple-WUS03058.jpg/1280px-Kumbakonam-Sarangapani_Temple-WUS03058.jpg',
  'Sarangapani Temple, Kumbakonam',
  'Rainer Halama, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kumbakonam-Sarangapani_Temple-WUS03058.jpg'
);
