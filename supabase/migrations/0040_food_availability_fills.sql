-- Ṛtam — verified food-availability info for 5 temples that were showing
-- "unknown". Each of these has an explicitly documented, temple-run (or
-- temple-trust-run) vegetarian dining facility — not just general prasadam
-- packets, which several other candidates researched in this pass turned
-- out to only offer, and which was judged not enough to move them off
-- "unknown".

update public.temples
set food_tier = 'pure_veg_available',
    food_source_name = 'Kedarnath Mandir Samiti bhandara (seasonal, near the Alaknanda river crossing)'
where name = 'Kedarnath Jyotirlinga' and food_tier = 'unknown';

update public.temples
set food_tier = 'pure_veg_available',
    food_source_name = 'Dwarkadhish Temple prasad counter (puri-sabzi thali and sweets)'
where name = 'Dwarkadhish Temple, Dwarka' and food_tier = 'unknown';

update public.temples
set food_tier = 'pure_veg_available',
    food_source_name = 'Temple dining hall — free lunch and dinner (rice, sambar, rasam, buttermilk)'
where name = 'Kollur Mookambika Temple' and food_tier = 'unknown';

update public.temples
set food_tier = 'pure_veg_available',
    food_source_name = 'Kanchi Mutt Nitya Annadanam (free lunch)'
where name = 'Kanchi Kamakoti Peetham' and food_tier = 'unknown';

update public.temples
set food_tier = 'pure_veg_available',
    food_source_name = 'Ambika Bhojanalay (temple-trust-run dining hall)'
where name = 'Ambaji Temple' and food_tier = 'unknown';
