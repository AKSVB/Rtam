-- Ṛtam — the Nava Kailasam: nine Shiva temples strung along the
-- Thamirabarani river in Tirunelveli and Thoothukudi districts, Tamil
-- Nadu — a distinct circuit from the Nava Tirupati (Vaishnava, same
-- river, some shared villages) and from the Kumbakonam-area Navagraha
-- Sthalam already in this database. Tradition holds the sage Agastya's
-- disciple (called Romasa Muni in most sources, also Uromacha/Urosamar)
-- floated nine flowers down the river and installed a Shiva linga as
-- "Kailasanathar" at each spot one settled; a secondary folk tradition
-- also links each shrine to one of the nine planets, distinct from the
-- formal Navagraha Sthalam pilgrimage.
--
-- Coordinates for Cheranmahadevi, Rajapathy, and Senthapoomangalam are
-- town/locality-level approximations — no source gave a precise
-- building-level figure. Thenthiruperai reuses the coordinate already on
-- file for the Nava Tirupati shrine in the same village (a separate,
-- Vaishnava temple); the Nava Kailasam Shiva shrine there is confirmed
-- to be a distinct temple at the same location.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Papanasanathar Temple, Papanasam', 'Papanasanathar (Shiva) / Ulagammai Amman', 'Shaiva', array['Nava Kailasam'], 'India', 'Tamil Nadu', 'Tirunelveli', 'Papanasam', 8.71333, 77.40583, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.1, 'Oct–Feb.', 'The first of the Nava Kailasam, nine Shiva shrines on the Thamirabarani river. Tradition holds that Romasa Muni, a disciple of the sage Agastya, floated nine flowers down the river on his guru''s instruction and installed a Shiva linga as "Kailasanathar" wherever each came to rest — the first settling here, where Shiva is worshipped as Papanasanathar, "destroyer of sins," with Parvati as Ulagammai Amman. A separate folk tradition links this shrine to Surya (the Sun) among the nine planets. Originally built by the Pandyas, with major additions under the Vijayanagara and Nayaka kings in the 16th century.', 'Local/regional tradition (Agastya-Romasa Muni legend)', 'Dravidian (Pandya origins, Vijayanagara-Nayaka expansion)', 16, 'approved'
),
(
  'Ammainathar Kailasanathar Temple, Cheranmahadevi', 'Ammainathar / Kailasanathar (Shiva)', 'Shaiva', array['Nava Kailasam'], 'India', 'Tamil Nadu', 'Tirunelveli', 'Cheranmahadevi', 8.68, 77.57, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.5, 'Oct–Feb.', 'The second of the Nava Kailasam, where Shiva is worshipped as Ammainathar. The linga here is said to have been installed directly by Romasa Muni. A folk tradition links this shrine to Chandra (the Moon) among the nine planets. The temple preserves roughly 1,100 years of Dravidian temple heritage.', 'Local/regional tradition (Agastya-Romasa Muni legend)', 'Dravidian', null, 'approved'
),
(
  'Kailasanathar Temple, Kodaganallur', 'Kailasanathar (Shiva)', 'Shaiva', array['Nava Kailasam'], 'India', 'Tamil Nadu', 'Tirunelveli', 'Kodaganallur', 8.6984, 77.5893, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.3, 'Oct–Feb.', 'The third of the Nava Kailasam. A folk tradition links this shrine to Chevvai/Sevvai (Mars) among the nine planets. The temple and village preserve temple architecture dating back to around the 12th century.', 'Local/regional tradition (Agastya-Romasa Muni legend)', 'Dravidian', 12, 'approved'
),
(
  'Kotha Parameswarar Temple, Kunnathur', 'Kotha Parameswarar (Shiva)', 'Shaiva', array['Nava Kailasam'], 'India', 'Tamil Nadu', 'Tirunelveli', 'Kunnathur', 8.6910, 77.6736, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.3, 'Oct–Feb.', 'The fourth of the Nava Kailasam, where Shiva is worshipped as Kotha Parameswarar. A folk tradition links this shrine to Rahu among the nine planets.', 'Local/regional tradition (Agastya-Romasa Muni legend)', 'Dravidian', null, 'approved'
),
(
  'Kailasanathar Temple, Murappanadu', 'Kailasanathar (Shiva)', 'Shaiva', array['Nava Kailasam'], 'India', 'Tamil Nadu', 'Tirunelveli', 'Murappanadu', 8.7247, 77.8319, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.3, 'Oct–Feb.', 'The fifth of the Nava Kailasam, traditionally said to have been built by a Vallala king. A local legend tells of a Chola king whose daughter was born with a horse''s face, cured after bathing at this spot on Shiva''s instruction. A folk tradition links this shrine to Guru (Jupiter) among the nine planets.', 'Local/regional tradition (Agastya-Romasa Muni legend)', 'Dravidian', null, 'approved'
),
(
  'Kailasanathar Temple, Srivaikuntam', 'Kailasanathar (Shiva)', 'Shaiva', array['Nava Kailasam'], 'India', 'Tamil Nadu', 'Thoothukudi', 'Srivaikuntam', 8.6358, 77.915, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.4, 'Oct–Feb.', 'The sixth of the Nava Kailasam, in the same town as the Vaishnava Srivaikuntanathan Perumal Temple of the Nava Tirupati circuit. Built by the Pandyas, with pillared halls and major shrines added under the Vijayanagara and Nayaka kings in the 16th century. A folk tradition links this shrine to Shani (Saturn) among the nine planets.', 'Local/regional tradition (Agastya-Romasa Muni legend)', 'Dravidian (Pandya origins, Vijayanagara-Nayaka additions)', 16, 'approved'
),
(
  'Kailasanathar Temple, Thenthiruperai', 'Kailasanathar (Shiva) / Azhagiya Ponnammai', 'Shaiva', array['Nava Kailasam'], 'India', 'Tamil Nadu', 'Thoothukudi', 'Thenthiruperai', 8.603222, 77.986028, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.5, 'Oct–Feb.', 'The seventh of the Nava Kailasam, sharing its village with the Vaishnava Makara Nedunkuzhaikathar Temple of the Nava Tirupati circuit — a rare village with both a Nava Tirupati and a Nava Kailasam shrine. A folk tradition links this shrine to Budhan (Mercury) among the nine planets.', 'Local/regional tradition (Agastya-Romasa Muni legend)', 'Dravidian', null, 'approved'
),
(
  'Kailasanathar Temple, Rajapathy', 'Kailasanathar (Shiva)', 'Shaiva', array['Nava Kailasam'], 'India', 'Tamil Nadu', 'Thoothukudi', 'Rajapathy', 8.63, 78.02, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.5, 'Oct–Feb.', 'The eighth of the Nava Kailasam. A folk tradition links this shrine to Ketu among the nine planets.', 'Local/regional tradition (Agastya-Romasa Muni legend)', 'Dravidian', null, 'approved'
),
(
  'Kailasanathar Temple, Senthapoomangalam', 'Kailasanathar (Shiva)', 'Shaiva', array['Nava Kailasam'], 'India', 'Tamil Nadu', 'Thoothukudi', 'Senthapoomangalam', 8.6106, 78.0825, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.5, 'Oct–Feb.', 'The ninth and last of the Nava Kailasam. Tradition holds that Sukra (Venus) himself worshipped Shiva here, so that Shiva is held to have taken on Sukra''s qualities at this shrine — the folk association with Sukra among the nine planets that closes the circuit.', 'Local/regional tradition (Agastya-Romasa Muni legend)', 'Dravidian', null, 'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'பாபநாசநாதர் கோயில்' where name = 'Papanasanathar Temple, Papanasam';
update public.temples set native_name = 'அம்மைநாதர் கைலாசநாதர் கோயில்' where name = 'Ammainathar Kailasanathar Temple, Cheranmahadevi';
update public.temples set native_name = 'கைலாசநாதர் கோயில், கொடகநல்லூர்' where name = 'Kailasanathar Temple, Kodaganallur';
update public.temples set native_name = 'கோத பரமேஸ்வரர் கோயில், குன்னத்தூர்' where name = 'Kotha Parameswarar Temple, Kunnathur';
update public.temples set native_name = 'கைலாசநாதர் கோயில், முறப்பநாடு' where name = 'Kailasanathar Temple, Murappanadu';
update public.temples set native_name = 'கைலாசநாதர் கோயில், ஸ்ரீவைகுண்டம்' where name = 'Kailasanathar Temple, Srivaikuntam';
update public.temples set native_name = 'கைலாசநாதர் கோயில், தென்திருப்பேரை' where name = 'Kailasanathar Temple, Thenthiruperai';
update public.temples set native_name = 'கைலாசநாதர் கோயில், ராஜபதி' where name = 'Kailasanathar Temple, Rajapathy';
update public.temples set native_name = 'கைலாசநாதர் கோயில், செந்தபூமங்கலம்' where name = 'Kailasanathar Temple, Senthapoomangalam';
