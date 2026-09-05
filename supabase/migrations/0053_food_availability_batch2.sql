-- Ṛtam — verified food_tier upgrades for 8 well-documented major temples.
-- All confirmed via multiple independent sources describing an ongoing,
-- temple-run (not just festival-day) free or subsidized vegetarian meal
-- or prasadam-distribution program.

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Palpayasam prasadam counter — the temple''s famous sweet milk payasam, distributed after the midday pooja',
  food_distance_km = 0
where name = 'Ambalapuzha Sree Krishna Temple';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Chhappan Bhog prasad distributed to devotees after each darshan — peda, laddu, makhan mishri, panchamrit, and seasonal fruit',
  food_distance_km = 0
where name = 'Shrinathji Temple, Nathdwara';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Daily bhandara — free vegetarian meals organized by devotees and the temple, with larger bhandaras during Phalgun and the Chaitra/Ashvin Purnima fairs',
  food_distance_km = 0
where name = 'Khatu Shyam Ji Temple';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple-run Annadana hall — free vegetarian lunch and dinner daily to all visitors, no coupon or payment needed',
  food_distance_km = 0.1
where name = 'Kukke Subramanya Temple';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Anna Prasadam dining hall — free meals daily, roughly noon–3pm; a token is handed out on the way out of the temple',
  food_distance_km = 0
where name = 'Mahalakshmi Temple, Kolhapur';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Anna Dhana — free vegetarian meals, a tradition since the temple''s founding in 1912, with especially large-scale service during Navaratri',
  food_distance_km = 0
where name = 'Kudroli Gokarnanatheshwara Temple';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Nitya Annadanam, running since 1991 — free afternoon meals and an evening alpahara (light refreshment)',
  food_distance_km = 0
where name = 'Sri Varasiddhi Vinayaka Temple, Kanipakam';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Annaprasadam hall serving roughly 500 devotees daily free of charge, alongside daily distribution of Pulihora and Daddojanam prasadam',
  food_distance_km = 0
where name = 'Yadagirigutta Lakshmi Narasimha Temple';
