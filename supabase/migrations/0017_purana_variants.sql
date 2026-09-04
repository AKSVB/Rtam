-- Ṛtam — alternate sthala purana traditions
--
-- A handful of temples have more than one well-documented origin account —
-- different sects, regions, or texts tell a genuinely different story
-- rather than just a stylistic variation. The main temples.sthala_purana
-- field keeps the most commonly told version; this table holds additional
-- attributed accounts for temples where a second version is confidently
-- known, rather than picking a winner.

create table public.temple_purana_variants (
  id uuid primary key default gen_random_uuid(),
  temple_id uuid not null references public.temples (id) on delete cascade,
  tradition_label text not null,
  account text not null,
  created_at timestamptz not null default now()
);

comment on table public.temple_purana_variants is
  'Additional, differently-attributed sthala purana accounts alongside temples.sthala_purana. Curated centrally for now rather than crowdsourced.';

create index temple_purana_variants_temple_id_idx on public.temple_purana_variants (temple_id);

alter table public.temple_purana_variants enable row level security;

create policy "Anyone can read purana variants for approved temples"
  on public.temple_purana_variants for select
  to anon, authenticated
  using (
    exists (
      select 1 from public.temples t
      where t.id = temple_purana_variants.temple_id and t.status = 'approved'
    )
  );

grant usage on schema public to anon, authenticated;
grant select on public.temple_purana_variants to anon, authenticated;

-- ── Seed data ─────────────────────────────────────────────────────────────

insert into public.temple_purana_variants (temple_id, tradition_label, account) values
(
  (select id from public.temples where name = 'Ramanathaswamy Temple, Rameswaram'),
  'Hanuman-and-the-lingam tradition',
  'A second, equally well-known account holds that Rama sent Hanuman to the Himalayas to fetch a Shiva lingam for worship before the assault on Lanka. When Hanuman was delayed, Sita is said to have shaped a lingam from the seashore sand herself for the auspicious moment — this became the Ramalingam. Hanuman returned soon after with his own lingam, which was installed alongside it as the Vishwalingam, and tradition holds Rama decreed that his own lingam be worshipped first at Rameswaram in honour of Hanuman''s effort.'
),
(
  (select id from public.temples where name = 'Sri Venkateswara Swamy Temple, Tirumala'),
  'Venkatachala Mahatmyam (folk/local tradition)',
  'Alongside the Vaishnava theological account of Venkateswara as a form of Vishnu, local tradition tells a more folk-flavoured story: Vishnu, having taken a large loan from Kubera (the god of wealth) to fund his wedding to Padmavati, is said to still be repaying it — which is why devotees offer money at the Tirumala hundi to this day, popularly explained as helping the deity meet the interest.'
),
(
  (select id from public.temples where name = 'Kanchi Kamakoti Peetham'),
  'The "fifth peetham" question',
  'Unlike Sringeri, Puri, Dwaraka, and Jyotirmath, Kanchi is not universally counted among the four Amnaya peethams traditionally attributed to Adi Shankaracharya — some historical accounts list only four peethams and do not include Kanchi, while the Kanchi matha''s own tradition holds it was established by Shankaracharya himself as a fifth seat, or in some regional tellings his original seat. Both accounts are current today and this directory does not attempt to adjudicate between them.'
),
(
  (select id from public.temples where name = 'Somnath Temple'),
  'Destruction-and-rebuilding history',
  'Beyond its founding legend as one of the twelve Jyotirlingas, Somnath''s more recent history is itself part of local memory: the temple was destroyed and rebuilt multiple times over the centuries, most famously sacked by Mahmud of Ghazni in 1024 CE. The present structure was rebuilt after independence, with the Government of India''s backing, and consecrated in 1951 — making its modern form as much a 20th-century monument to continuity as an ancient one.'
),
(
  (select id from public.temples where name = 'Adi Shankara Janma Bhoomi Kshetram, Kalady'),
  'Contested site tradition',
  'While Kalady is the most widely accepted birthplace of Adi Shankaracharya, it is worth noting for completeness that a small number of regional traditions elsewhere in South India have, at various points, also claimed the association — Kalady''s claim is by far the dominant and most institutionally recognised one, including by the Kanchi and Sringeri mathas.'
);
