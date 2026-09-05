-- Ṛtam — published darshan timings for 14 major, high-traffic temples.
-- Indian temple hours shift with season, festivals, and Ekadashi, and
-- published sources frequently disagree by 30 minutes to an hour — the
-- windows below are the most commonly cited baseline, with the variation
-- and any unusual schedule (e.g. Nathdwara's jhanki system, Vaishno Devi's
-- round-the-clock darshan) called out in timings_notes.

update public.temples set
  morning_opens_at = '05:30', morning_closes_at = '12:00',
  evening_opens_at = '16:00', evening_closes_at = '20:30',
  timings_notes = 'Shifts by roughly 30–60 minutes with the season and on Ekadashi; sources disagree slightly, so confirm locally.'
where name = 'Krishna Janmabhoomi Temple, Mathura';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '12:30',
  evening_opens_at = '15:30', evening_closes_at = '21:00',
  timings_notes = 'Extended to roughly 3:30am–11pm during Maha Shivratri.'
where name = 'Lingaraj Temple, Bhubaneswar';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '12:30',
  evening_opens_at = '16:30', evening_closes_at = '21:00',
  timings_notes = 'Reported hours vary by up to 30 minutes across sources; confirm locally.'
where name = 'Virupaksha Temple, Hampi';

update public.temples set
  morning_opens_at = '05:30', morning_closes_at = '12:15',
  evening_opens_at = '16:00', evening_closes_at = '19:30',
  timings_notes = 'Darshan actually follows eight separate Jhanki (glimpse) windows through the day — Mangala, Shringar, Rajbhog, Sandhya, Shayan, and others — rather than one continuous block; the schedule shifts further around Janmashtami, Holi (Phool Phag), and Diwali.'
where name = 'Shrinathji Temple, Nathdwara';

update public.temples set
  morning_opens_at = '05:30', morning_closes_at = '13:00',
  evening_opens_at = '17:00', evening_closes_at = '21:00',
  timings_notes = 'Summer hours run roughly an hour either side (4:30am–12:30pm, 4–10pm); open 24 hours during Ekadashi and the Phalgun Mela.'
where name = 'Khatu Shyam Ji Temple';

update public.temples set
  morning_opens_at = '04:00', morning_closes_at = '13:00',
  evening_opens_at = '15:00', evening_closes_at = '22:00',
  timings_notes = 'Runs 24×7 during the Chaitra and Ashwin Purnima fairs.'
where name = 'Salasar Balaji Temple';

update public.temples set
  morning_opens_at = '04:00', morning_closes_at = '12:00',
  evening_opens_at = '16:00', evening_closes_at = '21:30',
  timings_notes = 'Reported hours vary noticeably across sources — confirm locally, especially around the busy Tuesday/Saturday darshan.'
where name = 'Mehandipur Balaji Temple';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '12:00',
  evening_opens_at = '16:00', evening_closes_at = '20:00',
  timings_notes = 'Open every day including public holidays; some sources report a longer midday closure (up to 4pm).'
where name = 'Vishnupad Temple, Gaya';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '12:30',
  evening_opens_at = '16:00', evening_closes_at = '20:30',
  timings_notes = 'Sanctum closed roughly 12:30–4pm daily for rituals.'
where name = 'Brihadeeswarar Temple, Thanjavur';

update public.temples set
  morning_opens_at = '05:30', morning_closes_at = '13:00',
  evening_opens_at = '14:30', evening_closes_at = '17:30',
  timings_notes = 'Closed for about three days during the Ambubachi Mela in June; may open earlier on Mondays and festival days.'
where name = 'Kamakhya Temple';

update public.temples set
  timings_notes = 'The Bhawan offers darshan 24 hours a day, closing only briefly for the Mangala Aarti (roughly 6:20–8am) and evening Aarti (roughly 7:20–8:30pm). Waiting time varies hugely by season, from 1–2 hours in Feb/Mar to 6–9 hours during festivals.'
where name = 'Vaishno Devi Temple, Katra';

update public.temples set
  morning_opens_at = '06:30', morning_closes_at = '12:00',
  evening_opens_at = '14:30', evening_closes_at = '22:00',
  timings_notes = 'Doors close 12–2pm for a private bhog to Ram Lalla. Aartis: Mangala 4:30am, Shringar 6:30am, Sandhya 7pm, Shayan 10pm.'
where name = 'Ram Mandir, Ayodhya';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '12:30',
  evening_opens_at = '15:00', evening_closes_at = '20:30',
  timings_notes = 'Evening hours extend to roughly 9pm from April to September.'
where name = 'Dakshineswar Kali Temple, Kolkata';

update public.temples set
  morning_opens_at = '05:00', morning_closes_at = '14:00',
  evening_opens_at = '17:00', evening_closes_at = '22:30',
  timings_notes = 'Closed roughly 2–5pm for Bhog; some sources cite a shorter 1–3pm break instead.'
where name = 'Kalighat Kali Temple';
