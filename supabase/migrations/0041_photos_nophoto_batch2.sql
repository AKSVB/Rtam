-- Ṛtam — second-pass photos (via direct Commons file search rather than
-- Wikipedia's pageimage extraction, which had missed all of these) for
-- temples that had none at all. Each match verified against its filename
-- for genuine correspondence to the specific temple, not a namesake or
-- generic townscape.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Ambaji Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/0081323_Arasuri_Ambaji_mandir%2C_Shakti_Peeth%2C_north_Gujarat_076.jpg/1280px-0081323_Arasuri_Ambaji_mandir%2C_Shakti_Peeth%2C_north_Gujarat_076.jpg',
  'Arasuri Ambaji Mandir',
  'Ms Sarah Welch, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:0081323_Arasuri_Ambaji_mandir%2C_Shakti_Peeth%2C_north_Gujarat_076.jpg'
),
(
  (select id from public.temples where name = 'Ballaleshwar Temple, Pali'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Ballaleshwar_Temple_Pali_Raigad.jpg/1280px-Ballaleshwar_Temple_Pali_Raigad.jpg',
  'Ballaleshwar Temple, Pali',
  'Pradeep717, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Ballaleshwar_Temple_Pali_Raigad.jpg'
),
(
  (select id from public.temples where name = 'Basara Gnana Saraswati Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Goddess_of_Knowledge_Saraswati_Gnana_Temple_Basar_India.jpg/1280px-Goddess_of_Knowledge_Saraswati_Gnana_Temple_Basar_India.jpg',
  'Basara Gnana Saraswati Temple',
  '{ pranav } from Hyderabad, India, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Goddess_of_Knowledge_Saraswati_Gnana_Temple_Basar_India.jpg'
),
(
  (select id from public.temples where name = 'Ekambareswarar Temple, Kanchipuram (Prithvi Sthalam)'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Ekambareswarar_Temple_at_night_in_Kanchipuram_02.jpg/1280px-Ekambareswarar_Temple_at_night_in_Kanchipuram_02.jpg',
  'Ekambareswarar Temple, Kanchipuram, at night',
  'Pinakpani, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Ekambareswarar_Temple_at_night_in_Kanchipuram_02.jpg'
),
(
  (select id from public.temples where name = 'Hanuman Garhi Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/Hanuman_Garhi_Temple-20.jpg/1280px-Hanuman_Garhi_Temple-20.jpg',
  'Hanuman Garhi Temple, Ayodhya',
  'Immanuelle, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Hanuman_Garhi_Temple-20.jpg'
),
(
  (select id from public.temples where name = 'Mahaganapati Temple, Ranjangaon'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Ranjangaon_Ganpati_Mandir.jpg/1280px-Ranjangaon_Ganpati_Mandir.jpg',
  'Mahaganapati Temple, Ranjangaon',
  'VijaeGoray, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Ranjangaon_Ganpati_Mandir.jpg'
),
(
  (select id from public.temples where name = 'Mahamaya Devi Temple, Ratanpur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/0010722_11th_century_Ratanpur_Mahamaya_Temple_Chhattisgarh_051.jpg/1280px-0010722_11th_century_Ratanpur_Mahamaya_Temple_Chhattisgarh_051.jpg',
  'Mahamaya Devi Temple, Ratanpur',
  'Ms Sarah Welch, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:0010722_11th_century_Ratanpur_Mahamaya_Temple_Chhattisgarh_051.jpg'
),
(
  (select id from public.temples where name = 'Naina Devi Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Night_view_of_a_bus_full_of_Pilgrims_at_Naina_Devi_Temple%2C_Bilaspur%2C_Himachal_Pradesh.jpg/1280px-Night_view_of_a_bus_full_of_Pilgrims_at_Naina_Devi_Temple%2C_Bilaspur%2C_Himachal_Pradesh.jpg',
  'Naina Devi Temple, Bilaspur, at night',
  'Shimla Deities, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Night_view_of_a_bus_full_of_Pilgrims_at_Naina_Devi_Temple%2C_Bilaspur%2C_Himachal_Pradesh.jpg'
),
(
  (select id from public.temples where name = 'Narmada Udgam Temple, Amarkantak'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e4/HOLY_TEMPLES_AT_NARMADA_UDGAM%2C_AMARKANTAK._-_panoramio.jpg/1280px-HOLY_TEMPLES_AT_NARMADA_UDGAM%2C_AMARKANTAK._-_panoramio.jpg',
  'Narmada Udgam Temple, Amarkantak',
  'Kailash Mohankar, via Wikimedia Commons',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:HOLY_TEMPLES_AT_NARMADA_UDGAM%2C_AMARKANTAK._-_panoramio.jpg'
),
(
  (select id from public.temples where name = 'Panakala Narasimha Swamy Temple, Mangalagiri'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Mangalagiri_panakala_swamy_temple_Guntur.jpg/1280px-Mangalagiri_panakala_swamy_temple_Guntur.jpg',
  'Panakala Narasimha Swamy Temple, Mangalagiri',
  'Adityamadhav83, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Mangalagiri_panakala_swamy_temple_Guntur.jpg'
),
(
  (select id from public.temples where name = 'Raghunath Mandir, Jammu'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Raghunath_Temple_Jammu.JPG/1280px-Raghunath_Temple_Jammu.JPG',
  'Raghunath Mandir, Jammu',
  'Bhadani, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Raghunath_Temple_Jammu.JPG'
),
(
  (select id from public.temples where name = 'Sri Satyanarayana Swamy Temple, Annavaram'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/East_gopuram_at_Annavaram_Temple_01.jpg/1280px-East_gopuram_at_Annavaram_Temple_01.jpg',
  'East gopuram, Sri Satyanarayana Swamy Temple, Annavaram',
  'Adityamadhav83, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:East_gopuram_at_Annavaram_Temple_01.jpg'
),
(
  (select id from public.temples where name = 'Srikanteshwara Temple, Nanjangud'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Srikanteshwara_Temple%2C_Nanjangud.jpg/1280px-Srikanteshwara_Temple%2C_Nanjangud.jpg',
  'Srikanteshwara Temple, Nanjangud',
  'MaximusPrasad, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Srikanteshwara_Temple%2C_Nanjangud.jpg'
),
(
  (select id from public.temples where name = 'Vighnahar Temple, Ozar'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Ozhar_-_Shri_Vighnahar.jpg/1280px-Ozhar_-_Shri_Vighnahar.jpg',
  'Vighnahar Temple, Ozar',
  'Borayin Maitreya Larios, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Ozhar_-_Shri_Vighnahar.jpg'
),
(
  (select id from public.temples where name = 'Yadagirigutta Lakshmi Narasimha Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d7/Yadagirigutta_temple_main_Gopuram.jpg/1280px-Yadagirigutta_temple_main_Gopuram.jpg',
  'Yadagirigutta Lakshmi Narasimha Temple — main gopuram',
  'Adityamadhav83, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Yadagirigutta_temple_main_Gopuram.jpg'
);
