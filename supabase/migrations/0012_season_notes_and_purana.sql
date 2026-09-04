-- Ṛtam — proper sthala purana for the 19 temples that still lacked one, and
-- a rewrite of best_season_notes across most of the directory.
--
-- The old notes leaned on "Oct–Feb" as a default almost everywhere, which
-- flattened real regional differences. Most importantly, Tamil Nadu (coast
-- and interior alike) gets its main rain from the northeast monsoon in
-- Oct–Nov — the opposite of most of India, where that stretch is the dry
-- season — so "Nov–Feb" was actively misleading there. This migration
-- corrects that for every Tamil Nadu temple, and adds real differentiation
-- (cyclone-season caution on the eastern coast, fog in the north Indian
-- plains, Western Ghats monsoon on the Karnataka/Goa coast, etc.) elsewhere.

-- ── Missing sthala purana ────────────────────────────────────────────────

update public.temples set sthala_purana =
  'Tradition holds that Shiva revealed the secret of immortality (Amar Katha) to Parvati in this remote Himalayan cave, and that a pair of pigeons overheard it and became immortal themselves — pilgrims still report sighting a pair of doves near the cave. The ice lingam (a naturally forming stalagmite) that appears each year, waxing and waning with the moon, is worshipped as a swayambhu (self-manifest) form of Shiva.'
where name = 'Amarnath Cave Temple';

update public.temples set sthala_purana =
  'One of the Shakti Peethas, traditionally held to mark where Sati''s heart fell. Ambaji is the kuldevi (family deity) of many Gujarati and Rajasthani communities, and uniquely has no idol in the main shrine — worship is offered instead to a visible yantra (a geometric diagram) set into the wall, considered too sacred to be looked upon directly by some accounts.'
where name = 'Ambaji Temple';

update public.temples set sthala_purana =
  'Dedicated to Bahuchara Devi, whose vahana is a rooster. Tradition recounts several origin legends, including one where the goddess took her own life to escape bandits and cursed the land, later manifesting to bless a prince with a son on condition of dedicating his life to her service in feminine dress. The temple has long been a principal centre of devotion for Gujarat''s Hijra (transgender) community, who traditionally regard Bahuchara Devi as their patron goddess.'
where name = 'Bahucharaji Temple';

update public.temples set sthala_purana =
  'Built by the Chola emperor Raja Raja I and completed around 1010 CE, this is one of India''s largest temples and a UNESCO World Heritage Site. Its 66-metre vimana was, for centuries, among the tallest structures in the world, and tradition holds the single 80-tonne granite capstone at its peak was hauled up a 6-kilometre earthen ramp — with some accounts claiming the temple''s shadow never falls on the ground at noon, a detail popular in local lore though not something the temple asks visitors to verify.'
where name = 'Brihadeeswarar Temple, Thanjavur';

update public.temples set sthala_purana =
  'Tradition credits Adi Shankaracharya with installing the deity here on the banks of the Ganga at Haridwar. The temple, reached by a ropeway or a hillside climb, is dedicated to Chandi, the form of Devi described in the Devi Mahatmyam as having slain the demon generals Chanda and Munda — from which both the goddess''s epithet and the hill''s name are said to derive.'
where name = 'Chandi Devi Temple, Haridwar';

update public.temples set sthala_purana =
  'One of the Shakti Peethas, traditionally held to mark where Sati''s feet fell. The presiding form, Chhinnamasta, is depicted holding her own severed head — one of the more esoteric and tantric forms of the Devi — though the temple itself is a major, well-visited pilgrimage stop on the Himachal Shakti Peetha circuit alongside Naina Devi and Jwalamukhi.'
where name = 'Chintpurni Temple';

update public.temples set sthala_purana =
  'A modern temple, consecrated in 2007 by the Sri Narayani Peedam trust under the guidance of Sri Narayani Amma. Unlike the older sites in this directory, it carries no ancient sthala purana — its significance is contemporary, built around 1,500 sheets of gold covering its towers and ceilings, and a free meal (annadanam) served to every visitor regardless of faith.'
where name = 'Golden Temple, Sripuram, Vellore';

update public.temples set sthala_purana =
  'Built under the Chandela dynasty in the 11th century, this is the largest of the surviving Khajuraho temples — part of a group originally numbering around 85 shrines, of which about 25 survive. Its elaborate exterior carvings, covering every register of human experience, are traditionally read as a teaching on the passage from worldly desire (kama) toward liberation (moksha), with the sanctum housed at the end of a long ascent representing that same journey.'
where name = 'Kandariya Mahadev Temple, Khajuraho';

update public.temples set sthala_purana =
  'Built in the 13th century under the Eastern Ganga king Narasimhadeva I, the temple is conceived as a colossal stone chariot for Surya, the sun god, complete with twelve pairs of carved wheels and seven horses. Tradition links the site to the legend of Samba, Krishna''s son, who was cursed with leprosy and cured after performing penance to Surya on this coast — one account among several for why a sun temple was raised here.'
where name = 'Konark Sun Temple';

update public.temples set sthala_purana =
  'Held by tradition to be the exact site of the prison cell where Krishna was born to Devaki and Vasudeva, under the tyranny of Devaki''s brother, King Kamsa. The site has been rebuilt and re-consecrated many times over the centuries; the present temple complex stands immediately beside the Shahi Idgah, and both sit within what is revered as the same ancient birthplace precinct.'
where name = 'Krishna Janmabhoomi Temple, Mathura';

update public.temples set sthala_purana =
  'One of Odisha''s oldest and largest temples, with a documented history stretching back over a thousand years under successive Somavamshi and Ganga dynasty patronage. The presiding deity, Harihara, combines Shiva and Vishnu in a single form, and the temple compound is described at length in the Ekamra Purana, a regional Sanskrit text devoted to the sacred geography of Bhubaneswar.'
where name = 'Lingaraj Temple, Bhubaneswar';

update public.temples set sthala_purana =
  'One of the Shakti Peethas, traditionally held to mark where a breast of Sati fell. Its location in Gaya links it to one of the subcontinent''s most significant sites for pinda daan (ancestral rites) — pilgrims performing rites for their forebears elsewhere in Gaya customarily visit Mangala Gauri as part of the same pilgrimage.'
where name = 'Mangala Gauri Temple, Gaya';

update public.temples set sthala_purana =
  'One of the Shakti Peethas, traditionally held to mark where the eyes (nain) of Sati fell — giving the goddess and the temple their name. Set on a hilltop above Anandpur Sahib, it is one of the most visited of the Himachal peetha circuit, reached today by road or a ropeway.'
where name = 'Naina Devi Temple';

update public.temples set sthala_purana =
  'Revered as the birthplace (janmabhoomi) of Rama. The site was long contested between Hindu and Muslim communities and was the subject of a decades-long legal dispute, resolved by the Supreme Court of India in 2019; construction of the present temple began in 2020 and the sanctum was consecrated (pran pratishtha) in January 2024.'
where name = 'Ram Mandir, Ayodhya';

update public.temples set sthala_purana =
  'The deity, Shrinathji — Krishna as a seven-year-old lifting Govardhan Hill on one finger — is traditionally said to have travelled from Braj (near Mathura) in the late 17th century to escape Aurangzeb''s campaign against temples there. According to the tradition, the deity''s cart became stuck in the mud at Nathdwara and was taken as a sign to enshrine it on the spot. It remains the principal seat of the Pushtimarg, the devotional path founded by Vallabhacharya.'
where name = 'Shrinathji Temple, Nathdwara';

update public.temples set sthala_purana =
  'One of the Shakti Peethas — by most accounts marking where the third eye or the eyeball of Sati fell — and one of the major seats of Tantric practice in Bengal. Tradition holds that the sage Vashishtha attained siddhi (spiritual accomplishment) here through Tantric sadhana, and the temple remains closely associated with the adjoining cremation ground on the Dwarka riverbank.'
where name = 'Tarapith Temple';

update public.temples set sthala_purana =
  'One of the Shakti Peethas, traditionally held to mark where the right foot of Sati fell. Tripura Sundari has long been the principal state deity of the former kingdom of Tripura, and the temple''s distinctive hut-shaped (kurma, or tortoise-back) roof, unusual among Shakti Peethas, is said to have been modelled on a local Bengali temple style by the Tripura royal family who built it in the 15th century.'
where name = 'Tripura Sundari Temple, Udaipur';

update public.temples set sthala_purana =
  'Tradition holds that Vaishno Devi, an incarnation of Adi Shakti, took human form as a devotee of Rama before withdrawing to these hills to meditate. Pursued by the tantric Bhairavnath, she is said to have fought and ultimately beheaded him at a cave further up the mountain (now Bhairon Ghati) before manifesting herself permanently as three natural rock formations (pindis) in the main cave, representing Mahakali, Mahalakshmi, and Mahasaraswati together.'
where name = 'Vaishno Devi Temple, Katra';

update public.temples set sthala_purana =
  'Among the oldest continuously worshipped temples in India, with inscriptions and shrine elements predating the Vijayanagara empire that later grew up around it. Tradition holds that the local goddess Pampa (for whom the Tungabhadra river and the region Pampa-kshetra, later "Hampi", are named) performed penance to win Shiva as her husband — he accepted her here in the form of Virupaksha, and the couple''s wedding is still re-enacted annually at the temple''s Vijayotsava festival.'
where name = 'Virupaksha Temple, Hampi';

-- ── Season-note rewrite ──────────────────────────────────────────────────
-- Tamil Nadu: corrects the Oct–Nov northeast-monsoon issue described above.

update public.temples set best_season_notes =
  'Dec–Mar is the safer window here — like the rest of Tamil Nadu''s coast and interior, Kumbakonam gets its main rain from the northeast monsoon in Oct–Nov, the opposite of most of India''s calendar. The Mahamaham tank festival, held every 12 years, is the exception worth planning around regardless of season.'
where name = 'Adi Kumbeswarar Temple, Kumbakonam';

update public.temples set best_season_notes =
  'Dec–Mar avoids Tamil Nadu''s northeast-monsoon rains (Oct–Nov); the Karthigai Deepam festival (Nov/Dec) with its hilltop beacon falls right in that wet, very crowded window, so plan for both if attending.'
where name = 'Arunachaleswarar Temple, Thiruvannamalai (Agni Sthalam)';

update public.temples set best_season_notes =
  'Dec–Mar, early morning to avoid the heat. Like the rest of Tamil Nadu, Thanjavur''s rains come from the northeast monsoon in Oct–Nov rather than the June–September window most of India associates with monsoon season.'
where name = 'Brihadeeswarar Temple, Thanjavur';

update public.temples set best_season_notes =
  'Dec–Mar; one of Kanchipuram''s two must-see temples along with Kamakshi Amman. Tamil Nadu''s main rains fall in Oct–Nov (the northeast monsoon), later than the rest of India, so late-year visits here are wetter than the calendar might suggest.'
where name = 'Ekambareswarar Temple, Kanchipuram (Prithvi Sthalam)';

update public.temples set best_season_notes =
  'Dec–Mar. A modern (2007) temple known for its gold-plated architecture, free entry, and prasadam meal — comfortable to visit most of the year, but Tamil Nadu''s northeast monsoon (Oct–Nov) is worth avoiding if possible.'
where name = 'Golden Temple, Sripuram, Vellore';

update public.temples set best_season_notes =
  'Dec–Mar; pairs naturally with Srirangam''s Ranganathaswamy Temple nearby. Tiruchirappalli sits in the same northeast-monsoon belt as the rest of Tamil Nadu, with its wettest weeks typically in Oct–Nov.'
where name = 'Jambukeswarar Temple, Tiruvanaikaval (Appu Sthalam)';

update public.temples set best_season_notes =
  'Dec–Mar; easy to combine with Ekambareswarar Temple in the same town. As with the rest of Tamil Nadu, Kanchipuram''s heaviest rain falls in Oct–Nov via the northeast monsoon, not the summer months.'
where name = 'Kamakshi Amman Temple, Kanchipuram';

update public.temples set best_season_notes =
  'Dec–Mar. Walkable from both the Kamakshi Amman and Ekambareswarar temples; the same northeast-monsoon timing (heaviest rain Oct–Nov) applies across Kanchipuram.'
where name = 'Kanchi Kamakoti Peetham';

update public.temples set best_season_notes =
  'Dec–Mar is most reliable; the Meenakshi Thirukalyanam festival (Apr/May) draws enormous crowds and real heat. Madurai, like the rest of Tamil Nadu, gets its main rain from the northeast monsoon in Oct–Nov.'
where name = 'Meenakshi Amman Temple, Madurai';

update public.temples set best_season_notes =
  'Jan–Feb for Thaipusam, one of the largest Murugan festivals anywhere — Palani''s hill-station elevation keeps it noticeably cooler than the Tamil Nadu plains year-round, so it is a reasonable visit outside that window too.'
where name = 'Palani Murugan Temple';

update public.temples set best_season_notes =
  'Dec–Mar; this coastal island is directly exposed to the Bay of Bengal''s northeast monsoon and occasional cyclones in Oct–Nov, on top of the extreme heat and humidity of the summer months.'
where name = 'Ramanathaswamy Temple, Rameswaram';

update public.temples set best_season_notes =
  'Dec–Mar; the largest functioning Hindu temple complex in the world — allow a full day. Srirangam''s heaviest rain, like the rest of Tamil Nadu, falls in the northeast monsoon of Oct–Nov rather than the summer months.'
where name = 'Ranganathaswamy Temple, Srirangam';

update public.temples set best_season_notes =
  'Dec–Jan for Margazhi, when Andal''s Thiruppavai verses are recited daily — this also happens to sit right after Tamil Nadu''s northeast-monsoon rains (heaviest Oct–Nov) have cleared, so it is a genuinely good time to travel, not just a festival window.'
where name = 'Srivilliputhur Andal Temple';

update public.temples set best_season_notes =
  'Dec–Jan for the Thiru Kalyanam festival, and a comfortable time generally — Kanyakumari district''s rain, like the rest of Tamil Nadu, peaks in the Oct–Nov northeast monsoon rather than the summer.'
where name = 'Suchindram Thanumalayan Temple';

update public.temples set best_season_notes =
  'Dec–Mar; the Natyanjali dance festival (Feb/Mar) is a major cultural draw. Chidambaram sits on the Tamil Nadu coast, directly in the path of the Oct–Nov northeast monsoon and occasional cyclones, worth avoiding if the itinerary allows.'
where name = 'Thillai Nataraja Temple, Chidambaram (Akasha Sthalam)';

update public.temples set best_season_notes =
  'Dec–Mar. One of the 108 Divya Desams, and among the most important Vishnu temples in the Tamil country — like the rest of Kanchipuram, its wettest weeks fall in the Oct–Nov northeast monsoon.'
where name = 'Varadaraja Perumal Temple, Kanchipuram';

-- ── Andhra Pradesh / coastal Bay of Bengal — cyclone-season nuance ───────

update public.temples set best_season_notes =
  'Nov–Feb; the ghat road up the forest reserve floods and can wash out in the June–September monsoon, and the Andhra coast''s cyclone season (Oct–Nov) is worth watching before booking.'
where name = 'Mallikarjuna Jyotirlinga, Srisailam';

update public.temples set best_season_notes =
  'Nov–Feb, especially Dasara/Sharannavaratri when the hill is illuminated; Vijayawada sits on the Andhra coast, where cyclone risk peaks in Oct–Nov ahead of the cooler, drier stretch that follows.'
where name = 'Kanaka Durga Temple, Vijayawada';

update public.temples set best_season_notes =
  'Nov–Feb. Simhachalam sits inland of Visakhapatnam, so it is less cyclone-exposed than the immediate coast, but still sees the same Bay of Bengal storm season taper off by November.'
where name = 'Simhachalam Varaha Narasimha Temple';

update public.temples set best_season_notes =
  'Dec–Feb; plan around Rath Yatra (June/July) only if you want the festival crowds, and note that Odisha''s coast carries real cyclone risk in Oct–Nov, ahead of its calmer, cooler winter.'
where name = 'Jagannath Temple, Puri';

update public.temples set best_season_notes =
  'Dec–Feb. Now primarily a UNESCO World Heritage monument, with worship limited compared to a living temple; like the rest of coastal Odisha, Oct–Nov carries the season''s main cyclone risk.'
where name = 'Konark Sun Temple';

update public.temples set best_season_notes =
  'Dec–Feb; non-Hindus are traditionally not permitted inside, viewing platform available outside. Bhubaneswar is a little inland of the coast, so it sees less direct cyclone exposure than Puri or Konark, but the same winter window is most comfortable.'
where name = 'Lingaraj Temple, Bhubaneswar';

update public.temples set best_season_notes =
  'Dec–Feb. Sits beside the Jagannath temple, so the two are usually visited together — the same Odisha cyclone-season caution (Oct–Nov) applies to both.'
where name = 'Govardhana Peetham, Puri';

update public.temples set best_season_notes =
  'Dec–Feb, especially Ashoka Ashtami and Durga Puja; Jajpur is inland of the Odisha coast and less cyclone-exposed, but shares the same wet June–September monsoon.'
where name = 'Biraja Temple, Jajpur';

-- ── West Bengal — same Bay of Bengal storm-season logic ─────────────────

update public.temples set best_season_notes =
  'Dec–Feb; associated with Sri Ramakrishna Paramahamsa, who lived here. Kolkata''s cyclone risk, like the rest of the West Bengal coast, is highest in Oct–Nov, ahead of a cooler, drier winter.'
where name = 'Dakshineswar Kali Temple, Kolkata';

update public.temples set best_season_notes =
  'Dec–Feb; the temple and surrounding lanes are very crowded year-round, so plan for a long queue regardless of season. Kolkata''s main storm risk falls in Oct–Nov, same as the rest of the Bengal coast.'
where name = 'Kalighat Kali Temple';

update public.temples set best_season_notes =
  'Dec–Feb; Kali Puja season (Oct/Nov) is the busiest, though it overlaps with Bengal''s cyclone-risk window — worth checking forecasts if travelling then.'
where name = 'Tarapith Temple';

update public.temples set best_season_notes =
  'Dec–Feb. The site''s hot springs (kunda) are used for ritual bathing year-round; Birbhum is inland, so it is less cyclone-exposed than coastal Bengal but shares the same humid June–September monsoon.'
where name = 'Bakreshwar Temple';

-- ── North Indian plains — winter fog, not just "Oct–Feb" ────────────────

update public.temples set best_season_notes =
  'Oct–Nov and Feb–Mar avoid both the summer heat (Apr–Jun) and the thick winter fog that can disrupt road and rail travel across the Gangetic plain in Dec–Jan; the ghats are pleasant and the queue is shorter on weekday mornings either way.'
where name = 'Kashi Vishwanath Temple';

update public.temples set best_season_notes =
  'Oct–Nov and Feb–Mar sidestep the Dec–Jan fog that regularly delays road and rail travel around Mathura; Janmashtami (Aug/Sept) and Holi are extremely crowded if you want the festival atmosphere instead.'
where name = 'Krishna Janmabhoomi Temple, Mathura';

update public.temples set best_season_notes =
  'Oct–Nov and Feb–Mar are the clearest weeks, avoiding the Dec–Jan north Indian fog belt; Ram Navami (Mar/Apr) and Diwali see the largest crowds.'
where name = 'Ram Mandir, Ayodhya';

update public.temples set best_season_notes =
  'Oct–Nov and Feb–Mar avoid the worst of the Gangetic plain''s winter fog; Navratri draws very large crowds in this stretch regardless.'
where name = 'Vindhyavasini Temple';

update public.temples set best_season_notes =
  'Oct–Mar, with Dec–Jan bringing thick fog to the Malwa plateau some mornings; extremely crowded during Simhastha Kumbh (every 12 years).'
where name = 'Mahakaleshwar Jyotirlinga, Ujjain';

-- ── Karnataka / Goa coast and Western Ghats — heavy SW monsoon ─────────

update public.temples set best_season_notes =
  'Oct–Mar; the Western Ghats here get very heavy southwest-monsoon rain from June to September, so the shoulder months just after it clears (Oct–Nov) are lush and green without the downpours.'
where name = 'Gokarna Mahabaleshwar Temple';

update public.temples set best_season_notes =
  'Oct–Mar. Navaratri is the principal festival; Kollur sits deep in the Western Ghats monsoon belt, so avoid June–September even more than most Karnataka coastal sites.'
where name = 'Kollur Mookambika Temple';

update public.temples set best_season_notes =
  'Oct–Feb. The Lakshadeepotsava festival of a hundred thousand lamps is a highlight; Dharmasthala sits in the same heavy Western Ghats rain belt as the rest of coastal Karnataka.'
where name = 'Dharmasthala Manjunatha Temple';

update public.temples set best_season_notes =
  'Nov–Feb is coolest; Paryaya festival years (every two years, in January) draw large crowds. Udupi''s coast gets very heavy southwest-monsoon rain June–September, more than inland Karnataka.'
where name = 'Sri Krishna Matha, Udupi';

-- ── A few remaining bare or thin notes, given real elaboration ──────────

update public.temples set best_season_notes =
  'Oct–Mar; a modest Shakti Peetha temple in the same Bhadarvi Purnima mela orbit as Ambaji — most comfortable outside Gujarat''s hot, humid monsoon (Jun–Sep).'
where name = 'Bahucharaji Temple';

update public.temples set best_season_notes =
  'Oct–Feb, after Telangana''s southwest monsoon (Jun–Sep) has fully cleared; the hill shrine was fully renovated in recent years with a new granite temple complex, so facilities hold up well even in the cooler crowds of Brahmotsavam season.'
where name = 'Yadagirigutta Lakshmi Narasimha Temple';
