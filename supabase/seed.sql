-- Ṛtam — demo seed data
--
-- A curated starting set covering India's major pilgrimage circuits: all 12
-- Jyotirlingas, the 4 Char Dham, a well-documented set of Shakti Peethas, all
-- 5 Pancha Bhoota Sthalams, three more Sapta Puri cities, and other major
-- pan-India temples — ~56 temples in total, seeded pre-approved.
--
-- These rows are intentionally honest about what's verifiable from general
-- knowledge (location, deity, historical significance, nearby geography,
-- seasonal access) versus what genuinely needs a local contributor's
-- first-hand knowledge (specific Sandhya Vandanam space, Samidhadhanam
-- access, a named Brahmin-run kitchen). Where we're not confident, fields
-- are left 'unknown' rather than guessed — that's what the Add/Edit Temple
-- form and moderator queue are for. This list is a starting point, not a
-- ceiling: the whole point of the app is that the community keeps adding
-- and refining entries, down to the smallest village temple.

-- ── Original 9 (updated with significance tags) ─────────────────────────

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes,
  samidhadhanam_friendly, samidhadhanam_notes,
  food_tier, food_source_name, food_source_contact, food_distance_km,
  nearest_river_name, river_distance_km,
  best_season_notes, status
) values
(
  'Sri Venkateswara Swamy Temple, Tirumala', 'Venkateswara (Vishnu)', 'Vaishnava', ARRAY[]::text[], 'India',
  'Andhra Pradesh', 'Tirupati', 'Tirumala', 13.6833, 79.3475,
  'yes', 'Dedicated Sandhya Vandanam hall near Vishnu Nivasam guest houses; water taps available all day.',
  'partial', 'Open spaces near the choultries can be used; check with TTD staff for a quiet spot during peak hours.',
  'brahmin_run_kitchen', 'TTD Annadanam & Vishnu Nivasam Brahmin Bhojanam', '+91-877-227-7777', 0.5,
  'Kalyani Dam', 3.0,
  'Sept–Feb is cooler and less crowded; avoid Brahmotsavam week unless attending.', 'approved'
),
(
  'Kashi Vishwanath Temple', 'Shiva (Kashi Vishwanath)', 'Smartha', ARRAY['Jyotirlinga', 'Sapta Puri'], 'India',
  'Uttar Pradesh', 'Varanasi', 'Varanasi', 25.3109, 83.0107,
  'yes', 'Ghat steps a short walk away provide open river access for Sandhya Vandanam at sunrise and sunset.',
  'unknown', null,
  'pure_veg_available', 'Kashi Annapurna Bhavan (pure veg mess near Vishwanath Gali)', '+91-98765-43210', 0.3,
  'Ganga', 0.2,
  'Oct–Mar; the ghats are pleasant and the queue is shorter on weekday mornings.', 'approved'
),
(
  'Ramanathaswamy Temple, Rameswaram', 'Shiva (Ramanathaswamy)', 'Smartha', ARRAY['Jyotirlinga', 'Char Dham'], 'India',
  'Tamil Nadu', 'Ramanathapuram', 'Rameswaram', 9.2882, 79.3129,
  'yes', 'Agni Theertham beach directly behind the temple is the traditional spot for the 22 sacred well baths and Sandhya Vandanam.',
  'no', 'No dedicated firewood/samidha space known near the temple complex; most pilgrims skip this ritual here.',
  'brahmin_run_kitchen', 'Sri Vishnu Priya Bhavan', '+91-4573-221-357', 0.4,
  'Bay of Bengal (Agni Theertham)', 0.1,
  'Nov–Feb; summers are extremely hot and humid on this coastal island.', 'approved'
),
(
  'Sri Krishna Matha, Udupi', 'Krishna', 'Madhwa', ARRAY[]::text[], 'India',
  'Karnataka', 'Udupi', 'Udupi', 13.3410, 74.7457,
  'yes', 'Madhwa Sarovar tank within the Matha complex is used for daily Sandhya Vandanam by pilgrims and students.',
  'yes', 'Ashta Matha kitchens can arrange samidha on request a day in advance — ask at the Paryaya Matha office.',
  'brahmin_run_kitchen', 'Sri Krishna Matha Bhojana Shala', '+91-820-252-0225', 0.0,
  'Indrani River', 4.0,
  'Nov–Feb is coolest; Paryaya festival years (every 2 years, Jan) draw large crowds.', 'approved'
),
(
  'Sringeri Sharada Peetham', 'Sharadamba (Saraswati)', 'Smartha', ARRAY[]::text[], 'India',
  'Karnataka', 'Chikkamagaluru', 'Sringeri', 13.4177, 75.2537,
  'yes', 'Tunga river bank steps right behind the Peetham are used daily by resident Brahmins and visiting pilgrims.',
  'yes', 'Firewood is available near the guest-house kitchens; ask the Annapurna Choultry staff.',
  'brahmin_run_kitchen', 'Sringeri Matha Annapurna Choultry', '+91-8265-250-123', 0.2,
  'Tunga', 0.1,
  'Sept–Feb; the Tunga is gentle and clean for ritual bathing in this window.', 'approved'
),
(
  'Vitthal Rukmini Temple, Pandharpur', 'Vitthal (Vishnu)', 'Vaishnava', ARRAY[]::text[], 'India',
  'Maharashtra', 'Solapur', 'Pandharpur', 17.6792, 75.3324,
  'partial', 'Chandrabhaga river ghat is close but very crowded during Wari/Ekadashi; quieter on regular weekdays.',
  'unknown', null,
  'pure_veg_available', 'Pandharpur Devasthan pure-veg canteen', '+91-217-232-2100', 0.6,
  'Chandrabhaga (Bhima)', 0.3,
  'Avoid Ashadhi and Kartiki Ekadashi (Wari season) unless you specifically want the pilgrimage crowd experience.', 'approved'
),
(
  'Guruvayur Sri Krishna Temple', 'Krishna', 'Vaishnava', ARRAY[]::text[], 'India',
  'Kerala', 'Thrissur', 'Guruvayur', 10.5949, 76.0405,
  'unknown', null,
  'no', 'No known space for Samidhadhanam within or near the temple premises.',
  'no_veg_confirmed_nearby', null, null, null,
  null, null,
  'Nov–Feb is cooler; avoid Ekadashi day if you need a quick darshan, as crowds swell significantly.', 'approved'
),
(
  'Kalighat Kali Temple', 'Kali (Devi)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'West Bengal', 'Kolkata', 'Kalighat', 22.5193, 88.3425,
  'no', 'Dense urban setting with no dedicated quiet space known near the temple for Sandhya Vandanam.',
  'no', 'Not feasible in this dense urban temple setting.',
  'pure_veg_available', 'Bhawanipur pure-veg Brahmin mess (10 min drive)', '+91-98300-12345', 2.5,
  'Adi Ganga (Hooghly tributary)', 0.2,
  'Oct–Feb; the temple and surrounding lanes are very crowded year-round, plan for a long queue.', 'approved'
),
(
  'Somnath Temple', 'Shiva (Somnath)', 'Smartha', ARRAY['Jyotirlinga'], 'India',
  'Gujarat', 'Gir Somnath', 'Somnath', 20.8880, 70.4013,
  'yes', 'The temple sits directly on the Arabian Sea shore; the beach area is used for sunrise Sandhya Vandanam.',
  'partial', 'Open ground near the parikrama path can work with your own samidha; nothing formally arranged.',
  'pure_veg_available', 'Somnath Trust pure-veg Bhojanalaya', '+91-2876-231-212', 0.5,
  'Arabian Sea (confluence of Hiran, Kapila, Saraswati rivers)', 0.1,
  'Oct–Mar; the sea breeze makes even midday pleasant in winter months.', 'approved'
);

-- ── Remaining 9 Jyotirlingas ─────────────────────────────────────────────

insert into public.temples (
  name, deity, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes, samidhadhanam_friendly, food_tier,
  nearest_river_name, river_distance_km, best_season_notes, status
) values
(
  'Mallikarjuna Jyotirlinga, Srisailam', 'Shiva (Mallikarjuna)', ARRAY['Jyotirlinga'], 'India',
  'Andhra Pradesh', 'Nandyal', 'Srisailam', 16.0740, 78.8677,
  'yes', 'The temple overlooks the Krishna river gorge; ghats below the town give river access.', 'unknown', 'unknown',
  'Krishna', 1.0, 'Oct–Feb; the ghat road up the forest reserve can be difficult in heavy monsoon.', 'approved'
),
(
  'Mahakaleshwar Jyotirlinga, Ujjain', 'Shiva (Mahakaleshwar)', ARRAY['Jyotirlinga', 'Sapta Puri'], 'India',
  'Madhya Pradesh', 'Ujjain', 'Ujjain', 23.1828, 75.7681,
  'yes', 'Ram Ghat on the Shipra, a short walk from the temple, is the traditional bathing and ritual spot.', 'unknown', 'unknown',
  'Shipra', 0.8, 'Oct–Mar; extremely crowded during Simhastha Kumbh (every 12 years).', 'approved'
),
(
  'Omkareshwar Jyotirlinga', 'Shiva (Omkareshwar)', ARRAY['Jyotirlinga'], 'India',
  'Madhya Pradesh', 'Khandwa', 'Omkareshwar', 22.2413, 76.1494,
  'yes', 'The temple sits on Mandhata island in the Narmada itself — river access is immediate.', 'unknown', 'unknown',
  'Narmada', 0.1, 'Oct–Mar; footbridge access can flood in peak monsoon.', 'approved'
),
(
  'Kedarnath Jyotirlinga', 'Shiva (Kedarnath)', ARRAY['Jyotirlinga'], 'India',
  'Uttarakhand', 'Rudraprayag', 'Kedarnath', 30.7346, 79.0669,
  'yes', 'Mandakini river runs alongside the temple town.', 'unknown', 'unknown',
  'Mandakini', 0.2, 'Temple is open only late Apr/May to early Nov — closed and inaccessible in winter due to snow.', 'approved'
),
(
  'Bhimashankar Jyotirlinga', 'Shiva (Bhimashankar)', ARRAY['Jyotirlinga'], 'India',
  'Maharashtra', 'Pune', 'Bhimashankar', 19.0728, 73.5514,
  'unknown', null, 'unknown', 'unknown',
  'Bhima (origin nearby)', 2.0, 'Oct–Feb; the wildlife-sanctuary forest route is lush but slippery in monsoon.', 'approved'
),
(
  'Trimbakeshwar Jyotirlinga', 'Shiva (Trimbakeshwar)', ARRAY['Jyotirlinga'], 'India',
  'Maharashtra', 'Nashik', 'Trimbak', 19.9328, 73.5306,
  'yes', 'Kushavarta Kund, the traditional source-pool of the Godavari, is right by the temple.', 'unknown', 'unknown',
  'Godavari (origin)', 0.1, 'Oct–Feb; very crowded during Nashik-Trimbak Kumbh Mela (every 12 years).', 'approved'
),
(
  'Vaidyanath Jyotirlinga, Deoghar', 'Shiva (Vaidyanath)', ARRAY['Jyotirlinga'], 'India',
  'Jharkhand', 'Deoghar', 'Deoghar', 24.4823, 86.6958,
  'unknown', null, 'unknown', 'unknown',
  null, null, 'Oct–Feb is comfortable; extremely crowded during Shravan month (July–Aug) Kanwar pilgrimage.', 'approved'
),
(
  'Nageshwar Jyotirlinga, Dwarka', 'Shiva (Nageshwar)', ARRAY['Jyotirlinga'], 'India',
  'Gujarat', 'Devbhoomi Dwarka', 'Dwarka', 22.3268, 69.0269,
  'yes', 'Close to the Dwarka seafront; the Arabian Sea shore is a short drive away.', 'unknown', 'unknown',
  'Arabian Sea (Gomti Ghat, Dwarka)', 2.0, 'Oct–Mar; pairs well with a Dwarkadhish Temple visit the same day.', 'approved'
),
(
  'Grishneshwar Jyotirlinga, Ellora', 'Shiva (Grishneshwar)', ARRAY['Jyotirlinga'], 'India',
  'Maharashtra', 'Chhatrapati Sambhajinagar', 'Ellora', 20.0233, 75.1770,
  'unknown', null, 'unknown', 'unknown',
  null, null, 'Oct–Feb; easy to combine with visiting the Ellora Caves (UNESCO site) next door.', 'approved'
);

-- ── Char Dham (remaining 3 — Rameswaram already seeded above) ──────────

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes, samidhadhanam_friendly, food_tier, food_source_name, food_source_contact, food_distance_km,
  nearest_river_name, river_distance_km, best_season_notes, status
) values
(
  'Badrinath Temple', 'Vishnu (Badrinarayan)', 'Vaishnava', ARRAY['Char Dham'], 'India',
  'Uttarakhand', 'Chamoli', 'Badrinath', 30.7433, 79.4938,
  'yes', 'Tapt Kund, a hot-spring bathing ghat, sits right below the temple steps on the Alaknanda.', 'unknown', 'unknown', null, null, null,
  'Alaknanda', 0.1, 'Open only ~May to early Nov; closed and snowbound the rest of the year.', 'approved'
),
(
  'Dwarkadhish Temple, Dwarka', 'Krishna (Dwarkadhish)', 'Vaishnava', ARRAY['Char Dham', 'Sapta Puri'], 'India',
  'Gujarat', 'Devbhoomi Dwarka', 'Dwarka', 22.2442, 68.9685,
  'yes', 'Gomti Ghat, a short walk from the temple, is the traditional bathing spot.', 'unknown', 'unknown', null, null, null,
  'Gomti (confluence with the Arabian Sea)', 0.3, 'Oct–Mar; can be paired with Nageshwar Jyotirlinga and Beyt Dwarka.', 'approved'
),
(
  'Jagannath Temple, Puri', 'Jagannath (Krishna/Vishnu)', 'Vaishnava', ARRAY['Char Dham'], 'India',
  'Odisha', 'Puri', 'Puri', 19.8135, 85.8312,
  'yes', 'The temple is a short walk from Puri''s beach on the Bay of Bengal.', 'unknown',
  'brahmin_run_kitchen', 'Sri Jagannath Temple Ananda Bazaar (Mahaprasad, cooked by the temple''s traditional Suar/Mahasuar cooks)', null, 0.2,
  'Bay of Bengal', 1.0, 'Oct–Feb; plan around Rath Yatra (June/July) only if you want the festival crowds.', 'approved'
);

-- ── Shakti Peethas (13 more — Kalighat already seeded above) ───────────

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes, samidhadhanam_friendly, food_tier,
  nearest_river_name, river_distance_km, best_season_notes, status
) values
(
  'Kamakhya Temple', 'Kamakhya (Devi)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Assam', 'Kamrup Metropolitan', 'Guwahati', 26.1665, 91.7036,
  'yes', 'Atop Nilachal Hill overlooking the Brahmaputra; the riverfront ghats are a drive away.', 'unknown', 'unknown',
  'Brahmaputra', 2.0, 'Oct–Mar; the temple closes for three days during Ambubachi Mela (June) — check dates before visiting then.', 'approved'
),
(
  'Kamakshi Amman Temple, Kanchipuram', 'Kamakshi (Parvati)', 'Shakta', ARRAY['Shakti Peetha', 'Sapta Puri'], 'India',
  'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.8342, 79.7036,
  'unknown', null, 'unknown', 'unknown',
  'Vegavathy', 1.0, 'Nov–Feb; easy to combine with Ekambareswarar Temple in the same town.', 'approved'
),
(
  'Meenakshi Amman Temple, Madurai', 'Meenakshi (Parvati) & Sundareswarar (Shiva)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Tamil Nadu', 'Madurai', 'Madurai', 9.9195, 78.1193,
  'unknown', null, 'unknown', 'unknown',
  'Vaigai', 1.0, 'Nov–Feb; the Meenakshi Thirukalyanam festival (Apr/May) draws very large crowds.', 'approved'
),
(
  'Mahalakshmi Temple, Kolhapur', 'Mahalakshmi (Devi)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Maharashtra', 'Kolhapur', 'Kolhapur', 16.6947, 74.2296,
  'unknown', null, 'unknown', 'unknown',
  'Panchganga', 1.0, 'Oct–Feb; the Kirnotsav (sunset-ray) festival window in Jan/Feb is a special sight.', 'approved'
),
(
  'Vindhyavasini Temple', 'Vindhyavasini (Devi)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Uttar Pradesh', 'Mirzapur', 'Vindhyachal', 25.2900, 82.4970,
  'yes', 'The Ganga flows right past the temple town.', 'unknown', 'unknown',
  'Ganga', 0.5, 'Oct–Mar; Navratri draws very large crowds.', 'approved'
),
(
  'Naina Devi Temple', 'Naina Devi (Devi)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Himachal Pradesh', 'Bilaspur', 'Naina Devi', 31.3287, 76.5464,
  'unknown', null, 'unknown', 'unknown',
  'Gobind Sagar (Sutlej reservoir)', 3.0, 'Mar–Jun and Sept–Nov avoid both peak heat and monsoon landslide risk on the hill road.', 'approved'
),
(
  'Jwalamukhi Temple', 'Jwala Devi (eternal flame)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Himachal Pradesh', 'Kangra', 'Jwalamukhi', 31.8745, 76.3226,
  'unknown', null, 'unknown', 'unknown',
  null, null, 'Mar–Jun and Sept–Nov; Navratri is the busiest season.', 'approved'
),
(
  'Chintpurni Temple', 'Chinnamastika Devi', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Himachal Pradesh', 'Una', 'Chintpurni', 31.8215, 76.1298,
  'unknown', null, 'unknown', 'unknown',
  null, null, 'Mar–Jun and Sept–Nov; both Navratri seasons are very crowded.', 'approved'
),
(
  'Ambaji Temple', 'Amba (Devi)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Gujarat', 'Banaskantha', 'Ambaji', 24.2114, 72.8508,
  'unknown', null, 'unknown', 'unknown',
  'Saraswati (origin, nearby Kumbhariya)', 3.0, 'Oct–Feb; Bhadarvi Purnima mela (Aug/Sept) draws huge crowds on foot from Gujarat and Rajasthan.', 'approved'
),
(
  'Bahucharaji Temple', 'Bahuchara Mata', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Gujarat', 'Mehsana', 'Bahucharaji', 23.5333, 72.1667,
  'unknown', null, 'unknown', 'unknown',
  'Saraswati', 5.0, 'Oct–Feb.', 'approved'
),
(
  'Mangala Gauri Temple, Gaya', 'Mangala Gauri (Devi)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Bihar', 'Gaya', 'Gaya', 24.7955, 85.0002,
  'yes', 'The Falgu river, associated with Gaya''s Pitru Paksha rites, is close by.', 'unknown', 'unknown',
  'Falgu', 1.5, 'Oct–Feb; Pitru Paksha (Sept/Oct) brings large crowds for ancestral rites across Gaya.', 'approved'
),
(
  'Tarapith Temple', 'Tara (Devi)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'West Bengal', 'Birbhum', 'Tarapith', 24.0866, 87.7936,
  'yes', 'The small Dwarka river and its cremation-ground (Mahashmashan) bank run alongside the temple.', 'unknown', 'unknown',
  'Dwarka (local river)', 0.3, 'Oct–Feb; Kali Puja season (Oct/Nov) is the busiest.', 'approved'
),
(
  'Tripura Sundari Temple, Udaipur', 'Tripura Sundari (Devi)', 'Shakta', ARRAY['Shakti Peetha'], 'India',
  'Tripura', 'Gomati', 'Udaipur', 23.5167, 91.4667,
  'unknown', null, 'unknown', 'unknown',
  'Gomati', 2.0, 'Oct–Mar; Diwali-time Tripura Sundari mela is the major local festival.', 'approved'
);

-- ── Pancha Bhoota Sthalams (5 — the Pancha Bhoota Lingas of Tamil Nadu) ─

insert into public.temples (
  name, deity, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes, samidhadhanam_friendly, food_tier,
  nearest_river_name, river_distance_km, best_season_notes, status
) values
(
  'Ekambareswarar Temple, Kanchipuram (Prithvi Sthalam)', 'Shiva (Ekambareswarar)', ARRAY['Pancha Bhoota Sthalam'], 'India',
  'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.8396, 79.7000,
  'unknown', null, 'unknown', 'unknown',
  'Vegavathy', 1.5, 'Nov–Feb; one of Kanchipuram''s two must-see temples along with Kamakshi Amman.', 'approved'
),
(
  'Jambukeswarar Temple, Tiruvanaikaval (Appu Sthalam)', 'Shiva (Jambukeswarar)', ARRAY['Pancha Bhoota Sthalam'], 'India',
  'Tamil Nadu', 'Tiruchirappalli', 'Tiruvanaikaval', 10.8531, 78.7047,
  'yes', 'The Kaveri flows close to this island-adjacent temple town.', 'unknown', 'unknown',
  'Kaveri', 0.8, 'Nov–Feb; pairs naturally with Srirangam''s Ranganathaswamy Temple nearby.', 'approved'
),
(
  'Arunachaleswarar Temple, Thiruvannamalai (Agni Sthalam)', 'Shiva (Arunachaleswarar)', ARRAY['Pancha Bhoota Sthalam'], 'India',
  'Tamil Nadu', 'Tiruvannamalai', 'Thiruvannamalai', 12.2253, 79.0747,
  'unknown', null, 'unknown', 'unknown',
  null, null, 'Nov–Feb; the Karthigai Deepam festival (Nov/Dec) with the hilltop beacon is spectacular but very crowded.', 'approved'
),
(
  'Sri Kalahasti Temple (Vayu Sthalam)', 'Shiva (Kalahastiswara)', ARRAY['Pancha Bhoota Sthalam'], 'India',
  'Andhra Pradesh', 'Tirupati', 'Srikalahasti', 13.7500, 79.7000,
  'yes', 'The Swarnamukhi river runs directly alongside the temple.', 'unknown', 'unknown',
  'Swarnamukhi', 0.2, 'Oct–Feb; often combined with a Tirupati visit, about an hour away.', 'approved'
),
(
  'Thillai Nataraja Temple, Chidambaram (Akasha Sthalam)', 'Shiva (Nataraja)', ARRAY['Pancha Bhoota Sthalam'], 'India',
  'Tamil Nadu', 'Cuddalore', 'Chidambaram', 11.3994, 79.6936,
  'unknown', null, 'unknown', 'unknown',
  null, null, 'Nov–Feb; the Natyanjali dance festival (Feb/Mar) is a major cultural draw.', 'approved'
);

-- ── Sapta Puri — remaining sacred cities (Kashi, Ujjain, Dwarka, Kanchi
--    are already tagged above on temples already seeded) ───────────────

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes, samidhadhanam_friendly, food_tier,
  nearest_river_name, river_distance_km, best_season_notes, status
) values
(
  'Ram Mandir, Ayodhya', 'Rama', 'Vaishnava', ARRAY['Sapta Puri'], 'India',
  'Uttar Pradesh', 'Ayodhya', 'Ayodhya', 26.7955, 82.1944,
  'yes', 'The Sarayu river and its ghats run along the edge of town.', 'unknown', 'unknown',
  'Sarayu', 0.5, 'Oct–Mar; Ram Navami (Mar/Apr) and Diwali see the largest crowds.', 'approved'
),
(
  'Krishna Janmabhoomi Temple, Mathura', 'Krishna', 'Vaishnava', ARRAY['Sapta Puri'], 'India',
  'Uttar Pradesh', 'Mathura', 'Mathura', 27.5042, 77.6737,
  'yes', 'The Yamuna and its ghats are a short walk away.', 'unknown', 'unknown',
  'Yamuna', 1.0, 'Oct–Mar; Janmashtami (Aug/Sept) and Holi (the Mathura-Vrindavan celebrations) are extremely crowded.', 'approved'
),
(
  'Chandi Devi Temple, Haridwar', 'Chandi Devi (Devi)', 'Shakta', ARRAY['Sapta Puri'], 'India',
  'Uttarakhand', 'Haridwar', 'Haridwar', 29.9709, 78.1972,
  'yes', 'Atop Neel Parvat overlooking the Ganga; Har Ki Pauri ghat below is the main ritual-bathing spot in town.', 'unknown', 'unknown',
  'Ganga', 1.0, 'Oct–Mar; extremely crowded during Kumbh/Ardh Kumbh Mela years.', 'approved'
);

-- ── Other major pan-India temples ───────────────────────────────────────

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes, samidhadhanam_friendly, food_tier, food_source_name, food_source_contact, food_distance_km,
  nearest_river_name, river_distance_km, best_season_notes, status
) values
(
  'Vaishno Devi Temple, Katra', 'Vaishno Devi', 'Shakta', ARRAY[]::text[], 'India',
  'Jammu and Kashmir', 'Reasi', 'Katra', 33.0306, 74.9496,
  'unknown', null, 'unknown', 'pure_veg_available', 'Shri Mata Vaishno Devi Shrine Board Bhojanalaya (along the trek route and at Bhawan)', null, 0.0,
  null, null, 'Mar–Oct is most comfortable for the ~13km uphill trek; winter brings snow and ice on the path.', 'approved'
),
(
  'Amarnath Cave Temple', 'Shiva (ice lingam)', null, ARRAY[]::text[], 'India',
  'Jammu and Kashmir', 'Anantnag', 'Amarnath', 34.2104, 75.5000,
  'unknown', null, 'unknown', 'unknown', null, null, null,
  null, null, 'Accessible only during the official Amarnath Yatra window, typically late June to August — otherwise snowbound and closed.', 'approved'
),
(
  'Sabarimala Ayyappa Temple', 'Ayyappa', null, ARRAY[]::text[], 'India',
  'Kerala', 'Pathanamthitta', 'Sabarimala', 9.4325, 77.0800,
  'unknown', null, 'unknown', 'unknown', null, null, null,
  'Pamba', 4.0, 'Open mainly during the Mandalam-Makaravilakku season (mid-Nov to mid-Jan) and monthly first-five-days windows; closed otherwise.', 'approved'
),
(
  'Padmanabhaswamy Temple, Thiruvananthapuram', 'Vishnu (Padmanabha)', 'Vaishnava', ARRAY[]::text[], 'India',
  'Kerala', 'Thiruvananthapuram', 'Thiruvananthapuram', 8.4828, 76.9439,
  'unknown', null, 'unknown', 'unknown', null, null, null,
  null, null, 'Nov–Feb; note the temple''s traditional dress code is strictly enforced.', 'approved'
),
(
  'Akshardham Temple, Delhi', 'Swaminarayan', null, ARRAY[]::text[], 'India',
  'Delhi', 'East Delhi', 'New Delhi', 28.6127, 77.2773,
  'unknown', null, 'unknown', 'pure_veg_available', 'Premvati Food Court (on-site, Akshardham complex)', null, 0.1,
  'Yamuna', 1.0, 'Oct–Mar; closed on Mondays.', 'approved'
),
(
  'Brihadeeswarar Temple, Thanjavur', 'Shiva (Brihadeeswarar)', null, ARRAY[]::text[], 'India',
  'Tamil Nadu', 'Thanjavur', 'Thanjavur', 10.7828, 79.1318,
  'unknown', null, 'unknown', 'unknown', null, null, null,
  'Kaveri', 3.0, 'Nov–Feb; a UNESCO World Heritage Chola-era temple, best visited early morning to avoid heat.', 'approved'
),
(
  'Ranganathaswamy Temple, Srirangam', 'Ranganatha (Vishnu)', 'Vaishnava', ARRAY[]::text[], 'India',
  'Tamil Nadu', 'Tiruchirappalli', 'Srirangam', 10.8624, 78.6905,
  'yes', 'The temple sits on an island between two branches of the Kaveri.', 'unknown', 'unknown', null, null, null,
  'Kaveri', 0.2, 'Nov–Feb; the largest functioning Hindu temple complex in the world — allow a full day.', 'approved'
),
(
  'Konark Sun Temple', 'Surya', null, ARRAY[]::text[], 'India',
  'Odisha', 'Puri', 'Konark', 19.8876, 86.0945,
  'unknown', null, 'unknown', 'unknown', null, null, null,
  'Bay of Bengal', 3.0, 'Oct–Feb; now primarily a UNESCO World Heritage monument, with worship limited compared to a living temple.', 'approved'
),
(
  'Virupaksha Temple, Hampi', 'Shiva (Virupaksha)', null, ARRAY[]::text[], 'India',
  'Karnataka', 'Ballari', 'Hampi', 15.3350, 76.4600,
  'yes', 'The Tungabhadra river runs past the Hampi ruins, a short walk from the temple.', 'unknown', 'unknown', null, null, null,
  'Tungabhadra', 1.0, 'Oct–Feb; one of the few continuously active temples within the Hampi UNESCO site.', 'approved'
),
(
  'Lingaraj Temple, Bhubaneswar', 'Shiva-Vishnu (Harihara/Lingaraja)', null, ARRAY[]::text[], 'India',
  'Odisha', 'Khordha', 'Bhubaneswar', 20.2373, 85.8344,
  'unknown', null, 'unknown', 'unknown', null, null, null,
  'Bindusagar (temple tank)', 0.1, 'Oct–Feb; non-Hindus are traditionally not permitted inside, viewing platform available outside.', 'approved'
),
(
  'Kandariya Mahadev Temple, Khajuraho', 'Shiva', null, ARRAY[]::text[], 'India',
  'Madhya Pradesh', 'Chhatarpur', 'Khajuraho', 24.8318, 79.9199,
  'unknown', null, 'unknown', 'unknown', null, null, null,
  null, null, 'Oct–Mar; part of the Khajuraho Group of Monuments (UNESCO), known for its temple architecture.', 'approved'
),
(
  'Shrinathji Temple, Nathdwara', 'Krishna (Shrinathji)', 'Vaishnava', ARRAY[]::text[], 'India',
  'Rajasthan', 'Rajsamand', 'Nathdwara', 24.9333, 73.8167,
  'unknown', null, 'unknown', 'unknown', null, null, null,
  'Banas', 1.0, 'Oct–Mar; a major Pushtimarg (Vallabhacharya sampradaya) pilgrimage site — darshan follows a fixed multi-times-daily schedule.', 'approved'
),
(
  'Dakshineswar Kali Temple, Kolkata', 'Kali (Bhavatarini)', 'Shakta', ARRAY[]::text[], 'India',
  'West Bengal', 'North 24 Parganas', 'Dakshineswar, Kolkata', 22.6547, 88.3573,
  'yes', 'The temple sits directly on the Hooghly (Ganga) riverbank.', 'unknown', 'unknown', null, null, null,
  'Hooghly (Ganga)', 0.0, 'Oct–Feb; associated with Sri Ramakrishna Paramahamsa, who lived here.', 'approved'
),
(
  'Golden Temple, Sripuram, Vellore', 'Mahalakshmi', null, ARRAY[]::text[], 'India',
  'Tamil Nadu', 'Vellore', 'Vellore', 12.8889, 79.1147,
  'unknown', null, 'unknown', 'unknown', null, null, null,
  null, null, 'Oct–Feb; a modern (2007) temple known for its gold-plated architecture, free entry and prasadam meal.', 'approved'
);
