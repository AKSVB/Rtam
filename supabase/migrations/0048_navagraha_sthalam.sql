-- Ṛtam — completing the Navagraha Sthalams: nine Tamil Nadu temples, each
-- housing a shrine to one of the nine planetary deities alongside its
-- presiding Shiva (or, at Suryanar Kovil, Surya himself). Vaitheeswaran
-- Koil (Angaraka/Mars) was already in the database; this migration adds
-- the remaining eight, clustered around Kumbakonam and the Cauvery delta.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Suryanar Kovil', 'Suryanarayana (Surya) / Usha Devi, Pratyusha Devi', 'Saura', array['Navagraha Sthalam'], 'India', 'Tamil Nadu', 'Thanjavur', 'Suryanar Koil', 11.02972, 79.47778, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Cauvery', 3, 'Oct–Feb; Sundays are considered especially auspicious.', 'Unusually among the Navagraha Sthalams, this temple — also called Thirumangalagudi — is dedicated directly to Surya (the Sun) himself rather than housing him as a subsidiary shrine to Shiva, with his consorts Usha Devi and Pratyusha Devi. Tradition holds Shiva blessed the nine planetary deities to make this their principal abode. The present masonry structure dates to the reign of the Chola king Kulottunga I in the 11th century, when it was called Kulottunga Chola-Marttandalaya, with later additions by the Vijayanagara kings.', 'Local/regional tradition', 'Dravidian (Chola, Vijayanagara)', 11, 'approved'
),
(
  'Kailasanathar Temple, Thingalur', 'Kailasanathar (Shiva) / Periyanayaki', 'Shaiva', array['Navagraha Sthalam'], 'India', 'Tamil Nadu', 'Thanjavur', 'Thingalur', 10.88667, 79.12556, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Cauvery', 2, 'Oct–Feb.', 'The Navagraha Sthalam for Chandra (the Moon). Tradition holds Chandra married the 28 daughters of Daksha but favoured only the youngest, provoking the others to complain to their father, who cursed Chandra to lose his radiance; worship of Kailasanathar at this thousand-plus-year-old temple is said to have restored it. During the Tamil months of Purattasi and Panguni, moonlight is said to fall directly on the presiding deity. Believed founded by the Pallava king Rajasimha in the 7th century, with later Chola and Nayaka-era renovations.', 'Puranic tradition (Daksha/Chandra legend); local/regional tradition', 'Dravidian (Pallava origins, Chola and Nayaka renovations)', 7, 'approved'
),
(
  'Swetharanyeswarar Temple, Thiruvenkadu', 'Swetharanyeswarar (Shiva)', 'Shaiva', array['Navagraha Sthalam'], 'India', 'Tamil Nadu', 'Mayiladuthurai', 'Thiruvenkadu', 11.17528, 79.80944, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Cauvery (near the coast)', 4, 'Oct–Feb.', 'The Navagraha Sthalam for Budhan (Mercury), worshipped here in a separate shrine beside the presiding Swetharanyeswarar. A Paadal Petra Sthalam sung by the Nayanar saints, the temple is also called Swetaranyam and Adi Chidambaram; tradition holds Indra, Airavata, Surya and Chandra all worshipped here alongside Budhan, and that Shiva took the fierce form of Agoramurthi at this spot to slay the demon Maruthuvasuran.', 'Local/regional tradition; Tevaram canon', 'Dravidian', null, 'approved'
),
(
  'Apatsahayesvarar Temple, Alangudi', 'Apatsahayeswarar (Shiva)', 'Shaiva', array['Navagraha Sthalam'], 'India', 'Tamil Nadu', 'Tiruvarur', 'Alangudi', 10.83, 79.41028, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Cauvery delta', 5, 'Oct–Feb; Thursdays, associated with Guru, are considered auspicious.', 'Known as the Guru Sthalam, this temple houses the Navagraha shrine for Guru (Jupiter), worshipped here in the form of Dakshinamurthy alongside the presiding Apatsahayeswarar. The principal linga is held to be swayambhu (self-manifested), so the temple''s founding cannot be dated with certainty, though it is venerated in ten verses by the 7th-century Nayanar saint Tirugnana Sambandar in the Tevaram, making it a Paadal Petra Sthalam. The current structure was rebuilt in the 16th century under the Nayaks on an earlier Chola-era complex.', 'Tevaram canon; local/regional tradition', 'Dravidian (Chola origins, Nayaka rebuilding)', 16, 'approved'
),
(
  'Agneeswarar Temple, Kanjanur', 'Agneeswarar (Shiva) / Karpagambal', 'Shaiva', array['Navagraha Sthalam'], 'India', 'Tamil Nadu', 'Thanjavur', 'Kanjanur', 11.06583, 79.4625, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Cauvery delta', 3, 'Oct–Feb; Fridays, associated with Sukra, are considered auspicious.', 'The Navagraha Sthalam for Sukra (Venus), who — in keeping with the Saiva belief that Shiva is omnipresent — is held to reside within the presiding deity''s own form. The 7th-century Nayanar saint Thirunavukkarasar sang ten verses in praise of this shrine in the Tevaram, naming the goddess here Karpagambal. The temple traces to the Chola period, with major renovation under the Vijayanagara empire.', 'Tevaram canon; local/regional tradition', 'Dravidian (Chola, Vijayanagara)', null, 'approved'
),
(
  'Tirunallar Dharbaranyeswarar Temple', 'Dharbaraneswarar (Shiva)', 'Shaiva', array['Navagraha Sthalam'], 'India', 'Puducherry', 'Karaikal', 'Thirunallar', 10.92556, 79.79222, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Cauvery delta', 5, 'Oct–Feb; especially crowded during Sani Peyarchi, Saturn''s roughly 2.5-year sign transit.', 'The best known of the Navagraha Sthalams, dedicated to easing the effects of Shani (Saturn). The site was once a forest of sacred dharba grass, and the original linga is said to have been formed of the grass itself — hence Dharbaraneswarar. Tradition holds King Nala, tormented by Shani''s malefic influence, was freed of it after worshipping Shiva here, establishing the temple''s enduring association with relief from Saturn''s effects.', 'Puranic/regional tradition (King Nala legend)', null, null, 'approved'
),
(
  'Tirunageswaram Naganathar Temple', 'Naganathar (Shiva)', 'Shaiva', array['Navagraha Sthalam'], 'India', 'Tamil Nadu', 'Thanjavur', 'Thirunageswaram', 10.96428, 79.42927, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Cauvery', 2, 'Oct–Feb; Sundays are considered auspicious for Rahu worship here.', 'The Navagraha Sthalam for Rahu, also known as the Rahu Sthalam. Tradition holds that serpents — including Adishesha, Takshaka and Karkotaka — worshipped Shiva at this spot, giving the temple its name (Thiru-naga-eswaram, "the lord of serpents"). Believed built by the Chola king Aditya I in the 10th century, with later royal additions, and venerated as a Paadal Petra Sthalam in the Tevaram.', 'Tevaram canon; local/regional tradition', 'Dravidian (Chola)', 10, 'approved'
),
(
  'Nagannathaswamy Temple, Keelaperumpallam', 'Naganatha Swamy (Shiva) / Soundaryanaki', 'Shaiva', array['Navagraha Sthalam'], 'India', 'Tamil Nadu', 'Mayiladuthurai', 'Keelaperumpallam', 11.1351, 79.8353, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Cauvery (near the coast at Poompuhar)', 2, 'Oct–Feb.', 'The Navagraha Sthalam for Ketu, the last of the nine planetary shrines, two kilometres from Poompuhar. The presiding deity is worshipped as Naganatha Swamy with his consort Soundaryanaki, and the shrine to Ketu is housed within the same Chola-era complex.', 'Local/regional tradition', 'Dravidian (Chola)', null, 'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'சூரியனார் கோயில்' where name = 'Suryanar Kovil';
update public.temples set native_name = 'கைலாசநாதர் கோயில், திங்களூர்' where name = 'Kailasanathar Temple, Thingalur';
update public.temples set native_name = 'ஸ்வேதாரண்யேஸ்வரர் கோயில், திருவெண்காடு' where name = 'Swetharanyeswarar Temple, Thiruvenkadu';
update public.temples set native_name = 'ஆபத்சகாயேஸ்வரர் கோயில், ஆலங்குடி' where name = 'Apatsahayesvarar Temple, Alangudi';
update public.temples set native_name = 'அக்னீஸ்வரர் கோயில், கஞ்சனூர்' where name = 'Agneeswarar Temple, Kanjanur';
update public.temples set native_name = 'தர்பாரண்யேஸ்வரர் கோயில், திருநள்ளாறு' where name = 'Tirunallar Dharbaranyeswarar Temple';
update public.temples set native_name = 'நாகநாதர் கோயில், திருநாகேஸ்வரம்' where name = 'Tirunageswaram Naganathar Temple';
update public.temples set native_name = 'நாகநாதசுவாமி கோயில், கீழப்பெரும்பள்ளம்' where name = 'Nagannathaswamy Temple, Keelaperumpallam';
