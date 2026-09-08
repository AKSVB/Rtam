-- Ṛtam — seven landmark temples that were still missing despite being
-- among the most famous pilgrimage/heritage sites in the country, plus a
-- new significance tag: the Pancha Sabhai (five halls of Shiva's cosmic
-- dance in Tamil Shaiva tradition). Two of the five sabhas already exist
-- in the database (Chidambaram, Madurai) and are tagged here; the other
-- three (Tirunelveli, Kutralam, Tiruvalangadu) are new. The remaining four
-- entries are landmark Pallava/Chola/Vijayanagara-era monuments and a
-- major Devi shrine that had no entry at all yet.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Kailasanathar Temple, Kanchipuram', 'Kailasanathar (Shiva) / Uma', 'Shaiva', array['Pallava monument'], 'India', 'Tamil Nadu', 'Kanchipuram', 'Kanchipuram', 12.8342, 79.6903, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Vegavathy', 1.5, 'Nov–Feb.', 'Built in sandstone by the Pallava king Narasimhavarman II (Rajasimha) in the early 8th century and completed by his son Mahendravarman III, this is the oldest structural (built, not rock-cut) temple in Kanchipuram and one of the earliest surviving Dravidian-style stone temples anywhere. A narrow circumambulatory passage rings the main shrine, lined with 58 small sub-shrines originally holding stucco images of different forms of Shiva — many of the temple''s sculptures still carry traces of their original fresco paintwork. Its architecture is considered a direct precursor to the later Kailasanatha temple built by the Rashtrakutas at Ellora.', 'Historical/epigraphical record; ASI documentation', 'Pallava', 8, 'approved'
),
(
  'Shore Temple, Mahabalipuram', 'Shiva (two shrines, facing east and west) with a reclining Vishnu shrine between them', 'Shaiva', array['Pallava monument'], 'India', 'Tamil Nadu', 'Chengalpattu', 'Mahabalipuram', 12.6161, 80.1985, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Built by the Pallava king Narasimhavarman II (Rajasimha) in the early 8th century on the Coromandel coast, this granite structural temple is the oldest of its kind in South India and marks the transition from the rock-cut mandapams and rathas carved earlier at the same site to free-standing built temples. Local tradition holds it is the last-surviving of an original group of Seven Pagodas, the other six long since swallowed by the sea. It forms part of the UNESCO World Heritage Site "Group of Monuments at Mahabalipuram", inscribed in 1984.', 'UNESCO World Heritage documentation; ASI records; local tradition', 'Pallava', 8, 'approved'
),
(
  'Veerabhadra Temple, Lepakshi', 'Veerabhadra (fierce form of Shiva)', 'Shaiva', array['Vijayanagara monument'], 'India', 'Andhra Pradesh', 'Sri Sathya Sai', 'Lepakshi', 13.8047, 77.6081, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'Built in the 1530s under the Vijayanagara Empire by brothers Viranna and Virupanna, governors under Achyuta Deva Raya, the temple is renowned for its "hanging pillar" — one of around 70 carved granite pillars whose base does not touch the floor — and for a giant monolithic Nandi carved from a single boulder nearby, along with an unfinished Kalyana Mandapam and the largest single-stone Naga-linga in India, a multi-hooded serpent sheltering a Shiva linga. Local tradition ties the town's name to the Ramayana: Rama is said to have found the vulture-king Jatayu here, mortally wounded after trying to stop Ravana's abduction of Sita, and to have addressed him as "Le Pakshi" (Telugu, roughly "rise, bird").', 'Local/regional tradition; ASI documentation', 'Vijayanagara', 16, 'approved'
),
(
  'Kumari Amman Temple, Kanyakumari', 'Kanyakumari / Bhagavathy Amman (virgin form of Devi)', 'Shakta', array['Ashta Dasa Shakti Peetha'], 'India', 'Tamil Nadu', 'Kanyakumari', 'Kanyakumari', 8.0788, 77.5385, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Mar.', 'Standing at India''s southernmost tip, where tradition holds the Bay of Bengal, the Arabian Sea, and the Indian Ocean meet, this ancient shrine is dedicated to Devi in her eternal-virgin form. Tradition holds she undertook penance to marry Shiva so as to gain the boon needed to slay the demon Bana, but the sage Narada, knowing only a virgin goddess could defeat him, contrived to delay the wedding past its auspicious hour — leaving the uneaten wedding rice and grain scattered on the shore, said to be the source of the multi-coloured sand found on Kanyakumari's beaches to this day. The site was known to ancient Mediterranean geographers, who recorded it as "Comorin".', 'Local/regional Puranic tradition; classical geographical accounts', 'Dravidian, with additions across several centuries', null, 'approved'
),
(
  'Nellaiappar Temple, Tirunelveli', 'Nellaiappar (Shiva) / Kanthimathi Amman', 'Shaiva', array['Pancha Sabhai'], 'India', 'Tamil Nadu', 'Tirunelveli', 'Tirunelveli', 8.7139, 77.7567, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.5, 'Nov–Feb.', 'Historically two adjoining temples — one for Nellaiappar, one for his consort Kanthimathi Amman — later joined by the Sangili Mandapam ("chain hall"), added in the 18th century by the local merchant-patron Nainar Pillai and famous for its musical pillars, each carved to ring with a distinct note when struck. The temple houses the Tamira Sabha, the copper-roofed hall counted among the Pancha Sabhai, the five halls where Nataraja is traditionally held to have performed his cosmic dance.', 'Local/regional tradition; Tamil Shaiva literature', 'Dravidian, Pandya origins with later Nayak-era additions', null, 'approved'
),
(
  'Kutralanathar Temple, Kutralam', 'Kutralanathar (Shiva) / Kuzhalvai Mozhi Amman', 'Shaiva', array['Pancha Sabhai'], 'India', 'Tamil Nadu', 'Tenkasi', 'Courtallam', 8.9372, 77.2657, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Jun–Sep, when the nearby Courtallam falls are at their fullest.', 'Set beside the Courtallam waterfalls — popularly called the "Spa of South India" for their believed medicinal properties — this temple houses the Chitra Sabha, the hall of pictures/paintings counted among the Pancha Sabhai, the five halls where Nataraja is traditionally held to have performed his cosmic dance.', 'Local/regional tradition; Tamil Shaiva literature', 'Dravidian', null, 'approved'
),
(
  'Vadaranyeswarar Temple, Tiruvalangadu', 'Vadaranyeswarar (Shiva) / Vandarkuzhali Amman', 'Shaiva', array['Pancha Sabhai'], 'India', 'Tamil Nadu', 'Tiruvallur', 'Tiruvalangadu', 13.1608, 79.6764, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Nov–Feb.', 'Home to the Ratna Sabha, the gem-studded hall counted among the Pancha Sabhai, the five halls where Nataraja is traditionally held to have performed his cosmic dance — here linked to a legendary dance contest between Shiva and Kali. The temple is closely associated with an especially celebrated Chola-era bronze Nataraja unearthed at the site, now held in the Government Museum, Chennai, and regarded as one of the finest examples of Chola bronze-casting.', 'Local/regional tradition; art-historical record', 'Chola', null, 'approved'
);

-- ── Tag the two existing Pancha Sabhai temples ──────────────────────────

update public.temples
set significance = array_append(significance, 'Pancha Sabhai')
where name = 'Thillai Nataraja Temple, Chidambaram (Akasha Sthalam)'
  and not ('Pancha Sabhai' = any(significance));

update public.temples
set significance = array_append(significance, 'Pancha Sabhai')
where name = 'Meenakshi Amman Temple, Madurai'
  and not ('Pancha Sabhai' = any(significance));

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'காஞ்சி கைலாசநாதர் கோயில்' where name = 'Kailasanathar Temple, Kanchipuram';
update public.temples set native_name = 'கடற்கரைக் கோயில்' where name = 'Shore Temple, Mahabalipuram';
update public.temples set native_name = 'వీరభద్ర స్వామి దేవాలయం' where name = 'Veerabhadra Temple, Lepakshi';
update public.temples set native_name = 'குமரி அம்மன் கோயில்' where name = 'Kumari Amman Temple, Kanyakumari';
update public.temples set native_name = 'நெல்லையப்பர் கோயில்' where name = 'Nellaiappar Temple, Tirunelveli';
update public.temples set native_name = 'குற்றாலநாதர் கோயில்' where name = 'Kutralanathar Temple, Kutralam';
update public.temples set native_name = 'வடாரண்யேஸ்வரர் கோயில்' where name = 'Vadaranyeswarar Temple, Tiruvalangadu';
