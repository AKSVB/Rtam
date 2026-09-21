-- Ratam -- backfills precise Drikpanchang-sourced dates for the festivals
-- that were left with only a month window after migration 0082. Dates are
-- the next occurrence relative to when this was written (late September
-- 2026); several are already in the past for 2026 and point to 2027.
-- Institution-announced festivals (Aradhana Mahotsava, Brahmotsavam) use
-- the most recently published edition rather than a computed tithi.

update public.festivals set exact_date = v.exact_date::date, exact_date_note = v.note, drikpanchang_url = coalesce(v.url, drikpanchang_url)
from (values
  ('holi', '2027-03-22', 'Rangwali Holi — Phalguna Purnima. Holika Dahan is the evening before, 21 March 2027.', 'https://www.drikpanchang.com/festivals/holi/festivals-holi-rangwali.html'),
  ('janmashtami', '2026-09-04', 'Bhadrapada Krishna Ashtami with Rohini Nakshatra.', 'https://www.drikpanchang.com/dashavatara/lord-krishna/krishna-janmashtami-date-time.html'),
  ('rath-yatra', '2027-07-05', 'Ashadha Shukla Dwitiya — the return journey (Bahuda Yatra) follows about a week later.', 'https://www.drikpanchang.com/festivals/ratha-yatra/jagannatha-rathayatra-date-time.html'),
  ('vasant-panchami', '2027-02-11', 'Magha Shukla Panchami.', 'https://www.drikpanchang.com/festivals/vasant-panchami/vasant-panchami-puja-date-time.html'),
  ('narasimha-jayanti', '2027-05-18', 'Vaishakha Shukla Chaturdashi.', 'https://www.drikpanchang.com/dashavatara/narasimha/narasimha-jayanti-date-time.html'),
  ('onam', '2027-09-12', 'Thiruvonam Nakshatra — the tenth and final day of the ten-day Onam festival, which begins 3 September 2027.', 'https://www.drikpanchang.com/festivals/onam/onam-thiruvonam-date.html'),
  ('karthigai-deepam', '2026-11-24', 'Krittika Nakshatra coinciding with the full moon in the Tamil month of Karthikai.', 'https://www.drikpanchang.com/festivals/karthigai-deepam/karthigai-deepam-date-time.html'),
  ('kartiki-ekadashi', '2026-11-20', 'Prabodhini (Dev Uthani) Ekadashi — Vithoba-tradition pilgrims call it Kartiki Ekadashi.', 'https://www.drikpanchang.com/ekadashis/prabodhini/prabodhini-ekadashi-date-time.html'),
  ('ashadhi-ekadashi', '2027-07-14', 'Devshayani Ekadashi — Chaturmas begins this day.', 'https://www.drikpanchang.com/ekadashis/devshayani/devshayani-ekadashi-date-time.html'),
  ('mandalam-makaravilakku', '2027-01-14', 'Makara Sankranti — Makaravilakku is sighted from the temple in the evening.', 'https://www.drikpanchang.com/festivals/sankranti/sankranti-calendar.html'),
  ('panguni-car-festival', '2027-03-22', 'Panguni Uthiram — Uthiram Nakshatram in the Tamil month of Panguni.', 'https://www.drikpanchang.com/festivals/panguni-uthiram/panguni-uthiram-date.html'),
  ('panguni-peruvizha', '2027-03-22', 'Panguni Uthiram.', 'https://www.drikpanchang.com/festivals/panguni-uthiram/panguni-uthiram-date.html'),
  ('meenakshi-thirukalyanam', '2027-04-18', 'Culminating day of the Chithirai Thiruvizha, which begins 9 April 2027.', null),
  ('vaikathashtami', '2026-12-12', 'Ashtami, eight days after the full moon, in the Malayalam month of Vrishchikam.', null),
  ('ambubachi-mela', '2027-06-22', 'The temple closes 22-25 June and reopens 26 June 2027.', null),
  ('bhadarvi-purnima-mela', '2026-09-26', 'Bhadrapada Purnima.', 'https://www.drikpanchang.com/purnima/bhadrapada/bhadrapada-purnima-date-time.html'),
  ('ashwin-purnima-mela', '2026-10-26', 'Sharad/Kojagiri Purnima — the tithi is observed the night of 25 October.', null),
  ('chaitra-purnima-mela', '2027-04-20', 'Chaitra Purnima.', 'https://www.drikpanchang.com/purnima/chaitra/chaitra-purnima-date-time.html'),
  ('chaitra-yatra', '2027-04-20', 'Chaitra Purnima, with large processions and gulal (pink powder).', null),
  ('ashoka-ashtami', '2027-04-14', 'Chaitra Shukla Ashtami.', null),
  ('attukal-pongala', '2027-02-22', 'Pongala nivedyam day, within the ten-day festival running 14-23 February 2027.', null),
  ('aradhana-mahotsava', '2026-08-30', 'Madhya Aradhana, the main day of the three-day Aradhana Mahotsava (29-31 August 2026).', null),
  ('narmada-jayanti', '2027-02-13', 'Magha Shukla Saptami.', null),
  ('skanda-sashti', '2026-11-15', 'Soorasamharam, within the six-day Skanda Sashti Viratham (10-16 November 2026).', null),
  ('pitru-paksha', '2026-09-27', 'Begins the day after Bhadrapada Purnima; runs through Sarva Pitru Amavasya on 10 October 2026.', null),
  ('durga-puja', '2026-10-21', 'Vijayadashami, the day after Maha Navami (20 October 2026).', null),
  ('thrissur-pooram', '2027-04-17', 'The day the Paramekkavu and Thiruvambadi Devaswoms'' caparisoned-elephant processions meet.', null),
  ('shani-amavasya', '2027-08-02', 'Shravan Amavasya — a Somvati Amavasya this year, since it falls on a Monday.', null),
  ('chandanotsavam', '2027-05-09', 'Same day as Akshaya Tritiya — the only day of the year the deity''s sandal-paste covering is removed.', null),
  ('mysore-dasara', '2026-10-20', 'Vijayadashami, the climax of Sharad Navaratri.', null),
  ('brahmotsavam', '2026-09-19', 'Garuda Seva, the peak day of the nine-day Annual Brahmotsavam (15-23 September 2026). Exact dates are announced by the temple each year, typically only months in advance.', null)
) as v(slug, exact_date, note, url)
where public.festivals.slug = v.slug;
