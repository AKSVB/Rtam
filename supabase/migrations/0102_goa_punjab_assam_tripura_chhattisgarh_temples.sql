-- Ṛtam — 6 temples across thinly-covered states: Mahalasa Narayani
-- (Goa), Devi Talab (Punjab), Hayagriva Madhava (Assam), Unakoti (Tripura),
-- Bamleshwari and Rajiv Lochan (Chhattisgarh). None existed live, confirmed
-- by a direct database query before writing this batch.
--
-- Fields the research couldn't verify from a source are left null. Where
-- sources conflict (Devi Talab's which-breast legend, Hajo's foundation
-- date, Rajiv Lochan's dating, Unakoti's dating), the conflict is stated in
-- the text rather than resolved. No photo for Bamleshwari (the only Commons
-- hit shows the approach path, not the shrine) or Rajiv Lochan (the file
-- wasn't visually verified).

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Mahalasa Narayani Temple, Mardol', 'Mahalasa, identified as Mohini, the female form of Vishnu', null, array[]::text[], 'India', 'Goa', 'North Goa', 'Mardol', 15.441, 73.973, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Magha Jatra and Navaratri are the major festivals, with a Palakhi Seva on Sundays.',
  $$The present temple dates to the 17th century. The idol was rescued from the earlier temple at Verna, destroyed by the Portuguese in 1567. Tradition holds that the icon travelled from Nepal to Aurangabad and then to Goa — tradition, not documented history. Attendant shrines to Shantadurga and Lakshmi Narayan stand on the grounds.$$,
  'Wikipedia (Mahalasa Narayani Temple, Mardol)', null, 17,
  'A tourism site says western or revealing clothing is prohibited; this is not from an official source.',
  'Sources conflict and no official schedule was found (one lists roughly 9:30am–7:30pm, another 6:30am–8:30pm) — check locally.',
  null,
  'Dabolim Airport', 28, null, null, 'approved'
),
(
  'Devi Talab Mandir, Jalandhar', 'Durga, worshipped here as Tripurmalini (with Shiva as Bhishan)', 'Shakta', array[]::text[], 'India', 'Punjab', 'Jalandhar', 'Jalandhar', 31.34361, 75.58306, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Navratri and Durga Puja are the major festivals.',
  $$Tradition holds this is a Shakti Peetha where a part of Sati fell, but sources disagree on which: the temple's own site says the right breast, another temple-listing site says the left. It is also not on every list of the 51 Peethas, so it is not tagged as one. The temple and its pond are often described as about 200 years old, an unverified figure.$$,
  'Temple official site; Wikipedia (Devi Talab Mandir); Peetha attribution is traditional', null, null,
  null,
  null,
  'The temple site lists a dharamshala, langar, a charitable hospital and toilets on the premises.',
  null, null, 'Jalandhar City Railway Station', 1, 'approved'
),
(
  'Hayagriva Madhava Temple, Hajo', 'Vishnu as Hayagriva / Madhava', 'Vaishnava', array[]::text[], 'India', 'Assam', 'Kamrup', 'Hajo', 26.2427, 91.5265, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Doul Utsav, Bihu and Janmashtami are the major occasions; lamps here are kept burning continuously.',
  $$The ASI Guwahati Circle records the temple as rebuilt in 1583 by the Koch king Raghudeva over the ruins of an earlier 10th–11th century temple. Tourism sources instead claim a 6th-century Pala origin; the two accounts conflict and both are noted. Some Buddhists also hold Hajo to be the site of the Buddha's parinirvana, a belief rather than an established fact.$$,
  'ASI Guwahati Circle; Wikipedia (Hayagriva Madhava Temple)', 'Nagara shikhara with an elephant frieze on the basement and an arched mandapa doorway', 16,
  null, null, null,
  'Lokpriya Gopinath Bordoloi International Airport, Guwahati', 35, null, null, 'approved'
),
(
  'Unakoti, Tripura', 'Shiva, in the form of Unakotiswara Kal Bhairava (a rock-cut figure about 30 ft tall), with Ganesha, Durga and Nandi', 'Shaiva', array[]::text[], 'India', 'Tripura', 'Unakoti', 'Kailashahar', 24.3167, 92.0667, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The Ashokastami Mela in April is the main fair, with a smaller one in January.',
  $$Legend says Shiva halted here on his way to Kashi with one crore minus one deities, who overslept and were cursed into stone. Local tribal tradition instead credits the sculptor Kallu Gurjar, who was set to carve a crore images in a night and fell one short. The dating is contested: the district administration suggests the 7th–9th century "if not earlier", while the one known inscription is in Bengali characters of the 11th–12th century. Coordinates are approximate.$$,
  'Unakoti district site; Wikipedia (Unakoti)', 'Rock-cut and rock-relief sculpture', null,
  null, null, null,
  'Agartala Airport (Maharaja Bir Bikram)', 178, 'Kumarghat Railway Station', 26, 'approved'
),
(
  'Bamleshwari Temple, Dongargarh', 'Bamleshwari — a form of Durga (the hilltop shrine is called Badi Bamleshwari)', 'Shakta', array[]::text[], 'India', 'Chhattisgarh', 'Rajnandgaon', 'Dongargarh', 21.17944, 80.75250, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Chaitra Navaratri and the autumn (Ashwin) Navaratri are the major festivals, with ritual lamps kindled for the nine days.',
  $$Tradition holds that the childless King Veersen prayed here and his queen bore a son, Madansen; a second tradition ties the temple to King Vikramaditya. The temple is said to be about 2,200 years old, a traditional claim with no archaeological support.$$,
  'Utsav (Government of India); Wikipedia (Bambleshwari Temple)', 'Nagara', null,
  null,
  null,
  'The hilltop shrine (about 1,600 ft) is reached by roughly 1,000 steps or by a ropeway; ropeway hours were not confirmed, and safety incidents have been reported there in past years.',
  'Swami Vivekananda Airport, Raipur', 125, 'Dongargarh Railway Station', 3, 'approved'
),
(
  'Rajiv Lochan Temple, Rajim', 'Vishnu as Rajivlochana, the lotus-eyed form (four-armed)', 'Vaishnava', array[]::text[], 'India', 'Chhattisgarh', 'Gariaband', 'Rajim', 20.96389, 81.87750, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Mahanadi', null, 'Rajim Kumbh (the fair at the Triveni Sangam of the Mahanadi, Pairi and Sondur rivers) draws the biggest crowds; sources disagree on whether it falls at Magh Purnima or Maha Shivaratri.',
  $$Dating is contested: an inscription attributes the temple to Vilasatunga of the Nala dynasty, placed in the 8th century on the style of the script, while others, following Cunningham, argue for a 5th-century origin with the inscription recording a restoration. Legends variously credit Vishvakarma, or a king called Jagat Pal who is said to have finished it in a day, or King Ratnakar after a vision. The complex also stands near the Kuleshwar Mahadev temple.$$,
  'Gariaband district site; Wikipedia (Rajiv Lochan Temple)', 'Pancayatana plan with four corner shrines (Narasimha, Vamana, Varaha, Badrinatha) and a sanctum tower of about 50 ft', null,
  null, null, null,
  'Swami Vivekananda Airport, Raipur', 42, 'Raipur Junction', 50, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Mahalasa Narayani Temple, Mardol'),
  'https://upload.wikimedia.org/wikipedia/commons/0/04/Mahalasatemple.jpg',
  'Mahalasa Narayani Temple, Mardol',
  'Kaveri, via Wikimedia Commons',
  'CC BY 2.5',
  'https://commons.wikimedia.org/wiki/File:Mahalasatemple.jpg'
),
(
  (select id from public.temples where name = 'Devi Talab Mandir, Jalandhar'),
  'https://upload.wikimedia.org/wikipedia/commons/6/64/Devi_Talab_Jalandhar_01.jpg',
  'Devi Talab Mandir, Jalandhar',
  'Shivamsetu, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Devi_Talab_Jalandhar_01.jpg'
),
(
  (select id from public.temples where name = 'Hayagriva Madhava Temple, Hajo'),
  'https://upload.wikimedia.org/wikipedia/commons/c/c7/Hagriva_Madhava_Temple_side_view2.jpg',
  'Hayagriva Madhava Temple, Hajo',
  'ComparingQuantities, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Hagriva_Madhava_Temple_side_view2.jpg'
),
(
  (select id from public.temples where name = 'Unakoti, Tripura'),
  'https://upload.wikimedia.org/wikipedia/commons/f/f0/Unakoti_3.jpg',
  'Rock carvings at Unakoti',
  'Barunghosh, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Unakoti_3.jpg'
);
