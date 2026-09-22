-- Ṛtam — "My Yatra": lets a signed-in devotee mark a temple as visited,
-- and powers a progress view against the named pilgrimage circuits
-- already tracked in src/constants/circuitInfo.ts (e.g. "5 of 12
-- Jyotirlingas visited"). One row per (user, temple) — re-marking just
-- updates visited_at rather than creating duplicates.

create table public.temple_visits (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.user_profiles (id) on delete cascade,
  temple_id uuid not null references public.temples (id) on delete cascade,
  visited_at date not null default current_date,
  notes text,
  created_at timestamptz not null default now(),
  unique (user_id, temple_id)
);

create index temple_visits_temple_id_idx on public.temple_visits (temple_id);
create index temple_visits_user_id_idx on public.temple_visits (user_id);

alter table public.temple_visits enable row level security;

-- Visit records carry no sensitive detail beyond an optional personal
-- note, and public counts ("developed by N devotees") are worth showing
-- on a temple page — so reads are public, matching temple_reviews.
create policy "Visits are publicly readable"
  on public.temple_visits for select
  using (true);

create policy "Authenticated users can log their own visits"
  on public.temple_visits for insert
  to authenticated
  with check (user_id = auth.uid());

create policy "Users can edit their own visits"
  on public.temple_visits for update
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

create policy "Users can delete their own visits"
  on public.temple_visits for delete
  using (user_id = auth.uid());

-- RLS policies are only evaluated after the base GRANT — this project
-- doesn't grant table privileges to anon/authenticated by default (see
-- 0003_grants.sql), so every new table needs this explicitly.
grant select on public.temple_visits to anon, authenticated;
grant insert, update, delete on public.temple_visits to authenticated;
