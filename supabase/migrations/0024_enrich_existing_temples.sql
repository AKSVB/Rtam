-- Ṛtam — filling in gaps on temples already in the directory
--
-- Native names for the temples that still had none (script left Punjab
-- and Assam blank rather than guess at Gurmukhi/Assamese, per migration
-- 0015's own stated caution — that caution still holds here, so Durgiana
-- and Kamakhya are still not included below).
--
-- Food-availability info for well-known temples still sitting at
-- 'unknown', each checked against public sources before writing. Two
-- notes on judgment calls made here:
--   - Kamakhya's prasad tradition includes both a vegetarian and a
--     non-vegetarian bhog line — flagged explicitly in the notes rather
--     than only stating the vegetarian option, since a Brahmin visitor
--     specifically needs to know which line to join.
--   - Ram Mandir's free meals are run by nearby trusts (Shri Ram Rasoi,
--     ISKCON Anna Daan) rather than confirmed as the temple's own scheme
--     at time of writing — worded accordingly.
-- All guarded so a better future answer is never overwritten.

update public.temples set native_name = 'બહુચરાજી માતાનું મંદિર' where name = 'Bahucharaji Temple' and native_name is null;
update public.temples set native_name = 'भद्रकाली मन्दिर' where name = 'Bhadrakali Temple, Kurukshetra' and native_name is null;
update public.temples set native_name = 'छिन्नपूर्णी मन्दिर' where name = 'Chintpurni Temple' and native_name is null;
update public.temples set native_name = 'द्वारका शारदा पीठम्' where name = 'Dwaraka Sharada Peetham' and native_name is null;
update public.temples set native_name = 'ଗୋବର୍ଧନ ପୀଠ' where name = 'Govardhana Peetham, Puri' and native_name is null;
update public.temples set native_name = 'ज्वालामुखी मन्दिर' where name = 'Jwalamukhi Temple' and native_name is null;
update public.temples set native_name = 'नैना देवी मन्दिर' where name = 'Naina Devi Temple' and native_name is null;

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Free meals near the temple from trusts such as Shri Ram Rasoi and ISKCON''s Anna Daan seva (not yet confirmed as the temple trust''s own scheme)',
  food_distance_km = 0.5
where name = 'Ram Mandir, Ayodhya' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Shri Mahakaleshwar Annakshetra — free meals since 2004, serving several thousand devotees daily',
  food_distance_km = 0.2
where name = 'Mahakaleshwar Jyotirlinga, Ujjain' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple Annaprasadam Hall — free meals since 2002',
  food_distance_km = 0.1
where name = 'Meenakshi Amman Temple, Madurai' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Anna Seva Kendra near the shrine — free khichdi bhog daily; note that a separate non-vegetarian bhog is also part of temple tradition, so ask specifically for the vegetarian line',
  food_distance_km = 0.1
where name = 'Kamakhya Temple' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Bhog Ghar — vegetarian meals available via a low-cost coupon system, not entirely free',
  food_distance_km = 0.1
where name = 'Dakshineswar Kali Temple, Kolkata' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Dasoha Bhavana on Chamundi Hill Road — free breakfast, lunch and dinner daily',
  food_distance_km = 0.3
where name = 'Chamundeshwari Temple, Mysore' and food_tier = 'unknown';

update public.temples set
  food_tier = 'pure_veg_available',
  food_source_name = 'Temple langar/free food arrangements, primarily for the poor and visiting sadhus',
  food_distance_km = 0.3
where name = 'Vindhyavasini Temple' and food_tier = 'unknown';
