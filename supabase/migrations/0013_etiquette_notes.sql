-- Ṛtam — dress code / temple-etiquette notes
--
-- A practical field distinct from sthala_purana (lore) and the ritual/food
-- fields: what a first-time visitor needs to know before they arrive so
-- they aren't turned away at the door — dress code, ID requirements,
-- restrictions on non-Hindus or on carrying leather/electronics, and so on.
-- Populated here only where the rule is well-documented and confidently
-- known; left null everywhere else for contributors to fill in.

alter table public.temples
  add column if not exists etiquette_notes text;

comment on column public.temples.etiquette_notes is
  'Practical visitor guidance: dress code, ID/entry restrictions, what not to carry in. Distinct from sthala_purana (lore) and the ritual/food fields.';

update public.temples set etiquette_notes =
  'Strict traditional dress code, enforced at the entrance: men must be bare-chested, wearing only a mundu/dhoti (no shirt, no trousers); women wear a saree or a churidar/long skirt with blouse — no salwar-kameez tops alone, no western clothing. Only Hindus are permitted inside; the rule is enforced by temple staff.'
where name = 'Guruvayur Sri Krishna Temple';

update public.temples set etiquette_notes =
  'Traditional dress code enforced: men wear a mundu/dhoti without a shirt; women wear a saree, or a long skirt (pavada) with a blouse for young girls. Photography is not permitted inside the sanctum precincts.'
where name = 'Padmanabhaswamy Temple, Thiruvananthapuram';

update public.temples set etiquette_notes =
  'Entry is restricted to those observing the traditional 41-day Ayyappa vratham (austerity vow): black, blue, or saffron dhoti, no leather items carried in, and completion of the vow is expected before the climb. By long-standing custom, women in the traditional "menstruating age" range did not enter; India''s Supreme Court ruled in 2018 that this restriction is unconstitutional, and the temple''s actual practice has varied and remained contested since — check current status before planning a visit if this affects you.'
where name = 'Sabarimala Ayyappa Temple';

update public.temples set etiquette_notes =
  'Traditional dress code applies: men in mundu/dhoti, women in saree or churidar with a covering dupatta. The temple hosts one of Kerala''s largest festivals (Thrissur Pooram) in its outer grounds, though the sanctum itself keeps to normal Kerala temple custom.'
where name = 'Vadakkunnathan Temple, Thrissur';

update public.temples set etiquette_notes =
  'Traditional Kerala dress code: men bare-chested in mundu/dhoti, women in saree or long skirt with blouse. Expect a security check and a no-phones/no-leather rule near the inner shrine, as at most major Kerala temples.'
where name = 'Chottanikkara Devi Temple';

update public.temples set etiquette_notes =
  'Only Hindus are permitted inside the temple; a viewing platform outside is available for others. No leather items (belts, wallets, bags) are allowed past the security check, and phones/cameras are generally restricted near the sanctum.'
where name = 'Jagannath Temple, Puri';

update public.temples set etiquette_notes =
  'Only Hindus are traditionally permitted inside the main sanctum; a viewing platform outside is provided for others.'
where name = 'Lingaraj Temple, Bhubaneswar';

update public.temples set etiquette_notes =
  'Leather items (belts, wallets, bags) and phones/cameras are not permitted near the sanctum — free cloakrooms are available outside. Expect an airport-style security check on the approach to the main shrine, especially on Mondays and during Shravan.'
where name = 'Kashi Vishwanath Temple';

update public.temples set etiquette_notes =
  'Modest dress is expected (shoulders and knees covered); shorts and sleeveless tops are usually turned away at the sanctum. Devotees often shave their heads here as an offering — entirely optional, with dedicated tonsure halls on site if you choose to.'
where name = 'Sri Venkateswara Swamy Temple, Tirumala';

update public.temples set etiquette_notes =
  'Modest dress is expected throughout; some inner areas restrict shorts, sleeveless tops, and leather items. As one of the largest temple complexes in the world, allow time to pass through multiple security and dress checks at different prakarams (enclosures).'
where name = 'Ranganathaswamy Temple, Srirangam';

update public.temples set etiquette_notes =
  'Modest dress is expected; some sanctum areas restrict shorts and sleeveless tops. Non-Hindus are generally welcomed here, unlike some of the stricter Kerala and Odisha temples in this directory.'
where name = 'Meenakshi Amman Temple, Madurai';

update public.temples set etiquette_notes =
  'Reached only via a roughly 13km uphill trek (or palanquin/pony/helicopter services available for a fee) — plan footwear and pacing accordingly rather than treating it as a normal temple visit. Modest dress is expected; no strict Kerala-style dress code applies here.'
where name = 'Vaishno Devi Temple, Katra';

update public.temples set etiquette_notes =
  'Accessible only by trekking or pony/palanquin during the official Amarnath Yatra window (typically late June to August), and only with the mandatory permit obtained in advance along with a medical fitness certificate — this is a genuine high-altitude trek, not a casual visit.'
where name = 'Amarnath Cave Temple';

update public.temples set etiquette_notes =
  'The final stretch to Kedarnath (about 16-18km) is on foot, pony, palanquin, or helicopter — there is no road to the shrine itself. Warm layered clothing is essential even in the open season (late April/May to early November), as the temple sits above 3,500m.'
where name = 'Kedarnath Jyotirlinga';
