-- Ṛtam — photos for 26 temples that had none, sourced from Wikimedia
-- Commons (all under CC BY / CC BY-SA / CC0 / public domain). Found via
-- the Wikipedia/Commons public APIs: searched by temple name, took the
-- article's lead image, then verified the file's own license via Commons'
-- extmetadata. Matches were required to share the temple's distinctive
-- name word(s) (allowing for common transliteration variants like
-- "Marundheeswarar"/"Marundeeswarar"), with the town also checked for
-- names known to repeat across multiple temples in this database (e.g.
-- the various "Kailasanathar Temple, <town>" entries — none of those
-- found a confident match here and remain photo-less). Filenames were
-- also required to look like an actual photograph, not a devotional
-- poster/map/logo. One initial hit (a "Raghavendra Nagar" locality
-- article, unrelated to the T. Nagar Raghavendra Swamy temple) was
-- discarded as a false positive during review.
--
-- The Putlur Amman Temple and Angala Parameshwari Amman Temple entries
-- (both Putlur, Tiruvallur) matched the same Commons photo/article —
-- worth checking by hand whether these are actually the same temple
-- entered twice from the contributor's source list, rather than two
-- distinct shrines.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Shore Temple, Mahabalipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/7/74/Shore_Temple_-Mamallapuram_-Tamil_Nadu_-N-TN-C55.jpg',
  'Shore Temple, Mahabalipuram',
  'Swarna1311, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Shore_Temple_-Mamallapuram_-Tamil_Nadu_-N-TN-C55.jpg'
),
(
  (select id from public.temples where name = 'Kumaran Kundram Murugan Temple, Chromepet'),
  'https://upload.wikimedia.org/wikipedia/commons/f/ff/Kumaran_Kundram_Chromepet.jpg',
  'Kumaran Kundram Murugan Temple, Chromepet',
  'Kggouthaman, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Kumaran_Kundram_Chromepet.jpg'
),
(
  (select id from public.temples where name = 'Masilamaniswara Temple, Thirumullaivoyal'),
  'https://upload.wikimedia.org/wikipedia/commons/a/ad/Tirumullaivayil2.jpg',
  'Masilamaniswara Temple, Thirumullaivoyal',
  'Ssriram mt at English Wikipedia, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Tirumullaivayil2.jpg'
),
(
  (select id from public.temples where name = 'Devi Karumariamman Temple, Thiruverkadu'),
  'https://upload.wikimedia.org/wikipedia/commons/1/1e/Side_view_of_the_Rajagopuram_of_Tiruverkadu_Temple_05.jpg',
  'Devi Karumariamman Temple, Thiruverkadu',
  'Bhagya sri113, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Side_view_of_the_Rajagopuram_of_Tiruverkadu_Temple_05.jpg'
),
(
  (select id from public.temples where name = 'Kamakshi Amman Temple, Mangadu'),
  'https://upload.wikimedia.org/wikipedia/commons/b/ba/MangaduEntrancePortrait.jpg',
  'Kamakshi Amman Temple, Mangadu',
  'Rasnaboy, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:MangaduEntrancePortrait.jpg'
),
(
  (select id from public.temples where name = 'Kundrathur Murugan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/5/50/Kundratur2.jpg',
  'Kundrathur Murugan Temple',
  'Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Kundratur2.jpg'
),
(
  (select id from public.temples where name = 'Kailasanathar Temple, Kanchipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/1/19/7th_century_Sri_Kailashnathar_Temple_Kanchipuram_Tamil_Nadu_India_01_%2811%29.jpg',
  'Kailasanathar Temple, Kanchipuram',
  'Bikash Das from bangalore, india, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:7th_century_Sri_Kailashnathar_Temple_Kanchipuram_Tamil_Nadu_India_01_(11).jpg'
),
(
  (select id from public.temples where name = 'Dhenupureeswarar Temple, Madambakkam'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b2/Thenupureeswarar_koil_front_view.jpg',
  'Dhenupureeswarar Temple, Madambakkam',
  'Booradleyp1, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Thenupureeswarar_koil_front_view.jpg'
),
(
  (select id from public.temples where name = 'Veerabhadra Temple, Lepakshi'),
  'https://upload.wikimedia.org/wikipedia/commons/b/bd/Veerabhadra_Temple_Tower.JPG',
  'Veerabhadra Temple, Lepakshi',
  'Magentic Manifestations, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Veerabhadra_Temple_Tower.JPG'
),
(
  (select id from public.temples where name = 'Nellaiappar Temple, Tirunelveli'),
  'https://upload.wikimedia.org/wikipedia/commons/9/9a/Nellaiappar_temple_tower.jpg',
  'Nellaiappar Temple, Tirunelveli',
  'Theni.M.Subramani, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Nellaiappar_temple_tower.jpg'
),
(
  (select id from public.temples where name = 'Vadaranyeswarar Temple, Tiruvalangadu'),
  'https://upload.wikimedia.org/wikipedia/commons/0/0b/Tiruvalangadu6.jpg',
  'Vadaranyeswarar Temple, Tiruvalangadu',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tiruvalangadu6.jpg'
),
(
  (select id from public.temples where name = 'Mundaka Kanni Amman Temple, Mylapore'),
  'https://upload.wikimedia.org/wikipedia/commons/3/3c/Mundakakanniamman_temple.jpg',
  'Mundaka Kanni Amman Temple, Mylapore',
  'பா.ஜம்புலிங்கம், via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Mundakakanniamman_temple.jpg'
),
(
  (select id from public.temples where name = 'Vengeeswarar Temple, Vadapalani'),
  'https://upload.wikimedia.org/wikipedia/commons/0/02/Vengeeswarar_temple.jpg',
  'Vengeeswarar Temple, Vadapalani',
  'Simply CVR, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Vengeeswarar_temple.jpg'
),
(
  (select id from public.temples where name = 'Jagannatha Perumal Temple, Thirumazhisai'),
  'https://upload.wikimedia.org/wikipedia/commons/4/4d/Jagannatha_Perumal_temple1.JPG',
  'Jagannatha Perumal Temple, Thirumazhisai',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Jagannatha_Perumal_temple1.JPG'
),
(
  (select id from public.temples where name = 'Vadapalani Murugan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/6/66/Vadapalani_murugan_temple_tank.jpg',
  'Vadapalani Murugan Temple',
  'Simply CVR, via Wikimedia Commons',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Vadapalani_murugan_temple_tank.jpg'
),
(
  (select id from public.temples where name = 'Karaneeswarar Temple, Saidapet'),
  'https://upload.wikimedia.org/wikipedia/commons/8/88/Chennai_karaneswarar_temple.jpg',
  'Karaneeswarar Temple, Saidapet',
  'Rsmn, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Chennai_karaneswarar_temple.jpg'
),
(
  (select id from public.temples where name = 'Sri Ashtalakshmi Temple, Besant Nagar'),
  'https://upload.wikimedia.org/wikipedia/commons/b/ba/Ashtalakshmi_temple_2.jpg',
  'Sri Ashtalakshmi Temple, Besant Nagar',
  'User:Sudharsun.j, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Ashtalakshmi_temple_2.jpg'
),
(
  (select id from public.temples where name = 'Marundheeswarar Temple, Tiruvanmiyur'),
  'https://upload.wikimedia.org/wikipedia/commons/3/31/Marundeeswarar7.jpg',
  'Marundheeswarar Temple, Tiruvanmiyur',
  'Mohan Krishnan (talk), via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Marundeeswarar7.jpg'
),
(
  (select id from public.temples where name = 'Kalikambal Temple, Parrys Corner'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7c/Kaalikaambaal_Temple_Main_Entrance%2C_Chennai.jpg',
  'Kalikambal Temple, Parrys Corner',
  'Rasnaboy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Kaalikaambaal_Temple_Main_Entrance,_Chennai.jpg'
),
(
  (select id from public.temples where name = 'Thiruporur Murugan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/4/45/THIRUPORUR%28TOWN_PANCHAYAT_KANCHIPURAM_DISTRICT_%29_KANDASAMY_TEMPLE.jpg',
  'Thiruporur Murugan Temple',
  'Prabhupuducherry, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:THIRUPORUR(TOWN_PANCHAYAT_KANCHIPURAM_DISTRICT_)_KANDASAMY_TEMPLE.jpg'
),
(
  (select id from public.temples where name = 'Padalathri Narasimhar Temple, Singaperumal Koil'),
  'https://upload.wikimedia.org/wikipedia/commons/9/9b/Singaperumalkovil1.JPG',
  'Padalathri Narasimhar Temple, Singaperumal Koil',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Singaperumalkovil1.JPG'
),
(
  (select id from public.temples where name = 'Sri Veeraraghava Perumal Temple, Thiruvallur'),
  'https://upload.wikimedia.org/wikipedia/commons/e/e1/Tiruvallur7.jpg',
  'Sri Veeraraghava Perumal Temple, Thiruvallur',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Tiruvallur7.jpg'
),
(
  (select id from public.temples where name = 'Siruvapuri Sri Balasubrahmanyam Temple, Tiruvallur'),
  'https://upload.wikimedia.org/wikipedia/commons/9/97/Siruvapuri_Sri_Murugan_Temple.jpg',
  'Siruvapuri Sri Balasubrahmanyam Temple, Tiruvallur',
  'Selvakumar mallar, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Siruvapuri_Sri_Murugan_Temple.jpg'
),
(
  (select id from public.temples where name = 'Putlur Amman Temple, Tiruvallur'),
  'https://upload.wikimedia.org/wikipedia/commons/3/3d/Putlur_Amman_Temple%2C_Main_entrance.jpg',
  'Putlur Amman Temple, Tiruvallur',
  'Rasnaboy, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Putlur_Amman_Temple,_Main_entrance.jpg'
),
(
  (select id from public.temples where name = 'Angala Parameshwari Amman Temple, Putlur, Tiruvallur'),
  'https://upload.wikimedia.org/wikipedia/commons/3/3d/Putlur_Amman_Temple%2C_Main_entrance.jpg',
  'Angala Parameshwari Amman Temple, Putlur, Tiruvallur',
  'Rasnaboy, via Wikimedia Commons',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Putlur_Amman_Temple,_Main_entrance.jpg'
),
(
  (select id from public.temples where name = 'Hridayaleeswarar Temple, Thirunindravur'),
  'https://upload.wikimedia.org/wikipedia/commons/7/76/%E0%AE%A4%E0%AE%BF%E0%AE%B0%E0%AF%81%E0%AE%A8%E0%AE%BF%E0%AE%A9%E0%AF%8D%E0%AE%B1%E0%AE%B5%E0%AF%82%E0%AE%B0%E0%AF%8D_%E0%AE%87%E0%AE%B0%E0%AF%81%E0%AE%A4%E0%AE%AF%E0%AE%BE%E0%AE%B2%E0%AF%80%E0%AE%B8%E0%AF%8D%E0%AE%B5_%E0%AE%B0%E0%AE%B0%E0%AF%8D_%E0%AE%95%E0%AF%8B%E0%AE%B5%E0%AE%BF%E0%AE%B2%E0%AF%8D_1.jpg',
  'Hridayaleeswarar Temple, Thirunindravur',
  'Rahuljeswin, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:%E0%AE%A4%E0%AE%BF%E0%AE%B0%E0%AF%81%E0%AE%A8%E0%AE%BF%E0%AE%A9%E0%AF%8D%E0%AE%B1%E0%AE%B5%E0%AF%82%E0%AE%B0%E0%AF%8D_%E0%AE%87%E0%AE%B0%E0%AF%81%E0%AE%A4%E0%AE%AF%E0%AE%BE%E0%AE%B2%E0%AF%80%E0%AE%B8%E0%AF%8D%E0%AE%B5_%E0%AE%B0%E0%AE%B0%E0%AF%8D_%E0%AE%95%E0%AF%8B%E0%AE%B5%E0%AE%BF%E0%AE%B2%E0%AF%8D_1.jpg'
);
