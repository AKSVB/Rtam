-- Ṛtam — the Saptha Sthana Sthalangal of Mylapore, Chennai: seven Shiva
-- temples said to have been worshipped by the Saptarishis, all but one
-- clustered within about a kilometre of each other in old Mylapore.
-- Kapaleeshwarar Temple (already in the database) is the seventh and by
-- far the largest and best known — this migration tags it and adds the
-- other six, all far smaller neighbourhood shrines.
--
-- Named "Saptha Sthana Mylapore" to distinguish it from an unrelated,
-- separately-named Saptha Sthana Shiva circuit near Tiruvaiyaru,
-- Thanjavur, which is not in this database.
--
-- Coordinates are close approximations from street-level descriptions
-- (no source gave a precise building coordinate for these small shrines);
-- Theerthapaleeswarar sits further off, in Triplicane rather than
-- Mylapore proper.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Karaneeswarar Temple, Mylapore', 'Karaneeswarar (Shiva) / Porkodi Amman', 'Shaiva', array['Saptha Sthana Mylapore'], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore, Chennai', 13.035, 80.268, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'One of the Saptha Sthana Sthalangal, seven Shiva shrines in and around Mylapore traditionally said to have been worshipped by the Saptarishis (seven sages). Karaneeswarar''s name means "the Lord who is the cause," with Parvati worshipped here as Porkodi Amman. The temple may date to around the 12th century, though this is not firmly documented.', 'Local/regional tradition (Saptha Sthana)', null, 12, 'approved'
),
(
  'Theerthapaleeswarar Temple, Triplicane', 'Theerthapaleeswarar (Shiva) / Tripura Sundari', 'Shaiva', array['Saptha Sthana Mylapore'], 'India', 'Tamil Nadu', 'Chennai', 'Triplicane, Chennai', 13.0575, 80.2765, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'One of the Saptha Sthana Sthalangal, with small, ancient-style idols of Theerthapaleeswarar and his consort Tripura Sundari. Tradition holds that 64 sacred theertha ponds once ran from this temple to the nearby sea. The present structure is around 500 years old.', 'Local/regional tradition (Saptha Sthana)', null, 16, 'approved'
),
(
  'Velleeswarar Temple, Mylapore', 'Velleeswarar (Shiva) / Kamakshi', 'Shaiva', array['Saptha Sthana Mylapore'], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore, Chennai', 13.0335, 80.269, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'One of the Saptha Sthana Sthalangal, on South Mada Street close to the Kapaleeshwarar Temple. Tradition holds that Shukra, guru of the asuras, worshipped Shiva here after being blinded by Vishnu''s Vamana avatara and regained his sight — devotees with eye ailments still worship here for relief.', 'Local/regional tradition (Saptha Sthana)', 'Dravidian (five-tier vimana)', null, 'approved'
),
(
  'Virupakshiswarar Temple, Mylapore', 'Virupaksheeswarar (Shiva) / Visalakshi', 'Shaiva', array['Saptha Sthana Mylapore'], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore, Chennai', 13.0355, 80.2675, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'One of the Saptha Sthana Sthalangal and, on inscriptional evidence from the reign of the Chola king Veerarajendra (1063-70 CE), close to a thousand years old. Tradition holds a devotee''s daughter, Poompavai, died here and was brought back to life by the Nayanar saint Tirugnana Sambandhar from her burnt bones.', 'Local/regional tradition (Saptha Sthana); Chola-era inscription', null, 11, 'approved'
),
(
  'Valeeswarar Temple, Mylapore', 'Valeeswarar (Shiva) / Periyanayagi Amman', 'Shaiva', array['Saptha Sthana Mylapore'], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore, Chennai', 13.0345, 80.2685, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'One of the Saptha Sthana Sthalangal, near the Kolaviliamman Temple in Mylapore. Panchalingas (five lingas together) are the particular specialty of this small shrine.', 'Local/regional tradition (Saptha Sthana)', null, null, 'approved'
),
(
  'Malleeswarar Temple, Mylapore', 'Malleeswarar (Shiva) / Maragathambal', 'Shaiva', array['Saptha Sthana Mylapore'], 'India', 'Tamil Nadu', 'Chennai', 'Mylapore, Chennai', 13.0352, 80.2678, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'One of the Saptha Sthana Sthalangal. Tradition holds a Shiva devotee named Prarthan came from Ayodhya and performed penance amid jasmine (malligai) bushes at this spot, and was granted darshan of Shiva with his consort Maragathambal — giving the shrine its name. The present temple dates to around the mid-18th century.', 'Local/regional tradition (Saptha Sthana)', null, 18, 'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'கரணீஸ்வரர் கோயில்' where name = 'Karaneeswarar Temple, Mylapore';
update public.temples set native_name = 'தீர்த்தபாலீஸ்வரர் கோயில்' where name = 'Theerthapaleeswarar Temple, Triplicane';
update public.temples set native_name = 'வெள்ளீஸ்வரர் கோயில்' where name = 'Velleeswarar Temple, Mylapore';
update public.temples set native_name = 'விருபாட்சீஸ்வரர் கோயில்' where name = 'Virupakshiswarar Temple, Mylapore';
update public.temples set native_name = 'வலீஸ்வரர் கோயில்' where name = 'Valeeswarar Temple, Mylapore';
update public.temples set native_name = 'மல்லீஸ்வரர் கோயில்' where name = 'Malleeswarar Temple, Mylapore';

-- ── Tag the existing Kapaleeshwarar Temple as the seventh ───────────────────

update public.temples
  set significance = significance || array['Saptha Sthana Mylapore'],
      sthala_purana = sthala_purana || ' Kapaleeshwarar is the seventh and largest of the Saptha Sthana Sthalangal, the seven Shiva shrines of Mylapore traditionally worshipped by the Saptarishis.'
  where name = 'Kapaleeshwarar Temple, Chennai' and not (significance @> array['Saptha Sthana Mylapore']);
