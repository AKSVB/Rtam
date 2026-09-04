-- Ṛtam — correct a location error + a verified batch of new temples
--
-- A contributor caught a real mistake: "Kanaka Mahalakshmi Temple,
-- Vijayawada" was wrong on the city — the temple is in Burujupeta,
-- Visakhapatnam, entirely distinct from Vijayawada's Kanaka Durga temple
-- that the previous migration's description confused it with. Fixed here
-- with facts checked against Wikipedia and other sources rather than
-- memory alone, which is also how every new temple below was researched
-- this time, specifically to avoid repeating that mistake.

-- ── Fix: Kanaka Mahalakshmi Temple is in Visakhapatnam, not Vijayawada ────

update public.temples set
  name = 'Kanaka Mahalakshmi Temple, Visakhapatnam',
  district = 'Visakhapatnam',
  town = 'Visakhapatnam (Burujupeta)',
  latitude = 17.7006,
  longitude = 83.2961,
  nearest_river_name = null,
  river_distance_km = null,
  sthala_purana = 'The swayambhu (self-manifest) idol here is depicted with one arm missing. Local tradition holds the goddess herself severed it as part of a vow, granting prosperity only to the worthy and deliberately withholding it from the ungrateful — an alternate telling holds the incomplete form instead symbolises that her abundance can never be fully contained or depicted. Devotees describe her as the presiding deity of Visakhapatnam. By local record, the idol was recovered from a well in 1912 and installed at a small roadside shrine, then relocated a short distance in 1917 during road-widening.',
  sthala_purana_source = 'Local/regional tradition'
where name = 'Kanaka Mahalakshmi Temple, Vijayawada';

-- ── New temples, each fact-checked against public sources ────────────────

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier,
  food_source_name, food_distance_km,
  nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source,
  status
) values
(
  'Chamundeshwari Temple, Mysore', 'Chamundeshwari (Durga)', 'Shakta', array['Shakti Peetha'], 'India',
  'Karnataka', 'Mysuru', 'Mysuru', 12.2724, 76.6702,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Sep–Oct for Mysore Dasara, when the city and temple are at their most festive; Oct–Feb otherwise.',
  'Set atop Chamundi Hill above the city, reached by a flight of 1,008 stone steps past a monolithic Nandi carved from a single block of granite. Tradition holds this is where the goddess slew the buffalo-demon Mahishasura, giving the city of Mysuru (from Mahishasura''s own city, Mahishuru) its name. The Wodeyar rulers of Mysore held Chamundeshwari as their family deity, and the temple was expanded considerably under their patronage.',
  'Local/regional tradition',
  'approved'
),
(
  'Kukke Subramanya Temple', 'Subramanya (Murugan)', 'Shaiva', array[]::text[], 'India',
  'Karnataka', 'Dakshina Kannada', 'Subrahmanya (Kukke)', 12.6167, 75.6167,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Dakshina (Kumaradhara)', 0.2,
  'Nov–Dec for Champa Shashti/Subramanya Shashti; otherwise Oct–Feb, avoiding the region''s heavy monsoon.',
  'Tradition holds this is one of the sites established by Parashurama, and the spot where the serpent-king Vasuki took refuge from Garuda; Subramanya is worshipped here as lord of all serpents. The temple is especially known for Sarpa Samskara and Ashlesha Bali rites performed for those believing themselves affected by sarpa dosha (astrological affliction linked to serpents).',
  'Local/regional tradition',
  'approved'
),
(
  'Horanadu Annapoorneshwari Temple', 'Annapoorneshwari (Parvati)', 'Shakta', array[]::text[], 'India',
  'Karnataka', 'Chikkamagaluru', 'Horanadu', 13.4667, 75.4667,
  'unknown', null, 'unknown', null, 'pure_veg_available',
  'Temple dining hall — free vegetarian meals served to every visitor regardless of faith or background', 0.0,
  'Bhadra', 0.2,
  'Oct–Feb, cooler and drier in these forested Western Ghats valleys.',
  'Tradition holds the sage Agastya first established worship of Annapoorneshwari here around the 8th century, with the present deity consecrated under the influence of Adi Shankaracharya. Worshipped as the goddess of food and nourishment — Annapoorneshwari literally means "she who is full of food" — the temple is known for feeding every pilgrim a full vegetarian meal without exception.',
  'Local/regional tradition',
  'approved'
),
(
  'Tulja Bhavani Temple, Tuljapur', 'Bhavani (Parvati)', 'Shakta', array['Shakti Peetha'], 'India',
  'Maharashtra', 'Dharashiv', 'Tuljapur', 18.0167, 76.0833,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Mandakini', 0.3,
  'Sep–Oct for Navaratri, the temple''s busiest period; otherwise Oct–Feb.',
  'Built in the 12th century under the Kadamb dynasty and counted among the 51 Shakti Peethas. Chhatrapati Shivaji Maharaj was a devoted worshipper of Tulja Bhavani; tradition holds the goddess granted him the sword he named Bhavani Talwar, and that he sought her blessing before his decisive encounter with Afzal Khan.',
  'Local/regional tradition',
  'approved'
),
(
  'Saptashrungi Devi Temple, Vani', 'Saptashrungi Nivasini (Durga)', 'Shakta', array['Shakti Peetha'], 'India',
  'Maharashtra', 'Nashik', 'Vani', 20.0333, 73.7833,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Sep–Oct for Navaratri; otherwise Oct–Feb for the climb up to the hillside shrine.',
  'Set into a cliff face amid seven surrounding peaks (sapta shrungi, "seven peaks"), from which the goddess takes her name. Counted among the three-and-a-half Shakti Peethas of Maharashtra, alongside Kolhapur''s Mahalakshmi, Tuljapur''s Bhavani, and Mahur''s Renuka. Tradition holds this is where Sati''s right arm fell, and separately that the goddess took form here as Durga to slay the demon Mahishasura.',
  'Local/regional tradition',
  'approved'
),
(
  'Khandoba Temple, Jejuri', 'Khandoba / Malhari Martand (Shiva)', 'Shaiva', array[]::text[], 'India',
  'Maharashtra', 'Pune', 'Jejuri', 18.2833, 74.1667,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Nov–Dec for Champa Shashti, Khandoba''s principal festival; otherwise Oct–Feb.',
  'A hilltop fort-like temple in the Hemadpanti style, reached by 200-250 stone steps. Khandoba, worshipped here as Malhari Martand, is held by tradition to be a form of Shiva who appeared to defeat the demons Mani and Malla — the name Malhari derives from his defeat of Malla. Long favoured by Maratha rulers and still the presiding deity of many farming and shepherding communities across Maharashtra and northern Karnataka.',
  'Local/regional tradition',
  'approved'
),
(
  'Vaikom Mahadeva Temple', 'Mahadeva (Shiva)', 'Shaiva', array[]::text[], 'India',
  'Kerala', 'Kottayam', 'Vaikom', 9.7500, 76.4000,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Nov–Dec for Vaikathashtami, the temple''s principal festival; otherwise Oct–Feb.',
  'Often called the "Kashi of the South," and traditionally held to have been established by Parashurama, with a Shiva linga believed by tradition to date to the Treta Yuga. Its sanctum is the only oval-shaped Sreekovil in any Kerala temple. Vaikathashtami commemorates the sage Vyaghrapada''s long penance, after which Shiva and Parvati are said to have appeared before him here.',
  'Local/regional tradition',
  'approved'
),
(
  'Ettumanoor Mahadeva Temple', 'Mahadeva (Shiva)', 'Shaiva', array[]::text[], 'India',
  'Kerala', 'Kottayam', 'Ettumanoor', 9.6833, 76.5500,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Feb–Mar around the temple''s Arattu festival; otherwise Oct–Feb.',
  'The present temple was rebuilt in 1542 CE. Tradition holds the demon Khara obtained three Shiva lingas from Shiva himself and consecrated them at three separate Kerala sites on the same day, this being one; the name Ettumanoor is locally explained as Shiva manifesting here in eight (ettu) forms. The temple is renowned for its Kerala mural paintings, above all a 16th-century fresco of Nataraja''s cosmic dance regarded as among the finest murals in India, and for the Ezhara Ponnana, seven-and-a-half gilded wooden elephant figures gifted by the Travancore king Marthanda Varma.',
  'Local/regional tradition',
  'approved'
),
(
  'Sree Vallabha Temple, Thiruvalla', 'Vallabha (Vishnu)', 'Vaishnava', array[]::text[], 'India',
  'Kerala', 'Pathanamthitta', 'Thiruvalla', 9.3833, 76.5667,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Feb–Mar for the temple''s annual festival; otherwise Oct–Feb.',
  'A roughly 400-year-old temple on the banks of the Manimala river, with the deity''s installation traditionally dated far earlier. Known for its 54-foot Garuda Sthambham, a flagstaff carved from a single block of granite, and unusual for being one of the very few temples anywhere that offers Kathakali as a regular nightly ritual to the deity, performed after the evening pooja.',
  'Local/regional tradition',
  'approved'
),
(
  'Panakala Narasimha Swamy Temple, Mangalagiri', 'Panakala Narasimha (Vishnu)', 'Vaishnava', array[]::text[], 'India',
  'Andhra Pradesh', 'Guntur', 'Mangalagiri', 16.4333, 80.5667,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Oct–Feb; the temple is one of the Ashta Mahakshetrams and receives steady visitors year-round.',
  'The swayambhu deity here appears only as an open mouth, set into the hillside, and is offered panakam — jaggery water with cardamom — of which tradition holds exactly half is accepted and the rest returns as prasadam. Local lore connects the offering to the hill itself once being a volcano, with the jaggery water said to pacify it. Tradition also holds the prince Hrasva Srungi, seeking to overcome a physical affliction, performed severe penance to Vishnu here for three years.',
  'Local/regional tradition',
  'approved'
),
(
  'Sri Kurmam Temple', 'Kurma (Vishnu)', 'Vaishnava', array[]::text[], 'India',
  'Andhra Pradesh', 'Srikakulam', 'Srikurmam', 18.6333, 84.0833,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Oct–Feb.',
  'The only temple in India where Vishnu is worshipped in his Kurma (tortoise) avatar, and one of the few Suyambu (self-manifest) Kurma shrines anywhere. Tradition holds the pious king Sweta Maharaja''s long penance drew Vishnu to appear here in this form, with Brahma himself consecrating the shrine; a later telling names king Swetha Chakravarti, guided by the sage Narada. The temple''s inscriptional history reaches back to the 11th–12th centuries, and it was restored under the Eastern Ganga king Anantavarman Chodaganga Deva.',
  'Local/regional tradition',
  'approved'
),
(
  'Swayambhu Ganapati Temple, Ganapatipule', 'Ganapati (Ganesha)', 'Ganapatya', array[]::text[], 'India',
  'Maharashtra', 'Ratnagiri', 'Ganapatipule', 17.1500, 73.2667,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Aug–Sep for Ganesh Chaturthi; Oct–Feb otherwise for the Konkan coast''s cooler, drier season.',
  'A roughly 400-year-old shrine on the Konkan coast built around a swayambhu (naturally emerged) Ganesha idol, said to face west toward the Arabian Sea as a guardian of the region — the temple is referred to in the Mudgala Purana as Paschim Dwarpalak, "guardian of the western gate." The dome over the deity was built up under Chhatrapati Shivaji Maharaj''s patronage and gilded during the Peshwa era.',
  'Local/regional tradition, referencing the Mudgala Purana',
  'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'ಶ್ರೀ ಚಾಮುಂಡೇಶ್ವರಿ ದೇವಸ್ಥಾನ' where name = 'Chamundeshwari Temple, Mysore';
update public.temples set native_name = 'ಕುಕ್ಕೆ ಸುಬ್ರಹ್ಮಣ್ಯ ದೇವಸ್ಥಾನ' where name = 'Kukke Subramanya Temple';
update public.temples set native_name = 'ಹೊರನಾಡು ಅನ್ನಪೂರ್ಣೇಶ್ವರಿ ದೇವಸ್ಥಾನ' where name = 'Horanadu Annapoorneshwari Temple';
update public.temples set native_name = 'श्री तुळजाभवानी मंदिर' where name = 'Tulja Bhavani Temple, Tuljapur';
update public.temples set native_name = 'श्री सप्तशृंगी देवी मंदिर' where name = 'Saptashrungi Devi Temple, Vani';
update public.temples set native_name = 'श्री खंडोबा मंदिर, जेजुरी' where name = 'Khandoba Temple, Jejuri';
update public.temples set native_name = 'गणपतीपुळे मंदिर' where name = 'Swayambhu Ganapati Temple, Ganapatipule';
update public.temples set native_name = 'വൈക്കം മഹാദേവക്ഷേത്രം' where name = 'Vaikom Mahadeva Temple';
update public.temples set native_name = 'ഏറ്റുമാനൂർ മഹാദേവക്ഷേത്രം' where name = 'Ettumanoor Mahadeva Temple';
update public.temples set native_name = 'തിരുവല്ല ശ്രീവല്ലഭക്ഷേത്രം' where name = 'Sree Vallabha Temple, Thiruvalla';
update public.temples set native_name = 'మంగళగిరి పానకాల నరసింహస్వామి ఆలయం' where name = 'Panakala Narasimha Swamy Temple, Mangalagiri';
update public.temples set native_name = 'శ్రీకూర్మం ఆలయం' where name = 'Sri Kurmam Temple';

-- ── Festivals ────────────────────────────────────────────────────────────

insert into public.temple_festivals (temple_id, name, month, secondary_month, notes) values
((select id from public.temples where name = 'Chamundeshwari Temple, Mysore'), 'Mysore Dasara', 9, 10, 'The temple and the whole city are lit up together for one of India''s best-known Dasara celebrations.'),
((select id from public.temples where name = 'Kukke Subramanya Temple'), 'Champa Shashti', 11, 12, 'Subramanya''s principal festival, marking his defeat of the demon Tarakasura.'),
((select id from public.temples where name = 'Tulja Bhavani Temple, Tuljapur'), 'Navaratri', 9, 10, null),
((select id from public.temples where name = 'Saptashrungi Devi Temple, Vani'), 'Navaratri', 9, 10, null),
((select id from public.temples where name = 'Khandoba Temple, Jejuri'), 'Champa Shashti', 11, 12, 'Khandoba''s principal festival, traditionally broken with a dish of roasted eggplant (vangyache bharit).'),
((select id from public.temples where name = 'Vaikom Mahadeva Temple'), 'Vaikathashtami', 11, 12, null),
((select id from public.temples where name = 'Ettumanoor Mahadeva Temple'), 'Arattu Festival', 2, 3, null),
((select id from public.temples where name = 'Sree Vallabha Temple, Thiruvalla'), 'Annual Utsavam', 2, 3, 'The first day traditionally includes an offering of some 12,000 bunches of bananas.'),
((select id from public.temples where name = 'Panakala Narasimha Swamy Temple, Mangalagiri'), 'Narasimha Jayanti', 4, 5, null),
((select id from public.temples where name = 'Swayambhu Ganapati Temple, Ganapatipule'), 'Ganesh Chaturthi', 8, 9, null);
