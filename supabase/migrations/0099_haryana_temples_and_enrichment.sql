-- Ṛtam — 2 new Haryana temples (the only prior Haryana entry, Bhadrakali
-- Temple Kurukshetra, confirmed still the sole one via a direct database
-- query before writing this batch), plus practical-detail enrichment for
-- 3 existing temples that were missing timings/accessibility/nearest-
-- airport/nearest-railway fields.
--
-- A third Haryana candidate, Jyotisar (the Gita-updesh site near
-- Kurukshetra), was researched but deliberately left out of this batch —
-- it's a historical/pilgrimage site centred on a sacred tree and a modern
-- monument rather than a single-deity temple, and doesn't fit this
-- schema's "deity" field cleanly. Worth adding later with a clearer
-- modelling decision, not forced in here.
--
-- Sheetla Mata Mandir, Gurugram has two genuinely conflicting founding
-- accounts in the sources (an 18th-century Jat-king donation vs. a
-- mythological "founded in 1000 AD" framing) — both are noted rather than
-- one being silently picked. Neither temple is entered into any named
-- pilgrimage circuit: both are loosely called "a Shakti Peetha" by
-- low-quality tourism sites, but neither appears on the standard 51-site
-- scholarly list, so `significance` is left empty for both.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Sheetla Mata Mandir, Gurugram', 'Sheetla Devi — goddess of protection from smallpox and fevers, and the kuldevi (patron goddess) of Gurugram; local tradition identifies her with Kripi, wife of Dronacharya from the Mahabharata', 'Shakta', array[]::text[], 'India', 'Haryana', 'Gurugram', 'Gurugram', 28.4783, 77.0305, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Navratri (both Chaitra and Ashvin) is the major season; Chaitra-month Mondays are especially busy. A week-long fair falls in Ashadha/Sawan, alongside an annual "Gardabh Mela" (donkey fair) distinctive to this site.',
  $$Sources genuinely disagree on the temple's origin, and both are recorded here rather than one being picked silently: one tradition holds the goddess was a real woman, Kripi, devoted to nursing smallpox-afflicted children, with villagers building a shrine after her death; a separate mythological framing (repeated on the temple's own Wikipedia page) dates the site to "1000 AD" tied to Yudhishthira in the Dvapara Yuga; a third, tourism-sourced account credits an 18th-century Jat king, Jawahar Singh of Bharatpur, with building the temple to commemorate a military victory.$$,
  'Local tradition (multiple conflicting accounts); no single documented founding date', null, null,
  null,
  'Per tourism sources, not an official schedule: roughly 5am–12pm and 4–9pm.',
  null,
  'Indira Gandhi International Airport, Delhi', 17, 'Gurugram Railway Station', 3, 'approved'
),
(
  'Mata Mansa Devi Mandir, Panchkula', 'Mansa Devi — a form of Shakti also invoked for protection from snakebite', 'Shakta', array[]::text[], 'India', 'Haryana', 'Panchkula', 'Panchkula', 30.76528, 76.82694, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Navratri in both Chaitra (Mar–Apr) and Ashvin (Sep–Oct) are the major fairs, each drawing very large crowds daily.',
  $$Local tradition holds this is one of the sites where a part of Sati fell (a "Shakti Peetha" in the loose, non-canonical sense some regional sources use — it is not on the standard scholarly 51-site list, so is not tagged as such here). The documented, verifiable history is more recent: the present main temple was built by Maharaja Gopal Singh of Manimajra between 1811 and 1815, with a subsidiary shrine (the Patiala Shivalaya, containing painted wall panels dated 1870 Vikram Samvat) added around 1840. The Haryana government constituted the Shri Mata Mansa Devi Shrine Board to administer the complex in 1991.$$,
  'Wikipedia; Haryana Tourism', 'North Indian temple architecture', 19,
  'A roughly 100-acre complex at the foot of the Shivalik hills with several sub-shrines alongside the main temple — expect very long queues during Navratri.',
  'Summer roughly 4am–10pm, winter roughly 5am–9pm; aartis around 5am and 6am.',
  'A large, mostly flat paved complex; some sub-shrines within the grounds involve short flights of steps, but unlike Naina Devi or Chandi Devi the main approach is not a hill-climb.',
  'Chandigarh Airport', 17, 'Chandigarh Railway Station', 8, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Mata Mansa Devi Mandir, Panchkula'),
  'https://upload.wikimedia.org/wikipedia/commons/a/a7/MATA_MANSA_DEVI_PANCHKULA%2C_HARYANA_at_steps_after_main_gate.jpg',
  'Mata Mansa Devi Mandir, Panchkula',
  'Aerorahulraj, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:MATA_MANSA_DEVI_PANCHKULA,_HARYANA_at_steps_after_main_gate.jpg'
);

-- ── enrichment: practical details for 3 existing temples ────────────────

update public.temples set
  timings_notes = 'Cave open for darshan roughly 6am–4pm during the yatra window itself. The season is strictly limited to about 40–60 days each summer (from Vyas Purnima to Shravan Purnima on the lunar calendar), typically falling within July–August — exact dates are fixed annually by the Shri Amarnathji Shrine Board, not a fixed calendar range.',
  nearest_airport_name = 'Srinagar Airport', nearest_airport_distance_km = 93,
  nearest_railway_station_name = 'Jammu Tawi', nearest_railway_distance_km = 315
where name = 'Amarnath Cave Temple';
-- Airport/rail distances above are road-distance to the Baltal/Pahalgam
-- base camps respectively (the practical arrival points, since the cave
-- itself has no road) rather than straight-line to the cave — sources
-- vary noticeably depending on which base camp and route are used as the
-- reference point, so treat these as approximate.

update public.temples set
  timings_notes = 'Per the temple trust''s own site: morning aarti 6–6:30am, morning darshan 6:30–11:30am, afternoon darshan 12:30–5pm, evening aarti 7–7:30pm, evening darshan 7:30pm–midnight. Some tourism aggregators instead list a shorter evening window closing around 9pm — the temple trust''s own figures are used here.',
  accessibility_notes = 'Wheelchairs are available at the VIP Plaza (Main Shakti Gate), with an assistance point for senior citizens there too; darshan queue wait is typically 30–40 minutes. This is distinct from the nearby Gabbar Hill shrine (a related but separate pilgrimage point), which involves 999+ steps and is not wheelchair-accessible.',
  nearest_airport_name = 'Sardar Vallabhbhai Patel International Airport, Ahmedabad', nearest_airport_distance_km = 185,
  nearest_railway_station_name = 'Abu Road Railway Station', nearest_railway_distance_km = 20
where name = 'Ambaji Temple';
-- Abu Road, the nearest railhead, is just across the state border in
-- Rajasthan — correct, not an error. Construction century is left null:
-- the one specific claim found ("14th century, built by a Vallabhi-
-- dynasty king") is internally inconsistent, since the historical
-- Maitraka/Vallabhi dynasty ruled the 5th–8th century CE, not the 14th.

update public.temples set
  timings_notes = 'Per tourism sources, not an official temple-board schedule: roughly 6am–10pm daily.',
  nearest_airport_name = 'Prayagraj Airport (Bamrauli)', nearest_airport_distance_km = 13,
  nearest_railway_station_name = 'Prayagraj Junction', nearest_railway_distance_km = 6
where name = 'Alopi Devi Mandir, Prayagraj';
-- Accessibility notes intentionally left blank rather than guessed — no
-- source (including official UP Tourism listings) confirmed specific
-- mobility-access details for this temple; it's described only as a
-- small neighbourhood shrine with no hill/stair access implied.
