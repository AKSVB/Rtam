-- Ṛtam — official devasthanam/trust-run accommodation
--
-- The temple_stays table (powering "Nearby Stays" on each temple page)
-- had zero rows despite existing since the very first migration. This
-- fills in the most valuable and easiest-to-verify category first: rooms
-- run directly by the temple's own devasthanam, devaswom board, matha, or
-- shrine board — not private hotels — for the 15 temples in this
-- directory where that scheme is well documented (starting with Tirumala,
-- Annavaram, and Simhachalam, as specifically asked for). Every entry
-- below was checked against the temple/trust's own site or a dedicated
-- pilgrim-accommodation guide, not assumed.
--
-- Deliberately left out: general private dharamshala clusters (e.g.
-- around Kashi Vishwanath, Dwarka) where no single scheme is clearly
-- the temple/board's own — a lower-confidence claim isn't worth making
-- here when the whole point is telling a pilgrim which option is
-- trust-run versus a private business.

insert into public.temple_stays (temple_id, name, contact, address, distance_to_temple_km, pure_veg_kitchen, puja_room_available, price_range, notes, status)
values
(
  (select id from public.temples where name = 'Sri Venkateswara Swamy Temple, Tirumala'),
  'TTD Guest Houses (Vishnu Nivasam, Srinivasam, Sapthagiri, Padmavati Guest House, and others)',
  null,
  'TTD Central Reception Office, Tirumala',
  0,
  false,
  false,
  '₹50 (dormitory) to ₹5,000/night (AC suite), depending on category',
  'Run directly by the Tirumala Tirupati Devasthanams (TTD), with thousands of rooms across several guest houses. Booking opens 90 days in advance online, plus offline allotment at the Central Reception Office; self-cooking is not permitted.',
  'approved'
),
(
  (select id from public.temples where name = 'Sri Satyanarayana Swamy Temple, Annavaram'),
  'Annavaram Devasthanam Choultries and Guest Houses',
  null,
  'Sri Veera Venkata Satyanarayana Swamy Devasthanam, Annavaram',
  0,
  false,
  false,
  '₹200 (basic choultry) to ₹3,000/night (deluxe suite)',
  'Run by the temple devasthanam itself, with a range from basic dormitory beds to AC suites. Bookable via MeeSeva centres, by post, or as a walk-in at the Choultry Reservation Office.',
  'approved'
),
(
  (select id from public.temples where name = 'Simhachalam Varaha Narasimha Temple'),
  'Simhachalam Devasthanam Choultries and Cottages (Gajapathi Choultry, Sivarama/Annapurna/Seethamma Cottages, and guest houses)',
  null,
  'Simhachalam Devasthanam, Visakhapatnam',
  0,
  false,
  false,
  '₹75–₹500/night',
  'Run by the temple devasthanam. Budget choultry rooms and a handful of named cottages; bookable online via the devasthanam website or on arrival at the cottage reception.',
  'approved'
),
(
  (select id from public.temples where name = 'Guruvayur Sri Krishna Temple'),
  'Guruvayur Devaswom Guest Houses (Panchajanyam, Kousthubham, Sreevalsam, and others)',
  null,
  'Guruvayur Devaswom, Guruvayur',
  0,
  false,
  false,
  '₹300–₹3,000/night depending on room type',
  'Run directly by the Guruvayur Devaswom Board, ranging from basic non-AC rooms to AC suites, plus a dormitory hall. Bookable online through the Devaswom''s own portal.',
  'approved'
),
(
  (select id from public.temples where name = 'Sabarimala Ayyappa Temple'),
  'Travancore Devaswom Board Accommodation at Pamba and Nilackal',
  null,
  'Pamba base camp and Nilackal, en route to Sabarimala',
  0,
  false,
  false,
  'Basic dormitory and family rooms; spartan, functional facilities',
  'Run by the Travancore Devaswom Board (TDB), the trust administering Sabarimala. Accommodation is at Pamba (closest to the trek to Sannidhanam) and the Nilackal base camp; book well ahead online during the pilgrimage season, as demand is extremely high.',
  'approved'
),
(
  (select id from public.temples where name = 'Ramanathaswamy Temple, Rameswaram'),
  'Rameswaram Devasthanam Rooms',
  null,
  'Sri Ramanathaswamy Devasthanam, Rameswaram',
  0,
  false,
  false,
  '₹500 upward, refundable caution deposit required',
  'A limited number of rooms run directly by the temple devasthanam, allotted for a 24-hour block from 6am; self-cooking is not allowed. Book at the devasthanam office as availability is limited.',
  'approved'
),
(
  (select id from public.temples where name = 'Mahakaleshwar Jyotirlinga, Ujjain'),
  'Mahakal Bhakt Niwas',
  null,
  'Run by the Shri Mahakaleshwar Temple Management Committee, near the temple, Ujjain',
  0,
  false,
  false,
  'Budget-priced, among the more affordable options near the temple',
  'A budget guest house run by the temple trust itself, distinct from the many private dharamshalas and hotels also clustered near the temple.',
  'approved'
),
(
  (select id from public.temples where name = 'Vaishno Devi Temple, Katra'),
  'Shrine Board Bhawans at Katra (Niharika Yatri Niwas, Shakti Bhawan, Ashirwad Bhawan, Trikuta Bhawan)',
  null,
  'Shri Mata Vaishno Devi Shrine Board reception complexes, Katra',
  0,
  false,
  false,
  '₹150/bed (dormitory) upward; ₹1,200–₹3,000/night for standard rooms',
  'Run directly by the Shri Mata Vaishno Devi Shrine Board — several large bhawans in Katra alone, including the 700-bed Trikuta Bhawan. The Board also runs accommodation along the yatra route itself. Book via the Board''s own reservation counters or website.',
  'approved'
),
(
  (select id from public.temples where name = 'Jagannath Temple, Puri'),
  'Niladri Bhakta Niwas',
  null,
  'Near Town Police Station, Grand Road, Puri (about 550m from the temple)',
  0,
  false,
  false,
  'Budget to mid-range, AC deluxe rooms available',
  'Operated by the Shree Jagannath Temple Administration itself — one of several Bhakta Niwas properties (alongside Shree Gundicha and Nilachala Bhakta Niwas) it runs for pilgrims. Book via the temple administration''s own accommodation portal.',
  'approved'
),
(
  (select id from public.temples where name = 'Meenakshi Amman Temple, Madurai'),
  'Madurai Devasthanam Rooms',
  null,
  'Within about 1km of the Meenakshi Amman Temple, Madurai',
  0,
  false,
  false,
  '₹300–₹1,000/night',
  'Basic, budget-friendly rooms managed by the temple devasthanam trust, distinct from the many private hotels in Madurai. Expect longer allotment waits on weekends and festival days.',
  'approved'
),
(
  (select id from public.temples where name = 'Somnath Temple'),
  'Shree Somnath Trust Guest Houses (Sagar Darshan Atithi Gruh, Lilavati Atithi Bhawan, Maheshwari Atithi Gruh, and others)',
  null,
  'Shree Somnath Trust, near the temple, Somnath/Prabhas Patan',
  0,
  false,
  false,
  '₹300 (budget guest house) to ₹5,000/night (suite)',
  'Run directly by the Shree Somnath Trust — more than 200 rooms across a VIP guest house, around eighteen other guest houses, and a budget dormitory. Book through the Trust''s own office or website.',
  'approved'
),
(
  (select id from public.temples where name = 'Palani Murugan Temple'),
  'Palani Devasthanam Lodges (Dhandapani Nilayam, Karthikeyan Viduthi, Velavan Viduthi, Devasthanam Cottages)',
  null,
  'Arulmigu Dhandayuthapani Swamy Devasthanam, Palani',
  0,
  false,
  false,
  '₹60–₹500/night across five separate lodging facilities',
  'Run by the temple devasthanam itself — five distinct lodging complexes ranging from economy rooms to cottages, totalling well over a hundred rooms. Book via the devasthanam''s own accommodation portal.',
  'approved'
),
(
  (select id from public.temples where name = 'Ranganathaswamy Temple, Srirangam'),
  'Srirangam Devasthanam Guest Houses (including Bangur Dharamshala and Sri Ranganadha Nilayam)',
  null,
  'Within a 5–10 minute walk of the temple, Srirangam',
  0,
  false,
  false,
  'Budget to AC rooms; dormitories also available',
  'Several lodging complexes managed by the temple devasthanam, from basic single rooms to family suites. Devotees needing accessible/ground-floor rooms should contact the devasthanam office directly to arrange this.',
  'approved'
),
(
  (select id from public.temples where name = 'Sri Krishna Matha, Udupi'),
  'Sri Krishna Matha Rooms and Yatri Nivas',
  null,
  'Sri Krishna Matha complex, Udupi (Yatri Nivas about 900m away)',
  0,
  false,
  false,
  '₹800–₹1,500/night for a 3-person room; ₹3,500 for a 25-person dormitory hall',
  'Rooms run directly by the matha itself, alongside a separate Yatri Nivas nearby. The room-allotment counter is open 24 hours.',
  'approved'
),
(
  (select id from public.temples where name = 'Sringeri Sharada Peetham'),
  'Sri Sharada Peetham Guest Houses (Yatri Nivas, Sri Shankara Kripa, Sri Sharada Kripa, and others)',
  null,
  'Built by Sri Sharada Peetham near the Sharada Temple, Sringeri',
  0,
  false,
  false,
  '₹500 (non-AC) to ₹1,000 (AC) per day — offered on a donation (kanikai) basis, not commercially',
  'Several guest houses built and maintained by the Sharada Peetham itself specifically for the comfort of pilgrims, not run as a commercial hotel. Bookable online from two days ahead via the Peetham''s own portal.',
  'approved'
);
