-- Ṛtam — every temple's generic-painting fallback photo used to point at
-- one of only 14 shared images (e.g. all 24 Shiva temples showed the
-- identical Raja-Ravi-Varma Shiva-Parvati print). Reassigns each of the
-- 57 affected temple_photos rows to its own distinct, verified-licensed
-- devotional painting of the same deity — mostly sourced from Raja Ravi
-- Varma's catalogue on Wikimedia Commons, which covers most major deities
-- with many genuinely different compositions. The 5 temples that already
-- had a unique single-use painting (Jagannath, Ayyappan, Lakshmi,
-- Raghavendra Swamy, Agastya) are untouched. No two temples on this site
-- now share the same fallback photo.

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Iramuthusamy, via Wikimedia Commons',
  license = 'CC BY-SA 3.0',
  source_url = 'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
where id = 'b6ad2421-85f4-4591-b342-14210a9387ee';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/0/05/%22Garuda_Vahan_Vishnu%2C%22_from_the_Ravi_Varma_studio%2C_c.1910%27s_Source-_ebay%2C_Oct._2009.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Ravi Varna Studio, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:%22Garuda_Vahan_Vishnu,%22_from_the_Ravi_Varma_studio,_c.1910%27s_Source-_ebay,_Oct._2009.jpg'
where id = '8b5dd686-e6f8-41c2-a52d-02d9fddc36ce';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/8/85/Kshira_sagara_nivasi.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Kshira_sagara_nivasi.jpg'
where id = '37221a56-d65c-470a-b364-3a550f524ebf';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/0/04/Vishnu_0.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Paper Jewels, via Wikimedia Commons',
  license = 'CC BY 4.0',
  source_url = 'https://commons.wikimedia.org/wiki/File:Vishnu_0.jpg'
where id = 'ce81172a-f3a9-42fe-a76b-23a2d3fd7718';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/2/27/Vishnu_protecting_an_elephant.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Vishnu_protecting_an_elephant.jpg'
where id = 'f9a307c9-c237-4763-9782-dae96ae4f04a';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/0/09/Dashavatara.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Dashavatara.jpg'
where id = '98b2927a-bac7-42df-9807-d0d0d2e4ff8c';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/2/2b/Kurma_Avatar_by_Raja_Ravi_Varma.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Kurma_Avatar_by_Raja_Ravi_Varma.jpg'
where id = '5d1d5114-584b-4133-807b-1d386c2a8d90';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Raja_Ravi_Varma%2C_Lord_Garuda.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Raja_Ravi_Varma,_Lord_Garuda.jpg'
where id = '68025c6b-4f54-4c8d-afab-0f1796727c07';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Raja_Ravi_Varma%2C_Seshanarayana_%28Oleographic_print%29.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Raja_Ravi_Varma,_Seshanarayana_(Oleographic_print).jpg'
where id = 'b3a4321d-7d02-485c-9f63-355e71675c75';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/9/99/Vaman.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Vaman.jpg'
where id = '70089731-1803-46c6-9d8a-724a8575b978';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/9/98/Vamana_%E2%80%94_Raja_Ravi_Varma.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Vamana_%E2%80%94_Raja_Ravi_Varma.jpg'
where id = 'c1ce8d4b-7524-4e42-95f1-b9e75c0b39e9';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/5/57/Vishnu_Avatars.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Vishnu_Avatars.jpg'
where id = '9d0eecf4-2be7-4435-8dab-2ebbdd11e13d';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/4/45/Mohini_bhasmasura.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Mohini_bhasmasura.jpg'
where id = '6c194615-61c8-46f6-8dc4-f4bcaea779b0';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/6/6d/Mohini_on_a_swing.jpg',
  caption = 'Traditional South Indian painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Mohini_on_a_swing.jpg'
where id = 'b1799834-a506-44be-9774-4d91b866d0fa';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'anonymous, may be Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
where id = '6a5d5910-e913-4635-95ad-fbc1f4ba2c00';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/0/0a/Raja_Ravi_Varma%2C_Markandeya.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Raja_Ravi_Varma,_Markandeya.jpg'
where id = '15116129-c036-4cb5-9e2a-77b57c566361';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/1/1d/An_Oleograph_of_Shiva%2C_Parvati_and_Nandi_by_Raja_Ravi_Varma.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma (1848-1906), via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:An_Oleograph_of_Shiva,_Parvati_and_Nandi_by_Raja_Ravi_Varma.jpg'
where id = 'a2db41c0-6e1b-4828-b6dd-ff85fc5c7a44';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/6/65/Shiva_as_an_ascetic.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'early bazaar art imported from Germany, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Shiva_as_an_ascetic.jpg'
where id = '1b614498-633b-4111-91d8-c24a573c5b15';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/e/ed/Shiva_Parvati_Ganesha.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Shiva_Parvati_Ganesha.jpg'
where id = '8ae2345e-521d-45cf-9238-6af7cbf4a0d9';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/1/15/Ravi_Varma-Descent_of_Ganga.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Ravi_Varma-Descent_of_Ganga.jpg'
where id = '8d75c8ad-cc7e-49b2-882e-11b3a7e23834';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/5/58/Shiva_parvati_chaupar_1694%E2%80%9395.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Devidasa of Nurpur, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Shiva_parvati_chaupar_1694%E2%80%9395.jpg'
where id = '642035c3-cc3f-4c3b-890b-b799514f9b59';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/5/5d/Shiva_Parvati_on_Nandi.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown author, via Wikimedia Commons',
  license = 'CC BY-SA 4.0',
  source_url = 'https://commons.wikimedia.org/wiki/File:Shiva_Parvati_on_Nandi.jpg'
where id = '9fd766a3-08db-45db-835a-e650bb4aa397';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/d/d3/Nataraja_with_Bhringi_and_Parvati.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'unknown from Tiruchchirappalli (made), via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Nataraja_with_Bhringi_and_Parvati.jpg'
where id = '9474aec0-7dd5-42e9-827a-0985ef88826c';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/5/5b/Chidambaram_Nataraja_temple_fresco.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown painter, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Chidambaram_Nataraja_temple_fresco.jpg'
where id = '0bdef935-57b7-4393-90ab-6c81f0e8e41a';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/5/5e/Brihadisvara_Temple-Museum-Chola_frescos-Dakshinamurthy-WUS-03440.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Wikimedia Commons contributor',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Brihadisvara_Temple-Museum-Chola_frescos-Dakshinamurthy-WUS-03440.jpg'
where id = '3f6f4e34-b3a4-41fd-a5f7-decee905bd99';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/9/95/Sukhasana_shiva.JPG',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'E. A. Rodrigues, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Sukhasana_shiva.JPG'
where id = '7210d079-891b-4295-9332-c03d75f7a5c5';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/4/4f/Shiva_Ganga_Visarjana.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'E.A. Rodrigues, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Shiva_Ganga_Visarjana.jpg'
where id = '68a4315a-c458-47e3-99cd-7660c9f970ca';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/3/35/Shiva_Chandrashekharamurti.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown author, via Wikimedia Commons',
  license = 'CC BY-SA 4.0',
  source_url = 'https://commons.wikimedia.org/wiki/File:Shiva_Chandrashekharamurti.jpg'
where id = 'ef1fd426-4717-46a8-a799-70048045acf7';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/4/4a/Kalantaka_-_Shiva_killed_Kala.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown author, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Kalantaka_-_Shiva_killed_Kala.jpg'
where id = '5a9388bd-b376-4ad4-94d4-b75376b3a71e';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Kalantaka_Kalasamhara.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown author, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Kalantaka_Kalasamhara.jpg'
where id = '0aecb829-ee51-47a6-88ed-889f97648d16';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/f/f9/Tiruchchirappalli_Kalasamhara.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'unknown from Tiruchchirappalli (made), via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Tiruchchirappalli_Kalasamhara.jpg'
where id = '0d0ffd31-522c-4a06-80d0-9b0967b4287d';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/4/4d/Virabhadra_Daksha.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown author, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Virabhadra_Daksha.jpg'
where id = 'a60c7790-ad6a-486f-b5c9-fc3e6dc46f58';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/4/42/Shiva_and_Parvati_on_Mount_Kailasa.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = '陈霆, via Wikimedia Commons',
  license = 'CC BY-SA 2.0',
  source_url = 'https://commons.wikimedia.org/wiki/File:Shiva_and_Parvati_on_Mount_Kailasa.jpg'
where id = '757a09fe-a513-411b-8ddf-5407279afef2';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/b/b2/Siva_with_Retinue.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown author, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Siva_with_Retinue.jpg'
where id = 'f32755b2-cb7a-4a35-a43d-57210272b0fe';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/b/ba/Siva_Parvati.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown author, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Siva_Parvati.jpg'
where id = '13fe860e-79cc-49b8-992a-5c311ae94bf1';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/f/f8/Shiva_trident.jpeg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown artist, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Shiva_trident.jpeg'
where id = 'd081262e-562e-4b38-afab-03d3e01ad359';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/e/e2/Bhairava_Brahma.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown author, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Bhairava_Brahma.jpg'
where id = '6edd31d1-0f6c-4f13-8bce-b1381bf0b58c';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/e/e3/16th_century_Virabhadra_temple%2C_Lepakshi%2C_Vijayanagara_era_Murals.jpg',
  caption = 'Traditional South Indian painting of Shiva (generic devotional image — not a photo of this specific temple)',
  credit = 'Ms Sarah Welch, via Wikimedia Commons',
  license = 'CC0',
  source_url = 'https://commons.wikimedia.org/wiki/File:16th_century_Virabhadra_temple,_Lepakshi,_Vijayanagara_era_Murals.jpg'
where id = 'cd0877d1-cd37-4ddd-b974-8d5184fe9b65';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/7/7f/Durga_by_Raja_Ravi_Varma.jpg',
  caption = 'Traditional South Indian painting of Devi (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Durga_by_Raja_Ravi_Varma.jpg'
where id = '7133085c-91b4-4e94-8391-235ca5dca922';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/5/5a/Goddess_Durga_by_Raja_Ravi_Varma.jpg',
  caption = 'Traditional South Indian painting of Devi (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Goddess_Durga_by_Raja_Ravi_Varma.jpg'
where id = 'e9f2d7ad-2524-448d-a410-58ba81cb6faf';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/3/37/Durga_Mahishasura-mardini%2C_the_slayer_of_the_buffalo_demon%2C_Germany.jpg',
  caption = 'Traditional South Indian painting of Devi (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Durga_Mahishasura-mardini,_the_slayer_of_the_buffalo_demon,_Germany.jpg'
where id = '289a8eda-6b61-4402-93b4-f0a5a5a17212';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/8/89/Kali_by_Raja_Ravi_Varma.jpg',
  caption = 'Traditional South Indian painting of Devi (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Kali_by_Raja_Ravi_Varma.jpg'
where id = 'd45accc5-b678-41b8-aefc-7cbc57ded403';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Gayatri1.jpg',
  caption = 'Traditional South Indian painting of Devi (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Gayatri1.jpg'
where id = '6b755ccc-81f1-4a64-aa4f-55afc1b9c194';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/1/10/Shri_Hanuman_%28Anjeneya%29.jpg',
  caption = 'Traditional South Indian painting of Hanuman (generic devotional image — not a photo of this specific temple)',
  credit = 'Saie.Surendra, via Wikimedia Commons',
  license = 'CC BY-SA 3.0',
  source_url = 'https://commons.wikimedia.org/wiki/File:Shri_Hanuman_(Anjeneya).jpg'
where id = '97afccb7-11fe-473d-82d5-f3de3138d1a2';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/1/13/Bhaktha_Hanuman.jpg',
  caption = 'Traditional South Indian painting of Hanuman (generic devotional image — not a photo of this specific temple)',
  credit = 'Ravi Varma Press, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Bhaktha_Hanuman.jpg'
where id = '6929e4ad-6e78-44fc-aac8-d9667f889689';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/0/06/Maruti.JPG',
  caption = 'Traditional South Indian painting of Hanuman (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Maruti.JPG'
where id = 'a9fb6d3b-433c-41f4-a61e-9f2f95819a0c';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/4/40/Goddess_Saraswati_by_Raja_Ravi_Varma%2C_1896.jpg',
  caption = 'Traditional South Indian painting of Saraswati (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Goddess_Saraswati_by_Raja_Ravi_Varma,_1896.jpg'
where id = '4e3107cf-0c43-4cfb-812b-833c27c2fea0';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/3/31/Goddess_Saraswati_-_Raja_Ravi_Varma.jpg',
  caption = 'Traditional South Indian painting of Saraswati (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Goddess_Saraswati_-_Raja_Ravi_Varma.jpg'
where id = '06843088-9a61-4bdf-a542-097428cfc00d';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/9/90/Narasimha_avatar%2C_1850.jpg',
  caption = 'Traditional South Indian painting of Narasimha (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown author, via Wikimedia Commons',
  license = 'CC BY-SA 4.0',
  source_url = 'https://commons.wikimedia.org/wiki/File:Narasimha_avatar,_1850.jpg'
where id = '46f84994-a5b6-4441-a526-46f6e77c07d6';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/0/01/Narasimha_oil_colour.jpg',
  caption = 'Traditional South Indian painting of Narasimha (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown author, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Narasimha_oil_colour.jpg'
where id = 'b4df6677-2ac0-4456-9dd6-96599ee3ed31';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/8/81/Murugan_by_Raja_Ravi_Varma.jpg',
  caption = 'Traditional South Indian painting of Murugan (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Murugan_by_Raja_Ravi_Varma.jpg'
where id = '13ab3cfb-549b-40ec-ad64-dadfbcf7b11f';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/d/dc/Shanmukha_Subramanyaswami_by_Raja_Ravi_Varma.jpg',
  caption = 'Traditional South Indian painting of Murugan (generic devotional image — not a photo of this specific temple)',
  credit = 'Raja Ravi Varma, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Shanmukha_Subramanyaswami_by_Raja_Ravi_Varma.jpg'
where id = '5d3f27cf-0a27-4135-ad04-db78e8d2db45';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/3/3f/1801_sketch_of_Vishnu_avatar_Sundaranarayana_%28Harihara%29_in_Meenakshi_Shaivism_Temple_at_Madurai_Tamil_Nadu.jpg',
  caption = 'Traditional South Indian painting of Harihara, the combined Shiva-Vishnu form (generic devotional image — not a photo of this specific temple)',
  credit = 'Unknown (1801), via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:1801_sketch_of_Vishnu_avatar_Sundaranarayana_(Harihara)_in_Meenakshi_Shaivism_Temple_at_Madurai_Tamil_Nadu.jpg'
where id = 'fc941cd4-3940-42f7-bac5-6580f1ef7d01';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Brahma_Vishnu_Mahesh.jpg',
  caption = 'Traditional South Indian painting of Harihara, the combined Shiva-Vishnu form (generic devotional image — not a photo of this specific temple)',
  credit = 'Wikimedia Commons contributor',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Brahma_Vishnu_Mahesh.jpg'
where id = '8d4e3abc-ece2-446f-98fb-92fb75cd806e';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/f/fa/SRI_RAMA_PATTABHIKSHEKAM_WP.jpg',
  caption = 'Traditional South Indian painting of Rama (generic devotional image — not a photo of this specific temple)',
  credit = 'YECHARAN TATVAMASI, via Wikimedia Commons',
  license = 'CC BY-SA 4.0',
  source_url = 'https://commons.wikimedia.org/wiki/File:SRI_RAMA_PATTABHIKSHEKAM_WP.jpg'
where id = 'd595a6d2-19f2-4388-a122-59e931fa7983';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/d/d0/Coronation_of_Rama%2C_National_Museum%2C_New_Delhi.jpg',
  caption = 'Traditional South Indian painting of Rama (generic devotional image — not a photo of this specific temple)',
  credit = 'Nomu420, via Wikimedia Commons',
  license = 'CC BY-SA 3.0',
  source_url = 'https://commons.wikimedia.org/wiki/File:Coronation_of_Rama,_National_Museum,_New_Delhi.jpg'
where id = '68cc8d96-8e6d-4d57-9f09-1058aadd1574';

update public.temple_photos set
  url = 'https://upload.wikimedia.org/wikipedia/commons/2/29/Rama-Sita_coronation.jpg',
  caption = 'Traditional South Indian painting of Rama (generic devotional image — not a photo of this specific temple)',
  credit = 'Picture Publishing corporation, via Wikimedia Commons',
  license = 'Public domain',
  source_url = 'https://commons.wikimedia.org/wiki/File:Rama-Sita_coronation.jpg'
where id = 'e20a6b23-1074-475b-8154-81de7bb5896b';
