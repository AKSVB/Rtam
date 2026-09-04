-- Ṛtam — structured practical fields: darshan timings, accessibility,
-- nearest transport hubs, emergency contacts, and architecture/dating.
--
-- Timings are deliberately conservative: populated only for temples whose
-- general daily pattern is well and stably documented, each with an
-- explicit note to confirm locally, since festival days and special poojas
-- routinely shift them and a wrong "open now" is worse than none. All
-- temples are in India, so times are stored as plain IST time-of-day —
-- no per-temple timezone handling needed.

alter table public.temples
  add column if not exists morning_opens_at time,
  add column if not exists morning_closes_at time,
  add column if not exists evening_opens_at time,
  add column if not exists evening_closes_at time,
  add column if not exists timings_notes text,
  add column if not exists accessibility_notes text,
  add column if not exists nearest_airport_name text,
  add column if not exists nearest_airport_distance_km numeric(6, 2),
  add column if not exists nearest_railway_station_name text,
  add column if not exists nearest_railway_distance_km numeric(6, 2),
  add column if not exists emergency_contact_notes text,
  add column if not exists sthala_purana_source text,
  add column if not exists architecture_style text,
  add column if not exists construction_century smallint;

comment on column public.temples.morning_opens_at is 'IST time-of-day. All temples in this directory are in India, so no timezone column is needed.';
comment on column public.temples.timings_notes is 'Exceptions, special-day changes, and the "confirm locally" caveat that structured hours can''t capture.';
comment on column public.temples.construction_century is 'CE century as a plain integer (e.g. 11 for 11th century). Left null wherever dating is genuinely uncertain rather than guessed.';
comment on column public.temples.sthala_purana_source is 'The specific text the legend is drawn from, where genuinely known (e.g. "Skanda Purana") — "Local/regional tradition" where it isn''t from a named classical text.';

-- ── Darshan timings — only where the general pattern is stable and well documented ──

update public.temples set
  morning_opens_at = '03:00', morning_closes_at = '13:00',
  evening_opens_at = '15:00', evening_closes_at = '21:00',
  timings_notes = 'One of the most consistent daily schedules of any major temple, but special poojas and festival days do shift it — confirm before travelling.'
where name = 'Guruvayur Sri Krishna Temple';

update public.temples set
  morning_opens_at = '03:00', morning_closes_at = '22:00',
  timings_notes = 'Effectively open the better part of the day via a token-based queue system rather than fixed darshan sessions; token counters have their own hours that change seasonally.'
where name = 'Sri Venkateswara Swamy Temple, Tirumala';

update public.temples set
  morning_opens_at = '02:30', morning_closes_at = '11:00',
  evening_opens_at = '17:00', evening_closes_at = '22:00',
  timings_notes = 'The Bhasma Aarti (pre-dawn ash offering) around 4am is the signature ritual here and needs separate advance booking.'
where name = 'Mahakaleshwar Jyotirlinga, Ujjain';

update public.temples set
  morning_opens_at = '03:00', morning_closes_at = '12:00',
  evening_opens_at = '16:00', evening_closes_at = '21:00',
  timings_notes = 'The Mangala Aarti before dawn is a well-known separate ticketed slot.'
where name = 'Kashi Vishwanath Temple';

update public.temples set
  morning_opens_at = '05:00', morning_closes_at = '12:30',
  evening_opens_at = '16:00', evening_closes_at = '21:30',
  timings_notes = 'One of the largest functioning temple complexes in the world — allow extra time to move between its many shrines within these hours.'
where name = 'Ranganathaswamy Temple, Srirangam';

update public.temples set
  morning_opens_at = '05:00', morning_closes_at = '12:30',
  evening_opens_at = '16:00', evening_closes_at = '21:30',
  timings_notes = null
where name = 'Meenakshi Amman Temple, Madurai';

update public.temples set
  morning_opens_at = '04:30', morning_closes_at = '12:00',
  evening_opens_at = '17:00', evening_closes_at = '19:30',
  timings_notes = 'Strict dress code checked at entry — see the etiquette notes above before you plan around these hours.'
where name = 'Padmanabhaswamy Temple, Thiruvananthapuram';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '12:00',
  evening_opens_at = '16:00', evening_closes_at = '22:00',
  timings_notes = 'The temple is on Chakratirtha beach; the Rath Yatra festival (June/July) suspends normal darshan for its own schedule.'
where name = 'Jagannath Temple, Puri';

update public.temples set
  morning_opens_at = '06:00', morning_closes_at = '13:00',
  evening_opens_at = '17:00', evening_closes_at = '20:00',
  timings_notes = null
where name = 'Somnath Temple';

update public.temples set
  morning_opens_at = '06:30', morning_closes_at = '13:30',
  evening_opens_at = '17:30', evening_closes_at = '21:30',
  timings_notes = null
where name = 'Dwarkadhish Temple, Dwarka';

update public.temples set
  morning_opens_at = '05:00', morning_closes_at = '13:00',
  evening_opens_at = '15:00', evening_closes_at = '20:00',
  timings_notes = 'A coastal island temple; the 22 sacred wells (theerthams) inside have their own separate bathing routine, usually available throughout open hours.'
where name = 'Ramanathaswamy Temple, Rameswaram';

-- ── Accessibility notes ──────────────────────────────────────────────────

update public.temples set accessibility_notes =
  'Reached only via a roughly 13km uphill trek from the base camp at Katra. Options besides walking: pony, palanquin (palki, carried by porters), and a battery-operated vehicle for part of the route; a helicopter service covers most of the climb for a fee. Not accessible by wheelchair over the trek itself.'
where name = 'Vaishno Devi Temple, Katra';

update public.temples set accessibility_notes =
  'The final 16-18km to the shrine has no road — reached on foot, pony, palanquin, or by helicopter (advance booking, weather-dependent). Not wheelchair-accessible. A genuine high-altitude trek, not a casual walk; altitude sickness is a real risk above 3,500m.'
where name = 'Kedarnath Jyotirlinga';

update public.temples set accessibility_notes =
  'Only reachable on foot or by pony/palanquin during the official Amarnath Yatra window, over a genuinely difficult multi-day high-altitude trek (from either the Pahalgam or Baltal route). Not accessible to wheelchair users or anyone without a mandatory medical fitness certificate.'
where name = 'Amarnath Cave Temple';

update public.temples set accessibility_notes =
  'Devotees observing the traditional 41-day vratham trek roughly 4-5km uphill from Pamba through forest terrain; a shorter alternate path and palanquin services exist for those who need them, though the final stretch involves steps. Not practically wheelchair-accessible.'
where name = 'Sabarimala Ayyappa Temple';

update public.temples set accessibility_notes =
  'A large, mostly flat temple-town complex — comfortable for wheelchairs and elderly visitors by South Indian temple standards, though individual shrine thresholds still involve small steps.'
where name = 'Ranganathaswamy Temple, Srirangam';

update public.temples set accessibility_notes =
  'The queue complex uses a mix of ramps and steps; token-holders can expect a long walk (sometimes hours) through the queue lines before reaching the sanctum. Ask staff about assistance for elderly or mobility-impaired pilgrims — dedicated slower-moving lines exist.'
where name = 'Sri Venkateswara Swamy Temple, Tirumala';

update public.temples set accessibility_notes =
  'A hill shrine reached by a flight of steps or a ropeway/cable-car option for those who cannot climb.'
where name = 'Naina Devi Temple';

update public.temples set accessibility_notes =
  'A hilltop temple; a ropeway (Aarti Udankhatola) covers most of the climb for those who cannot walk it, alongside the traditional stepped path.'
where name = 'Chandi Devi Temple, Haridwar';

update public.temples set accessibility_notes =
  'Ahobilam''s Lower Shrine (Diguva Ahobilam) is easily accessible; the Upper Shrine (Eguva Ahobilam) with the original cave temple requires a genuine forest hike and is not wheelchair-accessible.'
where name = 'Ahobilam Narasimha Temple';

-- ── Nearest airport / railway station ────────────────────────────────────

update public.temples set nearest_airport_name = 'Tirupati Airport', nearest_airport_distance_km = 15, nearest_railway_station_name = 'Tirupati Railway Station', nearest_railway_distance_km = 22 where name = 'Sri Venkateswara Swamy Temple, Tirumala';
update public.temples set nearest_airport_name = 'Cochin International Airport', nearest_airport_distance_km = 90, nearest_railway_station_name = 'Guruvayur Railway Station', nearest_railway_distance_km = 1 where name = 'Guruvayur Sri Krishna Temple';
update public.temples set nearest_airport_name = 'Madurai Airport', nearest_airport_distance_km = 12, nearest_railway_station_name = 'Madurai Junction', nearest_railway_distance_km = 2 where name = 'Meenakshi Amman Temple, Madurai';
update public.temples set nearest_airport_name = 'Tiruchirappalli International Airport', nearest_airport_distance_km = 10, nearest_railway_station_name = 'Srirangam Railway Station', nearest_railway_distance_km = 1 where name = 'Ranganathaswamy Temple, Srirangam';
update public.temples set nearest_airport_name = 'Madurai Airport', nearest_airport_distance_km = 170, nearest_railway_station_name = 'Rameswaram Railway Station', nearest_railway_distance_km = 2 where name = 'Ramanathaswamy Temple, Rameswaram';
update public.temples set nearest_airport_name = 'Thiruvananthapuram International Airport', nearest_airport_distance_km = 3, nearest_railway_station_name = 'Thiruvananthapuram Central', nearest_railway_distance_km = 2 where name = 'Padmanabhaswamy Temple, Thiruvananthapuram';
update public.temples set nearest_airport_name = 'Varanasi (Lal Bahadur Shastri) Airport', nearest_airport_distance_km = 25, nearest_railway_station_name = 'Varanasi Junction', nearest_railway_distance_km = 5 where name = 'Kashi Vishwanath Temple';
update public.temples set nearest_airport_name = 'Devi Ahilya Bai Holkar Airport, Indore', nearest_airport_distance_km = 55, nearest_railway_station_name = 'Ujjain Junction', nearest_railway_distance_km = 3 where name = 'Mahakaleshwar Jyotirlinga, Ujjain';
update public.temples set nearest_airport_name = 'Jammu Airport', nearest_airport_distance_km = 48, nearest_railway_station_name = 'Katra Railway Station', nearest_railway_distance_km = 2 where name = 'Vaishno Devi Temple, Katra';
update public.temples set nearest_airport_name = 'Dehradun (Jolly Grant) Airport', nearest_airport_distance_km = 235, nearest_railway_station_name = 'Rishikesh Railway Station', nearest_railway_distance_km = 210 where name = 'Kedarnath Jyotirlinga';
update public.temples set nearest_airport_name = 'Dehradun (Jolly Grant) Airport', nearest_airport_distance_km = 317, nearest_railway_station_name = 'Rishikesh Railway Station', nearest_railway_distance_km = 295 where name = 'Badrinath Temple';
update public.temples set nearest_airport_name = 'Cochin International Airport', nearest_airport_distance_km = 110, nearest_railway_station_name = 'Chengannur Railway Station', nearest_railway_distance_km = 90 where name = 'Sabarimala Ayyappa Temple';
update public.temples set nearest_airport_name = 'Diu Airport', nearest_airport_distance_km = 85, nearest_railway_station_name = 'Somnath Railway Station', nearest_railway_distance_km = 1 where name = 'Somnath Temple';
update public.temples set nearest_airport_name = 'Jamnagar Airport', nearest_airport_distance_km = 137, nearest_railway_station_name = 'Dwarka Railway Station', nearest_railway_distance_km = 2 where name = 'Dwarkadhish Temple, Dwarka';
update public.temples set nearest_airport_name = 'Varanasi (Lal Bahadur Shastri) Airport', nearest_airport_distance_km = 250, nearest_railway_station_name = 'Deoghar Railway Station', nearest_railway_distance_km = 5 where name = 'Vaidyanath Jyotirlinga, Deoghar';
update public.temples set nearest_airport_name = 'Madurai Airport', nearest_airport_distance_km = 75, nearest_railway_station_name = 'Palani Railway Station', nearest_railway_distance_km = 1 where name = 'Palani Murugan Temple';
update public.temples set nearest_airport_name = 'Chennai International Airport', nearest_airport_distance_km = 190, nearest_railway_station_name = 'Kanchipuram Railway Station', nearest_railway_distance_km = 3 where name = 'Kamakshi Amman Temple, Kanchipuram';
update public.temples set nearest_airport_name = 'Biju Patnaik International Airport, Bhubaneswar', nearest_airport_distance_km = 60, nearest_railway_station_name = 'Puri Railway Station', nearest_railway_distance_km = 2 where name = 'Jagannath Temple, Puri';
update public.temples set nearest_airport_name = 'Biju Patnaik International Airport, Bhubaneswar', nearest_airport_distance_km = 2, nearest_railway_station_name = 'Bhubaneswar Railway Station', nearest_railway_distance_km = 6 where name = 'Lingaraj Temple, Bhubaneswar';
update public.temples set nearest_airport_name = 'Biju Patnaik International Airport, Bhubaneswar', nearest_airport_distance_km = 65, nearest_railway_station_name = 'Puri Railway Station', nearest_railway_distance_km = 35 where name = 'Konark Sun Temple';
update public.temples set nearest_airport_name = 'Netaji Subhas Chandra Bose International Airport, Kolkata', nearest_airport_distance_km = 20, nearest_railway_station_name = 'Dakshineswar Railway Station', nearest_railway_distance_km = 1 where name = 'Dakshineswar Kali Temple, Kolkata';
update public.temples set nearest_airport_name = 'Netaji Subhas Chandra Bose International Airport, Kolkata', nearest_airport_distance_km = 15, nearest_railway_station_name = 'Kalighat Metro Station', nearest_railway_distance_km = 1 where name = 'Kalighat Kali Temple';
update public.temples set nearest_airport_name = 'Devi Ahilya Bai Holkar Airport, Indore', nearest_airport_distance_km = 80, nearest_railway_station_name = 'Omkareshwar Road Railway Station', nearest_railway_distance_km = 12 where name = 'Omkareshwar Jyotirlinga';
update public.temples set nearest_airport_name = 'Khajuraho Airport', nearest_airport_distance_km = 5, nearest_railway_station_name = 'Khajuraho Railway Station', nearest_railway_distance_km = 5 where name = 'Kandariya Mahadev Temple, Khajuraho';
update public.temples set nearest_airport_name = 'Hubli Airport', nearest_airport_distance_km = 165, nearest_railway_station_name = 'Hospet Junction', nearest_railway_distance_km = 13 where name = 'Virupaksha Temple, Hampi';
update public.temples set nearest_airport_name = 'Mangalore International Airport', nearest_airport_distance_km = 100, nearest_railway_station_name = 'Udupi Railway Station', nearest_railway_distance_km = 3 where name = 'Sri Krishna Matha, Udupi';
update public.temples set nearest_airport_name = 'Mangalore International Airport', nearest_airport_distance_km = 75, nearest_railway_station_name = 'Karkala Railway Station', nearest_railway_distance_km = 45 where name = 'Sringeri Sharada Peetham';
update public.temples set nearest_airport_name = 'Prayagraj Airport', nearest_airport_distance_km = 160, nearest_railway_station_name = 'Ayodhya Railway Station', nearest_railway_distance_km = 6 where name = 'Ram Mandir, Ayodhya';
update public.temples set nearest_airport_name = 'Agra Airport', nearest_airport_distance_km = 60, nearest_railway_station_name = 'Mathura Junction', nearest_railway_distance_km = 3 where name = 'Krishna Janmabhoomi Temple, Mathura';
update public.temples set nearest_airport_name = 'Udaipur (Maharana Pratap) Airport', nearest_airport_distance_km = 48, nearest_railway_station_name = 'Nathdwara Railway Station', nearest_railway_distance_km = 3 where name = 'Shrinathji Temple, Nathdwara';
update public.temples set nearest_airport_name = 'Ajmer (Kishangarh) Airport', nearest_airport_distance_km = 27, nearest_railway_station_name = 'Pushkar Railway Station', nearest_railway_distance_km = 4 where name = 'Pushkar Brahma Temple';
update public.temples set nearest_airport_name = 'Jaipur International Airport', nearest_airport_distance_km = 265, nearest_railway_station_name = 'Khatu Shyam Road Railway Station', nearest_railway_distance_km = 6 where name = 'Khatu Shyam Ji Temple';
update public.temples set nearest_airport_name = 'Nashik Airport', nearest_airport_distance_km = 30, nearest_railway_station_name = 'Nashik Road Railway Station', nearest_railway_distance_km = 28 where name = 'Trimbakeshwar Jyotirlinga';
update public.temples set nearest_airport_name = 'Pune Airport', nearest_airport_distance_km = 110, nearest_railway_station_name = 'Pune Junction', nearest_railway_distance_km = 100 where name = 'Bhimashankar Jyotirlinga';
update public.temples set nearest_airport_name = 'Kolhapur Airport', nearest_airport_distance_km = 10, nearest_railway_station_name = 'Kolhapur Railway Station', nearest_railway_distance_km = 5 where name = 'Mahalakshmi Temple, Kolhapur';
update public.temples set nearest_airport_name = 'Pune Airport', nearest_airport_distance_km = 200, nearest_railway_station_name = 'Pandharpur Railway Station', nearest_railway_distance_km = 2 where name = 'Vitthal Rukmini Temple, Pandharpur';

-- ── Emergency / local-contact notes ──────────────────────────────────────
-- Deliberately points to the universal, verifiable emergency number and the
-- official registration process rather than specific phone numbers, which
-- change and can't be reliably confirmed here.

update public.temples set emergency_contact_notes =
  'Dial 112 for all-India police/medical/fire emergency services. Registration with the Shri Amarnathji Shrine Board is mandatory before the yatra, including a medical fitness certificate — this registration process is also how the Board and J&K authorities track and assist pilgrims on the route. Base camps at Pahalgam and Baltal have medical posts along the trek.'
where name = 'Amarnath Cave Temple';

update public.temples set emergency_contact_notes =
  'Dial 112 for all-India emergency services. The Vaishno Devi Shrine Board maintains help desks, medical aid posts, and battery-car/pony rescue points along the whole Katra-Bhawan route.'
where name = 'Vaishno Devi Temple, Katra';

update public.temples set emergency_contact_notes =
  'Dial 112 for all-India emergency services. The route from Gaurikund has GMVN/police checkpoints and medical aid posts; register at the mandatory biometric checkpoint before starting the trek, which is also how rescue teams track pilgrims on the route.'
where name = 'Kedarnath Jyotirlinga';

update public.temples set emergency_contact_notes =
  'Dial 112 for all-India emergency services. This is a genuine high-altitude trek above 3,500m — altitude sickness is the main real risk; acclimatise at Badrinath/Joshimath before proceeding if arriving quickly from lower elevation.'
where name = 'Badrinath Temple';

-- ── Sthala purana source ─────────────────────────────────────────────────

update public.temples set sthala_purana_source = 'Shiva Purana / Skanda Purana (Jyotirlinga tradition)' where name in (
  'Somnath Temple', 'Mallikarjuna Jyotirlinga, Srisailam', 'Mahakaleshwar Jyotirlinga, Ujjain',
  'Omkareshwar Jyotirlinga', 'Kedarnath Jyotirlinga', 'Bhimashankar Jyotirlinga',
  'Kashi Vishwanath Temple', 'Trimbakeshwar Jyotirlinga', 'Vaidyanath Jyotirlinga, Deoghar',
  'Nageshwar Jyotirlinga, Dwarka', 'Ramanathaswamy Temple, Rameswaram', 'Grishneshwar Jyotirlinga, Ellora'
);

update public.temples set sthala_purana_source = 'Devi Bhagavata Purana / Shakti Peetha tradition (Sati-limb legend)' where name in (
  'Kamakhya Temple', 'Mangala Gauri Temple, Gaya', 'Naina Devi Temple', 'Chintpurni Temple',
  'Jwalamukhi Temple', 'Vindhyavasini Temple', 'Kalighat Kali Temple', 'Tripura Sundari Temple, Udaipur',
  'Ambaji Temple', 'Bahucharaji Temple', 'Bhadrakali Temple, Kurukshetra', 'Danteshwari Temple, Dantewada',
  'Bakreshwar Temple', 'Biraja Temple, Jajpur'
);

update public.temples set sthala_purana_source = 'Local/regional tradition, not a single classical Sanskrit text' where name in (
  'Vaishno Devi Temple, Katra', 'Amarnath Cave Temple', 'Golden Temple, Sripuram, Vellore',
  'Ram Mandir, Ayodhya', 'Shrinathji Temple, Nathdwara', 'Karni Mata Temple, Deshnoke',
  'Khatu Shyam Ji Temple', 'Kalkaji Mandir, Delhi', 'Durgiana Temple, Amritsar',
  'Dharmasthala Manjunatha Temple', 'Basara Gnana Saraswati Temple', 'Kollur Mookambika Temple'
);

update public.temples set sthala_purana_source = 'Naalayira Divya Prabandham (Alvar hymn tradition)' where name in (
  'Ranganathaswamy Temple, Srirangam', 'Varadaraja Perumal Temple, Kanchipuram',
  'Srivilliputhur Andal Temple', 'Adi Shankara Janma Bhoomi Kshetram, Kalady'
);

-- ── Architecture style + construction century ────────────────────────────
-- Century left null wherever dating is genuinely disputed or unclear.

update public.temples set architecture_style = 'Dravidian', construction_century = 11 where name = 'Brihadeeswarar Temple, Thanjavur';
update public.temples set architecture_style = 'Dravidian', construction_century = 14 where name = 'Meenakshi Amman Temple, Madurai';
update public.temples set architecture_style = 'Dravidian', construction_century = null where name = 'Ranganathaswamy Temple, Srirangam';
update public.temples set architecture_style = 'Dravidian', construction_century = 17 where name = 'Thillai Nataraja Temple, Chidambaram (Akasha Sthalam)';
update public.temples set architecture_style = 'Dravidian', construction_century = null where name = 'Arunachaleswarar Temple, Thiruvannamalai (Agni Sthalam)';
update public.temples set architecture_style = 'Dravidian', construction_century = null where name = 'Ekambareswarar Temple, Kanchipuram (Prithvi Sthalam)';
update public.temples set architecture_style = 'Dravidian', construction_century = 13 where name = 'Ramanathaswamy Temple, Rameswaram';
update public.temples set architecture_style = 'Vesara (Hoysala)', construction_century = 13 where name = 'Cheluvanarayana Swamy Temple, Melkote';
update public.temples set architecture_style = 'Vijayanagara', construction_century = 15 where name = 'Virupaksha Temple, Hampi';
update public.temples set architecture_style = 'Nagara', construction_century = 11 where name = 'Kandariya Mahadev Temple, Khajuraho';
update public.temples set architecture_style = 'Kalinga', construction_century = 13 where name = 'Konark Sun Temple';
update public.temples set architecture_style = 'Kalinga', construction_century = 11 where name = 'Lingaraj Temple, Bhubaneswar';
update public.temples set architecture_style = 'Kalinga', construction_century = 12 where name = 'Jagannath Temple, Puri';
update public.temples set architecture_style = 'Kalinga', construction_century = 13 where name = 'Biraja Temple, Jajpur';
update public.temples set architecture_style = 'Nagara', construction_century = 11 where name = 'Somnath Temple';
update public.temples set architecture_style = 'Nagara', construction_century = 16 where name = 'Dwarkadhish Temple, Dwarka';
update public.temples set architecture_style = 'Nagara', construction_century = 8 where name = 'Kashi Vishwanath Temple';
update public.temples set architecture_style = 'Kerala', construction_century = null where name = 'Guruvayur Sri Krishna Temple';
update public.temples set architecture_style = 'Kerala', construction_century = null where name = 'Vadakkunnathan Temple, Thrissur';
update public.temples set architecture_style = 'Kerala', construction_century = 18 where name = 'Padmanabhaswamy Temple, Thiruvananthapuram';
update public.temples set architecture_style = 'Modern', construction_century = 21 where name = 'Golden Temple, Sripuram, Vellore';
update public.temples set architecture_style = 'Modern', construction_century = 21 where name = 'Ram Mandir, Ayodhya';
update public.temples set architecture_style = 'Dravidian', construction_century = 9 where name = 'Kamakshi Amman Temple, Kanchipuram';
update public.temples set architecture_style = 'Dravidian', construction_century = 8 where name = 'Varadaraja Perumal Temple, Kanchipuram';
