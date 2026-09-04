-- Ṛtam — cover photos for temples that had none yet
--
-- Sourced by cross-referencing each temple's own Wikipedia infobox image
-- (Wikipedia's pageimages API) against its Commons license metadata
-- (imageinfo/extmetadata), accepting only recognized free licenses
-- (CC0/CC BY/CC BY-SA/Public Domain/GODL) — same approach already used by
-- migration 0011, extended here to temples that migration missed and to
-- every temple added since. Deliberately skips temples that already have
-- at least one photo (checked against the live database first) and skips
-- Shrinathji, whose Wikipedia infobox image is a traditional pichwai
-- painting of the deity rather than a photo of the temple — photography
-- of the murti itself is restricted at Nathdwara.
--
-- Stored at 1280px (Wikimedia's own thumbnail service) rather than
-- original resolution, consistent with the image-compression work
-- elsewhere in this project — several originals here run 5-10MB+.

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url)
values
(
  (select id from public.temples where name = 'Sri Varasiddhi Vinayaka Temple, Kanipakam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Galipgopuram_of_Kanipakam_temple_%28May_2019%29_4.jpg/1280px-Galipgopuram_of_Kanipakam_temple_%28May_2019%29_4.jpg',
  null,
  'IM3847',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Galipgopuram_of_Kanipakam_temple_(May_2019)_4.jpg'
),
(
  (select id from public.temples where name = 'Mangeshi Temple, Priol'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7d/Shri-Mangesh-Temple%2CGoa.JPG/1280px-Shri-Mangesh-Temple%2CGoa.JPG',
  null,
  'Aruna at Malayalam Wikipedia',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Shri-Mangesh-Temple%2CGoa.JPG'
),
(
  (select id from public.temples where name = 'Bhadrakali Temple, Kurukshetra'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Bhadrakali_temple_pokhara.JPG/1280px-Bhadrakali_temple_pokhara.JPG',
  null,
  'Dhurba Gurung',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Bhadrakali_temple_pokhara.JPG'
),
(
  (select id from public.temples where name = 'Kollur Mookambika Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Kollur_Sri_Mookambika_Temple_%284465798056%29.jpg/1280px-Kollur_Sri_Mookambika_Temple_%284465798056%29.jpg',
  null,
  'Ashok Prabhakaran from Chennai, India',
  'CC BY-SA 2.0',
  'https://commons.wikimedia.org/wiki/File:Kollur_Sri_Mookambika_Temple_(4465798056).jpg'
),
(
  (select id from public.temples where name = 'Siddhivinayak Temple, Siddhatek'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Siddhi_Vinayak_at_Siddhatek.jpg/1280px-Siddhi_Vinayak_at_Siddhatek.jpg',
  null,
  'Borayin Maitreya Larios',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Siddhi_Vinayak_at_Siddhatek.jpg'
),
(
  (select id from public.temples where name = 'Kanchi Kamakoti Peetham'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Kamakoti_Vimana_Gopuram.jpg/1280px-Kamakoti_Vimana_Gopuram.jpg',
  null,
  'Ssgac',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:Kamakoti_Vimana_Gopuram.jpg'
),
(
  (select id from public.temples where name = 'Palani Murugan Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Palanihills.JPG/1280px-Palanihills.JPG',
  null,
  'Thiagupillai',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Palanihills.JPG'
),
(
  (select id from public.temples where name = 'Kalighat Kali Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Kalighat_Kali_Temple_after_renovation.jpg/1280px-Kalighat_Kali_Temple_after_renovation.jpg',
  null,
  'Ku423winz1',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kalighat_Kali_Temple_after_renovation.jpg'
),
(
  (select id from public.temples where name = 'Horanadu Annapoorneshwari Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/HoranaduAnnapurneswariTemple1.jpg/1280px-HoranaduAnnapurneswariTemple1.jpg',
  null,
  'Wind4wings',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:HoranaduAnnapurneswariTemple1.jpg'
),
(
  (select id from public.temples where name = 'Tulja Bhavani Temple, Tuljapur'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Raje_Shahaji_Mahadwar_of_Tulja_Bhavani_Temple.jpg/1280px-Raje_Shahaji_Mahadwar_of_Tulja_Bhavani_Temple.jpg',
  null,
  'Kiran891',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Raje_Shahaji_Mahadwar_of_Tulja_Bhavani_Temple.jpg'
),
(
  (select id from public.temples where name = 'Saptashrungi Devi Temple, Vani'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/06/Goddess_Saptashrungi_Devi_Temple1.jpg/1280px-Goddess_Saptashrungi_Devi_Temple1.jpg',
  null,
  'AmitUdeshi',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Goddess_Saptashrungi_Devi_Temple1.jpg'
),
(
  (select id from public.temples where name = 'Vaikom Mahadeva Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Pambady_Rajan_carrying_Idol_of_vaikom_mahadeva_temple.jpg/1280px-Pambady_Rajan_carrying_Idol_of_vaikom_mahadeva_temple.jpg',
  null,
  'Hari vaikom(harish)',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Pambady_Rajan_carrying_Idol_of_vaikom_mahadeva_temple.jpg'
),
(
  (select id from public.temples where name = 'Sri Kurmam Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/11th_century_Kurmanatha_Swamy_Temple%2C_Srikurmam_Andhra_Pradesh_01.jpg/1280px-11th_century_Kurmanatha_Swamy_Temple%2C_Srikurmam_Andhra_Pradesh_01.jpg',
  null,
  'G.N. Subrahmanyam',
  'CC0',
  'https://commons.wikimedia.org/wiki/File:11th_century_Kurmanatha_Swamy_Temple%2C_Srikurmam_Andhra_Pradesh_01.jpg'
),
(
  (select id from public.temples where name = 'Swayambhu Ganapati Temple, Ganapatipule'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/aa/A_Beach_at_GanapatiPule.jpg/1280px-A_Beach_at_GanapatiPule.jpg',
  null,
  'Dmpendse',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:A_Beach_at_GanapatiPule.jpg'
),
(
  (select id from public.temples where name = 'Girijatmaj Temple, Lenyadri'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/1/10/Lenyadri.jpg/1280px-Lenyadri.jpg',
  null,
  'Niemru from MUMBAI, INDIA',
  'CC BY 2.0',
  'https://commons.wikimedia.org/wiki/File:Lenyadri.jpg'
),
(
  (select id from public.temples where name = 'Chamundeshwari Temple, Mysore'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Chamundeshwari_Temple_Mysore.jpg/1280px-Chamundeshwari_Temple_Mysore.jpg',
  null,
  'Rithwik',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Chamundeshwari_Temple_Mysore.jpg'
),
(
  (select id from public.temples where name = 'Kukke Subramanya Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Kukke_Subramanya_Swami.jpg/1280px-Kukke_Subramanya_Swami.jpg',
  null,
  'C 21 K',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Kukke_Subramanya_Swami.jpg'
),
(
  (select id from public.temples where name = 'Ettumanoor Mahadeva Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Ettumanoor_Temple_North_Gate_Entrance.JPG/1280px-Ettumanoor_Temple_North_Gate_Entrance.JPG',
  null,
  'Ranjithsiji',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Ettumanoor_Temple_North_Gate_Entrance.JPG'
),
(
  (select id from public.temples where name = 'Sree Vallabha Temple, Thiruvalla'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/Sree_Vallaba_Temple_5.JPG/1280px-Sree_Vallaba_Temple_5.JPG',
  null,
  'Ssriram mt',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Sree_Vallaba_Temple_5.JPG'
),
(
  (select id from public.temples where name = 'Kapaleeshwarar Temple, Chennai'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Kapaleeswarar1.jpg/1280px-Kapaleeswarar1.jpg',
  null,
  'Mohan Krishnan',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Kapaleeswarar1.jpg'
),
(
  (select id from public.temples where name = 'Parthasarathy Temple, Chennai'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Tiruvallikeni1.jpg/1280px-Tiruvallikeni1.jpg',
  null,
  'Mohan Krishnan',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tiruvallikeni1.jpg'
),
(
  (select id from public.temples where name = 'Hoysaleswara Temple, Halebidu'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Hoysaleshwara_temple_in_Monsoon.JPG/1280px-Hoysaleshwara_temple_in_Monsoon.JPG',
  null,
  'Karthikbs23',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Hoysaleshwara_temple_in_Monsoon.JPG'
),
(
  (select id from public.temples where name = 'Modhera Sun Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Surya_mandhir.jpg/1280px-Surya_mandhir.jpg',
  null,
  'Musafir kanya',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Surya_mandhir.jpg'
),
(
  (select id from public.temples where name = 'Shani Shingnapur Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/Shani_Shignapur_renowned_for_its_Shani_temple.jpg/1280px-Shani_Shignapur_renowned_for_its_Shani_temple.jpg',
  null,
  '25 Cents FC',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Shani_Shignapur_renowned_for_its_Shani_temple.jpg'
),
(
  (select id from public.temples where name = 'Vishnupad Temple, Gaya'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Vishnupad_Temple%2CUpdated.jpg/1280px-Vishnupad_Temple%2CUpdated.jpg',
  null,
  'Deeppsychological',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Vishnupad_Temple%2CUpdated.jpg'
),
(
  (select id from public.temples where name = 'Sankat Mochan Hanuman Temple, Varanasi'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Sankat_Mochan_temple_entrance%2C_Varanasi_-_IRCTC_2017_%281%29.jpg/1280px-Sankat_Mochan_temple_entrance%2C_Varanasi_-_IRCTC_2017_%281%29.jpg',
  null,
  'Vinayaraj',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Sankat_Mochan_temple_entrance%2C_Varanasi_-_IRCTC_2017_(1).jpg'
),
(
  (select id from public.temples where name = 'Tara Tarini Temple, Ganjam'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Taratarini_maa.jpg/1280px-Taratarini_maa.jpg',
  null,
  'Nayansatya',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Taratarini_maa.jpg'
),
(
  (select id from public.temples where name = 'Ambalapuzha Sree Krishna Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Ambalappuzha_Temple.JPG/1280px-Ambalappuzha_Temple.JPG',
  null,
  'Pradeep717',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Ambalappuzha_Temple.JPG'
),
(
  (select id from public.temples where name = 'Thrikkakara Vamanamoorthy Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Thrikkakara_Temple_DSC09337.JPG/1280px-Thrikkakara_Temple_DSC09337.JPG',
  null,
  'Ranjithsiji',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Thrikkakara_Temple_DSC09337.JPG'
),
(
  (select id from public.temples where name = 'Kodungallur Bhagavathy Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fc/Kodungallur_Bhagavathy_Temple-WUS00050.jpg/1280px-Kodungallur_Bhagavathy_Temple-WUS00050.jpg',
  null,
  'Rainer Halama',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kodungallur_Bhagavathy_Temple-WUS00050.jpg'
),
(
  (select id from public.temples where name = 'Sachiya Mata Temple, Osian'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Osiyan_Mata_Temple%2C_Osiyan%2C_Jodhpur_02.jpg/1280px-Osiyan_Mata_Temple%2C_Osiyan%2C_Jodhpur_02.jpg',
  null,
  'Rajsethi13',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Osiyan_Mata_Temple%2C_Osiyan%2C_Jodhpur_02.jpg'
),
(
  (select id from public.temples where name = 'Bhoga Nandeeshwara Temple, Nandi Hills'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Bhoga_Nandeeshwara_Temple_-_North_Side_View.jpg/1280px-Bhoga_Nandeeshwara_Temple_-_North_Side_View.jpg',
  null,
  'Bikashrd',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Bhoga_Nandeeshwara_Temple_-_North_Side_View.jpg'
),
(
  (select id from public.temples where name = 'Umananda Temple, Guwahati'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bd/Chandrasekhar_Temple%2C_Umananda.jpg/1280px-Chandrasekhar_Temple%2C_Umananda.jpg',
  null,
  'Extreminatethejuice',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Chandrasekhar_Temple%2C_Umananda.jpg'
);
