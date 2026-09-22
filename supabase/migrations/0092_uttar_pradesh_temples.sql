-- Ṛtam — 4 more Uttar Pradesh temples beyond Hanuman Garhi, Alopi Devi
-- Mandir, Sankat Mochan Hanuman Temple, Vindhyavasini Temple,
-- Naimisharanya, Krishna Janmabhoomi Temple, Vishalakshi Temple, Kashi
-- Vishwanath Temple and Ram Mandir — all confirmed already live via a
-- direct database query before writing this batch.
--
-- Kaal Bhairav Mandir, Varanasi has no photo in this batch: both
-- Wikipedia and Wikidata's infobox for it actually use a photo of the
-- unrelated Kaal Bhairav shrine in Kathmandu, Nepal — a real mislabel
-- caught during research. Rather than propagate that error, or use a
-- differently-sourced but unverified image, this entry simply has no
-- photo for now. It's also worth noting explicitly: this is a
-- different temple from the Kal Bhairav Temple in Ujjain already in
-- this database (that one, in Madhya Pradesh, is known for liquor
-- offerings; this one, in Varanasi, for its peacock-feather-broom
-- ritual) — confirmed as two distinct temples during research.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, etiquette_notes, timings_notes, accessibility_notes, nearest_airport_name, nearest_airport_distance_km, nearest_railway_station_name, nearest_railway_distance_km, status
) values
(
  'Banke Bihari Temple, Vrindavan', 'Banke Bihari — a united form of Radha and Krishna, in tribhanga (three-bend) posture, worshipped as a child form', 'Vaishnava', array[]::text[], 'India', 'Uttar Pradesh', 'Mathura', 'Vrindavan', 27.57976, 77.69051, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Janmashtami, Radhashtami, Holi, Sharad Purnima (when the deity holds a flute) and Kartik Purnima are the major festivals; the deity is placed on a swing for one day during Shravan.',
  $$Originally worshipped by Swami Haridas at nearby Nidhivan under the name Kunj Bihari — devotional tradition rather than documented history. The present temple building dates to around 1862–1864, when the murti was moved to its current site, reportedly amid disputes between sadhu and goswami followers.$$,
  'Devotional tradition (Swami Haridas); temple construction records', 'Rajasthani style, completed around 1862', 19,
  'Darshan here is unusual: there is no continuous open view of the deity — a curtain is opened and closed every few minutes, traditionally so his gaze doesn''t linger on any one devotee for too long.',
  'Per tourism sources, not an official temple schedule: roughly 7:45am–12pm and 5:30–9:30pm in summer (Mar–Oct), 8:45am–1pm and 4:30–8:30pm in winter (Nov–Feb). Shringar Aarti around 8–9am, Rajbhog Aarti 11am–12pm.',
  'Very crowded, narrow lanes around the temple; a "Banke Bihari Corridor" project for ramps and improved wheelchair access is under development but not yet complete.',
  'Agra (Kheria) Airport', 55, 'Mathura Junction', 14, 'approved'
),
(
  'Kaal Bhairav Mandir, Varanasi', 'Kaal Bhairav — a fierce manifestation of Shiva, revered as the Kotwal (guardian/magistrate deity) of Kashi', 'Shaiva', array['Kotwal of Kashi']::text[], 'India', 'Uttar Pradesh', 'Varanasi', 'Varanasi', 25.31765, 82.97391, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Bhairav Ashtami is the major festival.',
  $$The exact founding date isn't documented; the current structure is dated to the mid-17th century. Tradition holds that no one may reside in, or even enter, Varanasi without Kaal Bhairav's sanction, and it's customary to visit here after Kashi Vishwanath darshan. This is a different temple from the Kal Bhairav Temple in Ujjain, Madhya Pradesh, already in this database — that one is known for liquor offerings to the deity, while this Varanasi temple's distinctive ritual is priests sweeping away bad omens with peacock-feather brooms and tying holy threads on devotees.$$,
  'Local tradition; temple history as documented by tourism and heritage sources', null, 17,
  null,
  'Per tourism sources, not an official schedule: roughly 5am–1:30pm and 4:30–9:30pm, with a midday closure. Mangala Aarti around 4am, Bhog Aarti around 1pm, Sandhya Aarti around 8–8:30pm.',
  null,
  'Lal Bahadur Shastri Airport, Varanasi', 25, null, null, 'approved'
),
(
  'Durga Mandir, Varanasi', 'Durga', 'Shakta', array[]::text[], 'India', 'Uttar Pradesh', 'Varanasi', 'Varanasi', 25.28862, 82.99928, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Durga Puja and Navratri are the major festivals; the quietest visiting window is cited as roughly 6–9am.',
  $$Built in the 18th century by Rani Bhabani of Natore, a Bengali queen and patron; the exact year isn't documented. Devi-Bhagavata Purana tradition holds it was built after Durga aided the Kashi Naresh (the king of Kashi) in a military conflict — legend, not verified history. It's popularly nicknamed the "Monkey Temple" for its resident monkey population, per tourism sources rather than the temple's own material.$$,
  'Devi-Bhagavata Purana tradition; local and tourism sources', 'North Indian Nagara style; distinctive red-ochre colouring, several small shikharas joined together with carved stonework', 18,
  null,
  'Per tourism sources, not an official schedule: roughly 5am–12pm and 4–9pm. Mangal Aarti around 4am, Bhog Aarti around 12pm, Sandhya Aarti around 7pm, Sayan Aarti around 10pm.',
  null,
  'Lal Bahadur Shastri Airport, Varanasi', 25, null, null, 'approved'
),
(
  'ISKCON Sri Krishna Balaram Mandir, Vrindavan', 'Krishna and Balarama (central altar); Radha Shyamsundar with the gopis Lalita and Vishakha (right altar); Chaitanya Mahaprabhu with Nityananda, alongside images of Prabhupada and his guru Bhaktisiddhanta Saraswati (left altar)', 'Vaishnava', array['ISKCON temple', 'Houses Srila Prabhupada''s samadhi']::text[], 'India', 'Uttar Pradesh', 'Mathura', 'Vrindavan', 27.57242, 77.67775, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Janmashtami, Radhashtami, Balarama Purnima, Gaura Purnima and Kartik Purnima are among the major festivals observed, alongside the appearance and disappearance days of Vaishnava acharyas.',
  $$Founded by A. C. Bhaktivedanta Swami Prabhupada, who installed the deities on Ram Navami (20 April) 1975; temple construction was completed in 1977. A white-marble samadhi mandir — a memorial shrine for Prabhupada — stands near the temple entrance within the complex.$$,
  'ISKCON institutional records', 'Modern Hindu temple architecture, a three-shrine complex completed in 1977', 20,
  null,
  'Per third-party guides, not independently confirmed against the official schedule: darshan roughly 4:30am–1pm and 4–8:15pm, with a midday closure for deity rest and prasadam preparation. Mangala Aarti at 4:30am; timings shift on Ekadashi and festival days.',
  null,
  'Agra (Kheria) Airport', 55, 'Mathura Junction', 14, 'approved'
);

insert into public.temple_photos (temple_id, url, caption, credit, license, source_url) values
(
  (select id from public.temples where name = 'Banke Bihari Temple, Vrindavan'),
  'https://upload.wikimedia.org/wikipedia/commons/e/e3/Banke_Bihari_Vrindavan.jpg',
  'Banke Bihari Temple, Vrindavan',
  'Kridha20, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Banke_Bihari_Vrindavan.jpg'
),
(
  (select id from public.temples where name = 'Durga Mandir, Varanasi'),
  'https://upload.wikimedia.org/wikipedia/commons/b/b1/Durga_Temple_gate.JPG',
  'Durga Mandir, Varanasi',
  'AKS.9955, via Wikimedia Commons',
  'CC BY-SA 4.0',
  'https://commons.wikimedia.org/wiki/File:Durga_Temple_gate.JPG'
),
(
  (select id from public.temples where name = 'ISKCON Sri Krishna Balaram Mandir, Vrindavan'),
  'https://upload.wikimedia.org/wikipedia/commons/4/4e/Vrindavan%2C_India_%2821178969102%29.jpg',
  'ISKCON Sri Krishna Balaram Mandir, Vrindavan',
  'Aleksandr Zykov, via Wikimedia Commons',
  'CC BY-SA 2.0',
  'https://commons.wikimedia.org/wiki/File:Vrindavan,_India_(21178969102).jpg'
);
