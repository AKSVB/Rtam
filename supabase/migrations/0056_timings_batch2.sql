-- Ṛtam — published darshan timings for 14 more major temples. As with the
-- previous timings batch, published hours vary by source and season; the
-- windows below are the most commonly cited baseline, with variation and
-- any unusual schedule called out in timings_notes. Karni Mata, Chintpurni,
-- and Naina Devi are represented as a single continuous "morning" session
-- since sources describe them as open through the day with no midday
-- closure, rather than forcing them into a two-session shape that doesn't
-- match how they actually run.

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '12:00',
  evening_opens_at = '16:00', evening_closes_at = '20:00',
  timings_notes = 'Overall gates open 5:30am–8:30pm; stays open till 9:30pm on Fridays and 10:30pm on Purnima.'
where name = 'Kamakshi Amman Temple, Kanchipuram';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '12:30',
  evening_opens_at = '16:00', evening_closes_at = '20:30',
  timings_notes = 'Schedules may shift on festival days.'
where name = 'Ekambareswarar Temple, Kanchipuram (Prithvi Sthalam)';

update public.temples set
  morning_opens_at = '05:00', morning_closes_at = '12:30',
  evening_opens_at = '16:00', evening_closes_at = '21:30',
  timings_notes = 'Open 24 hours (5am to next-day 5am) on Maha Shivaratri.'
where name = 'Kapaleeshwarar Temple, Chennai';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '12:00',
  evening_opens_at = '16:00', evening_closes_at = '21:00',
  timings_notes = 'Opens earlier (5:30am) on Saturdays and stays open till 10pm that day.'
where name = 'Parthasarathy Temple, Chennai';

update public.temples set
  morning_opens_at = '04:30', morning_closes_at = '11:30',
  evening_opens_at = '17:00', evening_closes_at = '20:00',
  timings_notes = 'Annadanam (free meals) served 11am–1pm daily.'
where name = 'Vaikom Mahadeva Temple';

update public.temples set
  morning_opens_at = '04:00', morning_closes_at = '12:00',
  evening_opens_at = '16:00', evening_closes_at = '21:00',
  timings_notes = 'Closed roughly 1–3pm for rituals and puja preparation.'
where name = 'Sri Krishna Matha, Udupi';

update public.temples set
  morning_opens_at = '06:30', morning_closes_at = '13:00',
  evening_opens_at = '15:30', evening_closes_at = '20:30',
  timings_notes = 'Extended on Mondays and Sundays (morning to ~4pm, evening to ~9pm); reported hours vary somewhat across sources.'
where name = 'Dharmasthala Manjunatha Temple';

update public.temples set
  morning_opens_at = '07:30', morning_closes_at = '14:00',
  evening_opens_at = '15:30', evening_closes_at = '21:00',
  timings_notes = 'Overall hilltop gates open 6am–9pm. Abhishekam 6–7:30am and 6–7:30pm (5–6:30am on Fridays).'
where name = 'Chamundeshwari Temple, Mysore';

update public.temples set
  morning_opens_at = '04:30', morning_closes_at = '12:00',
  evening_opens_at = '15:00', evening_closes_at = '21:00',
  timings_notes = 'The sanctum also closes briefly through the day for Ekantha seva; the schedule shifts during Brahmotsavam and Vaikunta Ekadasi.'
where name = 'Bhadrachalam Sita Ramachandraswamy Temple';

update public.temples set
  morning_opens_at = '04:00', morning_closes_at = '22:00',
  timings_notes = 'Open continuously through the day with no midday closure. Live-streamed Mangala Aarti is at 4am.'
where name = 'Karni Mata Temple, Deshnoke';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '13:30',
  evening_opens_at = '15:00', evening_closes_at = '20:30',
  timings_notes = 'Summer hours extend slightly later at both ends (6am–9pm); around Kartik Purnima and the Pushkar Mela, expect longer hours and heavy crowds.'
where name = 'Pushkar Brahma Temple';

update public.temples set
  morning_opens_at = '10:30', morning_closes_at = '13:30',
  evening_opens_at = '17:00', evening_closes_at = '19:30',
  timings_notes = 'There is also an early Mangala darshan window, roughly 4:30–7am, not reflected in the two sessions above.'
where name = 'Eklingji Temple, Kailashpuri';

update public.temples set
  morning_opens_at = '05:00', morning_closes_at = '22:00',
  timings_notes = 'Open continuously through the day; winter hours run 4am–10pm and summer roughly 5:30am–9:30pm. Closed during a solar/lunar eclipse (grahan).'
where name = 'Chintpurni Temple';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '22:00',
  timings_notes = 'Open continuously through the day; live-streamed aarti/darshan runs 4–10am on regular days, and the temple stays open through the night during Navratri.'
where name = 'Naina Devi Temple';
