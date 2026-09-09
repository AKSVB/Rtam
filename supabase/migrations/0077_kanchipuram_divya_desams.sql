-- Ṛtam — 6 more of the 15 Divya Desams clustered in and around
-- Kanchipuram (Varadaraja Perumal was already in the database as a
-- standalone entry). All six are richly documented on Wikimedia
-- Commons, so each gets two real photos rather than a painting
-- fallback. One more Kanchi Divya Desam, Nilathingal Thundam Perumal
-- Temple, is left for a later batch — no freely-licensed photo of it
-- could be found.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Ulagalantha Perumal Temple, Kanchipuram', 'Ulagalantha Perumal (Vishnu, in his Trivikrama/Vamana form) / Amuthavalli', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.83917, 79.70500, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Vegavathy', 1, 'Nov–Feb.', 'One of the 108 Divya Desams glorified in the Nalayira Divya Prabandham, believed to have been built by the Pallavas with later contributions from the Cholas, Vijayanagara kings, and Madurai Nayaks. Vishnu is worshipped here as Ulagalantha Perumal ("the one who measured the worlds"), commemorating his Trivikrama form in which he strode across the universe in three steps to reclaim it from the demon-king Mahabali.', 'Nalayira Divya Prabandham; local/regional tradition', 'Dravidian, Pallava origins', null, 'approved'
),
(
  'Yathothkari Perumal Temple, Kanchipuram', 'Yathothkari Perumal (Vishnu) / Komalavalli', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.82417, 79.71222, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Vegavathy', 1, 'Nov–Feb.', 'Also called the Tiruvekkaa Temple and locally known as Sonnavannam Seitha Perumal, one of the 108 Divya Desams and the second-largest temple in southern Kanchipuram after the Varadaraja Perumal Temple.', 'Nalayira Divya Prabandham; local/regional tradition', 'Dravidian, Pallava origins', null, 'approved'
),
(
  'Ashtabhujakaram, Kanchipuram', 'Ashta Bhuja Perumal (eight-armed Vishnu) / Alamelumangai', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.82250, 79.71083, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Vegavathy', 1, 'Nov–Feb.', 'One of the 108 Divya Desams and the fourth-largest temple in southern Kanchipuram, believed to have been renovated by the later Pallavas. Vishnu is worshipped here in his eight-armed (ashta bhuja) form.', 'Nalayira Divya Prabandham; local/regional tradition', 'Dravidian, Pallava origins', null, 'approved'
),
(
  'Tiru Parameswara Vinnagaram, Kanchipuram', 'Vaikunta Perumal (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.83694, 79.71000, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Vegavathy', 1, 'Nov–Feb.', 'Also known as the Vaikunta Perumal Temple, one of the 108 Divya Desams, built by the Pallava emperor Nandivarman II in the 8th century as "Vishnugriha" — a royal house for Vishnu. Scholarly study of its inscriptions and reliefs has contributed to dating portions of the Bhagavata Purana.', 'Nalayira Divya Prabandham; historical/epigraphical record', 'Dravidian, Pallava (8th century)', 8, 'approved'
),
(
  'Pandava Thoothar Perumal Temple, Kanchipuram', 'Pandava Tutar Perumal (Krishna) / Rukmini', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.84250, 79.69694, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Vegavathy', 1.5, 'Nov–Feb.', 'Also called Thirupadagam, one of the 108 Divya Desams and considered one of the three oldest temples in Kanchipuram. Krishna is worshipped here as Pandava Tutar Perumal, commemorating his role as envoy (thoothu) for the Pandavas before the Kurukshetra war.', 'Nalayira Divya Prabandham; Mahabharata tradition', 'Dravidian, among the oldest in Kanchipuram', null, 'approved'
),
(
  'Pavalavannam Temple, Kanchipuram', 'Pavalavannar Perumal (coral-hued Vishnu) / Pavalavalli', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.84444, 79.70444, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Vegavathy', 1, 'Nov–Feb.', 'Also called Tirupavalavannam, one of the 108 Divya Desams, believed to have been built by the Cholas with later contributions from the Vijayanagara kings. Vishnu is worshipped here in his coral-hued (pavala vannam) form.', 'Nalayira Divya Prabandham; local/regional tradition', 'Dravidian, Chola origins', null, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Ulagalantha Perumal Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/4/49/Kanchipuram-temple-ulagalandar.jpg',
  'Ulagalantha Perumal Temple, Kanchipuram',
  'Tshrinivasan, via Wikimedia Commons',
  'CC BY-SA 1.0',
  'https://commons.wikimedia.org/wiki/File:Kanchipuram-temple-ulagalandar.jpg'
),
(
  (select id from public.temples where name = 'Ulagalantha Perumal Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/e/ea/Ulagalantha_Perumal_Temple_complex_in_Kanchipuram%2C_Tamil_Nadu_01.jpg',
  'Ulagalantha Perumal Temple complex, Kanchipuram',
  'Pinakpani, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Ulagalantha_Perumal_Temple_complex_in_Kanchipuram,_Tamil_Nadu_01.jpg'
),
(
  (select id from public.temples where name = 'Yathothkari Perumal Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/2/2c/Yathothkari_%289%29.jpg',
  'Yathothkari Perumal Temple, Kanchipuram',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Yathothkari_(9).jpg'
),
(
  (select id from public.temples where name = 'Yathothkari Perumal Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7f/Thiruvekka_-_yathothkari1.jpg',
  'Thiruvekkaa, Yathothkari Perumal Temple',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Thiruvekka_-_yathothkari1.jpg'
),
(
  (select id from public.temples where name = 'Ashtabhujakaram, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/9/95/Ashtabhujakaram_%288%29.jpg',
  'Ashtabhujakaram, Kanchipuram',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Ashtabhujakaram_(8).jpg'
),
(
  (select id from public.temples where name = 'Ashtabhujakaram, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/4/40/Ashtabhujakaram_%281%29.jpg',
  'Ashtabhujakaram, Kanchipuram',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Ashtabhujakaram_(1).jpg'
),
(
  (select id from public.temples where name = 'Tiru Parameswara Vinnagaram, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/c/c2/Parameswara_Vinnagaram.JPG',
  'Tiru Parameswara Vinnagaram (Vaikunta Perumal Temple), Kanchipuram',
  'Sridhar.selvaraj, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Parameswara_Vinnagaram.JPG'
),
(
  (select id from public.temples where name = 'Tiru Parameswara Vinnagaram, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/5/5a/Tiru_Parameswara_Vinnagaram1.jpg',
  'Tiru Parameswara Vinnagaram, Kanchipuram',
  'பா.ஜம்புலிங்கம், via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Tiru_Parameswara_Vinnagaram1.jpg'
),
(
  (select id from public.temples where name = 'Pandava Thoothar Perumal Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/d/db/Pandavathoothar_Temple_%282%29.jpg',
  'Pandava Thoothar Perumal Temple, Kanchipuram',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Pandavathoothar_Temple_(2).jpg'
),
(
  (select id from public.temples where name = 'Pandava Thoothar Perumal Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/8/89/Pandava_Thoothar_Perumal_Temple_in_Kanchipuram_01.jpg',
  'Pandava Thoothar Perumal Temple, Kanchipuram',
  'Pinakpani, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Pandava_Thoothar_Perumal_Temple_in_Kanchipuram_01.jpg'
),
(
  (select id from public.temples where name = 'Pavalavannam Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7d/Pavalavannan2.jpg',
  'Pavalavannam Temple, Kanchipuram',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Pavalavannan2.jpg'
),
(
  (select id from public.temples where name = 'Pavalavannam Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/6/67/Pavalavanam.jpg',
  'Pavalavannam Temple, Kanchipuram',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Pavalavanam.jpg'
);
