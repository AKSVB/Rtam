-- Ṛtam — a structured festival calendar
--
-- Pulls the festival mentions that were previously buried in prose inside
-- best_season_notes out into real, queryable data, so the site can answer
-- "what's happening this month" across the whole directory rather than
-- only within a single temple's notes.
--
-- Exact dates for Hindu festivals follow lunar/regional calendars and shift
-- year to year, so `month` records the typical month(s) rather than a
-- fixed date — `notes` calls out when it varies more than that.

create table public.temple_festivals (
  id uuid primary key default gen_random_uuid(),
  temple_id uuid not null references public.temples (id) on delete cascade,
  name text not null,
  -- Primary month the festival usually falls in (1 = January … 12 = December).
  month smallint not null check (month between 1 and 12),
  -- Set when the festival typically spans into the following month too,
  -- e.g. Margazhi (Dec/Jan) — lets the calendar list it under both.
  secondary_month smallint check (secondary_month between 1 and 12),
  notes text,
  created_at timestamptz not null default now()
);

comment on table public.temple_festivals is
  'Structured festival calendar, one row per festival per temple. Curated centrally for now rather than crowdsourced.';

create index temple_festivals_temple_id_idx on public.temple_festivals (temple_id);
create index temple_festivals_month_idx on public.temple_festivals (month);

alter table public.temple_festivals enable row level security;

create policy "Anyone can read festivals for approved temples"
  on public.temple_festivals for select
  to anon, authenticated
  using (
    exists (
      select 1 from public.temples t
      where t.id = temple_festivals.temple_id and t.status = 'approved'
    )
  );

grant usage on schema public to anon, authenticated;
grant select on public.temple_festivals to anon, authenticated;

-- ── Seed data ─────────────────────────────────────────────────────────────

insert into public.temple_festivals (temple_id, name, month, secondary_month, notes) values
((select id from public.temples where name = 'Palani Murugan Temple'), 'Thaipusam', 1, 2, 'One of the largest Murugan festivals anywhere.'),
((select id from public.temples where name = 'Meenakshi Amman Temple, Madurai'), 'Meenakshi Thirukalyanam', 4, 5, 'The celestial wedding of Meenakshi and Sundareswarar draws enormous crowds.'),
((select id from public.temples where name = 'Arunachaleswarar Temple, Thiruvannamalai (Agni Sthalam)'), 'Karthigai Deepam', 11, 12, 'A giant beacon is lit atop Arunachala hill, visible for miles.'),
((select id from public.temples where name = 'Thillai Nataraja Temple, Chidambaram (Akasha Sthalam)'), 'Natyanjali Dance Festival', 2, 3, 'A major classical-dance offering to Nataraja, drawing dancers from across India.'),
((select id from public.temples where name = 'Suchindram Thanumalayan Temple'), 'Thiru Kalyanam', 12, 1, null),
((select id from public.temples where name = 'Srivilliputhur Andal Temple'), 'Margazhi (Andal''s Thiruppavai recitals)', 12, 1, 'Andal''s Thiruppavai verses are recited daily throughout the Tamil month of Margazhi.'),
((select id from public.temples where name = 'Cheluvanarayana Swamy Temple, Melkote'), 'Vairamudi Brahmotsavam', 3, 4, 'The deity is adorned with a diamond crown (Vairamudi) said to have belonged to Vishnu himself.'),
((select id from public.temples where name = 'Sri Venkateswara Swamy Temple, Tirumala'), 'Brahmotsavam', 9, 10, 'Nine days of major festivities; expect the largest crowds of the year.'),
((select id from public.temples where name = 'Sri Raghavendra Swamy Matha, Mantralayam'), 'Aradhana Mahotsava', 7, 8, 'Commemorates Sri Raghavendra Swamy''s entry into live samadhi.'),
((select id from public.temples where name = 'Dharmasthala Manjunatha Temple'), 'Lakshadeepotsava', 11, 12, 'A festival of a hundred thousand lamps.'),
((select id from public.temples where name = 'Basara Gnana Saraswati Temple'), 'Vasant Panchami', 1, 2, 'Children''s Aksharabhyasam (first-writing) ceremonies are especially popular.'),
((select id from public.temples where name = 'Mahalakshmi Temple, Kolhapur'), 'Kirnotsav', 1, 2, 'The setting sun''s rays are aligned to fall directly on the deity for a few days each year.'),
((select id from public.temples where name = 'Jagannath Temple, Puri'), 'Rath Yatra', 6, 7, 'The deities are pulled through the streets on giant wooden chariots — one of the best-known festivals in India.'),
((select id from public.temples where name = 'Simhachalam Varaha Narasimha Temple'), 'Chandanotsavam (Akshaya Tritiya)', 4, 5, 'The only day of the year the deity''s usual sandal-paste covering is removed to reveal its true form.'),
((select id from public.temples where name = 'Bhimashankar Jyotirlinga'), 'Maha Shivaratri', 2, 3, null),
((select id from public.temples where name = 'Trimbakeshwar Jyotirlinga'), 'Maha Shivaratri', 2, 3, 'Very crowded during Nashik-Trimbak Kumbh Mela years.'),
((select id from public.temples where name = 'Gokarna Mahabaleshwar Temple'), 'Maha Shivaratri', 2, 3, 'One of the largest Shivaratri celebrations on the coast.'),
((select id from public.temples where name = 'Kamakhya Temple'), 'Ambubachi Mela', 6, null, 'The temple closes for three days during this festival, which marks the goddess''s annual menstruation cycle in local tradition.'),
((select id from public.temples where name = 'Ambaji Temple'), 'Bhadarvi Purnima Mela', 8, 9, 'Huge numbers of pilgrims walk on foot from across Gujarat and Rajasthan.'),
((select id from public.temples where name = 'Ram Mandir, Ayodhya'), 'Ram Navami', 3, 4, null),
((select id from public.temples where name = 'Krishna Janmabhoomi Temple, Mathura'), 'Janmashtami', 8, 9, 'Krishna''s birthday — the single busiest day of the year here.'),
((select id from public.temples where name = 'Krishna Janmabhoomi Temple, Mathura'), 'Holi', 3, null, 'The Mathura-Vrindavan Holi celebrations are especially famous.'),
((select id from public.temples where name = 'Khatu Shyam Ji Temple'), 'Falgun Mela', 2, 3, null),
((select id from public.temples where name = 'Pushkar Brahma Temple'), 'Pushkar Camel Fair & Kartik Purnima', 10, 11, 'Also a major camel and livestock fair, alongside the religious bathing festival.'),
((select id from public.temples where name = 'Vadakkunnathan Temple, Thrissur'), 'Thrissur Pooram', 4, 5, 'Kerala''s largest temple festival, famous for its caparisoned elephants and percussion ensembles.'),
((select id from public.temples where name = 'Attukal Bhagavathy Temple'), 'Attukal Pongala', 2, 3, 'Recognised by Guinness World Records as the largest annual gathering of women.'),
((select id from public.temples where name = 'Chottanikkara Devi Temple'), 'Makam Thozhal', 12, 1, null),
((select id from public.temples where name = 'Sabarimala Ayyappa Temple'), 'Mandalam-Makaravilakku', 11, 1, 'The main pilgrimage season; the shrine is otherwise open only for brief monthly windows.'),
((select id from public.temples where name = 'Biraja Temple, Jajpur'), 'Ashoka Ashtami', 3, 4, null),
((select id from public.temples where name = 'Biraja Temple, Jajpur'), 'Durga Puja', 9, 10, null),
((select id from public.temples where name = 'Tarapith Temple'), 'Kali Puja', 10, 11, null),
((select id from public.temples where name = 'Dakshineswar Kali Temple, Kolkata'), 'Kali Puja', 10, 11, null),
((select id from public.temples where name = 'Kalighat Kali Temple'), 'Kali Puja', 10, 11, null),
((select id from public.temples where name = 'Danteshwari Temple, Dantewada'), 'Bastar Dussehra', 9, 10, 'Unusually long by local Bastar tradition, running for months rather than the usual ten days.'),
((select id from public.temples where name = 'Sri Krishna Matha, Udupi'), 'Paryaya', 1, null, 'Held every two years, when custodianship of the matha passes to the next Ashta Matha swami.'),
((select id from public.temples where name = 'Amarnath Cave Temple'), 'Amarnath Yatra', 6, 8, 'The only window the shrine is accessible at all — permit required in advance.'),
((select id from public.temples where name = 'Vaidyanath Jyotirlinga, Deoghar'), 'Shravani Mela (Kanwar pilgrimage)', 7, 8, 'Extremely crowded — millions of kanwariyas carry Ganga water here on foot during Shravan.'),
((select id from public.temples where name = 'Vitthal Rukmini Temple, Pandharpur'), 'Ashadhi Ekadashi (Wari)', 6, 7, 'Pilgrims walk for weeks from across Maharashtra to arrive for this date.'),
((select id from public.temples where name = 'Vitthal Rukmini Temple, Pandharpur'), 'Kartiki Ekadashi', 10, 11, null),
((select id from public.temples where name = 'Mahakaleshwar Jyotirlinga, Ujjain'), 'Simhastha Kumbh Mela', 4, 5, 'Held roughly every 12 years — extremely crowded when it falls.'),
((select id from public.temples where name = 'Adi Kumbeswarar Temple, Kumbakonam'), 'Mahamaham', 2, 3, 'Held every 12 years, likened to a Tamil Kumbh Mela; a normal Cauvery-side visit otherwise.');
