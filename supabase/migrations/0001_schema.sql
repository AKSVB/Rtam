-- Ṛtam — Phase 1 schema
-- Core tables: user_profiles, temples, temple_stays, temple_photos, temple_reviews, trip_lists

create extension if not exists "pgcrypto";

-- ── Enums ──────────────────────────────────────────────────────────────────

create type friendliness_level as enum ('yes', 'no', 'partial', 'unknown');

create type food_tier_level as enum (
  'brahmin_run_kitchen',
  'pure_veg_available',
  'no_veg_confirmed_nearby',
  'unknown'
);

create type submission_status as enum ('pending', 'approved', 'rejected');

create type user_role as enum ('member', 'moderator', 'admin');

-- ── user_profiles ────────────────────────────────────────────────────────
-- Extends auth.users (Supabase-managed) with app-specific profile fields.

create table public.user_profiles (
  id uuid primary key references auth.users (id) on delete cascade,
  display_name text not null,
  home_city text,
  role user_role not null default 'member',
  contribution_points integer not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

comment on table public.user_profiles is 'App-facing profile data for each authenticated user.';

-- ── temples ──────────────────────────────────────────────────────────────

create table public.temples (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  deity text not null,
  sampradaya text,
  -- Free-form tags for well-known pilgrimage groupings, e.g. 'Jyotirlinga',
  -- 'Shakti Peetha', 'Pancha Bhoota Sthalam', 'Char Dham', 'Sapta Puri'.
  -- Lets the UI badge/filter famous circuits without a rigid enum.
  significance text[] not null default '{}',
  country text not null default 'India',
  state text not null,
  district text not null,
  town text not null,
  latitude double precision not null,
  longitude double precision not null,

  sandhya_friendly friendliness_level not null default 'unknown',
  sandhya_notes text,

  samidhadhanam_friendly friendliness_level not null default 'unknown',
  samidhadhanam_notes text,

  food_tier food_tier_level not null default 'unknown',
  food_source_name text,
  food_source_contact text,
  food_distance_km numeric(6, 2),

  nearest_river_name text,
  river_distance_km numeric(6, 2),

  best_season_notes text,

  submitted_by uuid references public.user_profiles (id) on delete set null,
  status submission_status not null default 'pending',
  verified_by uuid references public.user_profiles (id) on delete set null,
  moderator_note text,

  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),

  constraint food_fields_require_known_tier check (
    food_tier = 'unknown' or food_source_name is not null or food_distance_km is not null
      or food_tier = 'no_veg_confirmed_nearby'
  )
);

create extension if not exists pg_trgm;

create index temples_state_idx on public.temples (state);
create index temples_country_idx on public.temples (country);
create index temples_significance_idx on public.temples using gin (significance);
create index temples_status_idx on public.temples (status);
create index temples_deity_idx on public.temples (deity);
create index temples_name_trgm_idx on public.temples using gin (name gin_trgm_ops);

-- ── temple_stays ─────────────────────────────────────────────────────────

create table public.temple_stays (
  id uuid primary key default gen_random_uuid(),
  temple_id uuid not null references public.temples (id) on delete cascade,
  name text not null,
  contact text,
  address text not null,
  distance_to_temple_km numeric(6, 2),
  distance_to_river_km numeric(6, 2),
  pure_veg_kitchen boolean not null default false,
  puja_room_available boolean not null default false,
  price_range text,
  notes text,
  submitted_by uuid references public.user_profiles (id) on delete set null,
  status submission_status not null default 'pending',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index temple_stays_temple_id_idx on public.temple_stays (temple_id);

-- ── temple_photos ────────────────────────────────────────────────────────

create table public.temple_photos (
  id uuid primary key default gen_random_uuid(),
  temple_id uuid not null references public.temples (id) on delete cascade,
  url text not null,
  uploaded_by uuid references public.user_profiles (id) on delete set null,
  created_at timestamptz not null default now()
);

create index temple_photos_temple_id_idx on public.temple_photos (temple_id);

-- ── temple_reviews ───────────────────────────────────────────────────────

create table public.temple_reviews (
  id uuid primary key default gen_random_uuid(),
  temple_id uuid not null references public.temples (id) on delete cascade,
  user_id uuid not null references public.user_profiles (id) on delete cascade,
  rating smallint not null check (rating between 1 and 5),
  comment text,
  created_at timestamptz not null default now(),
  unique (temple_id, user_id)
);

create index temple_reviews_temple_id_idx on public.temple_reviews (temple_id);

-- ── trip_lists ───────────────────────────────────────────────────────────
-- Synced version of the localStorage-based trip planner for logged-in users.

create table public.trip_lists (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.user_profiles (id) on delete cascade,
  name text not null default 'My Trip',
  temple_ids uuid[] not null default '{}',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index trip_lists_user_id_idx on public.trip_lists (user_id);

-- ── updated_at trigger helper ───────────────────────────────────────────

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

create trigger set_updated_at before update on public.user_profiles
  for each row execute function public.set_updated_at();

create trigger set_updated_at before update on public.temples
  for each row execute function public.set_updated_at();

create trigger set_updated_at before update on public.temple_stays
  for each row execute function public.set_updated_at();

create trigger set_updated_at before update on public.trip_lists
  for each row execute function public.set_updated_at();

-- ── auto-create profile on signup ───────────────────────────────────────

create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  insert into public.user_profiles (id, display_name)
  values (new.id, coalesce(new.raw_user_meta_data ->> 'display_name', split_part(new.email, '@', 1)));
  return new;
end;
$$;

create trigger on_auth_user_created
  after insert on auth.users
  for each row execute function public.handle_new_user();
