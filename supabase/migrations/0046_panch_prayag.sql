-- Ṛtam — the Panch Prayag: the five sacred confluences where tributaries
-- join the Alaknanda on its descent through Garhwal, the last of them
-- (Devprayag) giving rise to the Ganga itself. Each confluence carries its
-- own shrine; Karnaprayag has two (Karna Temple, tagged as the circuit
-- entry, and the nearby Uma Devi Temple, added as a bonus, untagged).
--
-- Coordinates for Nandaprayag, Karnaprayag and Rudraprayag are town-level
-- (the exact shrines sit at or very near the river confluence itself, but
-- no source gave separate temple-building coordinates); Vishnuprayag and
-- Devprayag's Raghunath Temple have precise, source-confirmed coordinates.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Vishnu Temple, Vishnuprayag', 'Vishnu', 'Vaishnava', array['Panch Prayag'], 'India', 'Uttarakhand', 'Chamoli', 'Vishnuprayag', 30.5625, 79.57528, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Alaknanda–Dhauliganga confluence', 0.05, 'May–Jun and Sep–Oct; closed off by snow in deep winter and prone to landslides in the monsoon.', 'The first of the Panch Prayag going downstream, where the Alaknanda meets the Dhauliganga near Joshimath. Tradition holds that the sage Narada performed penance here to Vishnu, giving the confluence its name. The present Vishnu temple beside the sangam was built in the 19th century by Ahilyabai Holkar, the Maharani of Indore, who endowed temples across many of India''s pilgrimage sites.', 'Local/regional tradition', 'North Indian hill-temple style, built by Ahilyabai Holkar of Indore', 19, 'approved'
),
(
  'Nand Temple, Nandaprayag', 'Vishnu', 'Vaishnava', array['Panch Prayag'], 'India', 'Uttarakhand', 'Chamoli', 'Nandaprayag', 30.33, 79.33, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Alaknanda–Nandakini confluence', 0.1, 'Mar–Jun and Sep–Nov.', 'The second of the Panch Prayag, where the Alaknanda meets the Nandakini river. Once the capital of a local Yadu kingdom, the site takes its name from King Nanda — the foster father of Krishna in the Bhagavata tradition — who is said to have performed intense penance here on a sacred stone, seeking a son from Vishnu; the temple is traditionally held to stand on that very stone.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Karna Temple, Karnaprayag', 'Surya (via Karna''s penance)', 'Saura', array['Panch Prayag'], 'India', 'Uttarakhand', 'Chamoli', 'Karnaprayag', 30.259, 79.218, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Alaknanda–Pindar confluence', 0.1, 'Mar–Jun and Sep–Nov.', 'The third of the Panch Prayag, at the confluence of the Alaknanda and Pindar rivers — among the widest of the five. The temple, perched on a large boulder at the sangam, marks the spot where Karna of the Mahabharata is said to have performed severe penance to Surya, the sun god, who granted him his celebrated armor and earrings. Local tradition also holds that Krishna performed Karna''s last rites at this confluence after the Kurukshetra war.', 'Mahabharata tradition; local/regional lore', null, null, 'approved'
),
(
  'Uma Devi Temple, Karnaprayag', 'Uma / Parvati (Devi)', 'Shakta', array[]::text[], 'India', 'Uttarakhand', 'Chamoli', 'Karnaprayag', 30.261, 79.216, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Alaknanda–Pindar confluence', 0.3, 'Mar–Jun and Sep–Nov.', 'A short distance from the Karnaprayag sangam, this temple enshrines a swayambhu (self-manifested) image of Uma (Parvati) and is traditionally said to have been renovated by Adi Shankaracharya during his 8th-century journey through Garhwal.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Chamunda Devi Temple, Rudraprayag', 'Chamunda (Devi)', 'Shakta', array['Panch Prayag'], 'India', 'Uttarakhand', 'Rudraprayag', 'Rudraprayag', 30.28, 78.98, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Alaknanda–Mandakini confluence', 0.1, 'Mar–Jun and Sep–Nov.', 'The fourth of the Panch Prayag, where the Mandakini flowing down from Kedarnath joins the Alaknanda flowing down from Badrinath. Chamunda, worshipped here as consort of Rudra (Shiva), gives the confluence its name. Tradition holds that the sage Narada meditated at this sangam and received the art of music from Shiva.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Raghunath Temple, Devprayag', 'Raghunath (Rama)', 'Vaishnava', array['Panch Prayag'], 'India', 'Uttarakhand', 'Tehri Garhwal', 'Devprayag', 30.14556, 78.56444, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bhagirathi–Alaknanda confluence (source of the Ganga)', 0.1, 'Mar–Jun and Sep–Nov.', 'The last and most revered of the Panch Prayag: here the Bhagirathi meets the Alaknanda, and their combined waters take on the name Ganga for the rest of their course to the sea. The temple, traditionally consecrated by Adi Shankaracharya in the 8th century and later expanded under the Garhwal kingdom, is among the oldest continuously worshipped shrines in the Himalaya. Rama is held to have performed penance here to atone for killing Ravana, and the deity is worshipped as Raghunathji.', 'Local/regional tradition', 'North Indian Himalayan hill-temple style; expanded under the Garhwal kingdom', 8, 'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'विष्णु मंदिर, विष्णुप्रयाग' where name = 'Vishnu Temple, Vishnuprayag';
update public.temples set native_name = 'नंद मंदिर, नंदप्रयाग' where name = 'Nand Temple, Nandaprayag';
update public.temples set native_name = 'कर्ण मंदिर, कर्णप्रयाग' where name = 'Karna Temple, Karnaprayag';
update public.temples set native_name = 'उमा देवी मंदिर, कर्णप्रयाग' where name = 'Uma Devi Temple, Karnaprayag';
update public.temples set native_name = 'चामुंडा देवी मंदिर, रुद्रप्रयाग' where name = 'Chamunda Devi Temple, Rudraprayag';
update public.temples set native_name = 'रघुनाथ मंदिर, देवप्रयाग' where name = 'Raghunath Temple, Devprayag';
