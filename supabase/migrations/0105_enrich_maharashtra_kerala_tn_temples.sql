-- Ṛtam — enrichment update for 10 existing, thinly-filled temples: the five
-- Ashtavinayak temples not yet detailed (Moreshwar, Ballaleshwar,
-- Varadavinayak, Girijatmaj, Mahaganapati), Saptashrungi Devi, Khandoba
-- (Jejuri), Shani Shingnapur, Ettumanoor Mahadeva and Tiruchendur Murugan.
-- Sourced mainly from Wikipedia and maharashtratourism.gov.in; distance
-- figures that came only from low-authority SEO/travel-blog sites (the sole
-- source found for them) are kept but captioned as unverified in the notes
-- field rather than treated as fact, per the site's stated policy.
-- Conflicting sources are stated, not resolved.

update public.temples set
  sthala_purana = $$Ganesha, in his form as Mayureshwar/Moreshwar, is believed to have slain the demon Sindhu here while riding a peacock (mayura). Local tradition holds the Ashtavinayak pilgrimage circuit both begins and traditionally should end at this temple.$$,
  sthala_purana_source = 'Wikipedia (Ganesha Temple, Morgaon; Ashtavinayaka)',
  architecture_style = 'Black-stone fort-like structure with four minaret-topped gates showing Islamic/Bahmani architectural influence, giving it a mosque-like exterior',
  construction_century = null,
  etiquette_notes = null,
  timings_notes = 'Not independently verified for this temple (a 4:15am–9pm figure found online is for the Siddhatek Ashtavinayak temple, a different shrine, and is not used here).',
  accessibility_notes = null,
  nearest_airport_name = 'Pune International Airport (Lohegaon)', nearest_airport_distance_km = 80,
  nearest_railway_station_name = 'Jejuri railway station', nearest_railway_distance_km = 17,
  nearest_river_name = 'Karha River', river_distance_km = 0
where name = 'Moreshwar Temple, Morgaon';

update public.temples set
  sthala_purana = $$Named after Ballal, a young devotee whose intense devotion to Ganesha so alarmed his father that he tried to stop it; Ganesha saved Ballal and stayed on as "Ballaleshwar" — the only Ashtavinayak temple named after a devotee rather than the deity's own form.$$,
  sthala_purana_source = 'maharashtratourism.gov.in (Ashtavinayak, Pali)',
  architecture_style = 'Peshwa-era Maratha temple architecture, built in the shape of the Devanagari letter "Shri"; the original wooden shrine was later replaced with the present stone structure',
  construction_century = null,
  etiquette_notes = 'Men are asked to wear a dhoti to perform puja inside the inner sanctum, per temple-visit guides — not confirmed against an official temple-trust source.',
  timings_notes = 'Reported as 5:30am–10pm by a travel site; not corroborated by an official source.',
  accessibility_notes = null,
  nearest_airport_name = 'Pune International Airport (Lohegaon)', nearest_airport_distance_km = null,
  nearest_railway_station_name = 'Karjat railway station', nearest_railway_distance_km = 30,
  nearest_river_name = null, river_distance_km = null
where name = 'Ballaleshwar Temple, Pali';

update public.temples set
  sthala_purana = $$The Varadvinayak idol is said to have been found immersed in the adjoining lake around 1690 CE; the temple and the town of Mahad were built around it by Ramji Mahadev Biwalkar, a Kalyan subhedar, in 1725 (some sources credit Ranoji Shinde instead).$$,
  sthala_purana_source = 'maharashtratourism.gov.in (Ashtavinayak, Mahad)',
  architecture_style = 'A small shrine (about 8 ft square) with a gold-plated dome around 25 ft high, ringed by carved elephant statues — Peshwa-period Maratha temple style',
  construction_century = 18,
  etiquette_notes = 'The only Ashtavinayak temple where devotees may approach and personally touch the idol, rather than viewing it from a distance.',
  timings_notes = null,
  accessibility_notes = null,
  nearest_airport_name = 'Mumbai (Chhatrapati Shivaji Maharaj International) or Pune Airport', nearest_airport_distance_km = null,
  nearest_railway_station_name = 'Karjat or Khopoli railway station', nearest_railway_distance_km = 20,
  nearest_river_name = 'Savitri River', river_distance_km = 0
where name = 'Varadavinayak Temple, Mahad';

update public.temples set
  sthala_purana = $$Worshipped as Girijatmaj, "son of Girija (Parvati)" — Ganesha's child form. Local tradition holds Parvati did penance in this cave before Ganesha's birth. The shrine occupies Cave 7 of the ancient Lenyadri Buddhist cave complex, later adapted into a Ganesha shrine.$$,
  sthala_purana_source = 'Wikipedia (Lenyadri)',
  architecture_style = 'A rock-cut Buddhist vihara of the 1st–3rd century CE, repurposed as a Hindu shrine rather than built in a classical temple style: an unpillared hall with 20 monk cells carved into the rock',
  construction_century = null,
  etiquette_notes = null,
  timings_notes = 'Sources disagree: one gives 6am–6pm with a Panchamrit Puja at 8am, another gives 5am–8pm. Neither source is authoritative; flagged, not resolved.',
  accessibility_notes = 'A steep climb of roughly 300 stone steps up the hillside to Cave 7 (307 per one source, 338 per another); no wheelchair access is documented.',
  nearest_airport_name = 'Pune International Airport (Lohegaon)', nearest_airport_distance_km = 98,
  nearest_railway_station_name = 'Talegaon railway station', nearest_railway_distance_km = 85,
  nearest_river_name = 'Kukadi River', river_distance_km = null
where name = 'Girijatmaj Temple, Lenyadri';

update public.temples set
  sthala_purana = $$Tradition holds that Shiva himself worshipped Ganesha here before setting out to defeat the demon Tripurasura, hence the name "Mahaganapati."$$,
  sthala_purana_source = 'Wikipedia (Ashtavinayaka)',
  architecture_style = 'East-facing shrine with the deity seated on a lotus flanked by consorts Riddhi and Siddhi; a grand Peshwa-era gateway with Jay-Vijay guardian figures and large flanking elephant sculptures',
  construction_century = null,
  etiquette_notes = null,
  timings_notes = 'Reported as 5am–10pm by a travel site; not corroborated by an official source.',
  accessibility_notes = null,
  nearest_airport_name = 'Pune International Airport (Lohegaon)', nearest_airport_distance_km = 50,
  nearest_railway_station_name = null, nearest_railway_distance_km = null,
  nearest_river_name = null, river_distance_km = null
where name = 'Mahaganapati Temple, Ranjangaon';

update public.temples set
  sthala_purana = $$The Goddess — an 18-armed image carved directly into the cliff rock and coated in sindoor — is revered as one of Maharashtra's three-and-a-half Shaktipeethas (with Mahalakshmi-Kolhapur, Tulja Bhavani-Tuljapur and Renuka-Mahur), and among the 51 Shaktipeethas of the subcontinent.$$,
  sthala_purana_source = 'Wikipedia (Saptashrungi)',
  architecture_style = 'Not a constructed temple in the conventional sense — a natural rock-cut cave shrine on a Sahyadri cliff face at about 1,230 m elevation',
  construction_century = null,
  etiquette_notes = null,
  timings_notes = 'Per a moderate-authority panchang site, not an official schedule: darshan 6am–9pm; Kakad Aarti 5:30–6:30am; Panchamrit Mahapuja 7–8am; Mahanaivedya Aarti 12–1pm; Sandhya Aarti 7–8pm.',
  accessibility_notes = 'Reached by more than 500 stone steps cut into the hillside (472 built in 1710, more added in 1768); a ropeway covering the same climb is also available.',
  nearest_airport_name = 'Ojhar / Nashik International Airport', nearest_airport_distance_km = 70,
  nearest_railway_station_name = 'Nashik Road railway station', nearest_railway_distance_km = 75,
  food_source_name = 'Temple-trust guesthouse, on site', food_distance_km = 0,
  nearest_river_name = null, river_distance_km = null
where name = 'Saptashrungi Devi Temple, Vani';

update public.temples set
  sthala_purana = $$Khandoba, a form of Shiva/Martanda-Bhairava, is worshipped here as the patron deity of the Marathas; the temple became a symbol of Maratha military pride, and houses Portuguese church bells brought as war trophies by Chimaji Appa after the 1737 Battle of Vasai.$$,
  sthala_purana_source = 'Wikipedia (Khandoba Temple, Jejuri); Deccan Herald',
  architecture_style = 'Hemadpanthi',
  construction_century = 12,
  etiquette_notes = 'At the Bhandara festival, devotees throw turmeric powder (bhandara) over each other and the temple — a festival custom rather than a standing dress code.',
  timings_notes = 'No published official schedule was found.',
  accessibility_notes = 'Nearly 200 steps lead to the main sanctum, approachable by three flights of steps (east, west and north, the north being the main entrance); not documented as wheelchair accessible.',
  nearest_airport_name = 'Pune International Airport (Lohegaon)', nearest_airport_distance_km = 55,
  nearest_railway_station_name = 'Jejuri railway station', nearest_railway_distance_km = 4,
  nearest_river_name = 'Karha River', river_distance_km = null
where name = 'Khandoba Temple, Jejuri';

update public.temples set
  sthala_purana = $$Legend holds that after a flood, villagers found a large black stone (svayambhu, self-manifested) floating in the Panasnala stream; when a shepherd struck it with a stick, it reportedly bled, and the stone was installed in the village as the deity Shani.$$,
  sthala_purana_source = 'Wikipedia (Shani Shingnapur)',
  architecture_style = 'Not a conventional built temple — a 5.5 ft black rock stands on an open platform with no roof, doors or surrounding walls; a trishul stands beside it and a Nandi faces it from the south, with mustard oil poured continuously over the idol from a suspended vessel',
  construction_century = null,
  etiquette_notes = 'The entire village is well known for having no doors or locks on homes or shops (including the local bank branch), reflecting communal faith in the deity''s protection — a village-wide custom, not a temple rule.',
  timings_notes = 'Sources disagree: one gives 7am–8:30pm, another describes it as open 24 hours (consistent with there being no doors to close). Flagged, not resolved.',
  accessibility_notes = null,
  nearest_airport_name = 'Chhatrapati Sambhajinagar (Aurangabad) Airport', nearest_airport_distance_km = 90,
  nearest_railway_station_name = 'Rahuri railway station', nearest_railway_distance_km = 32,
  nearest_river_name = 'Panasnala River', river_distance_km = null
where name = 'Shani Shingnapur Temple';

update public.temples set
  sthala_purana = $$Local tradition associates the temple with worship by the Pandavas and the sage Vyasa. The present structure, including its fortifications, was rebuilt in 717 ME (1542 CE).$$,
  sthala_purana_source = 'Wikipedia (Ettumanoor Mahadevar Temple)',
  architecture_style = 'Traditional Kerala temple architecture: a copper-tiled circular sanctum with 14 ornamental finials, a golden dwajasthambham, carved woodwork and Dravidian-influenced mural paintings — including the "Pradosha Nritham" (Shiva''s dance) fresco, regarded as one of India''s finest temple murals',
  construction_century = 16,
  etiquette_notes = null,
  timings_notes = '4am–12pm and 5pm–8pm, per a moderate-authority source — not confirmed against the Devaswom board''s own listing.',
  accessibility_notes = null,
  nearest_airport_name = 'Cochin International Airport (Nedumbassery)', nearest_airport_distance_km = 75,
  nearest_railway_station_name = 'Ettumanoor railway station', nearest_railway_distance_km = 2.2,
  nearest_river_name = 'Meenachil River', river_distance_km = null
where name = 'Ettumanoor Mahadeva Temple';

update public.temples set
  sthala_purana = $$Known by the puranic name Jayanthipuram. Legend holds that Skanda (Murugan) vanquished the demon Soorapadman and his army at his sea-fortress here. It is the only one of the six Arupadaiveedu (Six Abodes of Murugan) situated directly on the seashore.$$,
  sthala_purana_source = 'Wikipedia (Subramaniya Swamy Temple, Tiruchendur)',
  architecture_style = 'Dravidian, built largely of red sandstone; unusually for a Dravidian temple, its nine-tier Raja Gopuram (about 157 ft/48 m high) faces west rather than east',
  construction_century = null,
  etiquette_notes = null,
  timings_notes = 'General daily hours around 5am–9pm (paid-darshan queue closes 6:30pm, general queue 7pm), with extended hours during festivals — per a recent news report, not an official schedule.',
  accessibility_notes = null,
  nearest_airport_name = 'Tuticorin (Thoothukudi) Airport', nearest_airport_distance_km = 27,
  nearest_railway_station_name = 'Tiruchendur railway station', nearest_railway_distance_km = 0,
  nearest_river_name = null, river_distance_km = null
where name = 'Tiruchendur Murugan Temple';
