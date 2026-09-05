-- Ṛtam — two more small, finite circuits closed out in one migration:
--
-- Arupadaiveedu (the six abodes of Murugan): five were already present
-- (Thiruparankundram, Tiruchendur, Swamimalai, Pazhamudircholai, and
-- Palani — the last already carrying sthala_purana text describing it as
-- one of the six, just missing the tag). This adds the sixth, Thiruthani,
-- and tags Palani.
--
-- Trilinga Desham (the three lingas historically marking the land of the
-- Telugu-speaking peoples): Srisailam and Draksharamam were already
-- present under other circuits; this adds the third, Kaleshwaram, and
-- tags all three.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Thiruthani Murugan Temple', 'Murugan (Subramanya)', 'Shaiva', array['Arupadaiveedu'], 'India', 'Tamil Nadu', 'Tiruvallur', 'Tiruttani', 13.17183, 79.60377, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Kusasthalaiyar', 8, 'Oct–Feb; the 365 steps to the hilltop shrine are best climbed before the heat of the day.', 'One of the six Arupadaiveedu (sacred abodes of Murugan), set atop a hill 700 feet above the surrounding plain and reached by 365 steps, one for each day of the year. Tradition holds Murugan rested here to compose himself after slaying the demon Surapadman. It is also here that Indra gave his daughter Deivayanai in marriage to Murugan, along with his white elephant Airavata as dowry; Murugan offered to return the elephant, but Indra asked only that it face his direction, and the temple''s elephant image still faces east as a result. The temple is celebrated in the Sangam-era Tirumurugatrupadai of Nakkeerar, with later patronage from the Vijayanagara empire and local chieftains.',  'Sangam-era Tirumurugatrupadai; local/regional tradition', 'Dravidian (Vijayanagara-era patronage)', null, 'approved'
),
(
  'Kaleshwara Mukteshwara Swamy Temple', 'Kaleshwara (Shiva) / Mukteshwara (Yama-linga)', 'Shaiva', array['Trilinga Kshetra'], 'India', 'Telangana', 'Bhupalpally', 'Kaleshwaram', 18.81194, 79.90389, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Godavari–Pranahita confluence', 0.2, 'Oct–Feb.', 'One of the three Trilinga Kshetras traditionally said to mark the ancient boundaries of the Telugu-speaking land — along with Srisailam and Draksharamam in Andhra Pradesh — Kaleshwaram stands at the meeting point of the Godavari, Pranahita, and a third stream locally identified with the Saraswati. Its sanctum is unusual for holding two lingas on a single pedestal, worshipped together as Kaleshwara (Shiva) and Mukteshwara, the latter associated with Yama, the god of death — pilgrims traditionally visit believing worship here can free one from Yama''s hold. The shrine has four doors, one on each side, allowing entry from any direction. First built under the Chalukyas, with major additions under the Kakatiya dynasty.', 'Local/regional tradition (Trilinga Desham)', 'Dravidian/Deccan (Chalukya origins, Kakatiya expansion)', null, 'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'திருத்தணி முருகன் கோயில்' where name = 'Thiruthani Murugan Temple';
update public.temples set native_name = 'శ్రీ కాళేశ్వర ముక్తీశ్వర స్వామి దేవాలయం' where name = 'Kaleshwara Mukteshwara Swamy Temple';

-- ── Tag existing temples that complete these circuits ──────────────────────

update public.temples
  set significance = significance || array['Arupadaiveedu']
  where name = 'Palani Murugan Temple' and not (significance @> array['Arupadaiveedu']);

update public.temples
  set significance = significance || array['Trilinga Kshetra']
  where name = 'Mallikarjuna Jyotirlinga, Srisailam' and not (significance @> array['Trilinga Kshetra']);

update public.temples
  set significance = significance || array['Trilinga Kshetra']
  where name = 'Draksharamam Bhimeswara Temple' and not (significance @> array['Trilinga Kshetra']);
