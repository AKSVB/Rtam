-- Ṛtam — verified food_tier upgrades (all pure_veg_available) for 8 more
-- temples with documented, ongoing annadanam/anna-prasada programs — not
-- just festival-day bhandaras.

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Daily Annadanam hall run by the temple, alongside the temple''s well-known pulihora and laddu prasadam',
  food_distance_km = 0
where name = 'Basara Gnana Saraswati Temple';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'The temple runs ongoing charitable food service for visitors and the community alongside its hospital and school',
  food_distance_km = 0
where name = 'Sankat Mochan Hanuman Temple, Varanasi';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Nithyam Annam Trust — serves free sattvic meals (rice, sambar, kootu, rasam, vadai) to pilgrims daily in Chidambaram town',
  food_distance_km = 0.5
where name = 'Thillai Nataraja Temple, Chidambaram (Akasha Sthalam)';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple-run Annadanam, served daily 11am–1pm',
  food_distance_km = 0
where name = 'Vaikom Mahadeva Temple';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Sri Ahobila Matam''s Annamacharya Nitya Annadanam Trust — free curd rice morning and evening, full meals (Tadiyaradhanam) at noon',
  food_distance_km = 0
where name = 'Ahobilam Narasimha Temple';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Anna Prasada dining hall — free lunch from around 12:30pm daily',
  food_distance_km = 0
where name = 'Murudeshwara Temple';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple Annadanam served daily at 12:15pm',
  food_distance_km = 0
where name = 'Sarangapani Temple, Kumbakonam';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Amrutanna Prasad Bhojana — free meals served twice daily, roughly noon–2pm and 7:30–8:30pm',
  food_distance_km = 0.2
where name = 'Gokarna Mahabaleshwar Temple';
