-- Ṛtam — a second verified batch of well-known temples toward wider coverage
--
-- Same discipline as migration 0021: every fact below was checked against
-- public sources (Wikipedia, temple-tourism sites, state tourism boards)
-- before writing, not pulled from memory alone. This batch was generated
-- from a structured data file rather than hand-written SQL, specifically
-- to rule out the column-count bug that broke migration 0021's first
-- attempt — the generator asserted every row's value count against the
-- column list before writing a single line of SQL.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Kapaleeshwarar Temple, Chennai', 'Kapaleeshwarar (Shiva) / Karpagambal', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore, Chennai', 13.0338, 80.2695, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Feb–Mar for the Panguni Peruvizha (Arubathimoovar) festival; Oct–Feb otherwise.', 'Originally built by the Pallavas in the 7th century near the present-day Santhome Church, destroyed during Portuguese colonisation in 1566, and rebuilt inland in its current form by the Vijayanagara rulers in the 16th century. Tradition holds Mylapore''s name comes from Parvati worshipping Shiva here in the form of a peahen (mayil) after being cursed for losing focus during a Himalayan penance; a separate tradition holds Brahma installed a linga here after Shiva removed one of his five heads.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Parthasarathy Temple, Chennai', 'Parthasarathy (Krishna)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Triplicane, Chennai', 13.0569, 80.2749, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; the temple is one of the 108 Divya Desams and sees steady visitors year-round.', 'Built by the Pallava king Narasimhavarman I in the 8th century, with a temple inscription dated 808 CE. Krishna is worshipped here as Parthasarathy, "charioteer of Partha (Arjuna)," in a rare nine-foot standing form with a moustache, carrying a conch but — by vow to stay unarmed in that role — no discus. One of the 108 Divya Desams, it is unusual for depicting Krishna alongside Rukmini, Balarama, Satyaki, Pradyumna, and Aniruddha together.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Murudeshwara Temple', 'Murudeshwara (Shiva)', 'Shaiva', array[]::text[], 'India', 'Karnataka', 'Uttara Kannada', 'Murudeshwar', 14.0938, 74.483, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb, cooler for visiting the coastal statue and gopuram.', 'Part of the same Atma Linga legend as Gokarna: tradition holds Ravana was tricked into setting Shiva''s Atma Linga down here, after which it fixed itself permanently to the ground, with fragments of its covering said to have landed at several sites including Murudeshwara. The temple is best known today for its 123-foot Shiva statue, one of the tallest in the world, and a 237-foot gopuram overlooking the Arabian Sea.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Hoysaleswara Temple, Halebidu', 'Hoysaleswara (Shiva)', 'Shaiva', array[]::text[], 'India', 'Karnataka', 'Hassan', 'Halebidu', 13.213, 75.995, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'Built from 1121 CE under the Hoysala king Vishnuvardhana, funded substantially by wealthy Shaiva citizens of the then-capital Dwarasamudra (Halebidu). Despite roughly 39 years of construction its towers were never finished, yet its soapstone walls carry some of the most intricate figural carving of any Indian temple. Inscribed as a UNESCO World Heritage Site in 2023 together with the Hoysala temples at Belur and Somanathapura.', 'Local/regional tradition', 'Hoysala', 12, 'approved'
),
(
  'Chennakeshava Temple, Belur', 'Chennakeshava (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Karnataka', 'Hassan', 'Belur', 13.1642, 75.8626, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Yagachi', 0.5, 'Oct–Feb.', 'Commissioned in 1117 CE by the Hoysala king Vishnuvardhana, traditionally said to mark both his military victory over the Cholas at Talakad and his own conversion to Sri Vaishnavism under Ramanujacharya''s influence. Construction continued over three generations, roughly a century, on the banks of the Yagachi river in what was then the Hoysala capital. Inscribed as a UNESCO World Heritage Site in 2023 alongside Halebidu and Somanathapura.', 'Local/regional tradition', 'Hoysala', 12, 'approved'
),
(
  'Modhera Sun Temple', 'Surya', 'Saura', array[]::text[], 'India', 'Gujarat', 'Mehsana', 'Modhera', 23.5866, 72.1316, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; the temple is aligned so the equinox sunrise lines up with the sanctum.', 'Built in 1026–27 CE by the Solanki king Bhima I, shortly after defending Gujarat from Mahmud of Ghazni''s raid on the Somnath temple — the Solankis, who traced their lineage to the sun god Surya, built it partly as a political statement of that dynasty''s own resilience. The complex is precisely oriented so that the sun at the equinoxes shines directly through the hall into the sanctum. A separate tradition holds Rama and Sita rested here on their return from Lanka, and the Bhavishya Purana ties the town''s name to a blind Brahmin, Modha, healed here by Surya''s grace.', 'Local/regional tradition, referencing the Bhavishya Purana', 'Maru-Gurjara', 11, 'approved'
),
(
  'Shani Shingnapur Temple', 'Shani', null, array[]::text[], 'India', 'Maharashtra', 'Ahmednagar', 'Shani Shingnapur', 19.6033, 74.7573, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; Saturdays (Shani''s day) and Amavasya draw the largest crowds.', 'Local tradition holds that centuries ago a large black stone washed up in a flooded stream near the village; when a shepherd struck it with a stick it bled, and Shani appeared in a villager''s dream identifying the stone as his own self-manifest (swayambhu) form, asking to be worshipped in the open, without any roof over him. The village became known for a still-observed custom of doorless homes and shops, in the belief that Shani himself protects the settlement from theft.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Vishnupad Temple, Gaya', 'Vishnu', 'Vaishnava', array[]::text[], 'India', 'Bihar', 'Gaya', 'Gaya', 24.7955, 85.0002, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Falgu', 0.2, 'Sep–Oct for Pitru Paksha, when pind daan rites peak; Oct–Feb otherwise.', 'Built in its present form in 1787 under the patronage of Maharani Ahilyabai Holkar, on a site with a documented history reaching back to the Gupta era. The temple''s sanctum holds a 40-cm footprint said to be Vishnu''s own, set into basalt rock. Tradition holds the demon Gayasura won a boon that anyone who saw him would attain moksha; Vishnu pinned him underground with his foot to stop this, leaving the footprint, and granted Gayasura''s request that people be able to free their ancestors through pind daan offered here — making Gaya one of the principal sites in India for that rite.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Sankat Mochan Hanuman Temple, Varanasi', 'Hanuman', 'Vaishnava', array[]::text[], 'India', 'Uttar Pradesh', 'Varanasi', 'Varanasi', 25.2822, 82.9922, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Assi', 0.3, 'Oct–Feb; Tuesdays and Saturdays (Hanuman''s traditional days) are especially busy.', 'Founded in the early 16th century by the saint-poet Tulsidas, author of the Ramcharitmanas, at the spot where he is said to have had a vision of Hanuman, who told him he would go on to see Rama himself. The current temple structure dates to 1900, built under Pandit Madan Mohan Malaviya. The name Sankat Mochan, "reliever of troubles," reflects Hanuman''s role here as remover of obstacles and hardship.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Tara Tarini Temple, Ganjam', 'Tara Tarini (Devi)', 'Shakta', array['Shakti Peetha'], 'India', 'Odisha', 'Ganjam', 'Purushottampur', 19.3667, 84.7833, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Rushikulya', 0.5, 'Mar–Apr for the four Tuesday fairs in the Odia month of Chaitra; otherwise Oct–Feb.', 'Set on the Kumari hills above the Rushikulya river, one of the four major Adi Shakti Peethas of Odisha, where tradition holds Sati''s breasts fell. A separate, more local tradition credits a Brahmin named Basu Praharaj with establishing the shrine after the goddess appeared in his dream. The site has long been associated with tantric worship alongside its Shakta tradition.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Ambalapuzha Sree Krishna Temple', 'Krishna', 'Vaishnava', array[]::text[], 'India', 'Kerala', 'Alappuzha', 'Ambalapuzha', 9.3833, 76.35, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; the temple''s own festival and the daily Palpayasam offering draw visitors year-round.', 'Built by the Chembakasserry ruler Devanarayana Thampuran between the 15th and 17th centuries, who is said to have dedicated his entire kingdom to Krishna and ruled afterward only as the deity''s regent. The temple is famous for Palpayasam, a milk-and-rice offering said to have originated when a sage — revealed to be Krishna himself — beat the king at chess using the classic doubling-grains-of-rice wager, and asked that payasam be offered daily until the debt was paid; it still is, centuries later. During Tipu Sultan''s raids in 1789, the deity from Guruvayur was kept here for safekeeping for three years.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Thrikkakara Vamanamoorthy Temple', 'Vamana (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Kerala', 'Ernakulam', 'Thrikkakara', 10.0333, 76.3167, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Aug–Sep for Onam, when the temple is at the centre of Kerala-wide celebrations.', 'The only temple in Kerala dedicated to Vamana, Vishnu''s dwarf avatar, with inscriptions on site dating from the 10th–13th centuries. Tradition holds this is where Vamana approached the generous asura king Mahabali and asked for three paces of land, then grew into his cosmic Trivikrama form, covering the earth and sky in two steps before Mahabali offered his own head for the third — after which Vishnu granted him an annual visit to his former kingdom, still celebrated every year as Onam.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Yaganti Uma Maheshwara Temple', 'Uma Maheshwara (Shiva-Parvati)', 'Shaiva', array[]::text[], 'India', 'Andhra Pradesh', 'Kurnool', 'Yaganti', 15.1667, 78.2833, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; Shivaratri is the busiest day.', 'Believed to date to around the 5th–6th centuries, with later additions credited to the Vijayanagara period. The temple is best known for its Nandi statue in the sanctum, whose stone is documented to slowly enlarge over time — by tradition, the 16th-century saint Potuluri Veera Brahmendra Swamy prophesied it would keep growing until it fills the shrine at the end of the Kali Yuga, at which point it will come alive.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Raja Rajeshwara Temple, Vemulawada', 'Rajarajeshwara (Shiva)', 'Shaiva', array[]::text[], 'India', 'Telangana', 'Rajanna Sircilla', 'Vemulawada', 18.4167, 78.8833, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Feb–Mar for Maha Shivaratri, when the temple draws over half a million pilgrims.', 'Built between the 11th and 12th centuries under a governor of the Kalyani Chalukyas, in what had earlier been the capital of the Vemulawada Chalukya dynasty (750–973 CE). Locally called Rajanna, the deity is enshrined alongside Raja Rajeshwari Devi and Siddhi Vinayaka. Tradition holds Shiva chose to make Vemulawada his home after residing at Kashi, Chidambaram, Srisailam, and Kedarnath, and that Indra worshipped here and bathed in the temple''s Dharma Gundam tank after defeating the demon Vritrasura.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Kodungallur Bhagavathy Temple', 'Bhadrakali', 'Shakta', array[]::text[], 'India', 'Kerala', 'Thrissur', 'Kodungallur', 10.2333, 76.2, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Mar–Apr for the Kodungallur Bharani festival.', 'Tradition traces the shrine to Parashurama, who is said to have established it to placate the goddess Bhadrakali after she, born from Shiva''s third eye, destroyed the demon Daruka. The temple''s annual Bharani festival is one of Kerala''s most distinctive, drawing large numbers of ecstatic oracles (velichappadu) in trance, alongside older rites once involving animal sacrifice that have been progressively phased out.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Sachiya Mata Temple, Osian', 'Sachiya Mata (Devi)', 'Shakta', array[]::text[], 'India', 'Rajasthan', 'Jodhpur', 'Osian', 26.7167, 72.9167, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb, avoiding the Thar desert heat.', 'With foundations reaching to the 8th century and its major surviving structure built up through the 12th, the temple is worshipped jointly by Hindus and Jains and is sometimes called the "Khajuraho of Rajasthan" for its finely carved archways. Tradition holds that the goddess was originally worshipped with animal sacrifice by local communities, a practice later replaced with purely sattvic (vegetarian) offerings under the influence of Jain monks, including the Jain teacher Ratnaprabhasuri.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Bhoga Nandeeshwara Temple, Nandi Hills', 'Bhoga Nandeeshwara (Shiva)', 'Shaiva', array[]::text[], 'India', 'Karnataka', 'Chikkaballapur', 'Nandi', 13.37, 77.68, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'Among the oldest temples in Karnataka, with its earliest inscriptions dating to around 806 CE under the Nolamba and Rashtrakuta dynasties, and later additions by the Gangas, Cholas, Hoysalas, and Vijayanagara rulers across roughly a thousand years. The complex holds two adjoining shrines, Arunachaleswara and Bhoga Nandeeshwara, traditionally understood to represent Shiva''s childhood and youth respectively, with a further Yoga Nandeeshwara shrine on the hilltop above representing his renunciation.', 'Local/regional tradition', 'Ganga, Chola, Hoysala and Vijayanagara-era additions', 9, 'approved'
),
(
  'Umananda Temple, Guwahati', 'Shiva (Bhasmachala/Umananda)', 'Shaiva', array[]::text[], 'India', 'Assam', 'Kamrup Metropolitan', 'Guwahati', 26.1889, 91.7453, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Brahmaputra', 0, 'Oct–Feb; the temple is on an island reached by ferry from the Guwahati bank.', 'Built in 1694 under the Ahom king Gadadhar Singha on what is often called the world''s smallest inhabited river island, in the middle of the Brahmaputra — largely destroyed in the 1897 Assam earthquake and later rebuilt by a local merchant. The site is also called Bhasmachala, "hill of ashes," from a tradition in the Kalika Purana that Shiva burned Kamadeva to ash here with his third eye after being disturbed mid-meditation; the temple''s name, Umananda, refers to the joy (ananda) Shiva is said to have created the island to give his wife Uma.', 'Local/regional tradition, referencing the Kalika Purana', null, null, 'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'கபாலீஸ்வரர் கோயில்' where name = 'Kapaleeshwarar Temple, Chennai';
update public.temples set native_name = 'பார்த்தசாரதி கோயில்' where name = 'Parthasarathy Temple, Chennai';
update public.temples set native_name = 'ಮುರುಡೇಶ್ವರ ದೇವಸ್ಥಾನ' where name = 'Murudeshwara Temple';
update public.temples set native_name = 'ಹೊಯ್ಸಳೇಶ್ವರ ದೇವಸ್ಥಾನ' where name = 'Hoysaleswara Temple, Halebidu';
update public.temples set native_name = 'ಚೆನ್ನಕೇಶವ ದೇವಸ್ಥಾನ' where name = 'Chennakeshava Temple, Belur';
update public.temples set native_name = 'મોઢેરા સૂર્ય મંદિર' where name = 'Modhera Sun Temple';
update public.temples set native_name = 'श्री शनि शिंगणापूर मंदिर' where name = 'Shani Shingnapur Temple';
update public.temples set native_name = 'विष्णुपद मन्दिर' where name = 'Vishnupad Temple, Gaya';
update public.temples set native_name = 'संकट मोचन हनुमान मन्दिर' where name = 'Sankat Mochan Hanuman Temple, Varanasi';
update public.temples set native_name = 'ତାରାତାରିଣୀ ମନ୍ଦିର' where name = 'Tara Tarini Temple, Ganjam';
update public.temples set native_name = 'അമ്പലപ്പുഴ ശ്രീകൃഷ്ണക്ഷേത്രം' where name = 'Ambalapuzha Sree Krishna Temple';
update public.temples set native_name = 'തൃക്കാക്കര വാമനമൂർത്തിക്ഷേത്രം' where name = 'Thrikkakara Vamanamoorthy Temple';
update public.temples set native_name = 'యాగంటి ఉమామహేశ్వర ఆలయం' where name = 'Yaganti Uma Maheshwara Temple';
update public.temples set native_name = 'వేములవాడ రాజరాజేశ్వర ఆలయం' where name = 'Raja Rajeshwara Temple, Vemulawada';
update public.temples set native_name = 'കൊടുങ്ങല്ലൂർ ഭഗവതി ക്ഷേത്രം' where name = 'Kodungallur Bhagavathy Temple';
update public.temples set native_name = 'सांचिया माता मंदिर' where name = 'Sachiya Mata Temple, Osian';
update public.temples set native_name = 'ಭೋಗ ನಂದೀಶ್ವರ ದೇವಸ್ಥಾನ' where name = 'Bhoga Nandeeshwara Temple, Nandi Hills';
update public.temples set native_name = 'ঊমানন্দ মন্দিৰ' where name = 'Umananda Temple, Guwahati';

-- ── Festivals ────────────────────────────────────────────────────────────

insert into public.temple_festivals (temple_id, name, month, secondary_month, notes) values
((select id from public.temples where name = 'Kapaleeshwarar Temple, Chennai'), 'Panguni Peruvizha (Arubathimoovar)', 3, 4, 'The temple''s major annual festival, with a procession of 63 Nayanars.'),
((select id from public.temples where name = 'Murudeshwara Temple'), 'Maha Shivaratri', 2, 3, null),
((select id from public.temples where name = 'Vishnupad Temple, Gaya'), 'Pitru Paksha', 9, 10, 'Pind daan for ancestors peaks here during this fortnight.'),
((select id from public.temples where name = 'Tara Tarini Temple, Ganjam'), 'Chaitra Tuesday Melas', 3, 4, 'Four Tuesday fairs through the Odia month of Chaitra.'),
((select id from public.temples where name = 'Thrikkakara Vamanamoorthy Temple'), 'Onam (Thiruvonam)', 8, 9, 'The epicentre of Kerala-wide Onam celebrations, marking Mahabali''s annual return.'),
((select id from public.temples where name = 'Yaganti Uma Maheshwara Temple'), 'Maha Shivaratri', 2, 3, null),
((select id from public.temples where name = 'Raja Rajeshwara Temple, Vemulawada'), 'Maha Shivaratri', 2, 3, 'Draws over half a million pilgrims.'),
((select id from public.temples where name = 'Kodungallur Bhagavathy Temple'), 'Kodungallur Bharani', 3, 4, 'One of Kerala''s most distinctive festivals, known for its trance-oracles.'),
((select id from public.temples where name = 'Shani Shingnapur Temple'), 'Shani Amavasya', 7, 8, 'Observed on every Amavasya (new moon) year-round, but especially significant during Shravan.');
