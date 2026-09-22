-- Ṛtam — 8 major Andhra Pradesh / Telangana temples not yet in the
-- database (Tirumala, Srisailam, Sri Kalahasti, the Pancharama/Shakti
-- Peetha/Nava Narasimha clusters, and 27 other AP/Telangana temples were
-- already added in earlier migrations — checked against those before
-- writing this batch).
--
-- Every fact below was checked against Wikipedia and, where noted,
-- flagged as traditional/legendary rather than settled history — several
-- of these temples have genuinely disputed founding dates in the
-- sources themselves (Thousand Pillar Temple's exact consecration year,
-- Bhadrakali's Chalukya attribution, Chilkur Balaji's construction
-- century), so those are phrased as "traditionally attributed" rather
-- than stated as fact, and left out of construction_century where the
-- dispute is unresolved. Medaram is not a conventional built temple —
-- it's an open-air site of "gaddelu" (shrine platforms) — so
-- architecture_style is left null for it rather than implying a
-- structure that doesn't exist. Native-script (Telugu) names are left
-- for a later pass rather than risked here.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Thousand Pillar Temple, Hanamkonda', 'Shiva (Rudreshwara), with Vishnu and Surya co-enshrined in a triple shrine (Trikutalayam)', 'Shaiva', array['Kakatiya monument']::text[], 'India', 'Telangana', 'Hanamkonda', 'Hanamkonda', 18.00370, 79.57470, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$Built by order of the Kakatiya king Rudra Deva in the 12th century (a consecration year of 1163 CE is commonly cited, though the temple's own documented history gives a broader 12th–13th century range for the Kakatiya building programme here). Its star-shaped triple-shrine (Trikutalayam) plan houses Shiva, Vishnu and Surya together, and it is renowned for a monolithic dolerite Nandi and finely detailed stone carving. Damaged in later centuries, it was restored with a donation from the 7th Nizam of Hyderabad and again by the Government of India in 2004; it is now ASI-protected.$$,
  'Temple inscriptions; Archaeological Survey of India records', 'Kakatiya (Vesara / later Chalukyan), star-shaped triple-shrine plan', 12, 'approved'
),
(
  'Bhadrakali Temple, Warangal', 'Bhadrakali (Devi)', 'Shakta', array['Kakatiya kuladevata']::text[], 'India', 'Telangana', 'Warangal', 'Warangal', 17.99490, 79.58280, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The Apara Ekadashi observance draws large crowds.',
  $$The temple's own inscriptions attribute its founding to the Chalukya king Pulakeshin II in 625 CE, commemorating a victory over the Vengi region — a traditional attribution rather than an independently settled academic date. The Kakatiya dynasty later adopted Bhadrakali, whose eight-armed image here is over two and a half metres tall, as their kuladevata (tutelary deity); the adjoining lake was built under the Kakatiya king Ganapati Deva. The temple declined after the fall of the Kakatiyas and was renovated in 1950.$$,
  'Temple inscriptions; local tradition', 'Traditionally Chalukyan origin (7th century) with later Kakatiya-era patronage', 7, 'approved'
),
(
  'Sammakka Saralamma Temple, Medaram', 'Sammakka and Saralamma (tribal goddesses, worshipped as forms of Adi Parashakti)', null, array['Tribal jatara']::text[], 'India', 'Telangana', 'Mulugu', 'Medaram', 18.24194, 80.08528, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The Jatara is held in the Telugu month of Magha (Jan–Feb), on even-numbered years, over four days.',
  $$Not a built stone temple but an open-air site: Sammakka and her daughter Saralamma are marked by "gaddelu" (shrine platforms), traditionally under trees in the forest. Koya tribal legend holds that Sammakka was found as an infant glowing amid tigers and adopted, later marrying the Koya chieftain Pagididda Raju; in the 13th century, when the Kakatiya ruler Prataparudra moved against the tribal territory, her daughter Saralamma and others died in battle, and a warrior named Jampanna gave his life in the stream since renamed Jampanna Vagu in his memory. Sammakka herself is said to have vanished into the Chilakala Gutta hills rather than die, worshipped since in the form of vermilion (kumkuma bharani) found at that spot. This is oral Koya tradition, not epigraphically documented history. The Jatara held here is one of the largest tribal religious gatherings in the world.$$,
  'Koya oral tradition', null, null, 'approved'
),
(
  'Chilkur Balaji Temple, Hyderabad', 'Venkateswara (Vishnu / Balaji)', 'Vaishnava', array['Visa Balaji']::text[], 'India', 'Telangana', 'Ranga Reddy', 'Chilkur', 17.35833, 78.29861, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, null,
  $$Local tradition holds that a devotee unable to travel to Tirupati was directed in a dream by Lord Venkateswara to Chilkur, where the idol was found beneath a molehill. The temple's later history is associated with Madanna and Akkanna — though sources disagree on whether the structure itself dates to the 14th century or to their own 17th-century Qutb Shahi era, so no construction century is asserted here. It is best known today for a distinctive practice: there is no hundi (donation box) and no paid "special" darshan, and devotees perform 11 circumambulations to make a wish, returning for 108 after it is fulfilled — the basis of its popular "Visa Balaji" nickname among US visa applicants.$$,
  'Local tradition; temple practice as documented by visitors and press coverage', null, null, 'approved'
),
(
  'Ujjaini Mahakali Temple, Secunderabad', 'Mahakali (Devi)', 'Shakta', array['Bonalu']::text[], 'India', 'Telangana', 'Hyderabad', 'Secunderabad', 17.436678, 78.491074, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Its Bonalu (Ashada Jatara), typically in the Hindu month of Ashada around July, is one of the most prominent in Hyderabad/Secunderabad.',
  $$Founded after a cholera outbreak in 1813 that coincided with the transfer of military battalions from Secunderabad to Ujjain. A doli-bearer, Suriti Appaiah, travelled to the Mahakali Devasthanam at Ujjain with his associates and vowed to install an idol if the epidemic relented; a wooden idol was installed in Secunderabad in July 1814, with the temple structure completed around 1815. It has since become one of the principal centres of the annual Bonalu festival, when devotees — especially women carrying "bonam" offerings — gather here in large numbers.$$,
  'Temple history as documented in regional press and municipal heritage records', null, 19, 'approved'
),
(
  'Mahanandeeswara Swamy Temple, Mahanandi', 'Shiva (Mahanandeeswara)', 'Shaiva', array['Nava Nandi']::text[], 'India', 'Andhra Pradesh', 'Nandyal', 'Mahanandi', 15.47056, 78.62611, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Maha Shivaratri (Feb–Mar) is the major festival here.',
  $$An ancient shrine, traditionally said to be over 1,500 years old, with its gopuram attributed to the Badami Chalukyas (7th century) and further additions under Vijayanagara patronage in the 10th–15th centuries. One of the "Nava Nandi" cluster of nine Nandi/Shiva shrines within about 15 km of each other, Mahanandi is known above all for its perennial spring-fed square tanks (pushkarinis, traditionally named for Brahma, Vishnu and Rudra), whose water is considered never to run dry.$$,
  'Local tradition; Nava Nandi cluster history', 'Dravidian; Badami Chalukyan-style gopuram with Vijayanagara-era additions', 7, 'approved'
),
(
  'Trikoteswara Swamy Temple, Kotappakonda', 'Shiva (Trikoteswara, "Lord of the Three Peaks")', 'Shaiva', array[]::text[], 'India', 'Andhra Pradesh', 'Palnadu', 'Kotappakonda', 16.14500, 80.03900, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Its Maha Shivaratri jatara features the "Prabha" festival, giant illuminated towers over 100 feet tall built by village communities.',
  $$Temple inscriptions show a shrine existed here before 1172 CE, on a hill also called Trikutadri or Trikuta Parvatham ("hill of three peaks"). It saw patronage from the Eastern Chalukyas and Kakatiyas between roughly the 9th and 14th centuries, and significant building activity under Vijayanagara rule in the 14th–16th centuries; local tradition also credits a notable 1761 renovation, though that date rests on local rather than academic sources. The temple is today administered by the Tirumala Tirupati Devasthanams (TTD).$$,
  'Temple inscriptions; local tradition', 'Dravidian; hilltop shrine with medieval-to-Vijayanagara-era construction phases', 12, 'approved'
),
(
  'Andhra Maha Vishnu Temple, Srikakulam (Krishna district)', 'Vishnu (Andhra Maha Vishnu) / Rajya Lakshmi Devi', 'Vaishnava', array['Divya Desam']::text[], 'India', 'Andhra Pradesh', 'Krishna', 'Srikakulam', 16.20000, 80.85000, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Krishna', 0.5, null,
  $$Counted as the 57th of the 108 Divya Desams. The temple bears 32 inscriptions, including ones from the Vijayanagara emperor Krishnadevaraya, who is recorded to have visited during his Kalinga campaign around 1515–1516 CE and is traditionally said to have composed the opening verses of his Telugu work Amuktamalyada here. A popular sthala purana, recounted in the Andhra Kaumudi, describes "Andhra Vishnu" building a wall linking Srisailam, Bhimeswaram and Kaleswaram with three gates for three lingams, after which the region came to be called "Trilingam" — a traditional account offered as the origin of the name "Andhra", not an established historical or linguistic fact. Note: this village, in Krishna district's Ghantasala mandal on the bank of the Krishna river, is distinct from Srikakulam town/district in north coastal Andhra Pradesh.$$,
  'Andhra Kaumudi (traditional account); temple inscriptions', null, null, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Thousand Pillar Temple, Hanamkonda'),
  'https://upload.wikimedia.org/wikipedia/commons/e/e1/1000_Pillar_Temple_%2802%29.jpg',
  'Thousand Pillar Temple, Hanamkonda',
  'Kotagaunisrinivas, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:1000_Pillar_Temple_(02).jpg'
),
(
  (select id from public.temples where name = 'Bhadrakali Temple, Warangal'),
  'https://upload.wikimedia.org/wikipedia/commons/4/44/Bhadrakali_Temple%2C_Warangal.jpg',
  'Bhadrakali Temple, Warangal',
  'Warangalite, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Bhadrakali_Temple,_Warangal.jpg'
),
(
  (select id from public.temples where name = 'Sammakka Saralamma Temple, Medaram'),
  'https://upload.wikimedia.org/wikipedia/commons/f/ff/Sammakka_gadde_at_sammakka_saarakka_jatara.jpg',
  'Sammakka gadde, Medaram',
  'Kasyap, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Sammakka_gadde_at_sammakka_saarakka_jatara.jpg'
),
(
  (select id from public.temples where name = 'Chilkur Balaji Temple, Hyderabad'),
  'https://upload.wikimedia.org/wikipedia/commons/2/21/Chilukuru_temple.jpg',
  'Chilkur Balaji Temple, Hyderabad',
  'Srilakshmi1991, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Chilukuru_temple.jpg'
),
(
  (select id from public.temples where name = 'Ujjaini Mahakali Temple, Secunderabad'),
  'https://upload.wikimedia.org/wikipedia/commons/2/2b/Mahkli.jpg',
  'Entrance to the Sri Ujjaini Mahakali Temple, Secunderabad',
  'Sharath, via Wikimedia Commons',
  'Public Domain',
  'https://commons.wikimedia.org/wiki/File:Mahkli.jpg'
),
(
  (select id from public.temples where name = 'Mahanandeeswara Swamy Temple, Mahanandi'),
  'https://upload.wikimedia.org/wikipedia/commons/a/ac/Mahanadi_Temple%2C_Mahanandi%2C_Andhra_Pradesh_India_-_2.jpg',
  'Mahanandeeswara Swamy Temple, Mahanandi',
  'P. Madhusudan, via Wikimedia Commons',
  'CC0 1.0',
  'https://commons.wikimedia.org/wiki/File:Mahanadi_Temple,_Mahanandi,_Andhra_Pradesh_India_-_2.jpg'
),
(
  (select id from public.temples where name = 'Trikoteswara Swamy Temple, Kotappakonda'),
  'https://upload.wikimedia.org/wikipedia/commons/c/ca/Sri_Trikoteswara_Swamy_Temple%2C_Kotappakonda.JPG',
  'Sri Trikoteswara Swamy Temple, Kotappakonda',
  'JVRKPRASAD, via Wikimedia Commons',
  'CC BY-SA 2.5',
  'https://commons.wikimedia.org/wiki/File:Sri_Trikoteswara_Swamy_Temple,_Kotappakonda.JPG'
),
(
  (select id from public.temples where name = 'Andhra Maha Vishnu Temple, Srikakulam (Krishna district)'),
  'https://upload.wikimedia.org/wikipedia/commons/6/63/Front_view_of_Andhra_Vishnu_temple.jpg',
  'Andhra Maha Vishnu Temple, Srikakulam',
  'Muppavarapu Navya, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Front_view_of_Andhra_Vishnu_temple.jpg'
);
