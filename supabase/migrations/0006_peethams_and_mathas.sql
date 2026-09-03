-- Ṛtam — Shankaracharya peethams, mathas, and other Vedic kshetras
--
-- Removes Akshardham (a modern Swaminarayan mandir, outside the Vedic
-- anushthanam focus of this directory) and adds the institutions that
-- actually anchor that tradition: the four Amnaya peethams established by
-- Adi Shankaracharya, the major Vaishnava and Madhwa mathas, and a few
-- kshetras of the same lineage.

delete from public.temples where name = 'Akshardham Temple, Delhi';

-- Sringeri is already seeded; tag it as the Southern Amnaya peetham.
update public.temples
set significance = array['Char Peetham']
where name = 'Sringeri Sharada Peetham';

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes, samidhadhanam_friendly, food_tier,
  nearest_river_name, river_distance_km, best_season_notes, sthala_purana, status
) values
(
  'Govardhana Peetham, Puri', 'Sharada / Jagannath', 'Smartha', array['Char Peetham'], 'India',
  'Odisha', 'Puri', 'Puri', 19.8095, 85.8318,
  'yes', 'The Bay of Bengal shore and the temple tanks are both within walking distance.', 'unknown', 'unknown',
  'Bay of Bengal', 1.0,
  'Oct–Feb. Sits beside the Jagannath temple, so the two are usually visited together.',
  'The eastern Amnaya peetham, established by Adi Shankaracharya and associated with the Rig Veda. Its mahavakya is Prajnanam Brahma — "consciousness is Brahman" — and its first acharya in the traditional account was Padmapada, one of Shankara''s four principal disciples.',
  'approved'
),
(
  'Dwaraka Sharada Peetham', 'Sharada (Saraswati)', 'Smartha', array['Char Peetham'], 'India',
  'Gujarat', 'Devbhoomi Dwarka', 'Dwarka', 22.2394, 68.9678,
  'yes', 'Gomti Ghat and the Arabian Sea shore are a short walk from the matha.', 'unknown', 'unknown',
  'Gomti (confluence with the Arabian Sea)', 0.4,
  'Oct–Mar. Easily combined with the Dwarkadhish temple and Nageshwar Jyotirlinga.',
  'The western Amnaya peetham, associated with the Sama Veda. Its mahavakya is Tattvamasi — "thou art that" — and it is traditionally held to have been entrusted by Adi Shankaracharya to his disciple Hastamalaka.',
  'approved'
),
(
  'Jyotirmath (Badari Peetham), Joshimath', 'Purna-giri / Narayana', 'Smartha', array['Char Peetham'], 'India',
  'Uttarakhand', 'Chamoli', 'Joshimath', 30.5560, 79.5646,
  'yes', 'The Alaknanda flows below the town, on the pilgrim route to Badrinath.', 'unknown', 'unknown',
  'Alaknanda', 2.0,
  'May–Oct. Joshimath is the wintering seat for the Badrinath deity once the shrine closes for the season.',
  'The northern Amnaya peetham, associated with the Atharva Veda. Its mahavakya is Ayamatma Brahma — "this Self is Brahman". Tradition holds that Adi Shankaracharya attained realisation here beneath a mulberry tree, and appointed his disciple Totakacharya to the seat.',
  'approved'
),
(
  'Kanchi Kamakoti Peetham', 'Chandramouleeswara / Kamakshi', 'Smartha', array[]::text[], 'India',
  'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.8397, 79.7050,
  'unknown', null, 'unknown', 'unknown',
  'Vegavathy', 1.0,
  'Nov–Feb. Walkable from both the Kamakshi Amman and Ekambareswarar temples.',
  'A Smartha matha at Kanchipuram, held by its own tradition to have been established by Adi Shankaracharya as a fifth seat, though it is not counted among the four Amnaya peethams in every account. It has long been a centre of Sri Vidya upasana and Vedic scholarship in the Tamil country.',
  'approved'
),
(
  'Sri Raghavendra Swamy Matha, Mantralayam', 'Sri Raghavendra Swamy', 'Madhwa', array[]::text[], 'India',
  'Andhra Pradesh', 'Kurnool', 'Mantralayam', 15.9410, 77.5330,
  'yes', 'The Tungabhadra runs alongside the matha, with steps down to the water.', 'unknown', 'unknown',
  'Tungabhadra', 0.2,
  'Oct–Feb. The Aradhana Mahotsava (Jul/Aug) draws very large crowds.',
  'The brindavana of Sri Raghavendra Tirtha, the seventeenth-century Madhwa saint and Dvaita scholar, who by tradition entered live samadhi here in 1671. The matha remains one of the principal centres of the Madhwa sampradaya.',
  'approved'
),
(
  'Ahobilam Narasimha Temple', 'Narasimha', 'Vaishnava', array[]::text[], 'India',
  'Andhra Pradesh', 'Nandyal', 'Ahobilam', 15.1333, 78.7167,
  'unknown', null, 'unknown', 'unknown',
  'Bhavanasini', 0.5,
  'Oct–Feb. The nine shrines are spread across forested hills; the upper ones need a hike.',
  'The kshetra of the nine forms of Narasimha (Nava Narasimha), held to be the place where Vishnu took the man-lion avatara and slew Hiranyakashipu. It is also the seat of the Ahobila Matha of the Sri Vaishnava sampradaya.',
  'approved'
),
(
  'Cheluvanarayana Swamy Temple, Melkote', 'Cheluvanarayana (Vishnu)', 'Vaishnava', array[]::text[], 'India',
  'Karnataka', 'Mandya', 'Melkote', 12.6614, 76.6497,
  'yes', 'The Kalyani temple tank sits within the complex.', 'unknown', 'unknown',
  'Kalyani (temple tank)', 0.1,
  'Oct–Feb. Vairamudi Brahmotsavam (Mar/Apr) is the largest festival.',
  'A hill kshetra closely associated with Ramanujacharya, who is said to have lived here for over a decade and reorganised its worship. It remains a major centre of the Sri Vaishnava tradition and of Sanskrit learning.',
  'approved'
),
(
  'Varadaraja Perumal Temple, Kanchipuram', 'Varadaraja (Vishnu)', 'Vaishnava', array[]::text[], 'India',
  'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.8194, 79.7300,
  'unknown', null, 'unknown', 'unknown',
  'Vegavathy', 1.5,
  'Nov–Feb. One of the 108 Divya Desams, and among the most important Vishnu temples in the Tamil country.',
  'Tradition holds that Brahma performed an ashvamedha yajna here, from whose sacrificial fire Vishnu appeared as Varadaraja, "the boon-granting king". Ramanujacharya is associated with this temple in his early years.',
  'approved'
),
(
  'Adi Shankara Janma Bhoomi Kshetram, Kalady', 'Adi Shankaracharya / Sharada', 'Smartha', array[]::text[], 'India',
  'Kerala', 'Ernakulam', 'Kalady', 10.1739, 76.4383,
  'yes', 'The Periyar river runs beside the kshetram, with bathing steps.', 'unknown', 'unknown',
  'Periyar', 0.1,
  'Oct–Feb. Quiet outside Shankara Jayanti (Apr/May).',
  'The birthplace of Adi Shankaracharya. The name Kalady is traditionally traced to the account of the Periyar changing its course to flow past his mother''s house so that she need not walk far to bathe.',
  'approved'
),
(
  'Simhachalam Varaha Narasimha Temple', 'Varaha Narasimha', 'Vaishnava', array[]::text[], 'India',
  'Andhra Pradesh', 'Visakhapatnam', 'Simhachalam', 17.7665, 83.2508,
  'unknown', null, 'unknown', 'unknown',
  null, null,
  'Oct–Feb. The deity is kept covered in sandal paste year-round except on Akshaya Tritiya.',
  'The deity here combines the Varaha and Narasimha avataras, and is coated in sandalwood paste throughout the year. Only on Chandanotsavam (Akshaya Tritiya) is the paste removed and the original form shown, an event that draws very large crowds.',
  'approved'
);
