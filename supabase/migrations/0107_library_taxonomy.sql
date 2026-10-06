-- Ṛtam — a richer taxonomy for the Devotional Library.
--
-- With several hundred books, one coarse "category" dropdown (and a 100+ book
-- "Other" bucket) stops being useful. This adds:
--   * a finer primary TYPE (category): Vedas, Upanishads, Gita & Vedanta, Dharmashastra &
--     Smriti, Agama & Tantra, Sandhyavandanam/Puja/Vrata (ritual), Stotras, Bhajans,
--     Puranas, Itihasa, Kshetra Mahatmyams (sthala), Kavya, Panchangam & Jyotisha,
--     Biographies, Other;
--   * multi-valued topic tags (samhita, sandhyavandanam, vrata, gita, ...);
--   * published_year (where the title, description or author/edition note states one);
--   * format: printed or manuscript.
-- Existing books are classified from their title and description by the keyword rules
-- below, so a moderator can still correct any single book afterwards. Re-running is safe:
-- a book that matches no rule keeps its current category.

-- 1. Widen the allowed categories (dropping whatever check constraint covers the column).
do $$
declare c text;
begin
  for c in
    select conname from pg_constraint
    where conrelid = 'public.devotional_books'::regclass and contype = 'c'
      and pg_get_constraintdef(oid) ilike '%category%'
  loop
    execute format('alter table public.devotional_books drop constraint %I', c);
  end loop;
end $$;

alter table public.devotional_books
  add constraint devotional_books_category_check check (category in ('veda', 'upanishad', 'vedanta', 'smriti', 'agama', 'ritual', 'stotra', 'bhajan', 'purana', 'itihasa', 'sthala', 'kavya', 'panchang', 'biography', 'other'));

-- 2. New columns.
alter table public.devotional_books
  add column if not exists tags text[] not null default '{}',
  add column if not exists published_year smallint check (published_year between 1000 and 2100),
  add column if not exists format text not null default 'printed' check (format in ('printed', 'manuscript'));

create index if not exists devotional_books_tags_idx on public.devotional_books using gin (tags);
create index if not exists devotional_books_language_idx on public.devotional_books (language);
create index if not exists devotional_books_year_idx on public.devotional_books (published_year);

-- 3. Backfill type, tags, year and format for the existing books.
with src as (
  select id, category as old_category,
         regexp_replace(lower(title), 'veda ?vy[aā]sa', '', 'g') as ttl,
         lower(title || ' ' || coalesce(description, '')) as txt
  from public.devotional_books
)
update public.devotional_books b set
  category = case
    when src.ttl ~* 'sandhya|nityanushtana|nitya karma|nityakarma|puja ?vidhi|pujavidhi|pujavidhanam|puja ?kalp|pujakalp|vrata|vratha|vratham|vrathamu|vratakalp|somavara|soma vara|homa |vivaha|jatakarma|upanayan|tarpan|pinda|pitru|shraddh|sraddh|prayoga|paddhati|prayaschitta|kalasa|pravara|santi prayog|ahnika' then 'ritual'
    when src.ttl ~* 'kshetrayya|kṣētrayya|divya prabandham|tiruppavai|tiruvacakam|tiruvācakam|tevaram|kirtamal' then 'bhajan'
    when src.ttl ~* 'smriti|dharma ?sutra|dharmasutra|dharmasastra|dharmashastra|dharma sastra|grihya|gṛhya|manusmriti|yajnavalkya smriti|yajnavalkiya|parasara|parāśara|putrika|nirnaya ?sindhu|apastamba|asvalayana|baudhayana|vaikhanasa sutra|sutra darpan|dharmamulu|dharma nirnay|varnasrama|sesa dharma|gautamiya|shikshapatri|śikṣāpatrī' then 'smriti'
    when src.ttl ~* 'agama|pancharatra|pañcarātra|pancaratra|tantrasara|tantrasāra|tantraloka|tantra|spanda|siva sutra|shiva sutra|śiva sūtra|pratyabhijna|vastu|shilpa|silpa|prapanchasara|prapañcasāra|diksha|mantra thantra|mantra tantra' then 'agama'
    when src.ttl ~* 'brahmana|brāhmaṇa|aranyaka' then 'veda'
    when src.ttl ~* 'upanishad|upaniṣad|upanishat|upanisad|upanishattula|kathaka' then 'upanishad'
    when src.ttl ~* 'stotra|stotram|stōtra|stavamu|stavam|dandakam|dandakamu|kavacha|lahari|suprabhat|sahasranama|sahasra nama|namavali|namāvali' then 'stotra'
    when src.ttl ~* 'gita|githa|geeta|gītā|gīta|gīt|vedanta|vedantha|vedhanth|vedānta|brahma ?sutra|brahmasutra|brahmasūtra|sutra bhashya|sutra bhasya|sri bhashya|śrī bhāṣya|bhashyamu|panchadas|pañcadaś|vivekachud|vivekach|atmabodha|(^| )yoga|yogabh|yogasutra|yoga sar|sivayoga|yogavas|advaita|sankhya|sāṅkhya|siddhanta sara|vichar sagar|makarand|tattvabodha|aparoksh|kaivalya|dasbodh|visistadvaita|vishishtadvaita|dvaita|tattva|rahasyamu|prakaran|prakaraṇ|patanjal|pātañjala|darsan|darśan|mimamsa' then 'vedanta'
    when src.ttl ~* 'veda|taittiriya samhita|rik samhita|ṛk|ṛg|rig|sukta|rudram|chamakam|mantra puspam|mantrah|ghana|padapatha|yajur|atharva' then 'veda'
    when src.ttl ~* 'mahatm|mahath|mahatya|māhātmy|kshetra|kṣētra|ksetra|sthala|yatra|yātra|narayanacala|tothadri|sahyadri|saket|sāket|మాహాత్మ్య' then 'sthala'
    when src.ttl ~* 'panchang|pancang|muhurta|jyotish|jyotiṣa|sidhanth|siddhanth|almanac|panchakala|ముహూర్త' then 'panchang'
    when src.ttl ~* 'khandamu|khandam|khanda |khaṇḍa|puran|purāṇ' then 'purana'
    when src.ttl ~* 'manucharit|manucarit|amuktamalyada|āmuktamālyada|parijat|kalapurnodayam|hamsa vimsati|vasucharitra|vasucaritra|prabandha|kavya|champu|chanpu|nalacharit|attakatha|thullal|dhruvopakhyan|vilas|vilaas' then 'kavya'
    when src.ttl ~* 'sataka|satakam|sathaka|shatak|śataka|kirtan|kīrtan|keerthan|padamulu|padyamulu|padavali|padābalī|padābali|gatha|gāthā|abhang|dohavali|dohāvalī|bijak|bījak|pad kavita|bhajan|ramprasad|kamalakanta|vakyani|vākyāni|పద్య' then 'bhajan'
    else src.old_category
  end,
  tags = array_remove(array[
    case when src.txt ~* 'samhita|saṃhitā|samhitha' then 'samhita' end,
    case when src.txt ~* 'brahmana|brāhmaṇa|aranyaka' then 'brahmana' end,
    case when src.txt ~* 'sukta|rudram|chamakam|purusha|mantra' then 'sukta-mantra' end,
    case when src.txt ~* 'sandhya' then 'sandhyavandanam' end,
    case when src.txt ~* 'nityanushtana|nitya karma|nityakarma|ahnika|brahmayajna|tarpan' then 'nitya-karma' end,
    case when src.txt ~* 'puja|pūjā' then 'puja-vidhi' end,
    case when src.txt ~* 'vrata|vratha|somavara|soma vara' then 'vrata' end,
    case when src.txt ~* 'homa |vivaha|upanayan|jatakarma|samskar|saṃskār|shraddh|sraddh|pinda|pitru|prayoga|prayaschitta' then 'homa-samskara' end,
    case when src.txt ~* 'smriti|dharma ?sutra|dharmasutra|dharmasastra|dharmashastra|manusmriti|yajnavalkya|parasara|grihya|dharmamulu' then 'dharmashastra' end,
    case when src.txt ~* 'sutra|sūtra' then 'sutra' end,
    case when src.txt ~* 'agama|pancharatra|pañcarātra|tantra|spanda|pratyabhijna|vaikhanasa|diksha' then 'agama-tantra' end,
    case when src.txt ~* 'vastu|shilpa|silpa' then 'vastu-shilpa' end,
    case when src.txt ~* 'upanishad|upaniṣad|upanishat|upanisad' then 'upanishad' end,
    case when src.txt ~* 'gita|githa|geeta|gītā' then 'gita' end,
    case when src.txt ~* 'brahma ?sutra|brahmasutra|brahmasūtra|sutra bhashya|sri bhashya|śrī bhāṣya' then 'brahma-sutra' end,
    case when src.txt ~* '(^| )yoga|yogabh|yogasutra|yoga sar|sivayoga|yogavas' then 'yoga' end,
    case when src.txt ~* 'advaita|vedanta|vedantha|vedhanth|vivekachud|panchadas|pañcadaś|atmabodha|sankara|śaṅkara|shankara|sankhya' then 'advaita-vedanta' end,
    case when src.txt ~* 'bhashya|bhāṣya|bhasya|commentary|tika|ṭīkā|vyakhya|vyākhy|vritti|vṛtti|tippani|vacanamu' then 'commentary' end,
    case when src.txt ~* 'stotra|stotram|stōtra|stava|dandakam|kavacha|lahari|suprabhat|nidhi' then 'stotra' end,
    case when src.txt ~* 'sahasra|namavali|namāvali|ashtottara' then 'sahasranama' end,
    case when src.txt ~* 'kirtan|kīrtan|keerthan|padamulu|padavali|padābalī|bhajan|abhang|gatha|gāthā' then 'kirtana-padam' end,
    case when src.txt ~* 'sataka|satakam|sathaka|shatak|śataka' then 'satakam' end,
    case when src.txt ~* 'ramayan|rāmāyaṇ' then 'ramayana' end,
    case when src.txt ~* 'mahabharat|mahābhārat|bharatam|bharata |parvam|parva |parvamu' then 'mahabharata' end,
    case when src.txt ~* 'bhagavata|bhāgavata|bhagavatam|bhagavathamu|bhagavatamu' then 'bhagavata' end,
    case when src.txt ~* 'harivamsa' then 'harivamsa' end,
    case when src.txt ~* 'puran|purāṇ' then 'purana' end,
    case when src.txt ~* 'mahatm|mahath|mahatya|māhātmy' then 'mahatmya' end,
    case when src.txt ~* 'kshetra|kṣētra|ksetra|sthala|yatra|yātra' then 'kshetra-yatra' end,
    case when src.txt ~* 'kavya|prabandha|champu|chanpu|manucharit|amuktamalyada|parijat|kalapurnodayam|vasucharitra|hamsa vimsati' then 'kavya' end,
    case when src.txt ~* 'panchang|pancang|muhurta|jyotish|siddhanth|sidhanth|almanac' then 'jyotisha-panchangam' end,
    case when src.txt ~* 'charit|caritr|biograph|life of|janam sakhi|janamsakhi|bhaktamal' then 'biography-saint' end,
    case when src.txt ~* 'tyagaraja|annamacharya|annamayya|ramadas|kabir|tulsidas|surdas|mira|tukaram|dnyaneshwar|jnaneshwar|nanak|alvar|divya prabandham|tevaram|tiruvacakam|tiruppavai|vemana' then 'hymns-of-saints' end
  ], null),
  published_year = coalesce(
    (regexp_match(b.title, '(1[5-9][0-9]{2})'))[1]::smallint,
    (regexp_match(coalesce(b.description, ''), '(1[5-9][0-9]{2})'))[1]::smallint,
    (regexp_match(coalesce(b.author, ''), '(1[5-9][0-9]{2})'))[1]::smallint
  ),
  format = case when src.txt ~* 'manuscript|palm.?leaf|goml|hand.?cop|vraata' then 'manuscript' else 'printed' end
from src
where b.id = src.id;
