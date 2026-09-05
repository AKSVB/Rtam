-- Ṛtam — three circuits were undercounting because their principal/best-known
-- shrine was already in the database under a different primary identity and
-- never got the circuit's own tag added:
--
--   Panch Kedar (was 4/5): Kedarnath itself — tagged only 'Jyotirlinga' —
--   is the fifth and principal Panch Kedar shrine (its sthala_purana
--   already describes the Panch Kedar legend, just not the tag).
--
--   Panch Badri (was 4/5): Badrinath Temple — tagged only 'Char Dham' — is
--   the principal Panch Badri shrine (also called Vishal Badri).
--
--   Pancharanga Kshetram (was 4/5): Ranganathaswamy Temple, Srirangam had
--   an empty significance array despite being Antya Ranga, the last and
--   most famous of the five Ranga shrines on the Kaveri.
--
-- Also closing a gap in the Shakti Peetha work from migration 0044: that
-- migration completed 15 of the 16 India-based Ashtadasha Shakti Peethas
-- but missed Harsiddhi (Ujjain) — Sati's elbow — which this adds now.
-- Coordinates are an approximation near Rudra Sagar/Mahakaleshwar, since no
-- source gave a precise figure for the temple building itself.

update public.temples
  set significance = significance || array['Panch Kedar'],
      sthala_purana = sthala_purana || ' As the site of the bull''s hump, Kedarnath is reckoned the principal and most-visited of the five Panch Kedar shrines.'
  where name = 'Kedarnath Jyotirlinga' and not (significance @> array['Panch Kedar']);

update public.temples
  set significance = significance || array['Panch Badri'],
      sthala_purana = sthala_purana || ' Also called Vishal Badri, this is the principal shrine of the Panch Badri circuit, alongside Yogadhyan, Bhavishya, Vridha, and Adi Badri.'
  where name = 'Badrinath Temple' and not (significance @> array['Panch Badri']);

update public.temples
  set significance = significance || array['Pancharanga Kshetram'],
      sthala_purana = sthala_purana || ' Srirangam is reckoned Antya Ranga, the last and southernmost of the five Pancharanga Kshetrams on the Kaveri, following Srirangapatna (Adi Ranga), Shivanasamudra (Madhya Ranga), Koviladi, and Kumbakonam.'
  where name = 'Ranganathaswamy Temple, Srirangam' and not (significance @> array['Pancharanga Kshetram']);

-- ── The 16th India-based Ashtadasha Shakti Peetha ───────────────────────────

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Harsiddhi Mata Temple, Ujjain', 'Harsiddhi (Devi)', 'Shakta', array['Shakti Peetha'], 'India', 'Madhya Pradesh', 'Ujjain', 'Ujjain', 23.1815, 75.7695, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Kshipra', 1, 'Oct–Feb; especially crowded during Navratri, when the temple''s twin 51-foot deepstambhas (lamp towers) are lit with over a thousand oil lamps each.', 'One of the Ashtadasha Shakti Peethas, standing near Rudra Sagar close to Mahakaleshwar. Tradition holds Sati''s elbow fell here as Shiva carried her body across the cosmos. A separate legend credits King Vikramaditya with reviving the goddess''s worship here after she helped him defeat a tyrant, hence "Harsiddhi" — the goddess "who fulfills desires." The present structure was renovated in the Maratha period, with the distinctive twin lamp-towers added under the patronage of Maharani Ahilyabai Holkar.', 'Ashtadasha Shakti Peetha tradition; local/regional legend (Vikramaditya)', 'Maratha-era renovation', 18, 'approved'
);

update public.temples set native_name = 'हरसिद्धि माता मंदिर' where name = 'Harsiddhi Mata Temple, Ujjain';

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Harsiddhi Mata Temple, Ujjain'),
  'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Harsiddhi_Temple%2C_Ujjain_01.jpg/1280px-Harsiddhi_Temple%2C_Ujjain_01.jpg',
  'Harsiddhi Mata Temple, Ujjain',
  'Bernard Gagnon, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Harsiddhi_Temple,_Ujjain_01.jpg'
);
