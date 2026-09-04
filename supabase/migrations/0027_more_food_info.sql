-- Ṛtam — another round of annadanam/food info for temples still 'unknown'
--
-- Same standard as migrations 0020/0024: each checked against public
-- sources before writing, guarded so nothing already answered gets
-- overwritten. Temples researched but left as 'unknown' because no
-- reliable public documentation of a formal food service was found:
-- Brihadeeswarar (Thanjavur), Kalkaji Mandir, Kandariya Mahadev, Karni
-- Mata, Vadakkunnathan, Vaidyanath (Deoghar), Trimbakeshwar, Adi
-- Kumbeswarar, Bakreshwar, Chandi Devi (Haridwar), Danteshwari.

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple Annadhanam Hall and nearby ashrams (including Sri Ramanasramam) — free meals, especially valued by those doing the Girivalam circuit',
  food_distance_km = 0.3
where name = 'Arunachaleswarar Temple, Thiruvannamalai (Agni Sthalam)' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple Ootupura (dining hall) near the north gate — free annadanam around midday',
  food_distance_km = 0.1
where name = 'Padmanabhaswamy Temple, Thiruvananthapuram' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple annadanam scheme — free meals to several hundred devotees daily, funded by donations',
  food_distance_km = 0.2
where name = 'Ranganathaswamy Temple, Srirangam' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Sri Bhramaramba Mallikarjuna Devasthanam Annadanam Hall — free meals twice daily, serving thousands',
  food_distance_km = 0.3
where name = 'Mallikarjuna Jyotirlinga, Srisailam' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Shri Omkar Prasadalay near Jhula Pul — meals at a nominal charge rather than fully free',
  food_distance_km = 0.3
where name = 'Omkareshwar Jyotirlinga' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple Anna Prasadam — free unlimited meals through the day',
  food_distance_km = 0.1
where name = 'Kanaka Durga Temple, Vijayawada' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple Annadhanam scheme, running since 2002 — free meals 360 days a year',
  food_distance_km = 0.2
where name = 'Palani Murugan Temple' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Matha Anna Prasadam — free meals to several thousand daily, a practice said to date back to Raghavendra Swamy himself (paused on Ekadasi and eclipse days)',
  food_distance_km = 0.1
where name = 'Sri Raghavendra Swamy Matha, Mantralayam' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Nitya Prasad Bhojan (Annadanam Hall) — free meals daily',
  food_distance_km = 0.2
where name = 'Tulja Bhavani Temple, Tuljapur' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Sri Rama Nitya Annadana Satram — free meals daily at the temple dining hall',
  food_distance_km = 0.2
where name = 'Bhadrachalam Sita Ramachandraswamy Temple' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple Annaprasadam Hall — free meals, serving thousands daily and tens of thousands during festivals',
  food_distance_km = 0.2
where name = 'Sri Kalahasti Temple (Vayu Sthalam)' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple dining hall — free meals daily',
  food_distance_km = 0.1
where name = 'Kamakshi Amman Temple, Kanchipuram' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple free-food service on the 1st of each Malayalam month and on Sundays',
  food_distance_km = 0.2
where name = 'Attukal Bhagavathy Temple' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple Prasadalaya — free vegetarian meals',
  food_distance_km = 0.3
where name = 'Bhimashankar Jyotirlinga' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Annadanam schemes (including Badari-BAKASS) running year-round, supplemented by devotee-run bhandaras in season',
  food_distance_km = 0.3
where name = 'Badrinath Temple' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple annadanam — free vegetarian meals; sponsorship also accepted',
  food_distance_km = 0.2
where name = 'Suchindram Thanumalayan Temple' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple annadanam — free meals daily, sponsorship accepted',
  food_distance_km = 0.2
where name = 'Grishneshwar Jyotirlinga, Ellora' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple Annadanam/Prasadam complex — free meals from 1–3pm daily, plus a special Thiruvonam feast',
  food_distance_km = 0.1
where name = 'Chottanikkara Devi Temple' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Langars run by NGOs and the Shri Amarnath Shrine Board along the yatra route and near the cave — entirely free, seasonal (yatra months only)',
  food_distance_km = 0.0
where name = 'Amarnath Cave Temple' and food_tier = 'unknown';
