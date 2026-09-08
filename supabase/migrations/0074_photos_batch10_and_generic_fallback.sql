-- Ṛtam — finishes off the remaining 75 temples that had no photo at all.
--
-- 12 of these turned out to have real photos on Wikimedia Commons that
-- the previous batch's search missed (mostly because it only checked a
-- Wikipedia article's lead image; this round also searched Commons'
-- File namespace directly). Each was individually verified — checking the
-- file's own Commons categories/description, not just its filename —
-- after the same broader search surfaced several convincing-looking but
-- wrong matches for other, differently-located temples that happen to
-- share a name (a Bangalore "Matsya Narayana" temple, the real Puri
-- Jagannath temple, a Sivakasi "Kasi Viswanathar" temple, a Hiremagalur
-- "Kothanda Ramar" temple, and more) — all discarded after checking.
--
-- The other 63 have no confirmed photo anywhere, so — per instruction,
-- rather than leave the photo slot blank — each gets a generic devotional
-- painting of its presiding deity instead (mostly public-domain Raja Ravi
-- Varma paintings and genuine Tanjore-style paintings from Wikimedia
-- Commons, one Pattachitra painting for the Jagannath-replica temple).
-- Every one of these is clearly captioned "generic devotional image — not
-- a photo of this specific temple" so nobody mistakes it for an actual
-- picture of the building. Deity was matched from each temple's deity
-- column (Shiva, Vishnu, Devi, Murugan, Hanuman, Rama, Narasimha,
-- Saraswati, Ayyappan, Lakshmi, Jagannath, Agastya, Raghavendra Swamy,
-- or joint Shiva-Vishnu/Harihara for the "Shiva Vishnu Temple" entries).

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Yogananda Narasimha Temple, Lower Ahobilam'),
  'https://upload.wikimedia.org/wikipedia/commons/1/17/Yogananda_Narasimha_Temple%2C_Ahobilam_in_February_2024.jpg',
  'Yogananda Narasimha Temple, Lower Ahobilam',
  'Wikimedia Commons contributor',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Yogananda_Narasimha_Temple,_Ahobilam_in_February_2024.jpg'
),
(
  (select id from public.temples where name = 'Nithya Kalyana Perumal Temple, Thiruvidanthai'),
  'https://upload.wikimedia.org/wikipedia/commons/9/90/Nithya_Kalyana_Perumal_Temple_-_panoramio.jpg',
  'Nithya Kalyana Perumal Temple, Thiruvidanthai',
  'Panoramio, via Wikimedia Commons',
  'CC BY 3.0',
  'https://commons.wikimedia.org/wiki/File:Nithya_Kalyana_Perumal_Temple_-_panoramio.jpg'
),
(
  (select id from public.temples where name = 'Sthalasayana Perumal Temple, Mahabalipuram'),
  'https://upload.wikimedia.org/wikipedia/commons/0/0d/Thirukadalmallai%2C_Sthalasayana_Perumal_Temple%2C_Mahabalipuram_2K22TNKAN_%2851%29.jpg',
  'Sthalasayana Perumal Temple, Mahabalipuram',
  'Wikimedia Commons contributor',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thirukadalmallai,_Sthalasayana_Perumal_Temple,_Mahabalipuram_2K22TNKAN_(51).jpg'
),
(
  (select id from public.temples where name = 'Sri Rathnagiriswarar Temple, Besant Nagar'),
  'https://upload.wikimedia.org/wikipedia/commons/0/01/Sri_Rathnagiriswarar_Temple_-_Besant_Nagar.jpg',
  'Sri Rathnagiriswarar Temple, Besant Nagar',
  'Wikimedia Commons contributor',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Sri_Rathnagiriswarar_Temple_-_Besant_Nagar.jpg'
),
(
  (select id from public.temples where name = 'Sri Anjaneyar Temple, Nanganallur'),
  'https://upload.wikimedia.org/wikipedia/commons/0/08/Bhaktha_Anjaneyar%2C_Nanganallur.JPG',
  'Sri Anjaneyar Temple, Nanganallur',
  'Wikimedia Commons contributor',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Bhaktha_Anjaneyar,_Nanganallur.JPG'
),
(
  (select id from public.temples where name = 'Bhakthavatsala Perumal Temple, Thirunindravur'),
  'https://upload.wikimedia.org/wikipedia/commons/4/4e/Bhakthavatsala.JPG',
  'Bhakthavatsala Perumal Temple, Thirunindravur',
  'Wikimedia Commons contributor',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Bhakthavatsala.JPG'
),
(
  (select id from public.temples where name = 'Kumari Amman Temple, Kanyakumari'),
  'https://upload.wikimedia.org/wikipedia/commons/a/a4/Kanyakumari_Temple.JPG',
  'Kumari Amman Temple, Kanyakumari',
  'Kainjock, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Kanyakumari_Temple.JPG'
),
(
  (select id from public.temples where name = 'Neer Vanna Perumal Temple, Thiruneermalai'),
  'https://upload.wikimedia.org/wikipedia/commons/2/25/Neervannaperumal_Temple%2C_Thiruneermalai%2C_Chennai%2C_India.jpg',
  'Neer Vanna Perumal Temple, Thiruneermalai',
  'Wikimedia Commons contributor',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Neervannaperumal_Temple,_Thiruneermalai,_Chennai,_India.jpg'
),
(
  (select id from public.temples where name = 'Kutralanathar Temple, Kutralam'),
  'https://upload.wikimedia.org/wikipedia/commons/9/94/Courtallam%2C_Arulmigu_Thiru_Kuttralanathar_Temple_%2838765%29.jpg',
  'Kutralanathar Temple, Kutralam',
  'Manukrishnan80, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Courtallam,_Arulmigu_Thiru_Kuttralanathar_Temple_(38765).jpg'
),
(
  (select id from public.temples where name = 'Vadivudai Amman Temple, Tiruvottiyur'),
  'https://upload.wikimedia.org/wikipedia/commons/9/91/Thiuvotriyur3.jpg',
  'Vadivudai Amman Temple, Tiruvottiyur',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thiuvotriyur3.jpg'
),
(
  (select id from public.temples where name = 'Aadhipureeswarar Temple, Tiruvottiyur'),
  'https://upload.wikimedia.org/wikipedia/commons/9/91/Thiuvotriyur3.jpg',
  'Aadhipureeswarar Temple, Tiruvottiyur',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Thiuvotriyur3.jpg'
),
(
  (select id from public.temples where name = 'Sri Vedantha Desikar Devasthanam, Mylapore'),
  'https://upload.wikimedia.org/wikipedia/commons/0/00/Vedanta_Desikar.jpg',
  'Sri Vedantha Desikar Devasthanam, Mylapore',
  'Ssriram mt, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Vedanta_Desikar.jpg'
),
(
  (select id from public.temples where name = 'Lakshmi Narasimha Navaneetha Krishnan Temple, Nanganallur'),
  'https://upload.wikimedia.org/wikipedia/commons/9/90/Narasimha_avatar%2C_1850.jpg',
  'Traditional South Indian painting of Narasimha (generic devotional image — not a photo of this specific temple)',
  'Unknown author, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Narasimha_avatar,_1850.jpg'
),
(
  (select id from public.temples where name = 'Thiru Mada Koil Varadaraja Perumal Temple, Nanganallur'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Thiruvalithaayan Temple, Padi'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Agatheeswarar Temple, Villivakkam'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Sowmya Damodhara Perumal Temple, Villivakkam'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Koyambedu Vaikundavasa Perumal Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Kanaka Mahalakshmi Temple, Visakhapatnam'),
  'https://upload.wikimedia.org/wikipedia/commons/4/40/Tanjore_Lakshmi.jpg',
  'Traditional Tanjore-style painting of Lakshmi (generic devotional image — not a photo of this specific temple)',
  'Gcguru, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Lakshmi.jpg'
),
(
  (select id from public.temples where name = 'Kurungaleeswarar Temple, Koyambedu'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Pidari Sellandi Amman Saptha Kannikai Temple, Velachery'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7f/Durga_by_Raja_Ravi_Varma.jpg',
  'Traditional South Indian painting of Devi (generic devotional image — not a photo of this specific temple)',
  'Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Durga_by_Raja_Ravi_Varma.jpg'
),
(
  (select id from public.temples where name = 'Dhandeeswarar Temple, Velachery'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Sri Abirami Ambal Samedha Amirdhakadeshwarar Temple, Selaiyur'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Kailasanathar Temple, Murappanadu'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Yoga Narasimhar Kovil, Velachery'),
  'https://upload.wikimedia.org/wikipedia/commons/9/90/Narasimha_avatar%2C_1850.jpg',
  'Traditional South Indian painting of Narasimha (generic devotional image — not a photo of this specific temple)',
  'Unknown author, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Narasimha_avatar,_1850.jpg'
),
(
  (select id from public.temples where name = 'Kailasanathar Temple, Thenthiruperai'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Kailasanathar Temple, Rajapathy'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Kailasanathar Temple, Senthapoomangalam'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Sri Adhipureeshwarar Temple, Pallikaranai'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Mela Tirupathi Srinivasa Perumal Temple, Medavakkam'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Panchamuka Anjaneyar Temple, Gowrivakkam'),
  'https://upload.wikimedia.org/wikipedia/commons/1/10/Shri_Hanuman_%28Anjeneya%29.jpg',
  'Traditional South Indian painting of Hanuman (generic devotional image — not a photo of this specific temple)',
  'Saie.Surendra, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Shri_Hanuman_(Anjeneya).jpg'
),
(
  (select id from public.temples where name = 'Sri Ramanatheeswarar Temple, Porur'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Bhavishya Badri Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Vridha Badri Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Tirusoolanathar Tripurasundari Temple, Tirusulam'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Thiru Ooragam Perumal Temple, Kundrathur'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Maha Meru Seshadri Swamigal Shrine, Madambakkam'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Matsya Narayana Temple, ECR'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Puri Jagannath Temple, Kannathur, ECR'),
  'https://upload.wikimedia.org/wikipedia/commons/4/44/Jagannath_Theme_in_Pattachitra.jpg',
  'Traditional Pattachitra painting of Jagannath (generic devotional image — not a photo of this specific temple)',
  'Unknown author, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Jagannath_Theme_in_Pattachitra.jpg'
),
(
  (select id from public.temples where name = 'Agasthyar Temple, T. Nagar'),
  'https://upload.wikimedia.org/wikipedia/commons/0/00/Aagasya_Maharshi.jpg',
  'Traditional South Indian painting of the sage Agastya (generic devotional image — not a photo of this specific temple)',
  'Kanaka Suri babu, via Wikimedia Commons',
  'CC BY 4.0',
  'https://commons.wikimedia.org/wiki/File:Aagasya_Maharshi.jpg'
),
(
  (select id from public.temples where name = 'Shiva Vishnu Temple, T. Nagar'),
  'https://upload.wikimedia.org/wikipedia/commons/3/3f/1801_sketch_of_Vishnu_avatar_Sundaranarayana_%28Harihara%29_in_Meenakshi_Shaivism_Temple_at_Madurai_Tamil_Nadu.jpg',
  'Traditional South Indian depiction of Harihara, the combined Shiva-Vishnu form (generic devotional image — not a photo of this specific temple)',
  'Unknown artist, 1801, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:1801_sketch_of_Vishnu_avatar_Sundaranarayana_(Harihara)_in_Meenakshi_Shaivism_Temple_at_Madurai_Tamil_Nadu.jpg'
),
(
  (select id from public.temples where name = 'Paathala Lingeshwarar Temple, Kakallur, Tiruvallur'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Raghavendra Swamy Temple, T. Nagar'),
  'https://upload.wikimedia.org/wikipedia/commons/8/81/Ragavendra1.jpg',
  'Traditional depiction of Sri Raghavendra Swamy (generic devotional image — not a photo of this specific temple)',
  'Nsmohan, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Ragavendra1.jpg'
),
(
  (select id from public.temples where name = 'Sharadhamba Temple, T. Nagar'),
  'https://upload.wikimedia.org/wikipedia/commons/4/40/Goddess_Saraswati_by_Raja_Ravi_Varma%2C_1896.jpg',
  'Traditional South Indian painting of Saraswati (generic devotional image — not a photo of this specific temple)',
  'Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Goddess_Saraswati_by_Raja_Ravi_Varma,_1896.jpg'
),
(
  (select id from public.temples where name = 'Muppathamman Temple, T. Nagar'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7f/Durga_by_Raja_Ravi_Varma.jpg',
  'Traditional South Indian painting of Devi (generic devotional image — not a photo of this specific temple)',
  'Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Durga_by_Raja_Ravi_Varma.jpg'
),
(
  (select id from public.temples where name = 'Iyappan Temple, Mahalingapuram'),
  'https://upload.wikimedia.org/wikipedia/commons/5/5f/Paintings_of_Ayyappan_at_Shree_Dharmashasthagiri_Ayyappa_Swamy_Temple%2C_Huskuru.jpg',
  'Traditional South Indian painting of Ayyappan (generic devotional image — not a photo of this specific temple)',
  'Kaartic, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Paintings_of_Ayyappan_at_Shree_Dharmashasthagiri_Ayyappa_Swamy_Temple,_Huskuru.jpg'
),
(
  (select id from public.temples where name = 'Mahalingapuram Mahalingaswamy Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Agatheeswarar Temple, Nungambakkam'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Theerthapaleeswarar Temple, Triplicane'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Angala Parameswari Temple, West Mambalam'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7f/Durga_by_Raja_Ravi_Varma.jpg',
  'Traditional South Indian painting of Devi (generic devotional image — not a photo of this specific temple)',
  'Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Durga_by_Raja_Ravi_Varma.jpg'
),
(
  (select id from public.temples where name = 'Kasi Viswanathar Temple, West Mambalam'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Uma Devi Temple, Karnaprayag'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7f/Durga_by_Raja_Ravi_Varma.jpg',
  'Traditional South Indian painting of Devi (generic devotional image — not a photo of this specific temple)',
  'Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Durga_by_Raja_Ravi_Varma.jpg'
),
(
  (select id from public.temples where name = 'Sharadhamba Temple, West Mambalam'),
  'https://upload.wikimedia.org/wikipedia/commons/4/40/Goddess_Saraswati_by_Raja_Ravi_Varma%2C_1896.jpg',
  'Traditional South Indian painting of Saraswati (generic devotional image — not a photo of this specific temple)',
  'Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Goddess_Saraswati_by_Raja_Ravi_Varma,_1896.jpg'
),
(
  (select id from public.temples where name = 'Kolavizhi Amman Temple, Mylapore'),
  'https://upload.wikimedia.org/wikipedia/commons/7/7f/Durga_by_Raja_Ravi_Varma.jpg',
  'Traditional South Indian painting of Devi (generic devotional image — not a photo of this specific temple)',
  'Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Durga_by_Raja_Ravi_Varma.jpg'
),
(
  (select id from public.temples where name = 'Adi Kesava Perumal Temple, Mylapore'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Veerabhadra Swamy Temple, Mylapore'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Balasubramanya Swamy Temple, Teynampet'),
  'https://upload.wikimedia.org/wikipedia/commons/8/81/Murugan_by_Raja_Ravi_Varma.jpg',
  'Traditional South Indian painting of Murugan (generic devotional image — not a photo of this specific temple)',
  'Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Murugan_by_Raja_Ravi_Varma.jpg'
),
(
  (select id from public.temples where name = 'Sri Bharadwajeswarar Temple, Kodambakkam'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Adi Kesava Perumal Temple, West Mambalam'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Kothanda Ramar Temple, West Mambalam'),
  'https://upload.wikimedia.org/wikipedia/commons/f/fa/SRI_RAMA_PATTABHIKSHEKAM_WP.jpg',
  'Traditional South Indian painting of Rama (generic devotional image — not a photo of this specific temple)',
  'Yecharan Tatvamasi, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:SRI_RAMA_PATTABHIKSHEKAM_WP.jpg'
),
(
  (select id from public.temples where name = 'Sathyanarayana Temple, West Mambalam'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Thiruvateeswarar Temple, Triplicane'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Sri Anantha Padmanabhaswami Temple, Adyar'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Kaleshwara Mukteshwara Swamy Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Vallakottai Murugan Temple, Park Town'),
  'https://upload.wikimedia.org/wikipedia/commons/8/81/Murugan_by_Raja_Ravi_Varma.jpg',
  'Traditional South Indian painting of Murugan (generic devotional image — not a photo of this specific temple)',
  'Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Murugan_by_Raja_Ravi_Varma.jpg'
),
(
  (select id from public.temples where name = 'Vaideeswaran Temple, Poonamallee High Road'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Chettipunyam Hayagrivar Temple, Chengalpattu'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Eri Katha Ramar Temple, Chengalpattu'),
  'https://upload.wikimedia.org/wikipedia/commons/f/fa/SRI_RAMA_PATTABHIKSHEKAM_WP.jpg',
  'Traditional South Indian painting of Rama (generic devotional image — not a photo of this specific temple)',
  'Yecharan Tatvamasi, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:SRI_RAMA_PATTABHIKSHEKAM_WP.jpg'
),
(
  (select id from public.temples where name = 'Sri Ranganatha Perumal Temple, Tiruvallur'),
  'https://upload.wikimedia.org/wikipedia/commons/d/d3/Tanjore_Paintings_Venkateshwara.jpg',
  'Traditional Tanjore-style painting of Vishnu (generic devotional image — not a photo of this specific temple)',
  'Iramuthusamy, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Tanjore_Paintings_Venkateshwara.jpg'
),
(
  (select id from public.temples where name = 'Gnanapureeswarar Temple, Thiruvadisoolam'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Tirupacchur Vaccheeswarar Temple, Tiruvallur'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b3/Siva-parvati-by-raja-ravi-varma.jpg',
  'Traditional South Indian painting of Shiva and Parvati (generic devotional image — not a photo of this specific temple)',
  'Attributed to Raja Ravi Varma, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:Siva-parvati-by-raja-ravi-varma.jpg'
),
(
  (select id from public.temples where name = 'Kakallur Veera Anjaneyar Temple, Tiruvallur'),
  'https://upload.wikimedia.org/wikipedia/commons/1/10/Shri_Hanuman_%28Anjeneya%29.jpg',
  'Traditional South Indian painting of Hanuman (generic devotional image — not a photo of this specific temple)',
  'Saie.Surendra, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Shri_Hanuman_(Anjeneya).jpg'
),
(
  (select id from public.temples where name = 'Shiva Vishnu Temple, Poonga Nagar, Tiruvallur'),
  'https://upload.wikimedia.org/wikipedia/commons/3/3f/1801_sketch_of_Vishnu_avatar_Sundaranarayana_%28Harihara%29_in_Meenakshi_Shaivism_Temple_at_Madurai_Tamil_Nadu.jpg',
  'Traditional South Indian depiction of Harihara, the combined Shiva-Vishnu form (generic devotional image — not a photo of this specific temple)',
  'Unknown artist, 1801, via Wikimedia Commons',
  'Public domain',
  'https://commons.wikimedia.org/wiki/File:1801_sketch_of_Vishnu_avatar_Sundaranarayana_(Harihara)_in_Meenakshi_Shaivism_Temple_at_Madurai_Tamil_Nadu.jpg'
),
(
  (select id from public.temples where name = 'Pancha Mukha Anjaneyar Temple, NGO Colony, Tiruvallur'),
  'https://upload.wikimedia.org/wikipedia/commons/1/10/Shri_Hanuman_%28Anjeneya%29.jpg',
  'Traditional South Indian painting of Hanuman (generic devotional image — not a photo of this specific temple)',
  'Saie.Surendra, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Shri_Hanuman_(Anjeneya).jpg'
),
(
  (select id from public.temples where name = 'Eri Katha Ramar Temple, Thirunindravur'),
  'https://upload.wikimedia.org/wikipedia/commons/f/fa/SRI_RAMA_PATTABHIKSHEKAM_WP.jpg',
  'Traditional South Indian painting of Rama (generic devotional image — not a photo of this specific temple)',
  'Yecharan Tatvamasi, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:SRI_RAMA_PATTABHIKSHEKAM_WP.jpg'
);
