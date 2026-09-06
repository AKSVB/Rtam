-- Ṛtam — the Malai Nadu Divya Desams: 13 of the 108 Divya Desams (Vishnu
-- shrines glorified by the Alvar poet-saints) located in and around
-- Kerala, two of them just across the border in today's Kanyakumari
-- district, Tamil Nadu. Three were already in the database under other
-- names (Padmanabhaswamy Thiruvananthapuram, Thrikkakara Vamanamoorthy,
-- Sree Vallabha Thiruvalla) — this tags those three and adds the other
-- ten. Five of the Kerala shrines (Aranmula, Thiruvanvandoor, Thirupuliyoor,
-- Thrichittatt/Thiruchenkundroor, Thrikodithanam) share a well-documented
-- legend of having been built one each by the five Pandava brothers.
--
-- Thiruchenkundroor's coordinate is an approximation (Chengannur town
-- centre) since no source gave a precise building-level figure.

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude, sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier, food_source_name, food_distance_km, nearest_river_name, river_distance_km, best_season_notes, sthala_purana, sthala_purana_source, architecture_style, construction_century, status
) values
(
  'Adikesava Perumal Temple, Thiruvattar', 'Adikesava Perumal (Vishnu)', 'Vaishnava', array['Malai Nadu Divya Desam'], 'India', 'Tamil Nadu', 'Kanyakumari', 'Thiruvattar', 8.32972, 77.26583, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Thamirabarani', 0.3, 'Oct–Feb.', 'One of the Malai Nadu Divya Desams, uniquely encircled on three sides by the Kothai, Pahrali, and Thamirabarani rivers — giving the town its name, Vattaru ("circle of rivers"). Tradition holds two demons, Kesan and Kesi, troubled the sages after a flaw in one of Brahma''s yajnas; Vishnu slew Kesan and used Kesi as a pillow, and is known here as Adhikesava for the killing of Kesan. Inscriptions date the site to 779 in the Kollam Era.', 'Local/regional tradition; temple inscriptions', null, null, 'approved'
),
(
  'Thiruvazhmarban Temple, Thiruppathisaram', 'Thiruvazhmarban / Kuralappa Perumal (Vishnu)', 'Vaishnava', array['Malai Nadu Divya Desam'], 'India', 'Tamil Nadu', 'Kanyakumari', 'Thiruppathisaram', 8.2086, 77.4472, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'One of the Malai Nadu Divya Desams, also known as Thiruvanparisaram, traditionally held to have been built by the Chera king Kulasekara. The nine-foot image of Kuralappa Perumal is said to be made of kadu sarkara yogam, a traditional lime-based mortar. The oldest surviving inscription dates to 1139 CE, and the village is also revered as the birthplace of the Alvar saint Nammalvar''s mother.', 'Local/regional tradition; temple inscriptions', null, 12, 'approved'
),
(
  'Thiruvanvandoor Mahavishnu Temple', 'Pambanaiyappan (Vishnu)', 'Vaishnava', array['Malai Nadu Divya Desam'], 'India', 'Kerala', 'Alappuzha', 'Thiruvanvandoor', 9.34306, 76.57972, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Pamba', 0.2, 'Oct–Feb.', 'One of the Malai Nadu Divya Desams and one of five shrines in the Chengannur area tied to the Mahabharata, tradition holding it was built by Nakula, one of the five Pandava brothers, on the banks of the Pamba river — giving Vishnu the name Pambanaiyappan here. Glorified in the Nalayira Divya Prabandham of the Alvar saints.', 'Mahabharata tradition; Nalayira Divya Prabandham', 'Kerala style', null, 'approved'
),
(
  'Thirupuliyoor Mahavishnu Temple', 'Mayapiran (Vishnu)', 'Vaishnava', array['Malai Nadu Divya Desam'], 'India', 'Kerala', 'Alappuzha', 'Puliyoor', 9.30194, 76.58583, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Pamba', 0.5, 'Oct–Feb.', 'One of the Malai Nadu Divya Desams and one of five Pandava-built shrines of the Chengannur area, this one tradition credits to Bhima. Vishnu is worshipped here as Mayapiran, also called Thirupuliyoorappan, and the shrine is glorified in the Nalayira Divya Prabandham.', 'Mahabharata tradition; Nalayira Divya Prabandham', 'Kerala style', null, 'approved'
),
(
  'Aranmula Parthasarathy Temple', 'Parthasarathy (Vishnu)', 'Vaishnava', array['Malai Nadu Divya Desam'], 'India', 'Kerala', 'Pathanamthitta', 'Aranmula', 9.3281, 76.6879, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Pamba', 0.1, 'Oct–Feb; the Aranmula Boat Race (Uthrittathi Vallamkali) falls in Aug/Sep (Malayalam month Chingam) and draws huge crowds.', 'One of the Malai Nadu Divya Desams and one of five Pandava-built shrines of the Chengannur area, tradition crediting this one to Arjuna, with Krishna worshipped here as Parthasarathy, his charioteer form. Tradition holds the deity arrived by raft on six bamboo poles (aru mula), giving the village its name. The famous Aranmula snake-boat race traces to a legend of boats rushing to protect a devotee''s offering-laden vessel bound for the temple.', 'Mahabharata tradition; local/regional legend', 'Kerala style, with 18th-century wall paintings', null, 'approved'
),
(
  'Thrichittatt Mahavishnu Temple, Thiruchenkundroor', 'Imayavarappan (Vishnu) / Sengamalavalli', 'Vaishnava', array['Malai Nadu Divya Desam'], 'India', 'Kerala', 'Alappuzha', 'Chengannur', 9.318, 76.614, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Pamba', 1, 'Oct–Feb.', 'One of the Malai Nadu Divya Desams, known locally as Thrichittatt, and one of five Pandava-built shrines of the Chengannur area — this one credited to Yudhishthira (Dharmar). Vishnu is worshipped here as Imayavarappan with his consort as Sengamalavalli, and the shrine was praised by the Alvar saint Nammalvar.', 'Mahabharata tradition; Nalayira Divya Prabandham', null, null, 'approved'
),
(
  'Thrikodithanam Mahavishnu Temple', 'Atputha Narayana (Vishnu)', 'Vaishnava', array['Malai Nadu Divya Desam'], 'India', 'Kerala', 'Kottayam', 'Thrikodithanam', 9.4381, 76.5619, 'unknown', null, 'unknown', null, 'unknown', null, null, null, null, 'Oct–Feb.', 'One of the Malai Nadu Divya Desams and the last of five Pandava-built shrines of the Chengannur area, tradition crediting this one to Sahadeva — who, unable to find a Vishnu murti as his four brothers had, is said to have been on the verge of ending his life on a pyre when a four-armed image of Vishnu miraculously appeared from the flames, worshipped since as Atputha ("wondrous") Narayana. The temple is mentioned in the 16th-century Unniyachi Charitham and records a 965 CE donation by the Venad crown prince.', 'Mahabharata tradition; historical inscriptions', null, null, 'approved'
),
(
  'Thirumoozhikkulam Lakshmana Perumal Temple', 'Lakshmana Perumal (Vishnu)', 'Vaishnava', array['Malai Nadu Divya Desam'], 'India', 'Kerala', 'Ernakulam', 'Thirumoozhikkulam', 10.187835, 76.327099, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Periyar', 3, 'Oct–Feb.', 'One of the Malai Nadu Divya Desams, praised in verse by both Nammalvar and Tirumangai Alvar. Tradition holds the sage Hareetha performed long penance to Vishnu on the banks of a nearby river, and was rewarded at the start of Kali Yuga with Vishnu''s appearance and counsel (thirumozhi, "sacred words") — giving the site its name.', 'Nalayira Divya Prabandham; local/regional tradition', null, null, 'approved'
),
(
  'Thirunavaya Navamukunda Temple', 'Navamukundan (Vishnu) / Malarmangai Nachiyar', 'Vaishnava', array['Malai Nadu Divya Desam'], 'India', 'Kerala', 'Malappuram', 'Tirunavaya', 10.8636, 75.9817, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bharathapuzha', 0.2, 'Oct–Feb.', 'One of the Malai Nadu Divya Desams, historically also the venue of the Mamankam, a once-every-12-years festival held here from at least the 8th century CE until it was discontinued; the Pazhukka Mandapam, from which the Zamorins of Calicut watched the festivities, still stands in the temple''s southeast corner. The present structure was renovated by the local Vettath Raja and later damaged during Tipu Sultan''s 18th-century invasion of Kerala.', 'Local/regional tradition; historical record', 'Kerala style', null, 'approved'
),
(
  'Thirumittakode Anchumoorthi Temple, Thiruvithuvakkodu', 'Uyyavantha Perumal (Vishnu)', 'Vaishnava', array['Malai Nadu Divya Desam'], 'India', 'Kerala', 'Palakkad', 'Thirumittacode', 10.783112, 76.184295, 'unknown', null, 'unknown', null, 'unknown', null, null, 'Bharathapuzha', 1, 'Oct–Feb.', 'One of the Malai Nadu Divya Desams, also called Thiruvithuvakkodu, and unusual in enshrining five deities together ("Anchumoorthi") including Shiva as Thiruvithamkodappan alongside Vishnu as Uyyavantha Perumal and Abhaya Pradhan, with Lakshmi as Padmasini. Tradition holds the Pandavas, during their exile, reached the banks of the Bharathapuzha and installed the Vishnu image here, with each brother associated with a different facing image of the deity.', 'Mahabharata tradition; local/regional tradition', 'Kerala style', null, 'approved'
);

-- ── Native names ─────────────────────────────────────────────────────────

update public.temples set native_name = 'ஆதிகேசவ பெருமாள் கோயில்' where name = 'Adikesava Perumal Temple, Thiruvattar';
update public.temples set native_name = 'திருவாழ்மார்பன் கோயில்' where name = 'Thiruvazhmarban Temple, Thiruppathisaram';
update public.temples set native_name = 'തിരുവന്‍വണ്ടൂര്‍ മഹാവിഷ്ണു ക്ഷേത്രം' where name = 'Thiruvanvandoor Mahavishnu Temple';
update public.temples set native_name = 'തിരുപ്പുലിയൂര്‍ മഹാവിഷ്ണു ക്ഷേത്രം' where name = 'Thirupuliyoor Mahavishnu Temple';
update public.temples set native_name = 'ആറന്മുള പാര്‍ത്ഥസാരഥി ക്ഷേത്രം' where name = 'Aranmula Parthasarathy Temple';
update public.temples set native_name = 'തൃച്ചിറ്റാറ്റ് മഹാവിഷ്ണു ക്ഷേത്രം' where name = 'Thrichittatt Mahavishnu Temple, Thiruchenkundroor';
update public.temples set native_name = 'തൃക്കൊടിത്താനം മഹാക്ഷേത്രം' where name = 'Thrikodithanam Mahavishnu Temple';
update public.temples set native_name = 'തിരുമൂഴിക്കുളം ശ്രീ ലക്ഷ്മണ പെരുമാള്‍ ക്ഷേത്രം' where name = 'Thirumoozhikkulam Lakshmana Perumal Temple';
update public.temples set native_name = 'തിരുനാവായ നാവാമുകുന്ദ ക്ഷേത്രം' where name = 'Thirunavaya Navamukunda Temple';
update public.temples set native_name = 'തിരുമിറ്റക്കോട് അഞ്ചുമൂര്‍ത്തി ക്ഷേത്രം' where name = 'Thirumittakode Anchumoorthi Temple, Thiruvithuvakkodu';

-- ── Tag the three existing Malai Nadu Divya Desams ──────────────────────

update public.temples
  set significance = significance || array['Malai Nadu Divya Desam']
  where name = 'Padmanabhaswamy Temple, Thiruvananthapuram' and not (significance @> array['Malai Nadu Divya Desam']);

update public.temples
  set significance = significance || array['Malai Nadu Divya Desam']
  where name = 'Thrikkakara Vamanamoorthy Temple' and not (significance @> array['Malai Nadu Divya Desam']);

update public.temples
  set significance = significance || array['Malai Nadu Divya Desam']
  where name = 'Sree Vallabha Temple, Thiruvalla' and not (significance @> array['Malai Nadu Divya Desam']);
