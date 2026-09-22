-- Ṛtam — 4 more Gujarat temples beyond Somnath, Nageshwar Jyotirlinga,
-- Dwarkadhish, Ambaji and Bahucharaji seeded earlier.
--
-- Modhera is, like Rajarani (Odisha) before it, not a living-worship
-- temple — its founding date is unusually solid (an 1026-27 CE
-- inscription), so that certainty is reflected in construction_century
-- even though the site no longer holds daily worship. Dakor and
-- Shamlaji both have real gaps between an older legendary/devotional
-- layer and a later, physically-standing structure; construction_century
-- reflects the standing building people actually visit, with the older
-- layer described in sthala_purana rather than folded into one date.
-- Pavagadh's Jain-vs-Hindu origin layering is presented as contested per
-- the research, not resolved into a single account.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Sun Temple, Modhera', 'Surya (the Sun God) — no longer an active place of worship; maintained as an ASI monument', null, array['UNESCO tentative list']::text[], 'India', 'Gujarat', 'Mehsana', 'Modhera', 23.58380, 72.13270, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The Modhera Dance Festival (Uttarardh Mahotsav), a 3-day classical dance festival, is held here each January — a cultural event, not a worship occasion, consistent with the temple''s non-active status.',
  $$Built under the Chaulukya (Solanki) dynasty during the reigns of Bhima I and Karna I, with a foundational inscription on the cella's western wall dated Vikram Samvat 1083 — 1026–27 CE, making this one of the more precisely dated ancient temples in India. The complex is arranged on one axis: the shrine (gudhamandapa), an assembly hall (sabhamandapa), and a large stepped tank, the Surya Kund. It was added to UNESCO's World Heritage tentative list in December 2022.$$,
  'Temple foundational inscription (Vikram Samvat 1083)', 'Māru-Gurjara (Chaulukya) style, 11th century CE', 11, 'approved'
),
(
  'Kalika Mata Temple, Pavagadh', 'Mahakali, flanked by Kali and Bahucharamata', 'Shakta', array['Shakti Peetha']::text[], 'India', 'Gujarat', 'Panchmahal', 'Pavagadh', 22.46110, 73.51170, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Navaratri (Sep–Oct) brings major pilgrimage crowds.',
  $$Considered the oldest temple on Pavagadh Hill, with a core dating to the 10th–11th century, and traditionally counted among the 51 Shakti Peethas, associated with the fall of Sati's right toe. The hill's religious history is layered and contested: the Śvetāmbara Jain Achalgacch order was established here in the 12th century, and some accounts describe the Mahakali image as originally a protective deity of that Jain sect before Hindu Shakta worship became dominant — presented here as a blended, disputed tradition rather than a single settled account. The temple sits within the Champaner-Pavagadh Archaeological Park, a UNESCO World Heritage Site.$$,
  'Local and Jain-Hindu layered tradition; UNESCO site documentation', 'Nagara style core (10th–11th century), later hilltop fortifications added', 10, 'approved'
),
(
  'Ranchhodraiji Temple, Dakor', 'Krishna, worshipped as Ranchhodrai (Ranchhodraiji)', 'Vaishnava', array[]::text[], 'India', 'Gujarat', 'Kheda', 'Dakor', 22.75443, 73.14898, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Sharad Purnima (the Ashwin/October full moon) is the temple''s most important festival, drawing large numbers of pilgrims who walk to Dakor.',
  $$Devotional tradition holds that the Ranchhodrai murti, linked to the Dwarkadhish Temple in Dwarka, came to Dakor with the devotee Bodana in 1151 CE — presented as legend rather than settled history. Simple worship is said to have continued for centuries until 1625, when the Pushtimargi gosvami Harirai established formal Vallabh-sampradaya rituals. The temple building that stands today, however, was constructed considerably later, by Gopal Tambvekar (Gopal Jagannath Ambekar), a Peshwa-court shroff from Poona, in 1769–70. It is enclosed by a fort wall near Gomti Lake, with 8 domes, 24 turrets, and a central dome rising about 27m, and Dakor is counted among the "Pancha Dwarka" pilgrimage sites.$$,
  'Devotional tradition (Bodana legend); temple construction records', 'Maratha-era temple architecture (built 1769–70)', 18, 'approved'
),
(
  'Shamlaji Temple', 'Vishnu, worshipped in Trivikrama form as "Gadadhar Shamlaji"', 'Vaishnava', array[]::text[], 'India', 'Gujarat', 'Aravalli', 'Shamlaji', 23.68810, 73.38690, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Meshwo', 0.1, 'The annual Kartik Purnima fair (Oct–Nov) on the Meshwo riverbank features ritual bathing alongside a trade fair.',
  $$The site's religious use significantly predates the present building: the Vishnu sculpture in the main sanctum is estimated to the 7th–8th century, a smaller adjoining shrine holds a 6th-century Shiva sculpture, and the nearby Harishchandrani Chauri temple (9th century) is the oldest intact structure at Shamlaji, which was already an active sculpture-production centre by the 6th century — work from its workshops has been found as far away as Mumbai. The main temple itself likely began in Chaulukya style around the 11th century, but the structure standing today mostly dates to a 15th–16th century rebuilding.$$,
  'Archaeological and art-historical scholarship', 'Chaulukya-style origins (11th century); present structure predominantly 15th–16th century', 15, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Sun Temple, Modhera'),
  'https://upload.wikimedia.org/wikipedia/commons/3/33/Sun_Temple%2C_Modhera%2C_Gujarat%2C_India.JPG',
  'Sun Temple, Modhera',
  'Manoj Radhakrishnan, via Wikimedia Commons',
  'CC BY-SA 3.0',
  'https://commons.wikimedia.org/wiki/File:Sun_Temple,_Modhera,_Gujarat,_India.JPG'
),
(
  (select id from public.temples where name = 'Kalika Mata Temple, Pavagadh'),
  'https://upload.wikimedia.org/wikipedia/commons/8/8e/Kalika-mata-temple.jpg',
  'Kalika Mata Temple, Pavagadh',
  'Abhishek199892, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Kalika-mata-temple.jpg'
),
(
  (select id from public.temples where name = 'Ranchhodraiji Temple, Dakor'),
  'https://upload.wikimedia.org/wikipedia/commons/e/e0/Ranchhodji_Temple%2C_Dakor.jpg',
  'Ranchhodraiji Temple, Dakor',
  'Aditya Mahar, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Ranchhodji_Temple,_Dakor.jpg'
),
(
  (select id from public.temples where name = 'Shamlaji Temple'),
  'https://upload.wikimedia.org/wikipedia/commons/9/9d/Shamlaji_Temple_2024.jpg',
  'Shamlaji Temple',
  'Nizil Shah, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Shamlaji_Temple_2024.jpg'
);
