-- Ṛtam — a third verified batch of temples, filling remaining state gaps
--
-- Same discipline as migrations 0021/0022: every fact checked against
-- public sources before writing, generated from a structured data file so
-- column counts can't drift (same fix as 0021's first-attempt bug).
-- Covers gaps this directory still had: Uttarakhand's Chota Char Dham
-- (distinct from the pan-India Char Dham already tagged elsewhere),
-- Bihar, Chhattisgarh, and several more Shakti Peethas and Pancharama
-- Kshetras.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Gangotri Temple', 'Ganga (Devi)', 'Shakta', array[]::text[], 'India', 'Uttarakhand', 'Uttarkashi', 'Gangotri', 30.9993, 78.9411, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'May–Oct only — the temple closes for winter and the deity is moved to Mukhba village; Kedarnath and Badrinath close on a similar schedule.', 'One of the Chota Char Dham of Uttarakhand (alongside Yamunotri, Kedarnath and Badrinath), built by the Gurkha general Amar Singh Thapa in the early 19th century and later restored by Jaipur''s Maharaja Madho Singh II. Tradition holds King Bhagiratha''s long penance brought the Ganga down from the heavens, and that Shiva agreed to break her fall through his matted hair so the force wouldn''t devastate the earth — a separate tradition holds Rama and Hanuman both visited and worshipped Ganga here.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Yamunotri Temple', 'Yamuna (Devi)', 'Shakta', array[]::text[], 'India', 'Uttarakhand', 'Uttarkashi', 'Yamunotri', 31.01, 78.4642, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'May–Oct only — the temple closes for winter, on a similar schedule to Gangotri, Kedarnath and Badrinath.', 'One of the Chota Char Dham of Uttarakhand, at the source of the Yamuna near Banderpooch peak. The present temple dates to the 19th century. Tradition holds this was the hermitage of the sage Asit Muni, and that Hanuman cooled his tail here in the Yamuna''s waters after burning Lanka — Banderpooch ("monkey''s tail") takes its name from this. Yamuna is worshipped as the daughter of Surya and twin sister of Yama, and a bath in her waters here is traditionally held to protect against an untimely death.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Naimisharanya', 'Vishnu (Naimishnath)', 'Vaishnava', array[]::text[], 'India', 'Uttar Pradesh', 'Sitapur', 'Naimisharanya', 27.3333, 80.4667, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; Kartik Purnima draws especially large crowds for bathing at Chakratirtha.', 'Tradition holds this forest was chosen by Brahma himself as the most sacred place for meditation in the Kali Yuga, after his discus (chakra) came to rest here at what is now the Chakratirtha pond. It is held to be where sage Vyasa first arranged the Vedas and Puranas, and where Suta Goswami later narrated all eighteen Puranas to an assembly of 88,000 rishis — making it one of the most textually significant sites in the Puranic tradition, alongside its many shrines including a Shakti Peetha to Lalita Devi.', 'Local/regional tradition, referencing the Puranas', null, null, 'approved'
),
(
  'Mehandipur Balaji Temple', 'Balaji (Hanuman)', 'Vaishnava', array[]::text[], 'India', 'Rajasthan', 'Dausa', 'Mehandipur', 26.8833, 76.6667, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb, avoiding peak Rajasthan summer heat.', 'Tradition holds the temple''s Hanuman idol, worshipped here as Balaji ("child Hanuman"), manifested on its own in these Aravalli hills rather than being carved by any sculptor. The temple has become widely known specifically for rituals believed to relieve those affected by evil spirits or negative energies, drawing pilgrims from across North India seeking this kind of spiritual relief.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Kalika Mata Temple, Pavagadh', 'Kalika Mata (Devi)', 'Shakta', array['Shakti Peetha'], 'India', 'Gujarat', 'Panchmahal', 'Pavagadh', 22.4833, 73.5333, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Sep–Oct for Navaratri, when millions of devotees visit; a ropeway serves the hilltop temple year-round.', 'Set atop Pavagadh Hill within the Champaner-Pavagadh Archaeological Park, a UNESCO World Heritage Site. Tradition holds this is where Sati''s left breast (by some accounts, her right foot) fell, making it one of the Shakti Peethas. The site was originally a Jain shrine before Kalika Mata''s idol was installed in the 12th century, reportedly by sage Vishwamitra; she is worshipped here as Dakshina Kali through tantric forms of puja.', 'Local/regional tradition', 'Nagara, on a Jain-era hilltop complex', 11, 'approved'
),
(
  'Jogulamba Temple, Alampur', 'Jogulamba (Devi)', 'Shakta', array['Shakti Peetha'], 'India', 'Telangana', 'Jogulamba Gadwal', 'Alampur', 15.8833, 78.1167, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Tungabhadra', 0.5, 'Oct–Feb.', 'Set beside the Navabrahma group of ninth-century Shiva temples near the Tungabhadra-Krishna confluence, and counted as the fifth of the 18 Maha Shakti Peethas — tradition holds Sati''s upper teeth fell here. The original temple dates to the 6th century CE under the Badami Chalukyas. Jogulamba is depicted seated on a corpse with a scorpion, frog and lizard on her head, and is held to grant siddhi (spiritual attainment) in yoga.', 'Local/regional tradition', null, 6, 'approved'
),
(
  'Draksharamam Bhimeswara Temple', 'Bhimeswara (Shiva) / Manikyamba (Devi)', 'Shaiva', array['Pancharama Kshetra'], 'India', 'Andhra Pradesh', 'Konaseema', 'Draksharamam', 16.9333, 82.05, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Feb–Mar for Maha Shivaratri; otherwise Oct–Feb.', 'One of the five Pancharama Kshetras: tradition holds Shiva''s linga, worn at his throat, shattered into five pieces during the slaying of the demon Tarakasura, each piece consecrated at a different site, this being one. A separate tradition ties the site to Daksha''s yajna, at which Sati is said to have self-immolated — no formal yajna is performed here even now as a result. Inscriptions here reach back to the 11th century, with the site''s core traced to the 9th-10th century Eastern Chalukyas.', 'Local/regional tradition', null, 9, 'approved'
),
(
  'Amareswara Temple, Amaravati', 'Amareswara (Shiva)', 'Shaiva', array['Pancharama Kshetra'], 'India', 'Andhra Pradesh', 'Palnadu', 'Amaravati', 16.573, 80.358, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Krishna', 0.1, 'Feb–Mar for Maha Shivaratri; otherwise Oct–Feb.', 'Another of the five Pancharama Kshetras formed, by tradition, from the shattered fragments of Shiva''s throat-linga after Tarakasura''s slaying — this one held to have been installed by Indra himself. Unique among the Pancharamas for standing on the Krishna river rather than near the Godavari. The temple''s earliest inscription is dated 1129 CE, and it was substantially expanded in the 18th–19th centuries under the Chintapalli/Dharanikota ruler Vasireddy Venkatadri Naidu; its sanctum holds a 15-foot white marble linga.', 'Local/regional tradition', null, 12, 'approved'
),
(
  'Mundeshwari Devi Temple', 'Mundeshwari (Devi/Shiva)', 'Shakta', array[]::text[], 'India', 'Bihar', 'Kaimur', 'Kaura', 25.1167, 83.6333, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; Navaratri draws the largest crowds.', 'Dated by the Archaeological Survey of India to around 108 CE, and widely cited as among the oldest continuously used Hindu temples anywhere, unusual for its octagonal stone construction. Tradition holds Durga killed the demon Munda here, giving the goddess and the site their name. Worship later broadened to Shiva as well, centred on a four-faced (Chaturmukha) linga that remains the temple''s central image today.', 'Local/regional tradition', 'Early Nagara, octagonal plan', 2, 'approved'
),
(
  'Srikanteshwara Temple, Nanjangud', 'Srikanteshwara / Nanjundeshwara (Shiva)', 'Shaiva', array[]::text[], 'India', 'Karnataka', 'Mysuru', 'Nanjangud', 12.1167, 76.6833, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Kapila (Kabini)', 0.3, 'Feb–Mar for Maha Shivaratri; otherwise Oct–Feb.', 'Known as the "Dakshina Kashi" (Kashi of the South) for the sanctity of bathing in the Kapila river here. Tradition holds sage Gautama first installed a linga at the site; the temple grew from a small 9th-century Ganga-era shrine to its present scale under Vijayanagara patronage. The deity''s names, Nanjunda and Srikanteshwara, both refer to Shiva''s swallowing of the halahala poison during the churning of the ocean. A well-known 18th-century episode holds Tipu Sultan''s blinded elephant regained its sight after 48 days of temple rituals, after which he donated an emerald linga still preserved here.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Chengannur Mahadeva Temple', 'Mahadeva-Parvati (Shiva-Parvati)', 'Shaiva', array[]::text[], 'India', 'Kerala', 'Alappuzha', 'Chengannur', 9.3167, 76.6167, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Dec, though the temple''s Thripoot rite can fall in other months depending on the deity''s own cycle.', 'Believed to have been built over 1,500 years ago by the legendary architect Perunthachan, and unusual in Kerala for enshrining Shiva and Parvati as a married couple in one sanctum. Tradition holds this is where the couple, travelling to meet sage Agastya after their wedding, paused when Parvati menstruated — the basis for the temple''s distinctive Thripoot festival, during which the sanctum closes for several days each cycle and reopens with elaborate rites, a practice with few parallels outside Kamakhya.', 'Local/regional tradition', null, 6, 'approved'
),
(
  'Kudroli Gokarnanatheshwara Temple', 'Gokarnanatheshwara (Shiva)', 'Shaiva', array[]::text[], 'India', 'Karnataka', 'Dakshina Kannada', 'Mangaluru', 12.8833, 74.8333, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; the temple''s Navarathri Deepotsava (lamp festival) is a major draw.', 'Founded in 1912 by the social reformer Narayana Guru, who by tradition envisioned the temple in a dream, at a time when many communities were denied entry to existing temples. Guru''s teaching — "one caste, one religion, one God for all mankind" — shaped this and roughly a hundred other temples he founded across Kerala and coastal Karnataka to be open to every devotee regardless of caste. The deity, Shiva as Gokarnanatha, shares his form with the older pilgrimage site of Gokarna.', 'Local/regional tradition', null, 20, 'approved'
),
(
  'Mahamaya Devi Temple, Ratanpur', 'Mahamaya (Devi)', 'Shakta', array['Shakti Peetha'], 'India', 'Chhattisgarh', 'Bilaspur', 'Ratanpur', 22.2833, 82.1667, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Sep–Oct for Navaratri; otherwise Oct–Feb.', 'Built under the Kalachuri dynasty of Ratanpur in the 12th–13th centuries and counted among the 52 Shakti Peethas. Tradition holds King Ratnadeva was woken one night by a brilliant light and found the goddess Mahamaya holding court; she later appeared to him in a dream instructing him to move his capital to Ratanpur, promising him fame in return. The temple, originally dedicated to Mahakali, Mahalakshmi and Mahasaraswati together, was rebuilt in its present form devoted to Mahalakshmi and Mahasaraswati in 1492.', 'Local/regional tradition', 'Nagara', 12, 'approved'
),
(
  'Raghunath Mandir, Jammu', 'Raghunath (Rama)', 'Vaishnava', array[]::text[], 'India', 'Jammu and Kashmir', 'Jammu', 'Jammu', 32.73, 74.86, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; Ram Navami is the temple''s busiest day.', 'Believed to be the largest temple complex in North India, comprising seven shrines to different deities within one walled compound. Construction began in 1835 under Maharaja Gulab Singh, founder of the Dogra dynasty, and continued under his son Maharaja Ranbir Singh. Tradition holds Gulab Singh was guided to build it by the Rama-devotee ascetic Shri Ram Dass Bairagi, who had earlier predicted his rise to kingship, and that the site itself had long shown an unexplained, recurring flame suggestive of a sacred fire altar.', 'Local/regional tradition', null, 19, 'approved'
),
(
  'Vaitheeswaran Koil', 'Vaitheeswaran (Shiva) / Thaiyal Nayagi', 'Shaiva', array['Navagraha Sthalam'], 'India', 'Tamil Nadu', 'Mayiladuthurai', 'Vaitheeswaran Koil', 11.15, 79.6667, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; Tuesdays, associated with the planet Mars, are considered especially auspicious here.', 'Built roughly a thousand years ago and revered as a Paadal Petra Sthalam, sung by the 7th-century Nayanar saints. Shiva is worshipped here as Vaitheeswaran, "the healing god," with Parvati as Thaiyal Nayagi, "the mother who stitches wounds." Tradition holds this is where the planet Mars (Angaraka), afflicted with leprosy, was cured by the deity — making the temple one of the nine Navagraha shrines of Tamil Nadu, specifically associated with Mars. The temple is also closely tied to Nadi astrology, palm-leaf readings said to have been recorded here by ancient sages.', 'Local/regional tradition', null, null, 'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'गंगोत्री मन्दिर' where name = 'Gangotri Temple';
update public.temples set native_name = 'यमुनोत्री मन्दिर' where name = 'Yamunotri Temple';
update public.temples set native_name = 'नैमिषारण्य' where name = 'Naimisharanya';
update public.temples set native_name = 'मेहंदीपुर बालाजी मन्दिर' where name = 'Mehandipur Balaji Temple';
update public.temples set native_name = 'પાવાગઢ કાલિકા માતાનું મંદિર' where name = 'Kalika Mata Temple, Pavagadh';
update public.temples set native_name = 'జోగులాంబ ఆలయం' where name = 'Jogulamba Temple, Alampur';
update public.temples set native_name = 'ద్రాక్షారామ భీమేశ్వర ఆలయం' where name = 'Draksharamam Bhimeswara Temple';
update public.temples set native_name = 'అమరావతి అమరేశ్వర ఆలయం' where name = 'Amareswara Temple, Amaravati';
update public.temples set native_name = 'मुंडेश्वरी देवी मन्दिर' where name = 'Mundeshwari Devi Temple';
update public.temples set native_name = 'ಶ್ರೀಕಂಠೇಶ್ವರ ದೇವಸ್ಥಾನ' where name = 'Srikanteshwara Temple, Nanjangud';
update public.temples set native_name = 'ചെങ്ങന്നൂർ മഹാദേവക്ഷേത്രം' where name = 'Chengannur Mahadeva Temple';
update public.temples set native_name = 'ಕುದ್ರೋಳಿ ಗೋಕರ್ಣನಾಥೇಶ್ವರ ದೇವಸ್ಥಾನ' where name = 'Kudroli Gokarnanatheshwara Temple';
update public.temples set native_name = 'महामाया देवी मन्दिर' where name = 'Mahamaya Devi Temple, Ratanpur';
update public.temples set native_name = 'रघुनाथ मन्दिर' where name = 'Raghunath Mandir, Jammu';
update public.temples set native_name = 'வைத்தீஸ்வரன் கோயில்' where name = 'Vaitheeswaran Koil';

-- ── Festivals ────────────────────────────────────────────────────────────

insert into public.temple_festivals (temple_id, name, month, secondary_month, notes) values
((select id from public.temples where name = 'Gangotri Temple'), 'Akshaya Tritiya (opening day)', 4, 5, 'The temple opens for the season on this day each year, closing again around Diwali.'),
((select id from public.temples where name = 'Yamunotri Temple'), 'Akshaya Tritiya (opening day)', 4, 5, 'The temple opens for the season on this day each year, closing again around Diwali.'),
((select id from public.temples where name = 'Naimisharanya'), 'Kartik Purnima', 11, null, 'Large-scale bathing at Chakratirtha.'),
((select id from public.temples where name = 'Kalika Mata Temple, Pavagadh'), 'Navaratri', 9, 10, null),
((select id from public.temples where name = 'Draksharamam Bhimeswara Temple'), 'Maha Shivaratri', 2, 3, null),
((select id from public.temples where name = 'Amareswara Temple, Amaravati'), 'Maha Shivaratri', 2, 3, null),
((select id from public.temples where name = 'Mundeshwari Devi Temple'), 'Navaratri', 9, 10, null),
((select id from public.temples where name = 'Srikanteshwara Temple, Nanjangud'), 'Maha Shivaratri', 2, 3, null),
((select id from public.temples where name = 'Kudroli Gokarnanatheshwara Temple'), 'Navarathri Deepotsava', 9, 10, 'A large lamp festival during Navaratri.'),
((select id from public.temples where name = 'Mahamaya Devi Temple, Ratanpur'), 'Navaratri', 9, 10, null),
((select id from public.temples where name = 'Raghunath Mandir, Jammu'), 'Ram Navami', 3, 4, null);
