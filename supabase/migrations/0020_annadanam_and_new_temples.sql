-- Ṛtam — annadanam coverage + missing well-known temples
--
-- Two gaps: (1) food_tier/food_source_name were left 'unknown' on several
-- temples that are in fact well known for large-scale free annadanam —
-- reusing the existing food fields rather than adding new ones, since
-- that's exactly what they're for; and (2) several very well-known
-- temples named by a contributor were simply missing from the directory
-- entirely — Annavaram, Kanipakam, all eight Ashtavinayak temples, and
-- Kanaka Mahalakshmi, Vijayawada.
--
-- The annadanam updates are guarded (`and (food_tier is null or food_tier
-- = 'unknown')`) so this can never clobber a more specific answer a
-- contributor already gave — it only fills in temples still sitting at
-- the default.

-- ── Annadanam coverage for temples already in the directory ────────────────

update public.temples set
  food_tier = 'brahmin_run_kitchen',
  food_source_name = 'Sri Tarigonda Vengamamba Annaprasadam Complex (TTD) — free meals served to all pilgrims',
  food_distance_km = 0.5
where name = 'Sri Venkateswara Swamy Temple, Tirumala'
  and (food_tier is null or food_tier = 'unknown');

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Simhachalam Devasthanam annadanam hall — free meals served to pilgrims daily',
  food_distance_km = 0.0
where name = 'Simhachalam Varaha Narasimha Temple'
  and (food_tier is null or food_tier = 'unknown');

-- Checked live: this one was still sitting at 'no_veg_confirmed_nearby'
-- with no food_source_name/distance behind it — i.e. genuinely
-- unresearched, not a considered answer — despite Guruvayur's Oottupura
-- being one of the best-documented free temple kitchens in Kerala. Correcting
-- it outright rather than leaving the guard in place for this one.
update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Guruvayur Devaswom Oottupura (dining hall) — free meals served to pilgrims',
  food_distance_km = 0.2
where name = 'Guruvayur Sri Krishna Temple';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Annadanam mandapam near the temple — free meals for pilgrims on the trek route',
  food_distance_km = 0.5
where name = 'Sabarimala Ayyappa Temple'
  and (food_tier is null or food_tier = 'unknown');

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Sri Krishna Matha Bhojana Shala — one of India''s oldest continuously running free temple kitchens',
  food_distance_km = 0.0
where name = 'Sri Krishna Matha, Udupi'
  and (food_tier is null or food_tier = 'unknown');

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Free meals served to visitors on the Sripuram Golden Temple premises',
  food_distance_km = 0.3
where name = 'Golden Temple, Sripuram, Vellore'
  and (food_tier is null or food_tier = 'unknown');

-- ── Simhachalam: sthala purana + Giri Pradakshina ──────────────────────────
--
-- Checked live: sthala_purana already has a solid entry here (the
-- Varaha-Narasimha/sandal-paste/Chandanotsavam story), so it's left as is
-- rather than duplicated — this only fills in the three fields that were
-- genuinely still empty (source citation, architecture, dating), each
-- guarded by coalesce so a future better answer is never clobbered.

update public.temples set
  sthala_purana_source = coalesce(sthala_purana_source, 'Local/regional tradition'),
  architecture_style = coalesce(architecture_style, 'Kalinga/Odisha-influenced Dravidian, with later Vijayanagara-era additions'),
  construction_century = coalesce(construction_century, 11)
where name = 'Simhachalam Varaha Narasimha Temple';

insert into public.temple_festivals (temple_id, name, month, secondary_month, notes)
select id, 'Giri Pradakshina', 11, null,
  'A circumambulation of the entire Simhachalam hill on foot, most widely observed through the Tamil/Telugu month of Kartika — distinct from the Chandanotsavam day itself.'
from public.temples
where name = 'Simhachalam Varaha Narasimha Temple'
  and not exists (
    select 1 from public.temple_festivals f
    where f.temple_id = public.temples.id and f.name = 'Giri Pradakshina'
  );

-- ── New temples ──────────────────────────────────────────────────────────

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier,
  food_source_name, food_distance_km,
  nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source,
  nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Sri Satyanarayana Swamy Temple, Annavaram', 'Satyanarayana Swamy (Vishnu)', 'Vaishnava', array[]::text[], 'India',
  'Andhra Pradesh', 'Kakinada', 'Annavaram', 17.2833, 82.2833,
  'unknown', null, 'unknown', null, 'brahmin_run_kitchen',
  'Temple annadanam hall — free meals served daily to pilgrims', 0.0,
  'Pampa', 0.3,
  'Every full-moon (Purnima) day draws large crowds for the Satyanarayana Vratam; Kartika Purnima is the busiest of the year.',
  'Set on Ratnagiri hill above the village of Annavaram, the present temple traces to a vision reported by a local benefactor pointing to the deity''s self-manifest presence on the hill; construction began in 1891 and the shrine grew over the following decades into one of Andhra Pradesh''s most-visited pilgrimage centres, closely associated with the Satyanarayana Vratam described in the Skanda Purana.',
  'Local/regional tradition, drawing on the Skanda Purana account of the Satyanarayana Vratam',
  'Annavaram', 2.0,
  'approved'
),
(
  'Sri Varasiddhi Vinayaka Temple, Kanipakam', 'Varasiddhi Vinayaka (Ganesha)', 'Ganapatya', array[]::text[], 'India',
  'Andhra Pradesh', 'Chittoor', 'Kanipakam', 13.3667, 79.1667,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Vinayaka Chavithi (Aug–Sep) is the busiest; otherwise Oct–Feb for cooler travel.',
  'Local tradition holds that three friends — one blind, one deaf, one mute — were digging a well when their spade struck a buried idol, drawing blood, and the well immediately filled with water despite the area''s drought. Devotees still travel to Kanipakam to swear oaths of truth beside this temple tank, an unusual practice believed to continue an old local custom of settling disputes here.',
  'Local/regional tradition',
  'Chittoor', 12.0,
  'approved'
),
(
  'Moreshwar Temple, Morgaon', 'Moreshwar / Mayureshwar (Ganesha)', 'Ganapatya', array['Ashtavinayak'], 'India',
  'Maharashtra', 'Pune', 'Morgaon', 18.1667, 74.4833,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Ganesh Chaturthi (Aug–Sep) is the single busiest day; the Ashtavinayak yatra itself is most commonly done Oct–Feb.',
  'Considered the first and foremost of the eight Ashtavinayak shrines — pilgrims doing the full yatra traditionally begin and end here. Local tradition, drawn from the Ganesha Purana, holds Ganesha took the form of Mayureshwar, riding a peacock (mayura), to defeat the demon Sindhurasura. The temple''s walled compound with four corner minarets, blending Hindu and Indo-Islamic architectural styles, is unusual among Ganesha shrines.',
  'Local/regional tradition, drawing on the Ganesha Purana',
  null, null,
  'approved'
),
(
  'Siddhivinayak Temple, Siddhatek', 'Siddhivinayak (Ganesha)', 'Ganapatya', array['Ashtavinayak'], 'India',
  'Maharashtra', 'Ahmednagar', 'Siddhatek', 18.5667, 74.9833,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Bhima', 0.2,
  'Ganesh Chaturthi (Aug–Sep) is the busiest day; Oct–Feb otherwise for the Ashtavinayak circuit.',
  'Tradition holds this is where Vishnu meditated on Ganesha to gain the siddhi (spiritual power) needed to defeat the demons Madhu and Kaitabha, giving the deity here the name Siddhivinayak. The idol''s trunk turns to the right rather than the more common left, a form considered more powerful and traditionally observed with stricter ritual discipline (including a longer period of abstinence for worshippers).',
  'Local/regional tradition, drawing on the Ganesha Purana',
  null, null,
  'approved'
),
(
  'Ballaleshwar Temple, Pali', 'Ballaleshwar (Ganesha)', 'Ganapatya', array['Ashtavinayak'], 'India',
  'Maharashtra', 'Raigad', 'Pali', 18.2333, 73.2333,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Ganesh Chaturthi (Aug–Sep) is the busiest day; Oct–Feb otherwise for the Ashtavinayak circuit.',
  'The only one of the eight Ashtavinayaks named after a devotee rather than a deity or a demon defeated: tradition holds a boy named Ballal, absorbed in devotion to Ganesha, was punished by his father for neglecting his studies, and Ganesha appeared to protect him, taking the name Ballaleshwar in his honour.',
  'Local/regional tradition, drawing on the Ganesha Purana',
  null, null,
  'approved'
),
(
  'Varadavinayak Temple, Mahad', 'Varadavinayak (Ganesha)', 'Ganapatya', array['Ashtavinayak'], 'India',
  'Maharashtra', 'Raigad', 'Mahad (near Khopoli)', 18.7667, 73.4167,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Ganesh Chaturthi (Aug–Sep) is the busiest day; Oct–Feb otherwise for the Ashtavinayak circuit.',
  'Tradition holds Ganesha appeared here to grant sage Gritsamada a boon (vara) after his penance, giving the deity the name Varadavinayak, "Ganesha who grants boons." An oil lamp inside the temple is said to have been kept continuously burning since 1892.',
  'Local/regional tradition, drawing on the Ganesha Purana',
  null, null,
  'approved'
),
(
  'Chintamani Temple, Theur', 'Chintamani Vinayaka (Ganesha)', 'Ganapatya', array['Ashtavinayak'], 'India',
  'Maharashtra', 'Pune', 'Theur', 18.4394, 74.0169,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Mula-Mutha', 0.5,
  'Ganesh Chaturthi (Aug–Sep) is the busiest day; Oct–Feb otherwise for the Ashtavinayak circuit.',
  'Named for the legendary wish-fulfilling Chintamani gem: tradition holds sage Kapila''s jewel was stolen by King Guna, and Ganesha recovered and returned it, then was asked to keep it, wearing it here as Chintamani Vinayaka. The temple is also where the Maratha Peshwa Madhavrao I is historically recorded to have died in 1772.',
  'Local/regional tradition, drawing on the Ganesha Purana',
  null, null,
  'approved'
),
(
  'Girijatmaj Temple, Lenyadri', 'Girijatmaj (Ganesha)', 'Ganapatya', array['Ashtavinayak'], 'India',
  'Maharashtra', 'Pune', 'Lenyadri (near Junnar)', 19.2167, 73.8833,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Ganesh Chaturthi (Aug–Sep) is the busiest day; Oct–Feb otherwise, and cooler for the roughly 300-step climb.',
  'The only Ashtavinayak shrine set inside a rock-cut cave, part of the ancient Lenyadri Buddhist cave complex, reached by climbing roughly 300 stone steps up the hillside. Tradition holds Parvati (Girija) performed penance in this cave for Ganesha to be born to her, giving the deity the name Girijatmaj, "son of Girija."',
  'Local/regional tradition, drawing on the Ganesha Purana',
  null, null,
  'approved'
),
(
  'Vighnahar Temple, Ozar', 'Vighneshwar / Vighnahar (Ganesha)', 'Ganapatya', array['Ashtavinayak'], 'India',
  'Maharashtra', 'Pune', 'Ozar (near Junnar)', 19.1900, 73.9200,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Kukadi', 0.3,
  'Ganesh Chaturthi (Aug–Sep) is the busiest day; Oct–Feb otherwise for the Ashtavinayak circuit.',
  'Tradition holds Ganesha took this form to defeat the demon Vighnasura, who had been disrupting sages'' yajnas, on the condition that his own name be invoked at the start of any undertaking to clear obstacles (vighna) — the origin, by this local tradition, of Ganesha''s role as remover of obstacles.',
  'Local/regional tradition, drawing on the Ganesha Purana',
  null, null,
  'approved'
),
(
  'Mahaganapati Temple, Ranjangaon', 'Mahaganapati (Ganesha)', 'Ganapatya', array['Ashtavinayak'], 'India',
  'Maharashtra', 'Pune', 'Ranjangaon', 18.7333, 74.2333,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Ganesh Chaturthi (Aug–Sep) is the busiest day; Oct–Feb otherwise for the Ashtavinayak circuit.',
  'Tradition holds this is where Shiva worshipped Ganesha before his battle with the demon Tripurasura, drawing the strength here to defeat him and giving the deity the name Mahaganapati. Local tradition also holds that a larger, ten-trunked and twenty-armed form of the deity lies hidden behind the visible idol in the sanctum.',
  'Local/regional tradition, drawing on the Ganesha Purana',
  null, null,
  'approved'
),
(
  'Kanaka Mahalakshmi Temple, Vijayawada', 'Kanaka Mahalakshmi (Lakshmi)', 'Shakta', array[]::text[], 'India',
  'Andhra Pradesh', 'NTR', 'Vijayawada', 16.5083, 80.6183,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Krishna', 0.3,
  'Oct–Feb; Navaratri and the temple''s own annual brahmotsavam draw the largest crowds.',
  'One of Vijayawada''s most visited Devi shrines, close to the Krishna riverbank in the old town and distinct from the hill shrine of Kanaka Durga on Indrakeeladri. Worshipped as a wealth-giving form of Mahalakshmi.',
  'Local/regional tradition',
  null, null,
  'approved'
);

-- ── Native names for the new temples ────────────────────────────────────

update public.temples set native_name = 'శ్రీ సత్యనారాయణ స్వామి దేవస్థానం' where name = 'Sri Satyanarayana Swamy Temple, Annavaram';
update public.temples set native_name = 'శ్రీ వరసిద్ధి వినాయక స్వామి దేవస్థానం' where name = 'Sri Varasiddhi Vinayaka Temple, Kanipakam';
update public.temples set native_name = 'శ్రీ కనక మహాలక్ష్మి దేవస్థానం' where name = 'Kanaka Mahalakshmi Temple, Vijayawada';
update public.temples set native_name = 'श्री मोरेश्वर मंदिर' where name = 'Moreshwar Temple, Morgaon';
update public.temples set native_name = 'श्री सिद्धिविनायक मंदिर' where name = 'Siddhivinayak Temple, Siddhatek';
update public.temples set native_name = 'श्री बल्लाळेश्वर मंदिर' where name = 'Ballaleshwar Temple, Pali';
update public.temples set native_name = 'श्री वरदविनायक मंदिर' where name = 'Varadavinayak Temple, Mahad';
update public.temples set native_name = 'श्री चिंतामणी मंदिर' where name = 'Chintamani Temple, Theur';
update public.temples set native_name = 'श्री गिरिजात्मज मंदिर' where name = 'Girijatmaj Temple, Lenyadri';
update public.temples set native_name = 'श्री विघ्नहर मंदिर' where name = 'Vighnahar Temple, Ozar';
update public.temples set native_name = 'श्री महागणपती मंदिर' where name = 'Mahaganapati Temple, Ranjangaon';

-- ── Festivals for the new temples ────────────────────────────────────────

insert into public.temple_festivals (temple_id, name, month, secondary_month, notes) values
((select id from public.temples where name = 'Sri Satyanarayana Swamy Temple, Annavaram'), 'Kartika Purnima', 11, 12, 'The busiest of the year''s many full-moon Satyanarayana Vratam days.'),
((select id from public.temples where name = 'Sri Varasiddhi Vinayaka Temple, Kanipakam'), 'Vinayaka Chavithi', 8, 9, null),
((select id from public.temples where name = 'Moreshwar Temple, Morgaon'), 'Ganesh Chaturthi', 8, 9, 'Traditionally the start and end point of the full Ashtavinayak yatra.'),
((select id from public.temples where name = 'Siddhivinayak Temple, Siddhatek'), 'Ganesh Chaturthi', 8, 9, null),
((select id from public.temples where name = 'Ballaleshwar Temple, Pali'), 'Ganesh Chaturthi', 8, 9, null),
((select id from public.temples where name = 'Varadavinayak Temple, Mahad'), 'Ganesh Chaturthi', 8, 9, null),
((select id from public.temples where name = 'Chintamani Temple, Theur'), 'Ganesh Chaturthi', 8, 9, null),
((select id from public.temples where name = 'Girijatmaj Temple, Lenyadri'), 'Ganesh Chaturthi', 8, 9, null),
((select id from public.temples where name = 'Vighnahar Temple, Ozar'), 'Ganesh Chaturthi', 8, 9, null),
((select id from public.temples where name = 'Mahaganapati Temple, Ranjangaon'), 'Ganesh Chaturthi', 8, 9, null),
((select id from public.temples where name = 'Kanaka Mahalakshmi Temple, Vijayawada'), 'Navaratri', 9, 10, null);
