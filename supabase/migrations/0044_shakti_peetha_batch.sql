-- Ṛtam — closing out the 18 Maha Shakti Peethas (Adi Shankaracharya's
-- Ashtadasha Shakti Peetha Stotram). Of the 18, two lie outside India
-- (Shankari in Sri Lanka, Sharada Peeth in Pakistan-administered Kashmir,
-- inaccessible) and are out of scope for this India-only directory. Of the
-- 16 India-based sites, 12 were already present (some tagged, some not) —
-- this migration adds the 4 that were fully missing and tags the 2 that
-- existed under a different circuit but share the same physical site.

-- ── New temples ──────────────────────────────────────────────────────────

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Renuka Devi Temple, Mahur', 'Renuka / Ekaveerika (Devi)', 'Shakta', array['Shakti Peetha'], 'India', 'Maharashtra', 'Nanded', 'Mahur', 19.8326, 77.9233, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Penganga', 2.5, 'Oct–Feb; the hillock climb is best avoided in peak summer or monsoon.', 'Set on a hillock above Mahur, this is one of Maharashtra''s most revered Devi shrines. Puranic tradition holds that Renuka, wife of the sage Jamadagni and mother of Parashurama, was beheaded by her own son on his father''s command and her head fell here — hence the temple''s Renuka identity. Adi Shankaracharya''s Ashtadasha Shakti Peetha Stotram separately names Mahur as the seat of Ekaveerika, where Sati''s right hand is said to have fallen; the two traditions are worshipped together at this one site, with no image but a vermilion-smeared stone (tandla) as the murti. Mahur is also revered as the birthplace of Dattatreya.', 'Puranic tradition (Renuka/Parashurama legend) and the Ashtadasha Shakti Peetha Stotram', null, null, 'approved'
),
(
  'Puruhutika Devi Temple, Pithapuram', 'Puruhutika (Devi)', 'Shakta', array['Shakti Peetha'], 'India', 'Andhra Pradesh', 'Kakinada', 'Pithapuram', 17.1068, 82.2433, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Godavari', 2, 'Oct–Feb.', 'A small shrine in the north-east corner of the Sri Kukkuteswara Swamy Temple complex, one of the Ashtadasha (18) Shakti Peethas. The goddess is worshipped as Puruhutika — "she worshipped by Puruhuta (Indra)" — depicted with four arms holding a seed-bag, an axe, a lotus, and a honey-vessel. Within the same temple grounds is Pada Gaya Sarovaram, a sacred tank where pilgrims bathe as part of the Gaya-style ancestral rites performed here.', 'Ashtadasha Shakti Peetha tradition', null, null, 'approved'
),
(
  'Alopi Devi Mandir, Prayagraj', 'Alopi Devi / Madhaveshwari (Devi)', 'Shakta', array['Shakti Peetha'], 'India', 'Uttar Pradesh', 'Prayagraj', 'Prayagraj', 25.4451, 81.8712, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Ganga-Yamuna confluence', 2, 'Oct–Feb; very crowded during the Magh Mela and Kumbh Mela years.', 'Also called Prayaga Madhaveshwari, this Ashtadasha Shakti Peetha temple in the Alopi Bagh locality is unusual for having no murti at all. Tradition holds a fragment of Sati fell here and simply vanished ("alop") into the ground, so an empty wooden doli (palanquin cradle), draped in cloth and flowers, is worshipped in its place. A separate, more folk-historical account tells of a bride vanishing from her wedding doli near this spot.', 'Ashtadasha Shakti Peetha tradition; local oral history', null, null, 'approved'
),
(
  'Vishalakshi Temple, Varanasi', 'Vishalakshi (Devi)', 'Shakta', array['Shakti Peetha'], 'India', 'Uttar Pradesh', 'Varanasi', 'Varanasi', 25.30889, 83.01083, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Ganges', 0.1, 'Oct–Mar.', 'Standing at Mir Ghat on the Ganges, Vishalakshi ("the wide-eyed one") is counted among the Ashtadasha Shakti Peethas, where Sati''s earring is held to have fallen; some traditions instead locate her eyes here, giving the goddess her name. The present temple was built in the South Indian style by the Nattukottai Nagarathar merchant community of Tamil Nadu — an inscription dates the structure to 1893 with a kumbhabhishekam in 1908 — and a new stone murti of the goddess was consecrated in 1949. Kashi Vishalakshi is traditionally named alongside Kanchi Kamakshi and Madurai Meenakshi as one of three great Shakti shrines.', 'Ashtadasha Shakti Peetha tradition', 'South Indian (Dravidian), built by the Nattukottai Nagarathar community', 19, 'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'रेणुका देवी मंदिर' where name = 'Renuka Devi Temple, Mahur';
update public.temples set native_name = 'పురుహూతికా దేవి ఆలయం' where name = 'Puruhutika Devi Temple, Pithapuram';
update public.temples set native_name = 'अलोपी देवी मंदिर' where name = 'Alopi Devi Mandir, Prayagraj';
update public.temples set native_name = 'विशालाक्षी मंदिर' where name = 'Vishalakshi Temple, Varanasi';

-- ── Tag existing temples that share a site with a Shakti Peetha ────────────
-- Mallikarjuna Jyotirlinga, Srisailam already carries sthala_purana text
-- noting it is "both a Jyotirlinga and a Shakti Peetha" (Bhramaramba Devi) —
-- just missing the tag. Draksharamam Bhimeswara Temple hosts the Manikyamba
-- shrine (Sati's cheek) on the same premises as the Pancharama Kshetra.

update public.temples
  set significance = significance || array['Shakti Peetha']
  where name = 'Mallikarjuna Jyotirlinga, Srisailam' and not (significance @> array['Shakti Peetha']);

update public.temples
  set significance = significance || array['Shakti Peetha'],
      sthala_purana = sthala_purana || ' The goddess is worshipped here as Manikyamba, and the site is counted among the Ashtadasha Shakti Peethas.'
  where name = 'Draksharamam Bhimeswara Temple' and not (significance @> array['Shakti Peetha']);
