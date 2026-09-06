-- Ṛtam — photos for all 10 new Malai Nadu Divya Desam temples added in
-- migration 0066.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Adikesava Perumal Temple, Thiruvattar'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Thiruvattar_Adhi_Kesava_Temple.JPG/1280px-Thiruvattar_Adhi_Kesava_Temple.JPG',
  'Adikesava Perumal Temple, Thiruvattar',
  'Infocaster, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Thiruvattar_Adhi_Kesava_Temple.JPG'
),
(
  (select id from public.temples where name = 'Thiruvazhmarban Temple, Thiruppathisaram'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Thriuppathisaram.jpg/1280px-Thriuppathisaram.jpg',
  'Thiruvazhmarban Temple, Thiruppathisaram',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Thriuppathisaram.jpg'
),
(
  (select id from public.temples where name = 'Thiruvanvandoor Mahavishnu Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Thiruvanvandoor_Pambanaiappan_Temple_1.JPG/1280px-Thiruvanvandoor_Pambanaiappan_Temple_1.JPG',
  'Thiruvanvandoor Mahavishnu (Pambanaiappan) Temple',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thiruvanvandoor_Pambanaiappan_Temple_1.JPG'
),
(
  (select id from public.temples where name = 'Thirupuliyoor Mahavishnu Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Puliyoor_gopuram.JPG/1280px-Puliyoor_gopuram.JPG',
  'Gopuram (temple gate), Thirupuliyoor Mahavishnu Temple',
  'Dvellakat, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Puliyoor_gopuram.JPG'
),
(
  (select id from public.temples where name = 'Aranmula Parthasarathy Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Aranmula_Parthasarathy_Temple_%282%29.jpg/1280px-Aranmula_Parthasarathy_Temple_%282%29.jpg',
  'Gopuram of the Aranmula Parthasarathy Temple',
  'Gnoeee, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Aranmula_Parthasarathy_Temple_(2).jpg'
),
(
  (select id from public.temples where name = 'Thrichittatt Mahavishnu Temple, Thiruchenkundroor'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Trichitat_gopuram.JPG/1280px-Trichitat_gopuram.JPG',
  'Temple gate, Thrichittatt Mahavishnu Temple, Chengannur',
  'Dvellakat, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Trichitat_gopuram.JPG'
),
(
  (select id from public.temples where name = 'Thrikodithanam Mahavishnu Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/009242022_Thrikkoduthanam_temple%2C_Changanassery_Divyadesham_Kerala_036.jpg/1280px-009242022_Thrikkoduthanam_temple%2C_Changanassery_Divyadesham_Kerala_036.jpg',
  'Thrikodithanam Mahavishnu Temple, Changanassery',
  'Ms Sarah Welch, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:009242022_Thrikkoduthanam_temple,_Changanassery_Divyadesham_Kerala_036.jpg'
),
(
  (select id from public.temples where name = 'Thirumoozhikkulam Lakshmana Perumal Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Thirumoozhikkulam.jpg/1280px-Thirumoozhikkulam.jpg',
  'Thirumoozhikkulam Sree Lakshmana Perumal Temple',
  'Santoshknambiar, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Thirumoozhikkulam.jpg'
),
(
  (select id from public.temples where name = 'Thirunavaya Navamukunda Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Thirunavaya_Navamukunda_Temple.JPG/1280px-Thirunavaya_Navamukunda_Temple.JPG',
  'Thirunavaya Navamukunda Temple',
  'RajeshUnuppally, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Thirunavaya_Navamukunda_Temple.JPG'
),
(
  (select id from public.temples where name = 'Thirumittakode Anchumoorthi Temple, Thiruvithuvakkodu'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Thirumittakode_Anchumoorthi_Temple.jpg/1280px-Thirumittakode_Anchumoorthi_Temple.jpg',
  'Thirumittakode Anchumoorthi Temple',
  'RajeshUnuppally, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thirumittakode_Anchumoorthi_Temple.jpg'
);
