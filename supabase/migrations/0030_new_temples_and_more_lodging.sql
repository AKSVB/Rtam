-- Ṛtam — 14 more verified temples and 10 more devasthanam lodging entries
--
-- Same discipline as prior batches: every fact checked against public
-- sources before writing, generated from a structured data file to keep
-- column counts correct. This batch fills in four of the six Arupadaiveedu
-- Murugan shrines (Palani was already in the directory), plus more
-- geographic spread — Ayodhya, Rajasthan, West Bengal, Madhya Pradesh.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Thiruparankundram Murugan Temple', 'Murugan (Subrahmanya)', 'Shaiva', array['Arupadaiveedu'], 'India', 'Tamil Nadu', 'Madurai', 'Thiruparankundram', 9.8667, 78.0667, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Jan–Feb for Thaipusam; otherwise Oct–Feb.', 'Considered the first of the six Arupadaiveedu (sacred battle-camps of Murugan), carved into a rock-cut hillside dating back to around the 6th century under the early Pandyas, with Nayak-era gopurams added later. Tradition holds this is where Murugan married Deivanai, Indra''s daughter, after freeing Indra and the other devas from the demon Surapadman.', 'Local/regional tradition', null, 6, 'approved'
),
(
  'Tiruchendur Murugan Temple', 'Murugan (Subrahmanya)', 'Shaiva', array['Arupadaiveedu'], 'India', 'Tamil Nadu', 'Thoothukudi', 'Tiruchendur', 8.4967, 78.1189, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Nov for Skanda Sashti, commemorating the victory over Surapadman; otherwise Oct–Feb.', 'The only one of the six Arupadaiveedu set directly on the seashore, with a documented history reaching back to Sangam-era Tamil literature over 2,000 years old. Tradition holds Murugan established his war camp here before his decisive battle with the demon Surapadman, who could not be slain by any human, animal, or being born of a goddess — Shiva''s third eye had earlier created six divine infants from sparks that merged into Murugan for this very purpose.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Swamimalai Murugan Temple', 'Murugan (Swaminatha)', 'Shaiva', array['Arupadaiveedu'], 'India', 'Tamil Nadu', 'Thanjavur', 'Swamimalai', 10.9667, 79.3167, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Cauvery', 2, 'Oct–Feb.', 'Set atop a 60-foot hill reached by sixty steps, each named for one of the sixty years of the Tamil calendar. Tradition holds this is where young Murugan explained the meaning of the sacred syllable Om to his own father Shiva, after Shiva could not answer it himself — earning the name Swamimalai, "the hill where Shiva became the student." The temple''s core dates to the Sangam period, with major rebuilding credited to the Chola king Parantaka I.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Pazhamudircholai Murugan Temple', 'Murugan (Subrahmanya)', 'Shaiva', array['Arupadaiveedu'], 'India', 'Tamil Nadu', 'Madurai', 'Pazhamudircholai', 9.9967, 78.2167, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'The sixth and last of the Arupadaiveedu, set in a forested hill near Madurai, and the only one where Murugan is depicted alongside both his consorts, Valli and Deivanai. Tradition holds this is where the Tamil poet-devotee Avvaiyar, tested by Murugan disguised as a young boy under a tree still worshipped today, was taught a lesson in humility despite her renowned wisdom.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Kodandarama Temple, Vontimitta', 'Rama, Sita, Lakshmana', 'Vaishnava', array[]::text[], 'India', 'Andhra Pradesh', 'YSR Kadapa', 'Vontimitta', 14.2667, 78.95, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Mar–Apr for Sri Rama Navami, when the state-sponsored Sita Rama Kalyanam is held here.', 'A 16th-century Vijayanagara-era temple regarded as one of the finest surviving examples of that architectural style in the Rayalaseema region, and today the official venue for Andhra Pradesh''s state-sponsored Rama Navami wedding celebrations. Tradition holds Rama, Sita, and Lakshmana rested here during their forest exile, and that Rama shot an arrow into the earth to draw water for a thirsty Sita, forming the temple''s two tanks, Ramatirtham and Lakshmanatirtham. The temple''s own name is said to come from two devotees, Vontudu and Mittudu, credited with its construction.', 'Local/regional tradition', 'Vijayanagara', 16, 'approved'
),
(
  'Vaidyeshwara Temple, Talakadu', 'Vaidyeshwara (Shiva)', 'Shaiva', array[]::text[], 'India', 'Karnataka', 'Mysuru', 'Talakadu', 12.2, 77.0333, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Kaveri', 0.1, 'Feb–Mar (Panchalinga Darshana, held once every 12 years, is the biggest event); otherwise Oct–Feb.', 'Once the capital of the Western Ganga dynasty, and by tradition home to more than thirty temples now mostly buried under Kaveri riverside sand dunes. Local tradition attributes the burial to a curse laid by Queen Alamelamma of Srirangapatna in the 16th century, after Mysore''s Wodeyar rulers seized her jewels — she is said to have drowned herself in the Kaveri, cursing the town to turn to sand; historians instead point to river-course shifts and wind-driven erosion. The Vaidyeshwara Temple is among the few structures still visible above the sand.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Parassinikadavu Muthappan Temple', 'Muthappan (Vishnu-Shiva)', 'Shaiva', array[]::text[], 'India', 'Kerala', 'Kannur', 'Parassinikadavu', 11.9667, 75.4167, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Valapattanam', 0.2, 'Dec–Jan for the Puthari Thiruvappana festival; otherwise Oct–Feb.', 'A markedly non-traditional temple: worship here centres on the daily Theyyam ritual rather than fixed-idol puja, is open to devotees of every caste and religion, and offers fish, toddy, and meat as prasadam. Local tradition holds Muthappan was a divine child found by a childless couple on the riverbank, whose unconventional habits led to his being cast out, after which he was revealed to combine the forms of Vishnu (as Thiruvappana) and Shiva (as Vellattom). Dogs are considered sacred here as Muthappan''s companions and roam the temple freely.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Galtaji Temple', 'Hanuman / Surya / Rama', 'Vaishnava', array[]::text[], 'India', 'Rajasthan', 'Jaipur', 'Jaipur', 26.9089, 75.8611, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb, avoiding peak Rajasthan summer heat.', 'Known widely as the "Monkey Temple" for the hundreds of macaques living in its Aravalli-hill ravine, alongside seven natural spring-fed water tanks used for ritual bathing. Tradition holds the sage Galav performed 60,000 years of penance here, and that his devotion caused the tanks to be perpetually replenished even in drought. The present temple complex was built under the patronage of Diwan Rao Kripa Ram in the reign of Sawai Jai Singh II.', 'Local/regional tradition', null, 18, 'approved'
),
(
  'Kalika Mata Temple, Chittorgarh Fort', 'Kalika Mata (Devi)', 'Shakta', array[]::text[], 'India', 'Rajasthan', 'Chittorgarh', 'Chittorgarh', 24.8829, 74.6467, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Sep–Oct for Navaratri; otherwise Oct–Feb.', 'Originally an 8th-century Surya (sun) temple built by Bappa Rawal, damaged in Alauddin Khalji''s 1303 sack of Chittorgarh Fort, and rededicated to the goddess Kalika (also known locally as Chittodeshwari) after Rana Hamir installed her idol here in the 14th century. The Mewar ruler Maharana Lakshman Singh is credited with lighting an eternal flame (Akhanda Jyoti) here that tradition holds has burned ever since.', 'Local/regional tradition', null, 8, 'approved'
),
(
  'Jyotiba Temple, Kolhapur', 'Jyotiba (Brahma-Vishnu-Shiva combined)', 'Shaiva', array[]::text[], 'India', 'Maharashtra', 'Kolhapur', 'Panhala', 16.7833, 74.15, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Mar–Apr for the Chaitra Yatra fair on Chaitra Purnima.', 'Set on a hilltop in the Panhala range, with the current structure dating to 1730 under the Maratha noble Ranoji Shinde, replacing an earlier 17th-century shrine. Tradition holds the three gods Brahma, Vishnu, and Shiva combined into a single form, Jyotiba, specifically to destroy the demon Ratnasura and later the demon Raktabhoja, freeing the region from their oppression. The temple''s Chaitra Yatra is known for its colourful processions and clouds of gulal (pink powder).', 'Local/regional tradition', null, 18, 'approved'
),
(
  'Kottarakkara Ganapathy Temple', 'Ganapathy (Ganesha)', 'Ganapatya', array[]::text[], 'India', 'Kerala', 'Kollam', 'Kottarakkara', 9.0, 76.7833, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Aug–Sep for Vinayaka Chaturthi; otherwise Oct–Feb.', 'Originally a Shiva temple (Kizhakkekara), where a subordinate Ganesha shrine grew to eclipse the main deity in popular devotion over time. Tradition holds a sculptor commissioned to carve a Vishnu idol was divinely guided to carve Ganesha instead, later consecrated by the legendary Kerala craftsman Perumthachan. The temple also holds a place in Kerala''s performing arts history as the site traditionally credited with the first-ever Kathakali performance, in the 17th century.', 'Local/regional tradition', null, 17, 'approved'
),
(
  'Hanuman Garhi Temple', 'Hanuman', 'Vaishnava', array[]::text[], 'India', 'Uttar Pradesh', 'Ayodhya', 'Ayodhya', 26.7969, 82.1956, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; devotees traditionally visit here before proceeding to the Ram Mandir.', 'A fort-like temple, blending Hindu and Indo-Islamic architectural styles, reached by 76 steps. Tradition holds this is the cave where Hanuman lived to guard Ramkot (Rama''s citadel) after Rama''s return from Lanka, and it remains customary for pilgrims to visit here before Ram Mandir darshan. Accounts of its founding vary — some crediting King Vikramaditya, others the poet-saint Tulsidas — and the present structure was rebuilt in the 18th century after Aurangzeb-era demolition.', 'Local/regional tradition', null, 18, 'approved'
),
(
  'Kankalitala Temple', 'Kankalini (Devi)', 'Shakta', array['Shakti Peetha'], 'India', 'West Bengal', 'Birbhum', 'Kankalitala', 23.6167, 87.6667, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Kopai', 0.1, 'Oct–Feb; Navaratri and Kali Puja draw the largest crowds.', 'One of the 51 Shakti Peethas, on the banks of the Kopai river, where tradition holds Sati''s waist (or, by some accounts, her bones — kankal) fell after Vishnu''s discus cut apart her body to end Shiva''s grief-stricken tandava. Unusually plain among the Shakti Peethas, the temple holds no metal, clay, or stone idol, worshipping instead at the sacred kund said to mark the spot itself.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Narmada Udgam Temple, Amarkantak', 'Narmada (Devi)', 'Shakta', array[]::text[], 'India', 'Madhya Pradesh', 'Anuppur', 'Amarkantak', 22.6725, 81.755, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; Narmada Jayanti draws the largest crowds.', 'Marks the source of the Narmada river, alongside a cluster of 11th-century Kalachuri-era temples (Karna, Keshava Narayan, Machendranatha, Pateleshwar and others) around the Surya Kund, traditionally said to have been built up from a tank first created by Adi Shankaracharya in the 8th century. Tradition holds the rivers Narmada and Son, born here together, were betrothed to marry but Son abandoned Narmada at the altar — she flows west to the Arabian Sea in anger and disappointment, while Son flows east to join the Ganges.', 'Local/regional tradition', null, 11, 'approved'
);

-- ── More devasthanam/trust-run lodging ───────────────────────────────────

insert into public.temple_stays (temple_id, name, contact, address, distance_to_temple_km, pure_veg_kitchen, puja_room_available, price_range, notes, status)
values
(
  (select id from public.temples where name = 'Dharmasthala Manjunatha Temple'),
  'Dharmasthala Temple Choultries and Guest Houses',
  null,
  'Shri Dharmasthala Manjunatheshwara Dharmothana Trust, Dharmasthala',
  0,
  false,
  false,
  'Free to nominal donation, plus paid guest-house rooms',
  'Run by the temple trust itself, mostly within walking distance of the temple. Some rooms/beds are free or donation-based on a first-come, first-served basis (no advance booking); paid guest-house rooms are also available. The trust separately runs the free Annapoorna Choultry dining hall.',
  'approved'
),
(
  (select id from public.temples where name = 'Kollur Mookambika Temple'),
  'Kollur Mookambika Temple Guest Houses (Lalithamba, Sowparnika, Matha Chatra, Jagadmbika, and a dormitory)',
  null,
  'Sri Mookambika Temple, Kollur (Lalithamba Guest House about 400m from the temple)',
  0,
  false,
  false,
  '₹250–₹500/night',
  'Several guest-house blocks run by the temple itself, from budget triple rooms to AC suites. Book only through the temple’s own official channels — fake booking websites impersonating the temple have been reported.',
  'approved'
),
(
  (select id from public.temples where name = 'Ekambareswarar Temple, Kanchipuram (Prithvi Sthalam)'),
  'Kanchipuram Devasthanam Rooms',
  null,
  'Near Ekambareswarar Temple, Kanchipuram',
  0,
  false,
  false,
  'Budget dormitory to family rooms',
  'Basic rooms operated by the temple trust rather than a private hotel, close to the temple’s thousand-pillared hall. Contact the devasthanam office directly to confirm current availability.',
  'approved'
),
(
  (select id from public.temples where name = 'Kanchi Kamakoti Peetham'),
  'Sri Kanchi Kamakoti Peetam Yatri Niwas',
  null,
  'Kanchi Kamakoti Peetham, Kanchipuram',
  0,
  false,
  false,
  'Budget-priced',
  null,
  'approved'
),
(
  (select id from public.temples where name = 'Shrinathji Temple, Nathdwara'),
  'New Cottage (run by the Srinath Trust)',
  null,
  'Within walking distance of the temple and main market, Nathdwara',
  0,
  false,
  false,
  'Mid-range, AC rooms available',
  'One of several guest houses run by the Srinath Trust itself, distinct from the many independent dharamshalas also clustered around the temple.',
  'approved'
),
(
  (select id from public.temples where name = 'Bhadrachalam Sita Ramachandraswamy Temple'),
  'Bhadrachalam Temple Guest Houses and Sadanams',
  null,
  'Official booking via bhadradritemple.telangana.gov.in, Bhadrachalam',
  0,
  false,
  false,
  '₹100–₹3,000/night; temple-managed AC rooms around ₹600–₹1,000',
  'A mix of temple-managed guest houses, cottages, and sadanams alongside government tourism accommodation, bookable through the temple’s own official portal.',
  'approved'
),
(
  (select id from public.temples where name = 'Basara Gnana Saraswati Temple'),
  'Basara Devasthanam Rooms and Cottages',
  null,
  'Sri Gnana Saraswati Devasthanam, Basara',
  0,
  false,
  false,
  '₹75 (basic) to ₹1,500/night (suite cottages)',
  'Run directly by the temple devasthanam — several named cottages and a basic guest house/dharamshala. Allotted first-come, first-served; there is currently no online booking system.',
  'approved'
),
(
  (select id from public.temples where name = 'Yadagirigutta Lakshmi Narasimha Temple'),
  'Yadadri (Yadagirigutta) Devasthanam Rooms, Dormitories and Cottages',
  null,
  'Sri Lakshmi Narasimha Swamy Devasthanam, Yadagirigutta',
  0,
  false,
  false,
  '₹100–₹1,200/night',
  'One of the larger devasthanam accommodation operations in this list — around 400 rooms/dormitories/cottages on the hill itself, plus a further 60-room choultry and 30 halls downhill.',
  'approved'
),
(
  (select id from public.temples where name = 'Kamakhya Temple'),
  'Kamakhya Debutter Guest House',
  null,
  'Immediately beside Kamakhya Temple, Nilachal Hill, Guwahati',
  0,
  false,
  false,
  '₹300–₹700/night depending on room size and season',
  '"Debutter" denotes temple-trust-owned property in this region — this guest house is run by the temple itself, distinct from the many independent lodges and homestays also on Nilachal Hill. Advance booking and photo ID are required.',
  'approved'
),
(
  (select id from public.temples where name = 'Ambaji Temple'),
  'Shri Arasuri Ambaji Mata Devasthan Trust Rooms',
  null,
  'Arasuri Ambaji Mata Devasthan Trust (SAAMDT), Ambaji',
  0,
  false,
  false,
  'Budget-priced',
  'Run directly by the temple trust; rooms are allotted on arrival at the counter rather than booked online, and photo ID is required.',
  'approved'
);

-- ── Native names for the new temples ────────────────────────────────────

update public.temples set native_name = 'திருப்பரங்குன்றம் முருகன் கோயில்' where name = 'Thiruparankundram Murugan Temple';
update public.temples set native_name = 'திருச்செந்தூர் முருகன் கோயில்' where name = 'Tiruchendur Murugan Temple';
update public.temples set native_name = 'சுவாமிமலை முருகன் கோயில்' where name = 'Swamimalai Murugan Temple';
update public.temples set native_name = 'பழமுதிர்சோலை முருகன் கோயில்' where name = 'Pazhamudircholai Murugan Temple';
update public.temples set native_name = 'కోదండరామ ఆలయం, వొంటిమిట్ట' where name = 'Kodandarama Temple, Vontimitta';
update public.temples set native_name = 'ವೈದ್ಯೇಶ್ವರ ದೇವಸ್ಥಾನ, ತಲಕಾಡು' where name = 'Vaidyeshwara Temple, Talakadu';
update public.temples set native_name = 'പറശ്ശിനിക്കടവ് മുത്തപ്പൻ ക്ഷേത്രം' where name = 'Parassinikadavu Muthappan Temple';
update public.temples set native_name = 'गलताजी मंदिर' where name = 'Galtaji Temple';
update public.temples set native_name = 'कालिका माता मंदिर, चित्तौड़गढ़' where name = 'Kalika Mata Temple, Chittorgarh Fort';
update public.temples set native_name = 'ज्योतिबा मंदिर' where name = 'Jyotiba Temple, Kolhapur';
update public.temples set native_name = 'കൊട്ടാരക്കര ഗണപതി ക്ഷേത്രം' where name = 'Kottarakkara Ganapathy Temple';
update public.temples set native_name = 'हनुमान गढ़ी मन्दिर' where name = 'Hanuman Garhi Temple';
update public.temples set native_name = 'কঙ্কালীতলা মন্দির' where name = 'Kankalitala Temple';
update public.temples set native_name = 'नर्मदा उद्गम मन्दिर' where name = 'Narmada Udgam Temple, Amarkantak';

-- ── Festivals ────────────────────────────────────────────────────────────

insert into public.temple_festivals (temple_id, name, month, secondary_month, notes) values
((select id from public.temples where name = 'Tiruchendur Murugan Temple'), 'Skanda Sashti', 10, 11, 'Commemorates the six-day battle in which Murugan defeated Surapadman.'),
((select id from public.temples where name = 'Thiruparankundram Murugan Temple'), 'Thaipusam', 1, 2, null),
((select id from public.temples where name = 'Kodandarama Temple, Vontimitta'), 'Sri Rama Navami', 3, 4, 'The state-sponsored Sita Rama Kalyanam is celebrated here.'),
((select id from public.temples where name = 'Vaidyeshwara Temple, Talakadu'), 'Panchalinga Darshana', 2, 3, 'A major pilgrimage held only once every 12 years, when the Kaveri''s water level allows five ancient lingas to be seen together.'),
((select id from public.temples where name = 'Parassinikadavu Muthappan Temple'), 'Puthari Thiruvappana', 12, 1, null),
((select id from public.temples where name = 'Jyotiba Temple, Kolhapur'), 'Chaitra Yatra', 3, 4, 'Held on Chaitra Purnima, with large processions and gulal (pink powder).'),
((select id from public.temples where name = 'Kottarakkara Ganapathy Temple'), 'Vinayaka Chaturthi', 8, 9, null),
((select id from public.temples where name = 'Kankalitala Temple'), 'Kali Puja', 10, 11, null),
((select id from public.temples where name = 'Narmada Udgam Temple, Amarkantak'), 'Narmada Jayanti', 2, 3, null);
