-- Ṛtam — 14 more verified temples: completing the Panch Kedar and Panch
-- Badri circuits (4 of 5 shrines each were missing), completing the
-- Pancharama Kshetras (3 of 5 were missing), and filling thin coverage in
-- Rajasthan, Chhattisgarh, and Madhya Pradesh.
--
-- Coordinates for the remote Himalayan Panch Badri shrines at Subain
-- (Bhavishya Badri), Animath (Vridha Badri), and Adibadri (Adi Badri) are
-- best-effort approximations anchored to well-documented nearby landmarks
-- (Tapovan/Dhauliganga valley, Joshimath, and Karnaprayag/Chandpur Garhi
-- respectively) — no source gave precise coordinates for these small
-- villages, and one widely-mirrored "exact" coordinate for Adi Badri
-- (77°E) is a clear data error that would place it in Haryana, nowhere
-- near Chamoli district; it was not used.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Tungnath Temple', 'Shiva (Tungnath)', 'Shaiva', array['Panch Kedar'], 'India', 'Uttarakhand', 'Rudraprayag', 'Chopta', 30.48944, 79.21528, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Open roughly May–June and Sept–Nov; closed and inaccessible under snow in winter, when its deity is moved down to Mukunath near Chopta.', 'The third and highest of the five Panch Kedar temples, at 3,680 m — among the highest Shiva temples in the world, just below the Chandrashila peak. Tradition holds that after the Mahabharata war, Shiva evaded the Pandavas seeking absolution by taking the form of a bull and diving into the ground; where his body reappeared in five pieces became the five Panch Kedar shrines, and his arms (bahu) are said to have surfaced here. Local tradition credits the temple''s founding to Arjuna, and later Adi Shankaracharya, though it is thought to be over a thousand years old.', 'Local/regional tradition', 'North Indian Himalayan (Katyuri)', null, 'approved'
),
(
  'Rudranath Temple', 'Shiva (Rudranath)', 'Shaiva', array['Panch Kedar'], 'India', 'Uttarakhand', 'Chamoli', 'Gopeshwar', 30.53333, 79.33333, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Open only in the warmer months (roughly May–Oct); the trek — around 20 km from Sagar village near Gopeshwar — is considered the most demanding of the Panch Kedar circuit.', 'The fourth of the Panch Kedar temples, where tradition holds Shiva''s face (mukh) surfaced after the Pandavas'' search for him following the Mahabharata war — his other body parts are worshipped at the other four Panch Kedar shrines. Local belief holds that Shiva''s full body is worshipped at Pashupatinath in Kathmandu, while only the face is enshrined here, in his fierce Rudra form.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Madhyamaheshwar Temple', 'Shiva (Madhyamaheshwar)', 'Shaiva', array['Panch Kedar'], 'India', 'Uttarakhand', 'Rudraprayag', 'Gaundar', 30.63694, 79.21611, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Open roughly May–Oct; in winter the deity is carried down to Omkareshwar Temple in Ukhimath, about 36 km away, where it is worshipped for six months.', 'The second of the Panch Kedar temples, set in a high meadow, where tradition holds the navel (nabhi) of Shiva''s bull-form surfaced after the Pandavas pursued him for absolution following the Mahabharata war. A black-stone, navel-shaped Shivalinga is enshrined in the sanctum in his memory.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Kalpeshwar Temple', 'Shiva (Kalpeshwar / Jatadhar)', 'Shaiva', array['Panch Kedar'], 'India', 'Uttarakhand', 'Chamoli', 'Urgam', 30.5770417, 79.4229139, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'The only one of the five Panch Kedar temples open and accessible year-round — the others close for winter.', 'The fifth and final Panch Kedar temple, in the Urgam valley, where tradition holds Shiva''s matted locks (jata) surfaced after the Pandavas'' pursuit of him following the Mahabharata war — he is worshipped here as Jatadhar, "bearer of the matted hair." The temple''s priests are traditionally Dasnami Gossains, disciples of Adi Shankaracharya.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Yogadhyan Badri Temple', 'Vishnu (meditating form)', 'Vaishnava', array['Panch Badri'], 'India', 'Uttarakhand', 'Chamoli', 'Pandukeshwar', 30.63323, 79.55035, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Accessible for most of the year via the Badrinath highway; becomes the effective seat of worship each winter when Badrinath itself closes.', 'One of the five Panch Badri shrines to Vishnu. Every winter, when Badrinath Temple closes under snow, its idol of Vishnu is brought down and worshipped here instead. Tradition holds this is where King Pandu — father of the Pandavas — meditated seeking atonement for accidentally killing a sage who had taken the form of a mating deer, and where the Pandava princes were later born. Vishnu is worshipped here in a seated, meditating (yog dhyan) pose, in a temple built in the Dravidian style despite its Himalayan setting.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Bhavishya Badri Temple', 'Vishnu (Bhavishya Badri)', 'Vaishnava', array['Panch Badri'], 'India', 'Uttarakhand', 'Chamoli', 'Subain', 30.53, 79.7, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Reached via a roughly 3 km trail from the motor road beyond Tapovan, up the Dhauliganga valley; a warm-season visit (May–Oct) is most practical.', 'One of the five Panch Badri shrines, known as the "Future Badri" — tradition holds that when the path to Badrinath eventually becomes impassable, this temple will become the seat of Vishnu''s worship in its place.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Vridha Badri Temple', 'Vishnu (elderly form)', 'Vaishnava', array['Panch Badri'], 'India', 'Uttarakhand', 'Chamoli', 'Animath', 30.51, 79.55, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Close to Joshimath and accessible for most of the year.', 'Considered the oldest of the five Panch Badri shrines. Tradition holds this is where Vishnu appeared before the sage Narada in the form of an old man performing penance — a rare depiction of the deity in his elderly form, worshipped here as the most ancient seat of Badri.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Adi Badri Temple', 'Vishnu', 'Vaishnava', array['Panch Badri'], 'India', 'Uttarakhand', 'Chamoli', 'Adibadri', 30.15, 79.25, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Accessible year-round, being at a much lower elevation than the other Panch Badri shrines; reached from Karnaprayag, near Chandpur Garhi fort.', 'A complex of sixteen small shrines, of which seven date to the Gupta period (5th–8th century CE), traditionally attributed to Adi Shankaracharya. Considered the first among both the Panch Badri and the wider Sapta Badri circuit — tradition holds Vishnu resided here through the Satya, Treta, and Dvapara ages before relocating to Badrinath itself in the current Kali Yuga, hence the name "Adi" (first) Badri.', 'Local/regional tradition', 'Gupta-period stone shrine complex', 6, 'approved'
),
(
  'Someswara Swamy Temple, Bhimavaram', 'Shiva (Someswara)', 'Shaiva', array['Pancharama Kshetra'], 'India', 'Andhra Pradesh', 'West Godavari', 'Bhimavaram', 16.5412667, 81.5350861, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; Maha Shivaratri (Feb/Mar) and Sarannavaratri (Sept/Oct) are the major festival periods.', 'One of the five Pancharama Kshetras, sacred sites said to hold a fragment of the Atma-linga of the demon Tarakasura, shattered by Kartikeya (Kumara Swamy) and installed at five locations across the Godavari delta. Tradition holds the linga here — known as Someswara — was installed by Chandra, the moon god, and it is popularly said to change colour with the lunar cycle: white on the full moon (Purnima), black on the new moon (Amavasya).', 'Local/regional tradition', null, 3, 'approved'
),
(
  'Kumararama Bhimeswara Swamy Temple, Samalkota', 'Shiva (Bhimeswara)', 'Shaiva', array['Pancharama Kshetra'], 'India', 'Andhra Pradesh', 'Kakinada', 'Samalkota', 17.0423, 82.1713, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb; Maha Shivaratri Mahotsavamulu (Feb/Mar) is the principal festival.', 'One of the five Pancharama Kshetras, believed to hold a fragment of the demon Tarakasura''s shattered Atma-linga — this one consecrated, tradition holds, by Kartikeya (Kumara Swamy) himself, giving the site its name Kumararama. The sanctum holds a roughly 14-foot white crystal Shivalinga spanning two floors. The present temple is attributed to the Eastern Chalukya king Chalukya Bhima I (888–918 CE).', 'Local/regional tradition', 'Dravidian (Eastern Chalukya)', 9, 'approved'
),
(
  'Ksheerarama Temple, Palakollu', 'Shiva (Ksheera Ramalingeswara)', 'Shaiva', array['Pancharama Kshetra'], 'India', 'Andhra Pradesh', 'West Godavari', 'Palakollu', 16.5333, 81.7333, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'One of the five Pancharama Kshetras, sacred sites believed to each hold a fragment of the demon Tarakasura''s shattered Atma-linga. Local tradition holds that spending even a single day at Ksheerarama carries the merit of a year''s stay in Varanasi. The 120-foot temple is attributed to the Chalukyas of the 9th century CE.', 'Local/regional tradition', 'Chalukyan', 9, 'approved'
),
(
  'Salasar Balaji Temple', 'Hanuman (Balaji)', 'Vaishnava', array[]::text[], 'India', 'Rajasthan', 'Churu', 'Salasar', 27.72, 74.71, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb, avoiding peak Rajasthan summer heat; major fairs (melas) are held in Chaitra (Mar/Apr) and Ashwin (Sept/Oct), drawing especially large crowds.', 'According to local tradition, a black-stone idol of Hanuman (worshipped here as Balaji) was unearthed by a farmer while ploughing his field in the early 18th century; the temple grew up around it. It is said that the farmer''s wife had prepared churma (a wheat-and-jaggery sweet) that day, and the family offered it to the newly-found deity — churma has been the temple''s signature offering ever since.', 'Local/regional tradition', null, null, 'approved'
),
(
  'Bhoramdeo Temple', 'Shiva (Bhoramdeo)', 'Shaiva', array[]::text[], 'India', 'Chhattisgarh', 'Kabirdham', 'Chaurabhata', 22.116, 81.148, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'Named for the local Gond tribal community''s own name for Shiva, "Bhoramdeo," whom they have worshipped here for centuries. The temple complex, built between the 7th and 11th centuries CE under the Phanigvansha dynasty, is known for intricate carvings — including erotic sculpture in a style reminiscent of Khajuraho and Konark — earning it the nickname "the Khajuraho of Chhattisgarh."', 'Local/regional tradition', 'Nagara (Khajuraho-style)', 11, 'approved'
),
(
  'Pitambara Peeth, Datia', 'Bagalamukhi (Devi)', 'Shakta', array[]::text[], 'India', 'Madhya Pradesh', 'Datia', 'Datia', 25.67, 78.47, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Mar, avoiding peak central-India summer heat.', 'A major Shakta pilgrimage complex in the Sonagiri hills dedicated to Bagalamukhi, one of the ten Mahavidyas (wisdom-goddess forms of Devi), worshipped here for her power of stambhana — the paralysis of hostile forces. The complex holds 77 shrines on the hill and a further 26 in the village below, including a Dhumavati temple and a Shivalinga, Vankhandeswar, whose installation local tradition traces back to the era of the Mahabharata.', 'Local/regional tradition', null, null, 'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'तुंगनाथ मंदिर' where name = 'Tungnath Temple';
update public.temples set native_name = 'रुद्रनाथ मंदिर' where name = 'Rudranath Temple';
update public.temples set native_name = 'मध्यमहेश्वर मंदिर' where name = 'Madhyamaheshwar Temple';
update public.temples set native_name = 'कल्पेश्वर मंदिर' where name = 'Kalpeshwar Temple';
update public.temples set native_name = 'योगध्यान बद्री मंदिर' where name = 'Yogadhyan Badri Temple';
update public.temples set native_name = 'भविष्य बद्री मंदिर' where name = 'Bhavishya Badri Temple';
update public.temples set native_name = 'वृद्ध बद्री मंदिर' where name = 'Vridha Badri Temple';
update public.temples set native_name = 'आदि बद्री मंदिर' where name = 'Adi Badri Temple';
update public.temples set native_name = 'సోమేశ్వర స్వామి ఆలయం' where name = 'Someswara Swamy Temple, Bhimavaram';
update public.temples set native_name = 'కుమారారామ భీమేశ్వర స్వామి ఆలయం' where name = 'Kumararama Bhimeswara Swamy Temple, Samalkota';
update public.temples set native_name = 'క్షీరారామ ఆలయం' where name = 'Ksheerarama Temple, Palakollu';
update public.temples set native_name = 'सालासर बालाजी मंदिर' where name = 'Salasar Balaji Temple';
update public.temples set native_name = 'भोरमदेव मंदिर' where name = 'Bhoramdeo Temple';
update public.temples set native_name = 'पीताम्बरा पीठ' where name = 'Pitambara Peeth, Datia';

-- ── Festivals ────────────────────────────────────────────────────────────

insert into public.temple_festivals (temple_id, name, month, secondary_month, notes) values
((select id from public.temples where name = 'Someswara Swamy Temple, Bhimavaram'), 'Maha Shivaratri', 2, 3, null),
((select id from public.temples where name = 'Someswara Swamy Temple, Bhimavaram'), 'Sarannavaratri', 9, 10, null),
((select id from public.temples where name = 'Kumararama Bhimeswara Swamy Temple, Samalkota'), 'Maha Shivaratri Mahotsavamulu', 2, 3, null),
((select id from public.temples where name = 'Salasar Balaji Temple'), 'Chaitra Purnima Mela', 3, 4, null),
((select id from public.temples where name = 'Salasar Balaji Temple'), 'Ashwin Purnima Mela', 9, 10, null);
