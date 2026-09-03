-- Ṛtam — expanding coverage into states with little or no representation yet
-- (Telangana, Delhi, Punjab, Haryana, Chhattisgarh, Goa, Rajasthan, and more
-- Karnataka/Kerala/Tamil Nadu/West Bengal/Odisha/Andhra Pradesh kshetras),
-- plus a few well-known circuits (Arupadaiveedu, more Shakti Peethas).

insert into public.temples (
  name, deity, sampradaya, significance, country, state, district, town, latitude, longitude,
  sandhya_friendly, sandhya_notes, samidhadhanam_friendly, samidhadhanam_notes, food_tier,
  food_source_name, food_distance_km,
  nearest_river_name, river_distance_km, best_season_notes, sthala_purana, status
) values
(
  'Yadagirigutta Lakshmi Narasimha Temple', 'Lakshmi Narasimha', 'Vaishnava', array[]::text[], 'India',
  'Telangana', 'Yadadri Bhuvanagiri', 'Yadagirigutta', 17.5833, 78.9463,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Oct–Feb. A hill shrine, fully renovated in recent years with a new granite temple complex.',
  'Named for the sage Yadarishi, who is said to have performed penance here seeking a vision of Narasimha in every one of his forms at once. Tradition holds the deity appeared in five aspects together in a hill cave — Jwala, Gandabherunda, Yogananda, Ugra, and Lakshmi Narasimha.',
  'approved'
),
(
  'Bhadrachalam Sita Ramachandraswamy Temple', 'Rama, Sita, Lakshmana', 'Vaishnava', array[]::text[], 'India',
  'Telangana', 'Bhadradri Kothagudem', 'Bhadrachalam', 17.6667, 80.8833,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Godavari', 0.3,
  'Nov–Feb. The Godavari Pushkaralu (every 12 years) brings very large crowds.',
  'Named for Bhadra, son of the mountain-sage Meru, who did tapas on this hill hoping Rama would appear to him. The temple''s renown owes much to Bhakta Ramadasu (Kancherla Gopanna), the 17th-century devotee-poet and local official who built the present shrine and was imprisoned for using treasury funds to do so.',
  'approved'
),
(
  'Basara Gnana Saraswati Temple', 'Saraswati', 'Smartha', array[]::text[], 'India',
  'Telangana', 'Nirmal', 'Basar', 19.3167, 77.9167,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Godavari', 0.2,
  'Oct–Mar. Vasant Panchami and children''s Aksharabhyasam (first-writing) ceremonies draw the largest crowds.',
  'One of only two well-known Saraswati temples in India (the other being Kashmir''s Sharada Peeth). Tradition holds that sage Vyasa, meditating here after the Mahabharata war, formed three sand hillocks representing Saraswati, Lakshmi, and Kali — the Saraswati mound became this temple.',
  'approved'
),
(
  'Kanaka Durga Temple, Vijayawada', 'Kanaka Durga', 'Shakta', array[]::text[], 'India',
  'Andhra Pradesh', 'NTR', 'Vijayawada', 16.5081, 80.6122,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Krishna', 0.2,
  'Oct–Feb, especially Dasara/Sharannavaratri when the hill is illuminated.',
  'Sited on the Indrakeeladri hill above the Krishna river. Tradition holds that Arjuna performed penance on this hill to obtain the Pashupatastra from Shiva, and that the Devi installed herself here afterward as Kanaka Durga.',
  'approved'
),
(
  'Kalkaji Mandir, Delhi', 'Kalkaji (Kali)', 'Shakta', array[]::text[], 'India',
  'Delhi', 'South Delhi', 'Kalkaji', 28.5505, 77.2588,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Sep–Mar. Navaratri draws the largest crowds; the temple is open year-round.',
  'An old self-manifest (swayambhu) Devi shrine, traditionally associated with the Pandavas, who are said to have worshipped here before the Kurukshetra war. The present structure was substantially rebuilt in the 18th–19th centuries.',
  'approved'
),
(
  'Durgiana Temple, Amritsar', 'Durga / Lakshmi-Narayan', 'Shakta', array[]::text[], 'India',
  'Punjab', 'Amritsar', 'Amritsar', 31.6222, 74.8762,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Oct–Mar. Diwali here is a major event, lit up alongside the Golden Temple.',
  'Built around a Durga idol on a site associated with sage Valmiki, the temple''s tank-and-causeway architecture deliberately echoes the nearby Harmandir Sahib. It is also known as the Lakshmi-Narayan temple for its adjoining Vishnu shrine.',
  'approved'
),
(
  'Bhadrakali Temple, Kurukshetra', 'Bhadrakali', 'Shakta', array['Shakti Peetha'], 'India',
  'Haryana', 'Kurukshetra', 'Kurukshetra', 29.9695, 76.8783,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Oct–Mar. Often visited alongside Brahma Sarovar and Jyotisar in the same town.',
  'Held by tradition to be one of the Shakti Peethas, marking the spot where an anklet (or the ankle) of Sati fell. Kurukshetra''s association with the Mahabharata war makes this one of the temples the Pandavas are said to have worshipped at before battle.',
  'approved'
),
(
  'Danteshwari Temple, Dantewada', 'Danteshwari (Durga)', 'Shakta', array['Shakti Peetha'], 'India',
  'Chhattisgarh', 'Dantewada', 'Dantewada', 18.9012, 81.3450,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Sankini-Dankini (confluence)', 0.2,
  'Nov–Feb. The Dussehra celebrations here run for months by local Bastar tradition, unusually long.',
  'Tradition holds this is the spot where a tooth (danta) of Sati fell, giving both the goddess and the town their names. Danteshwari has long been the kuldevi (family deity) of the former rulers of Bastar, and the region''s unusually long Bastar Dussehra is built around her festival.',
  'approved'
),
(
  'Shantadurga Temple, Kavalem', 'Shantadurga (Parvati)', 'Shakta', array[]::text[], 'India',
  'Goa', 'Ponda', 'Kavalem', 15.4167, 74.0667,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Nov–Feb, cool and dry season away from Goa''s monsoon.',
  'Tradition holds Parvati took this form to make peace between Vishnu and Shiva when they came to blows — Shanta-durga, "the goddess who pacifies". The deity was moved inland to Kavalem from Old Goa during the Portuguese era to protect it from destruction.',
  'approved'
),
(
  'Mangeshi Temple, Priol', 'Manguesh (Shiva)', 'Shaiva', array[]::text[], 'India',
  'Goa', 'Ponda', 'Priol', 15.4256, 73.9622,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Nov–Feb, cool and dry season away from Goa''s monsoon.',
  'One of Goa''s largest and most visited Shiva temples, also relocated to its present site from Old Goa (Kushasthali) during the Portuguese period to escape the demolition of Hindu shrines there.',
  'approved'
),
(
  'Eklingji Temple, Kailashpuri', 'Eklingji (Shiva)', 'Shaiva', array[]::text[], 'India',
  'Rajasthan', 'Udaipur', 'Kailashpuri', 24.7167, 73.6931,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Oct–Mar. A complex of over a hundred shrines, not a single temple.',
  'The tutelary deity (kuldevta) of the Mewar royal house, whose rulers traditionally styled themselves only as Eklingji''s regents (Dewan). The four-faced marble Shiva image and the surrounding complex of shrines date back over a thousand years, though rebuilt several times.',
  'approved'
),
(
  'Karni Mata Temple, Deshnoke', 'Karni Mata', 'Shakta', array[]::text[], 'India',
  'Rajasthan', 'Bikaner', 'Deshnoke', 27.7833, 73.3400,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Nov–Feb, to avoid the Thar desert heat.',
  'Karni Mata is venerated as an incarnation of Durga and kuldevi of the Bikaner royal family. The temple is famous for the thousands of black rats (kabas) living within it, held by tradition to be reincarnations of Karni Mata''s male descendants.',
  'approved'
),
(
  'Khatu Shyam Ji Temple', 'Khatu Shyam (Barbarika)', 'Vaishnava', array[]::text[], 'India',
  'Rajasthan', 'Sikar', 'Khatu', 27.6167, 75.1500,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Feb–Mar, around the Falgun Mela, is the busiest and most festive time.',
  'Dedicated to Barbarika, grandson of Bhima, who according to the Mahabharata offered to fight on the losing side out of a vow of fairness. Krishna, testing him, asked for his head as charity before the war; Barbarika''s severed head watched the battle from a hilltop and was later granted the boon of being worshipped as Krishna''s own form, Khatu Shyam, in the Kali Yuga.',
  'approved'
),
(
  'Pushkar Brahma Temple', 'Brahma', 'Smartha', array[]::text[], 'India',
  'Rajasthan', 'Ajmer', 'Pushkar', 26.4899, 74.5511,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Pushkar Lake', 0.1,
  'Oct–Nov for the Pushkar Camel Fair and Kartik Purnima bathing; cooler Nov–Feb otherwise.',
  'One of the very few Brahma temples in India. Tradition holds Brahma dropped a lotus (pushpa) to earth, and it fell here, creating Pushkar Lake; he then performed a yajna on its banks, but forgot to invite his wife Saraswati and married the local milkmaid Gayatri to complete the rite in time, drawing a curse that he be worshipped almost nowhere else.',
  'approved'
),
(
  'Kollur Mookambika Temple', 'Mookambika (Devi)', 'Shakta', array[]::text[], 'India',
  'Karnataka', 'Udupi', 'Kollur', 13.8667, 74.8500,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Souparnika', 0.3,
  'Oct–Mar. Navaratri is the principal festival.',
  'The deity here is held to combine Saraswati, Lakshmi, and Parvati in one form. Tradition credits Adi Shankaracharya with installing the Sri Chakra at the sanctum and fixing the present form of worship during his travels through the region.',
  'approved'
),
(
  'Gokarna Mahabaleshwar Temple', 'Mahabaleshwara (Shiva)', 'Shaiva', array[]::text[], 'India',
  'Karnataka', 'Uttara Kannada', 'Gokarna', 14.5500, 74.3167,
  'yes', 'The temple sits close to the town''s beach and bathing ghats on the Arabian Sea.', 'unknown', null, 'unknown', null, null,
  null, null,
  'Oct–Mar. Shivaratri here is one of the largest in coastal Karnataka.',
  'Tradition holds that Ravana obtained the Atma Linga from Shiva but was tricked by Ganesha (disguised as a boy) into setting it down here, after which it could not be moved — it remains fixed at Gokarna, sometimes called the "Kashi of the South" for this reason.',
  'approved'
),
(
  'Dharmasthala Manjunatha Temple', 'Manjunatha (Shiva)', 'Shaiva', array[]::text[], 'India',
  'Karnataka', 'Dakshina Kannada', 'Dharmasthala', 12.9333, 75.3833,
  'unknown', null, 'unknown', null, 'pure_veg_available',
  'Temple Bhojanshala — free meals served continuously to all pilgrims, regardless of faith', 0.0,
  'Netravathi', 0.5,
  'Oct–Feb. The Lakshadeepotsava festival of a hundred thousand lamps is a highlight.',
  'A uniquely syncretic kshetra where Vedic Shiva worship, conducted by a Brahmin priest, is administered by a Jain Bunt family carrying the hereditary title Dharmadhikari. Tradition holds the site was sanctified by four deities (the Daivas) who asked the family''s ancestors to look after it, alongside Manjunatha.',
  'approved'
),
(
  'Vadakkunnathan Temple, Thrissur', 'Vadakkunnathan (Shiva)', 'Shaiva', array[]::text[], 'India',
  'Kerala', 'Thrissur', 'Thrissur', 10.5276, 76.2144,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Apr–May for Thrissur Pooram, the region''s largest temple festival; Oct–Feb otherwise.',
  'One of the oldest Shiva temples in Kerala, built in the classical Kerala mural-and-gajaprishta style. It hosts the Thrissur Pooram festival on its grounds, famous for its massed caparisoned elephants and percussion ensembles, though the temple itself does not take part in the procession.',
  'approved'
),
(
  'Chottanikkara Devi Temple', 'Bhagavathy (Devi)', 'Shakta', array[]::text[], 'India',
  'Kerala', 'Ernakulam', 'Chottanikkara', 9.9667, 76.3667,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Nov–Jan, around the Makam Thozhal festival.',
  'The deity is worshipped in three forms across the day — Saraswati in the morning, Lakshmi at midday, and Durga in the evening. The temple is widely known for rites addressing mental distress, performed at the adjoining Keezhkkavu shrine.',
  'approved'
),
(
  'Attukal Bhagavathy Temple', 'Attukal Bhagavathy (Devi)', 'Shakta', array[]::text[], 'India',
  'Kerala', 'Thiruvananthapuram', 'Thiruvananthapuram', 8.4740, 76.9520,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Killi', 0.3,
  'Feb–Mar for the Attukal Pongala, recognised by Guinness World Records as the largest annual gathering of women.',
  'During the Pongala festival, millions of women cook a sweet rice offering (pongala) in the open on the streets around the temple in a single day — a scale of participation that led to its Guinness World Record listing.',
  'approved'
),
(
  'Srivilliputhur Andal Temple', 'Andal / Vatapatrasayi (Vishnu)', 'Vaishnava', array[]::text[], 'India',
  'Tamil Nadu', 'Virudhunagar', 'Srivilliputhur', 9.5136, 77.6328,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Dec–Jan for Margazhi, when Andal''s Thiruppavai verses are recited daily.',
  'The birthplace of Andal, the only woman among the twelve Alvar poet-saints, who by tradition wore garlands intended for the deity before offering them and was ultimately taken in marriage by Vishnu at Srirangam. One of the 108 Divya Desams.',
  'approved'
),
(
  'Palani Murugan Temple', 'Dhandayuthapani (Murugan)', 'Shaiva', array[]::text[], 'India',
  'Tamil Nadu', 'Dindigul', 'Palani', 10.4500, 77.5167,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Jan–Feb for Thaipusam, one of the largest Murugan festivals anywhere.',
  'One of the six Arupadaiveedu (sacred abodes of Murugan). Tradition holds Murugan retreated here alone, renouncing a mango offered as a prize to whichever of he and Ganesha could circle the world first, after Ganesha won by circling their parents instead. The image is said to be carved by the sage Bhogar from an amalgam of nine minerals (navapashanam).',
  'approved'
),
(
  'Adi Kumbeswarar Temple, Kumbakonam', 'Kumbeswarar (Shiva)', 'Shaiva', array[]::text[], 'India',
  'Tamil Nadu', 'Thanjavur', 'Kumbakonam', 10.9601, 79.3788,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Cauvery', 1.0,
  'Every 12 years for the Mahamaham festival, likened to a Tamil Kumbh Mela; otherwise Nov–Feb.',
  'Tradition holds that after a great deluge, Shiva, as a physician, gathered the scattered fragments of the nectar-pot (kumbha) of creation that had washed here, and shaped the temple''s linga from the resulting sand — giving Kumbakonam (kumbha-koṇam) its name.',
  'approved'
),
(
  'Suchindram Thanumalayan Temple', 'Sthanumalaya (Shiva-Vishnu-Brahma)', 'Smartha', array[]::text[], 'India',
  'Tamil Nadu', 'Kanyakumari', 'Suchindram', 8.1667, 77.4667,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  null, null,
  'Dec–Jan for the Thiru Kalyanam festival.',
  'Unusual for housing a single form, Sthanumalaya, understood to combine Shiva (Sthanu), Vishnu (Mal), and Brahma (Ayan) together. Tradition connects the town''s name to Indra being purified (suchindram, "purified Indra") of a curse here.',
  'approved'
),
(
  'Bakreshwar Temple', 'Bakreshwar (Shiva) / Mahishmardini', 'Shakta', array['Shakti Peetha'], 'India',
  'West Bengal', 'Birbhum', 'Bakreshwar', 23.8870, 87.3770,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Paphara', 0.5,
  'Oct–Feb. The site''s hot springs (kunda) are used for ritual bathing year-round.',
  'Tradition holds this is the spot where the eyebrows (or, by some accounts, the mind) of Sati fell, making it one of the Shakti Peethas. The site is unusual for its cluster of natural hot springs, each traditionally associated with a different deity.',
  'approved'
),
(
  'Biraja Temple, Jajpur', 'Biraja (Durga)', 'Shakta', array['Shakti Peetha'], 'India',
  'Odisha', 'Jajpur', 'Jajpur', 20.8500, 86.3300,
  'unknown', null, 'unknown', null, 'unknown', null, null,
  'Vaitarani', 0.3,
  'Oct–Feb, especially Ashoka Ashtami and Durga Puja.',
  'Tradition holds this is the spot where the navel of Sati fell, making it one of the Shakti Peethas. It sits on the banks of the Vaitarani, a river with its own significance in Odia funerary tradition as the river souls are said to cross after death.',
  'approved'
);
