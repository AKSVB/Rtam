-- Ṛtam — temple names in their native/regional script, alongside English.
--
-- Populated only where the script is confidently known — Devanagari for
-- Sanskrit/Hindi-belt names, and the appropriate regional script for Tamil
-- Nadu, Andhra Pradesh/Telangana, Karnataka, Kerala, West Bengal, and
-- Odisha. Left null for a few temples in Punjab and Assam, whose native
-- scripts (Gurmukhi, Assamese) aren't ones this migration can render with
-- confidence — better blank than wrong.

alter table public.temples
  add column if not exists native_name text;

comment on column public.temples.native_name is
  'The temple name in its native/regional script, where confidently known. Purely additive to the English name — not a replacement.';

-- ── Tamil Nadu (Tamil) ───────────────────────────────────────────────────

update public.temples set native_name = 'பிரகதீஸ்வரர் கோயில்' where name = 'Brihadeeswarar Temple, Thanjavur';
update public.temples set native_name = 'மீனாட்சி அம்மன் கோயில்' where name = 'Meenakshi Amman Temple, Madurai';
update public.temples set native_name = 'அரங்கநாதசுவாமி கோயில்' where name = 'Ranganathaswamy Temple, Srirangam';
update public.temples set native_name = 'இராமநாதசுவாமி கோயில்' where name = 'Ramanathaswamy Temple, Rameswaram';
update public.temples set native_name = 'காமாக்ஷி அம்மன் கோயில்' where name = 'Kamakshi Amman Temple, Kanchipuram';
update public.temples set native_name = 'ஏகாம்பரேஸ்வரர் கோயில்' where name = 'Ekambareswarar Temple, Kanchipuram (Prithvi Sthalam)';
update public.temples set native_name = 'வரதராஜப் பெருமாள் கோயில்' where name = 'Varadaraja Perumal Temple, Kanchipuram';
update public.temples set native_name = 'அருணாசலேஸ்வரர் கோயில்' where name = 'Arunachaleswarar Temple, Thiruvannamalai (Agni Sthalam)';
update public.temples set native_name = 'தில்லை நடராஜர் கோயில்' where name = 'Thillai Nataraja Temple, Chidambaram (Akasha Sthalam)';
update public.temples set native_name = 'ஜம்புகேஸ்வரர் கோயில்' where name = 'Jambukeswarar Temple, Tiruvanaikaval (Appu Sthalam)';
update public.temples set native_name = 'பழனி முருகன் கோயில்' where name = 'Palani Murugan Temple';
update public.temples set native_name = 'சுசீந்திரம் தானுமாலயன் கோயில்' where name = 'Suchindram Thanumalayan Temple';
update public.temples set native_name = 'ஸ்ரீவில்லிபுத்தூர் ஆண்டாள் கோயில்' where name = 'Srivilliputhur Andal Temple';
update public.temples set native_name = 'ஆதி கும்பேஸ்வரர் கோயில்' where name = 'Adi Kumbeswarar Temple, Kumbakonam';
update public.temples set native_name = 'ஸ்ரீபுரம் பொன் கோயில்' where name = 'Golden Temple, Sripuram, Vellore';
update public.temples set native_name = 'காஞ்சி காமகோடி பீடம்' where name = 'Kanchi Kamakoti Peetham';

-- ── Andhra Pradesh / Telangana (Telugu) ──────────────────────────────────

update public.temples set native_name = 'శ్రీ వేంకటేశ్వర స్వామి ఆలయం' where name = 'Sri Venkateswara Swamy Temple, Tirumala';
update public.temples set native_name = 'మల్లికార్జున జ్యోతిర్లింగం' where name = 'Mallikarjuna Jyotirlinga, Srisailam';
update public.temples set native_name = 'శ్రీ కాళహస్తి ఆలయం' where name = 'Sri Kalahasti Temple (Vayu Sthalam)';
update public.temples set native_name = 'సింహాచలం వరాహ నరసింహ స్వామి ఆలయం' where name = 'Simhachalam Varaha Narasimha Temple';
update public.temples set native_name = 'అహోబిలం నరసింహ స్వామి ఆలయం' where name = 'Ahobilam Narasimha Temple';
update public.temples set native_name = 'కనక దుర్గ ఆలయం' where name = 'Kanaka Durga Temple, Vijayawada';
update public.temples set native_name = 'శ్రీ రాఘవేంద్ర స్వామి మఠం' where name = 'Sri Raghavendra Swamy Matha, Mantralayam';
update public.temples set native_name = 'యాదగిరిగుట్ట లక్ష్మీ నరసింహ స్వామి ఆలయం' where name = 'Yadagirigutta Lakshmi Narasimha Temple';
update public.temples set native_name = 'భద్రాచలం సీతారామచంద్రస్వామి ఆలయం' where name = 'Bhadrachalam Sita Ramachandraswamy Temple';
update public.temples set native_name = 'బాసర జ్ఞాన సరస్వతి ఆలయం' where name = 'Basara Gnana Saraswati Temple';

-- ── Karnataka (Kannada) ──────────────────────────────────────────────────

update public.temples set native_name = 'ವಿರೂಪಾಕ್ಷ ದೇವಸ್ಥಾನ' where name = 'Virupaksha Temple, Hampi';
update public.temples set native_name = 'ಶೃಂಗೇರಿ ಶಾರದಾ ಪೀಠ' where name = 'Sringeri Sharada Peetham';
update public.temples set native_name = 'ಶ್ರೀ ಕೃಷ್ಣ ಮಠ' where name = 'Sri Krishna Matha, Udupi';
update public.temples set native_name = 'ಚೆಲುವನಾರಾಯಣ ಸ್ವಾಮಿ ದೇವಸ್ಥಾನ' where name = 'Cheluvanarayana Swamy Temple, Melkote';
update public.temples set native_name = 'ಕೊಲ್ಲೂರು ಮೂಕಾಂಬಿಕಾ ದೇವಸ್ಥಾನ' where name = 'Kollur Mookambika Temple';
update public.temples set native_name = 'ಗೋಕರ್ಣ ಮಹಾಬಲೇಶ್ವರ ದೇವಸ್ಥಾನ' where name = 'Gokarna Mahabaleshwar Temple';
update public.temples set native_name = 'ಧರ್ಮಸ್ಥಳ ಮಂಜುನಾಥ ದೇವಸ್ಥಾನ' where name = 'Dharmasthala Manjunatha Temple';

-- ── Kerala (Malayalam) ───────────────────────────────────────────────────

update public.temples set native_name = 'ഗുരുവായൂർ ശ്രീകൃഷ്ണ ക്ഷേത്രം' where name = 'Guruvayur Sri Krishna Temple';
update public.temples set native_name = 'ശബരിമല അയ്യപ്പ ക്ഷേത്രം' where name = 'Sabarimala Ayyappa Temple';
update public.temples set native_name = 'ശ്രീ പദ്മനാഭസ്വാമി ക്ഷേത്രം' where name = 'Padmanabhaswamy Temple, Thiruvananthapuram';
update public.temples set native_name = 'വടക്കുന്നാഥ ക്ഷേത്രം' where name = 'Vadakkunnathan Temple, Thrissur';
update public.temples set native_name = 'ചോറ്റാനിക്കര ദേവീ ക്ഷേത്രം' where name = 'Chottanikkara Devi Temple';
update public.temples set native_name = 'ആറ്റുകാൽ ഭഗവതി ക്ഷേത്രം' where name = 'Attukal Bhagavathy Temple';
update public.temples set native_name = 'ആദി ശങ്കര ജന്മഭൂമി ക്ഷേത്രം' where name = 'Adi Shankara Janma Bhoomi Kshetram, Kalady';

-- ── West Bengal / Tripura (Bengali) ──────────────────────────────────────

update public.temples set native_name = 'দক্ষিণেশ্বর কালীমন্দির' where name = 'Dakshineswar Kali Temple, Kolkata';
update public.temples set native_name = 'কালীঘাট কালীমন্দির' where name = 'Kalighat Kali Temple';
update public.temples set native_name = 'তারাপীঠ মন্দির' where name = 'Tarapith Temple';
update public.temples set native_name = 'বক্রেশ্বর মন্দির' where name = 'Bakreshwar Temple';
update public.temples set native_name = 'ত্রিপুরা সুন্দরী মন্দির' where name = 'Tripura Sundari Temple, Udaipur';

-- ── Odisha (Odia) ────────────────────────────────────────────────────────

update public.temples set native_name = 'ଶ୍ରୀ ଜଗନ୍ନାଥ ମନ୍ଦିର' where name = 'Jagannath Temple, Puri';
update public.temples set native_name = 'ଲିଙ୍ଗରାଜ ମନ୍ଦିର' where name = 'Lingaraj Temple, Bhubaneswar';
update public.temples set native_name = 'କୋଣାର୍କ ସୂର୍ଯ୍ୟ ମନ୍ଦିର' where name = 'Konark Sun Temple';
update public.temples set native_name = 'ବିରଜା ମନ୍ଦିର' where name = 'Biraja Temple, Jajpur';

-- ── Sanskrit / Hindi-belt and Marathi/Konkani (Devanagari) ──────────────

update public.temples set native_name = 'काशी विश्वनाथ मन्दिर' where name = 'Kashi Vishwanath Temple';
update public.temples set native_name = 'केदारनाथ ज्योतिर्लिंग' where name = 'Kedarnath Jyotirlinga';
update public.temples set native_name = 'बद्रीनाथ मन्दिर' where name = 'Badrinath Temple';
update public.temples set native_name = 'अमरनाथ गुफा मन्दिर' where name = 'Amarnath Cave Temple';
update public.temples set native_name = 'वैष्णो देवी मन्दिर' where name = 'Vaishno Devi Temple, Katra';
update public.temples set native_name = 'महाकालेश्वर ज्योतिर्लिंग' where name = 'Mahakaleshwar Jyotirlinga, Ujjain';
update public.temples set native_name = 'ओंकारेश्वर ज्योतिर्लिंग' where name = 'Omkareshwar Jyotirlinga';
update public.temples set native_name = 'कंदारिया महादेव मन्दिर' where name = 'Kandariya Mahadev Temple, Khajuraho';
update public.temples set native_name = 'श्री कृष्ण जन्मभूमि मन्दिर' where name = 'Krishna Janmabhoomi Temple, Mathura';
update public.temples set native_name = 'श्री राम मन्दिर' where name = 'Ram Mandir, Ayodhya';
update public.temples set native_name = 'विंध्यवासिनी मन्दिर' where name = 'Vindhyavasini Temple';
update public.temples set native_name = 'मंगला गौरी मन्दिर' where name = 'Mangala Gauri Temple, Gaya';
update public.temples set native_name = 'वैद्यनाथ ज्योतिर्लिंग' where name = 'Vaidyanath Jyotirlinga, Deoghar';
update public.temples set native_name = 'सोमनाथ मन्दिर' where name = 'Somnath Temple';
update public.temples set native_name = 'द्वारकाधीश मन्दिर' where name = 'Dwarkadhish Temple, Dwarka';
update public.temples set native_name = 'नागेश्वर ज्योतिर्लिंग' where name = 'Nageshwar Jyotirlinga, Dwarka';
update public.temples set native_name = 'अंबाजी मन्दिर' where name = 'Ambaji Temple';
update public.temples set native_name = 'श्रीनाथजी मन्दिर' where name = 'Shrinathji Temple, Nathdwara';
update public.temples set native_name = 'एकलिंगजी मन्दिर' where name = 'Eklingji Temple, Kailashpuri';
update public.temples set native_name = 'करणी माता मन्दिर' where name = 'Karni Mata Temple, Deshnoke';
update public.temples set native_name = 'खाटू श्याम जी मन्दिर' where name = 'Khatu Shyam Ji Temple';
update public.temples set native_name = 'पुष्कर ब्रह्मा मन्दिर' where name = 'Pushkar Brahma Temple';
update public.temples set native_name = 'कालकाजी मन्दिर' where name = 'Kalkaji Mandir, Delhi';
update public.temples set native_name = 'चंडी देवी मन्दिर' where name = 'Chandi Devi Temple, Haridwar';
update public.temples set native_name = 'ज्योतिर्मठ' where name = 'Jyotirmath (Badari Peetham), Joshimath';
update public.temples set native_name = 'दंतेश्वरी मन्दिर' where name = 'Danteshwari Temple, Dantewada';
update public.temples set native_name = 'भीमाशंकर ज्योतिर्लिंग' where name = 'Bhimashankar Jyotirlinga';
update public.temples set native_name = 'त्र्यंबकेश्वर ज्योतिर्लिंग' where name = 'Trimbakeshwar Jyotirlinga';
update public.temples set native_name = 'घृष्णेश्वर ज्योतिर्लिंग' where name = 'Grishneshwar Jyotirlinga, Ellora';
update public.temples set native_name = 'विठ्ठल रुक्मिणी मन्दिर' where name = 'Vitthal Rukmini Temple, Pandharpur';
update public.temples set native_name = 'महालक्ष्मी मन्दिर' where name = 'Mahalakshmi Temple, Kolhapur';
update public.temples set native_name = 'शांतादुर्गा मन्दिर' where name = 'Shantadurga Temple, Kavalem';
update public.temples set native_name = 'मंगेशी मन्दिर' where name = 'Mangeshi Temple, Priol';
