-- Ṛtam — a large batch of Chennai-metro-area temples submitted by a
-- contributor's friend as a hand-compiled local survey (distances given
-- from Vani Mahal, T. Nagar; ages as reported by the surveyor). Cross-
-- checked against the existing database first: only six names on the
-- original list already existed (Parthasarathy Temple/Triplicane,
-- Kapaleeshwarar Temple/Mylapore, Thiruthani Murugan Temple, and the
-- Shore Temple + Vadaranyeswarar Temple/Tiruvalangadu added in the
-- previous migration) — those are skipped here. Two list items gave no
-- temple name at all ("Perumal Temple... close to" the Selaiyur Abirami
-- temple, and an unnamed "ancient Shivan Temple" by the Thiruvallur
-- Veeraraghava Perumal tank) and are omitted rather than invented.
--
-- Coordinates are neighbourhood-level approximations (Chennai's suburbs
-- have shifted between districts repeatedly in recent reorganisations,
-- so district assignment here is best-effort). Historical claims mostly
-- reflect the surveyor's stated ages plus well-attested general context;
-- deity identification follows standard Tamil temple-naming convention
-- (-eeswarar/-eswarar = Shiva, Perumal/Narasimhar/Krishnan = Vishnu,
-- Amman/Ambal = Devi, Murugan = Skanda, Anjaneyar = Hanuman).

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values

-- ── T. Nagar / Mahalingapuram / Nungambakkam ────────────────────────────
(
  'Agasthyar Temple, T. Nagar', 'Agastya (Rishi)', 'Smartha', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'T. Nagar', 13.0418, 80.2341, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'A comparatively young neighbourhood shrine, reported to be about 75 years old, dedicated to the sage Agastya, revered in Tamil tradition as the codifier of Siddha medicine and Tamil grammar.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Shiva Vishnu Temple, T. Nagar', 'Shiva and Vishnu', 'Smartha', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'T. Nagar', 13.0415, 80.2335, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Built in 1935, a joint Shiva-Vishnu shrine in the heart of T. Nagar, in the smarta tradition of housing both deities under one roof.', 'Contributor-submitted local survey', null, 20, 'approved'
),
(
  'Raghavendra Swamy Temple, T. Nagar', 'Raghavendra Swamy (Guru)', 'Madhva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'T. Nagar', 13.0430, 80.2325, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'A 1987-built shrine to the 17th-century Madhva saint Sri Raghavendra Swamy, whose brindavana (living-samadhi shrine) at Mantralayam is the tradition''s primary pilgrimage site; this is a local satellite shrine roughly 8 minutes from Vani Mahal.', 'Contributor-submitted local survey', null, 20, 'approved'
),
(
  'Sharadhamba Temple, T. Nagar', 'Sharadhamba (Saraswati)', 'Smartha', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'T. Nagar', 13.0405, 80.2380, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Nov, around Navaratri/Vasant Panchami.', 'A Saraswati shrine on Venkatanarayana Road, T. Nagar — one of two Sharadhamba temples on this list within about a kilometre of each other, this one and the Kripa Shankari Street shrine in neighbouring West Mambalam.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Muppathamman Temple, T. Nagar', 'Muppathamman (Devi)', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'T. Nagar', 13.0398, 80.2352, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Apr–May, around the Panguni festival season.', 'A village-guardian Amman shrine on Giri Road near Panagal Park, T. Nagar — the kind of local grama devata temple that predates the neighbourhood''s development into a commercial district.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Iyappan Temple, Mahalingapuram', 'Ayyappan (Dharma Sasta)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Mahalingapuram', 13.0480, 80.2350, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Jan, the Mandala/Makaravilakku season.', 'Built in 1974, a neighbourhood Ayyappan shrine roughly 10 minutes from Vani Mahal.', 'Contributor-submitted local survey', null, 20, 'approved'
),
(
  'Mahalingapuram Mahalingaswamy Temple', 'Mahalingaswamy (Shiva) / Sundarambigai', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Mahalingapuram', 13.0485, 80.2345, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Built as a modelled replica of the celebrated Mahalingaswamy Temple of Thiruvidaimaruthur (Thanjavur district), on the main road of the Chennai neighbourhood it gave its name to.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Agatheeswarar Temple, Nungambakkam', 'Agatheeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Nungambakkam', 13.0567, 80.2426, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be over 500 years old, a Shiva shrine that predates Nungambakkam''s growth into a commercial district, roughly 10 minutes from Vani Mahal.', 'Contributor-submitted local survey', null, null, 'approved'
),

-- ── West Mambalam / Teynampet / Kodambakkam / Vadapalani / Saidapet ─────
(
  'Angala Parameswari Temple, West Mambalam', 'Angala Parameswari (Devi)', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'West Mambalam', 13.0375, 80.2205, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Built in 1978, a shrine to the fierce village-guardian form of Devi worshipped widely across Tamil Nadu as Angala Parameswari, roughly 10 minutes from Vani Mahal.', 'Contributor-submitted local survey', null, 20, 'approved'
),
(
  'Kasi Viswanathar Temple, West Mambalam', 'Kasi Viswanathar (Shiva) / Visalakshi', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'West Mambalam', 13.0360, 80.2210, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be around 400 years old, a Shiva shrine named for Varanasi''s Kashi Vishwanath, roughly 12 minutes from Vani Mahal.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Sharadhamba Temple, West Mambalam', 'Sharadhamba (Saraswati)', 'Smartha', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'West Mambalam', 13.0355, 80.2185, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Nov, around Navaratri/Vasant Panchami.', 'A Saraswati shrine on Kripa Shankari Street, West Mambalam, distinct from the similarly named Sharadhamba temple a short walk away on Venkatanarayana Road, T. Nagar.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Kolavizhi Amman Temple, Mylapore', 'Kolavizhi Amman (Devi)', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore', 13.0345, 80.2670, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'A roughly 1,000-year-old shrine near G. N. Chetty Road, opposite the Valeeswarar temple and east of the Mundaka Kanni Amman temple — both part of the Saptha Sthana Mylapore cluster — reportedly worshipped as the protective deity of Mylapore when it was still a village. Its poojas are conducted by non-Brahmin poojaris following agama procedure, a detail the local community takes particular pride in.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Mundaka Kanni Amman Temple, Mylapore', 'Mundaka Kanni Amman (Devi)', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore', 13.0342, 80.2680, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be about 1,300 years old, one of Mylapore''s older Amman shrines, standing near the Saptha Sthana Mylapore cluster of Shiva temples.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Adi Kesava Perumal Temple, Mylapore', 'Adi Kesava Perumal (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore', 13.0330, 80.2690, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Dated only loosely — likely 6th to 9th century — local tradition holds this Vishnu shrine as the original presiding deity of Mylapore before the legendary submergence that gave the neighbourhood its Kapaleeswarar-centred present form.', 'Contributor-submitted local survey; local/regional tradition', null, null, 'approved'
),
(
  'Sri Vedantha Desikar Devasthanam, Mylapore', 'Vedanta Desikar (Acharya)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore', 13.0332, 80.2688, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb, or around the Vedanta Desika Jayanti (Panguni).', 'On the same street as the Adi Kesava Perumal temple, this devasthanam to the 13th–14th-century philosopher-saint Vedanta Desika is regarded as the city''s foremost landmark of the Desika (Vadakalai) branch of Sri Vaishnavism.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Veerabhadra Swamy Temple, Mylapore', 'Veerabhadra (fierce form of Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore', 13.0325, 80.2660, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'An old shrine near the Madhava Perumal Temple, notable as one of the few Chennai temples to house a murti of Adi Shankaracharya.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Balasubramanya Swamy Temple, Teynampet', 'Balasubramanya (Murugan)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Teynampet', 13.0430, 80.2490, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Jan–Feb for Thaipusam; otherwise Nov–Feb.', 'Reported to be about 500 years old, a Murugan shrine in Teynampet that predates the neighbourhood''s modern commercial development.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Sri Bharadwajeswarar Temple, Kodambakkam', 'Bharadwajeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Kodambakkam', 13.0510, 80.2260, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Dated to roughly the 10th–11th century, named for the sage Bharadwaja, one of Kodambakkam''s older surviving Shiva shrines from before the area''s growth into a film-industry hub.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Vengeeswarar Temple, Vadapalani', 'Vengeeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Vadapalani', 13.0510, 80.2110, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'The sthalam is said to date to the Vedic age, though the present temple structure is reckoned at over 1,000 years old — among the oldest continuously worshipped sites in what is now Vadapalani.', 'Contributor-submitted local survey; local/regional tradition', null, null, 'approved'
),
(
  'Vadapalani Murugan Temple', 'Murugan (Andavar)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Vadapalani', 13.0503, 80.2121, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Jan–Feb for Thaipusam and Panguni Uthiram; otherwise Nov–Feb.', 'Reported to be around 125 years old, making it one of the newer major temples on this list — yet it has grown into one of Chennai''s most visited Murugan shrines, drawing huge crowds especially on Karthigai and Panguni Uthiram.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Adi Kesava Perumal Temple, West Mambalam', 'Adi Kesava Perumal (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'West Mambalam', 13.0350, 80.2195, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be over 1,000 years old and, per local tradition, visited by the Sri Vaishnava acharya Ramanuja — distinct from the similarly named Adi Kesava Perumal temple in nearby Mylapore.', 'Contributor-submitted local survey; local/regional tradition', null, null, 'approved'
),
(
  'Kothanda Ramar Temple, West Mambalam', 'Kothanda Ramar (Rama)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'West Mambalam', 13.0365, 80.2200, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb, or around Rama Navami.', 'Reported to be over a century old, a Rama shrine in West Mambalam depicting the "kothandam" (bow-wielding) form of the deity.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Sathyanarayana Temple, West Mambalam', 'Satyanarayana (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'West Mambalam', 13.0372, 80.2190, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb, or during a Satyanarayana Vratam.', 'A West Mambalam shrine to Satyanarayana with an especially strong local sampradaya connection, popular for the Satyanarayana Vratam observance.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Karaneeswarar Temple, Saidapet', 'Karaneeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Saidapet', 13.0210, 80.2230, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Adyar', 1, 'Nov–Feb.', 'Dated to around the 12th century — not to be confused with the similarly named Karaneeswarar shrine of the Saptha Sthana Mylapore cluster a few kilometres away, this is Saidapet''s own distinct old Shiva temple.', 'Contributor-submitted local survey', null, 12, 'approved'
),

-- ── Triplicane / Adyar / Besant Nagar / Tiruvanmiyur / Park Town / Parrys ─
(
  'Thiruvateeswarar Temple, Triplicane', 'Thiruvateeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Triplicane', 13.0605, 80.2795, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 1, 'Nov–Feb.', 'Dated only tentatively to around the 7th century, a Shiva temple in Triplicane near the far more famous Parthasarathy Perumal Divya Desam.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Sri Anantha Padmanabhaswami Temple, Adyar', 'Anantha Padmanabhaswami (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Adyar', 13.0080, 80.2545, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Adyar', 1, 'Nov–Feb.', 'Built in 1962, a Vishnu temple in Adyar named for the reclining Ananthasayana form also enshrined at Thiruvananthapuram''s Padmanabhaswamy Temple.', 'Contributor-submitted local survey', null, 20, 'approved'
),
(
  'Sri Rathnagiriswarar Temple, Besant Nagar', 'Rathnagiriswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Besant Nagar', 12.9990, 80.2660, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 1, 'Nov–Feb.', 'Built in 1975, a Shiva shrine in Besant Nagar not far from the neighbourhood''s much larger Ashtalakshmi temple.', 'Contributor-submitted local survey', null, 20, 'approved'
),
(
  'Sri Ashtalakshmi Temple, Besant Nagar', 'Ashta Lakshmi (the eight forms of Lakshmi)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Besant Nagar', 13.0004, 80.2721, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 0.2, 'Nov–Feb; the beachfront location makes cooler months markedly more comfortable.', 'Built in 1976 right on the Besant Nagar coastline, a multi-tiered temple enshrining all eight forms of Lakshmi (Adi, Dhana, Dhanya, Gaja, Santana, Veera, Vijaya, and Vidya Lakshmi) on ascending floors, one of Chennai''s most visited modern temples.', 'Contributor-submitted local survey', null, 20, 'approved'
),
(
  'Marundheeswarar Temple, Tiruvanmiyur', 'Marundheeswarar (Shiva) / Tripurasundari', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Tiruvanmiyur', 12.9822, 80.2593, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 1, 'Nov–Feb.', 'Reported to be around 1,300 years old, this Shiva temple''s name — "the lord of medicine" — comes from a tradition that the sage Valmiki was cured of an ailment here; it is glorified in the Tevaram hymns of the Nayanmar saints as one of the Padal Petra Sthalams.', 'Contributor-submitted local survey; local/regional tradition; Tevaram', null, null, 'approved'
),
(
  'Vallakottai Murugan Temple, Park Town', 'Murugan', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Park Town', 13.0950, 80.2840, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Cooum', 0.5, 'Jan–Feb for Thaipusam; otherwise Nov–Feb.', 'Reported to be over 1,000 years old, one of the older surviving temples in what is now Chennai''s Park Town district, predating most of the area''s colonial-era development.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Kalikambal Temple, Parrys Corner', 'Kalikambal (Devi) / Kamakshi Vinayakar', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Parrys Corner', 13.0940, 80.2897, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 0.8, 'Nov–Feb.', 'Built in 1678, predating British Fort St. George''s Parry''s Corner commercial district that grew up around it, one of the oldest surviving Amman temples in the old city.', 'Contributor-submitted local survey', null, 17, 'approved'
),

-- ── Nanganallur / Padi / Villivakkam / Koyambedu / Velachery / Pallikaranai / Medavakkam / Gowrivakkam / Thirumullaivoyal ─
(
  'Sri Anjaneyar Temple, Nanganallur', 'Anjaneyar (Hanuman)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Nanganallur', 12.9780, 80.1940, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb, or around Hanuman Jayanti.', 'Built in 1995, one of several 20th-century temples that grew up alongside Nanganallur''s development as a residential suburb.', 'Contributor-submitted local survey', null, 20, 'approved'
),
(
  'Lakshmi Narasimha Navaneetha Krishnan Temple, Nanganallur', 'Lakshmi Narasimha and Navaneetha Krishna (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Nanganallur', 12.9775, 80.1935, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Built in 1974, jointly enshrining the man-lion Narasimha and the butter-thief child-Krishna (Navaneetha Krishnan) forms of Vishnu.', 'Contributor-submitted local survey', null, 20, 'approved'
),
(
  'Thiru Mada Koil Varadaraja Perumal Temple, Nanganallur', 'Varadaraja Perumal (Vishnu) / Perundevi Thayar', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Nanganallur', 12.9790, 80.1950, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'A Varadaraja Perumal temple at MMTC Colony, 2nd Main Road, Nanganallur, also housing a "Madi Pillaiyar" Ganesha shrine.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Thiruvalithaayan Temple, Padi', 'Thiruvalithaayanathar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Padi', 13.0866, 80.1958, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be about 1,000 years old, one of the Padal Petra Sthalams glorified in the Tevaram hymns of the Nayanmar saints, in what is now the Padi suburb of Chennai.', 'Contributor-submitted local survey; Tevaram', null, null, 'approved'
),
(
  'Agatheeswarar Temple, Villivakkam', 'Agatheeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Villivakkam', 13.1080, 80.2090, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be 800 years old or more, distinct from the similarly named Agatheeswarar temple in Nungambakkam.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Sowmya Damodhara Perumal Temple, Villivakkam', 'Sowmya Damodharan (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Villivakkam', 13.1075, 80.2095, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be 800 years old or more, standing near the Agatheeswarar Shiva temple in Villivakkam.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Koyambedu Vaikundavasa Perumal Temple', 'Vaikundavasa Perumal (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Koyambedu', 13.0690, 80.1960, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be about 500 years old; local tradition holds this is where Sita stayed with the sage Valmiki during her pregnancy after being exiled from Ayodhya.', 'Contributor-submitted local survey; local/regional tradition', null, null, 'approved'
),
(
  'Kurungaleeswarar Temple, Koyambedu', 'Kurungaleeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Koyambedu', 13.0688, 80.1963, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Standing beside the Vaikundavasa Perumal temple in Koyambedu; local tradition holds that its Shiva linga was fashioned by Lava and Kusa, the twin sons of Rama and Sita, with their own hands.', 'Contributor-submitted local survey; local/regional tradition', null, null, 'approved'
),
(
  'Pidari Sellandi Amman Saptha Kannikai Temple, Velachery', 'Sellandi Amman and the Saptha Kannikai (seven virgin goddesses)', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Velachery', 12.9765, 80.2205, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Velachery Lake', 0.5, 'Nov–Feb.', 'Reported to be around 1,400 years old, one of three old temples clustered in Velachery within easy walking distance of each other and served by most buses passing through the area.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Dhandeeswarar Temple, Velachery', 'Dhandeeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Velachery', 12.9750, 80.2210, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Velachery Lake', 0.3, 'Nov–Feb.', 'Reported to be around 1,400 years old like its two Velachery neighbours, and has its own temple tank alongside the shrine.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Yoga Narasimhar Kovil, Velachery', 'Yoga Narasimha (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Velachery', 12.9740, 80.2215, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Velachery Lake', 0.4, 'Nov–Feb.', 'Reported to be around 1,400 years old, the third of Velachery''s three closely clustered old temples, enshrining the meditating (yoga) form of the man-lion Narasimha.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Sri Adhipureeshwarar Temple, Pallikaranai', 'Adhipureeshwarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Pallikaranai', 12.9370, 80.2000, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Pallikaranai Marsh', 1, 'Nov–Feb.', 'An old Shiva temple with its own tank, standing directly on Pallikaranai''s main road — distinct from the similarly named Aadhipureeswarar temple of Tiruvottiyur.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Mela Tirupathi Srinivasa Perumal Temple, Medavakkam', 'Srinivasa Perumal (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Medavakkam', 12.9210, 80.1890, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'A hillock-top Srinivasa Perumal shrine in Medavakkam whose name — "Tirupati of the west" — nods to the Tirumala hill temple it evokes.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Panchamuka Anjaneyar Temple, Gowrivakkam', 'Panchamukha Anjaneyar (five-faced Hanuman)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Gowrivakkam', 12.9050, 80.1680, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb, or around Hanuman Jayanti.', 'A Gowrivakkam shrine near the SIVET College campus, enshrining the five-faced (Narasimha, Garuda, Varaha, Hayagriva, and Hanuman-faced) form of Hanuman.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Masilamaniswara Temple, Thirumullaivoyal', 'Masilamaniswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Thirumullaivoyal', 13.1030, 80.1420, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be close to 1,000 years old, a Shiva temple in Thirumullaivoyal on Chennai''s northwestern edge.', 'Contributor-submitted local survey', null, null, 'approved'
),

-- ── Tiruvottiyur / Porur / Thiruverkadu / Mangadu / Kundrathur / Madambakkam ─
(
  'Vadivudai Amman Temple, Tiruvottiyur', 'Vadivudai Amman / Tripurasundari (Devi)', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Tiruvottiyur', 13.1613, 80.3006, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 1, 'Nov–Feb.', 'Reported to be over 2,000 years old, paired with the neighbouring Aadhipureeswarar Shiva temple as one of the oldest continuously worshipped sites in Chennai''s Tiruvottiyur suburb.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Aadhipureeswarar Temple, Tiruvottiyur', 'Aadhipureeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Tiruvottiyur', 13.1608, 80.3010, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 1, 'Nov–Feb.', 'Reported to be 1,000–2,000 years old, one of the Padal Petra Sthalams glorified in the Tevaram hymns of the Nayanmar saints, paired with the adjacent Vadivudai Amman shrine.', 'Contributor-submitted local survey; Tevaram', null, null, 'approved'
),
(
  'Sri Ramanatheeswarar Temple, Porur', 'Ramanatheeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Porur', 13.0380, 80.1580, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Porur Lake', 1, 'Nov–Feb.', 'Dated only tentatively to around the 11th century, a Shiva temple named for Rama''s worship of Shiva (Ramanatha), near Porur Lake.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Devi Karumariamman Temple, Thiruverkadu', 'Karumariamman (Devi)', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Chennai', 'Thiruverkadu', 13.0867, 80.1467, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Apr–May, around the annual Panguni festival, or Nov–Feb for a quieter visit.', 'Reported to be 500–1,000 years old, one of the most visited Amman temples in the Chennai region, drawing especially large crowds for its annual festival.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Kamakshi Amman Temple, Mangadu', 'Kamakshi (Devi)', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Mangadu', 13.0294, 80.1016, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be over 2,000 years old; local tradition holds this Kamakshi shrine at Mangadu as the site of Devi''s penance before her more famous form was installed at Kanchipuram, giving her the epithet here of "Bala Kamakshi" (the younger Kamakshi).', 'Contributor-submitted local survey; local/regional tradition', null, null, 'approved'
),
(
  'Kundrathur Murugan Temple', 'Murugan', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Kanchipuram', 'Kundrathur', 12.9791, 80.0899, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Jan–Feb for Thaipusam; otherwise Nov–Feb.', 'Reported to be around 250 years old, a hillock Murugan shrine at Kundrathur on Chennai''s southwestern edge.', 'Contributor-submitted local survey', null, 18, 'approved'
),
(
  'Thiru Ooragam Perumal Temple, Kundrathur', 'Thiru Ooragathan (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Kanchipuram', 'Kundrathur', 12.9800, 80.0905, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be 500–1,000 years old, a Vishnu temple at Kundrathur; note this is a separate shrine from the identically-named "Thiruooragam" Divya Desam (Sri Yathothkari Perumal Temple) near Kanchipuram.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Dhenupureeswarar Temple, Madambakkam', 'Dhenupureeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Madambakkam', 12.9186, 80.1354, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Dated by inscription to between 954 and 971 CE, a Chola-era Shiva temple at Madambakkam.', 'Contributor-submitted local survey; historical/epigraphical record', null, 10, 'approved'
),
(
  'Maha Meru Seshadri Swamigal Shrine, Madambakkam', 'Seshadri Swamigal and the eighteen Siddhas', 'Smartha', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Madambakkam', 12.9188, 80.1352, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Standing right beside the Dhenupureeswarar temple, a Maha Meru yantra shrine associated with the 19th-century Tiruvannamalai saint Seshadri Swamigal and the tradition of the eighteen Siddhas.', 'Contributor-submitted local survey', null, null, 'approved'
),

-- ── ECR / Thiruneermalai / Mahabalipuram / Chengalpattu / Thiruporur / Singaperumal Koil ─
(
  'Matsya Narayana Temple, ECR', 'Matsya (fish avatar of Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'ECR (Injambakkam)', 12.9300, 80.2470, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 0.5, 'Nov–Feb.', 'One of the newest temples on this list, built in 2011 along the East Coast Road, dedicated to Vishnu''s fish avatar.', 'Contributor-submitted local survey', null, 21, 'approved'
),
(
  'Puri Jagannath Temple, Kannathur, ECR', 'Jagannath (Krishna)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Kannathur', 12.8625, 80.2404, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 0.3, 'Nov–Feb.', 'Built in 2001 at Kannathur on the East Coast Road, modelled on the great Jagannath Temple of Puri, Odisha.', 'Contributor-submitted local survey', null, 21, 'approved'
),
(
  'Nithya Kalyana Perumal Temple, Thiruvidanthai', 'Nithya Kalyana Perumal (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Thiruvidanthai', 12.7938, 80.2348, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 0.5, 'Nov–Feb.', 'Reported to be about 1,000 years old, one of the 108 Divya Desams glorified by the Alvar poet-saints, standing on the East Coast Road; the deity''s name — "eternally auspicious for marriage" — draws couples seeking blessings for wedlock.', 'Contributor-submitted local survey; Nalayira Divya Prabandham', null, null, 'approved'
),
(
  'Neer Vanna Perumal Temple, Thiruneermalai', 'Neervannan (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Thiruneermalai', 12.9503, 80.1342, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be over 2,000 years old, one of the 108 Divya Desams, this hillock temple is unusual in enshrining Vishnu in all three postures — standing, seated, and reclining — across its different levels.', 'Contributor-submitted local survey; Nalayira Divya Prabandham', null, null, 'approved'
),
(
  'Sthalasayana Perumal Temple, Mahabalipuram', 'Sthalasayana Perumal (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Mahabalipuram', 12.6172, 80.1927, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 1, 'Nov–Feb.', 'Dated to around the 14th century, one of the 108 Divya Desams, standing inland from the more famous rock-cut monuments and Shore Temple of Mahabalipuram.', 'Contributor-submitted local survey; Nalayira Divya Prabandham', null, 14, 'approved'
),
(
  'Chettipunyam Hayagrivar Temple, Chengalpattu', 'Hayagriva (horse-headed Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Chengalpattu', 12.6920, 79.9770, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Palar', 3, 'Nov–Feb.', 'Reported to be over 400 years old, a temple to Hayagriva — the horse-headed form of Vishnu associated with knowledge and the recovery of the Vedas — near Chengalpattu.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Eri Katha Ramar Temple, Chengalpattu', 'Rama', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Chengalpattu', 12.6930, 79.9800, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be about 1,600 years old, its name ("Rama who protected the lake") reflecting a local legend of Rama shielding a nearby tank from breaching during floods — a legend echoed at a second, similarly named temple at Thirunindravur.', 'Contributor-submitted local survey; local/regional tradition', null, null, 'approved'
),
(
  'Thiruporur Murugan Temple', 'Murugan (Kandaswamy)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Thiruporur', 12.7318, 80.1889, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bay of Bengal', 5, 'Jan–Feb for Thaipusam; otherwise Nov–Feb.', 'Dated to around the 10th century, a well-known Murugan temple on the road between Chennai and Mahabalipuram.', 'Contributor-submitted local survey', null, 10, 'approved'
),
(
  'Padalathri Narasimhar Temple, Singaperumal Koil', 'Padalathri Narasimha (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Singaperumal Koil', 12.7902, 80.0246, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be over 1,500 years old, a hillock Narasimha shrine that gave the surrounding township, Singaperumal Koil, its name.', 'Contributor-submitted local survey', null, null, 'approved'
),

-- ── Tiruvallur town and its villages ─────────────────────────────────────
(
  'Sri Veeraraghava Perumal Temple, Thiruvallur', 'Veeraraghava Perumal (Vishnu) / Kanakavalli Thayar', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Tiruvallur', 13.1425, 79.9090, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Kosasthalaiyar', 1, 'Nov–Feb.', 'Dated to around the 8th century, one of the 108 Divya Desams, the principal Vishnu temple of Tiruvallur town, roughly 8 minutes'' drive from Thirumazhisai.', 'Contributor-submitted local survey; Nalayira Divya Prabandham', null, 8, 'approved'
),
(
  'Siruvapuri Sri Balasubrahmanyam Temple, Tiruvallur', 'Balasubramanya (Murugan)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Siruvapuri, Tiruvallur', 13.1350, 79.9150, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Jan–Feb for Thaipusam; otherwise Nov–Feb.', 'Reported to be around 500 years old, a Murugan shrine at Siruvapuri village near Tiruvallur.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Sri Ranganatha Perumal Temple, Tiruvallur', 'Ranganatha (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Tiruvallur', 13.1420, 79.9080, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be over 1,000 years old; the surveyed list did not give a precise locality within Tiruvallur beyond grouping it with the town''s other shrines, so this entry''s coordinates are only a town-centre approximation pending confirmation.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Putlur Amman Temple, Tiruvallur', 'Amman (Devi)', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Putlur, Tiruvallur', 13.1550, 79.9300, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be 500–1,000 years old, an Amman shrine at Putlur village, reachable via Putlur railway station.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Gnanapureeswarar Temple, Thiruvadisoolam', 'Gnanapureeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Thiruvadisoolam', 12.9186, 80.0405, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be 1,000–2,000 years old, a Shiva temple at Thiruvadisoolam.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Tirupacchur Vaccheeswarar Temple, Tiruvallur', 'Vaccheeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Tirupacchur, Tiruvallur', 13.1650, 79.8950, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be around 1,500 years old, a Shiva temple at Tirupacchur village near Tiruvallur.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Kakallur Veera Anjaneyar Temple, Tiruvallur', 'Veera Anjaneyar (Hanuman)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Kakallur, Tiruvallur', 13.1500, 79.9250, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb, or around Hanuman Jayanti.', 'A Hanuman shrine at Kakallur village, reachable by alighting at Putlur railway station and taking an auto-rickshaw the rest of the way.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Shiva Vishnu Temple, Poonga Nagar, Tiruvallur', 'Shiva and Vishnu', 'Smartha', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Poonga Nagar, Tiruvallur', 13.1470, 79.9120, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'A joint Shiva-Vishnu shrine in the Poonga Nagar residential locality of Tiruvallur town.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Pancha Mukha Anjaneyar Temple, NGO Colony, Tiruvallur', 'Panchamukha Anjaneyar (five-faced Hanuman)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'NGO Colony, Tiruvallur', 13.1400, 79.9050, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb, or around Hanuman Jayanti.', 'A five-faced Hanuman shrine in the NGO Colony locality of Tiruvallur town.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Angala Parameshwari Amman Temple, Putlur, Tiruvallur', 'Angala Parameswari (Devi)', 'Shakta', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Putlur, Tiruvallur', 13.1555, 79.9310, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'An Angala Parameswari shrine at Putlur village near Tiruvallur, distinct from the West Mambalam temple of the same dedication in Chennai proper.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Paathala Lingeshwarar Temple, Kakallur, Tiruvallur', 'Paathala Lingeshwarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Kakallur, Tiruvallur', 13.1505, 79.9260, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'A Shiva shrine at Kakallur village, its name referring to a linga said to extend below (patala, "netherworld") ground level.', 'Contributor-submitted local survey', null, null, 'approved'
),

-- ── Thirumazhisai / Poonamallee / Tirusulam / Chromepet / Selaiyur / Thirunindravur ─
(
  'Jagannatha Perumal Temple, Thirumazhisai', 'Jagannathan (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Thirumazhisai', 13.0797, 80.0611, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be about 1,000 years old, one of the 108 Divya Desams, and the birthplace of the Alvar poet-saint Thirumazhisai Alvar.', 'Contributor-submitted local survey; Nalayira Divya Prabandham', null, null, 'approved'
),
(
  'Vaideeswaran Temple, Poonamallee High Road', 'Vaidyeeswaran (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Poonamallee', 13.0500, 80.1000, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be about 1,000 years old, a Shiva shrine — "the physician-lord" — along the historic Poonamallee High Road.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Tirusoolanathar Tripurasundari Temple, Tirusulam', 'Tirusoolanathar (Shiva) / Tripurasundari', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Tirusulam', 12.9975, 80.1668, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'A Shiva-Shakti temple in Tirusulam, a suburb near Chennai airport, with inscriptions dating from the Pallava period.', 'Contributor-submitted local survey; historical/epigraphical record', null, null, 'approved'
),
(
  'Sri Abirami Ambal Samedha Amirdhakadeshwarar Temple, Selaiyur', 'Amirdhakadeshwarar (Shiva) / Abirami Ambal', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Selaiyur', 12.9080, 80.1440, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Reported to be about 250 years old, a Shiva-Devi temple in Selaiyur.', 'Contributor-submitted local survey', null, 18, 'approved'
),
(
  'Kumaran Kundram Murugan Temple, Chromepet', 'Murugan', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Chengalpattu', 'Chromepet', 12.9510, 80.1420, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Jan–Feb for Thaipusam; otherwise Nov–Feb.', 'A hillock Murugan temple ("kundram" meaning hill) in Chromepet.', 'Contributor-submitted local survey', null, null, 'approved'
),
(
  'Hridayaleeswarar Temple, Thirunindravur', 'Hridayaleeswarar (Shiva)', 'Shaiva', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Thirunindravur', 13.1073, 80.0483, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Built in the 6th century, this Shiva temple is famed as the site of the Nayanmar saint Poosalar''s legend: too poor to build a physical temple, he is said to have constructed one entirely in his mind and heart (hridaya) with such devotion that Shiva accepted it as complete — one of the best-loved Bhakti-movement stories in Tamil Shaivism.', 'Contributor-submitted local survey; Periya Puranam', null, 6, 'approved'
),
(
  'Bhakthavatsala Perumal Temple, Thirunindravur', 'Bhakthavatsala Perumal (Vishnu)', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Thirunindravur', 13.1078, 80.0478, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'One of the 108 Divya Desams, initially built by the Pallavas in the late 8th century, standing near the Hridayaleeswarar Shiva temple in Thirunindravur.', 'Contributor-submitted local survey; Nalayira Divya Prabandham; historical record', null, 8, 'approved'
),
(
  'Eri Katha Ramar Temple, Thirunindravur', 'Rama', 'Vaishnava', array[]::text[], 'India', 'Tamil Nadu', 'Tiruvallur', 'Thirunindravur', 13.1085, 80.0490, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Standing on the banks of the Thirunindravur lake — historically known as the Varuna Pushkarani — and largely overlooked by visitors to the town''s two better-known temples. Local tradition holds that when the lake once threatened to breach during heavy rain, villagers prayed to Rama, who raised a wall of arrows around it to hold back the water; in gratitude they built this temple and named the deity Eri Katha Ramar, "Rama who protected the lake" — the same legend, and name, attached to a separate temple at Chengalpattu.', 'Contributor-submitted local survey; local/regional tradition', null, null, 'approved'
);
