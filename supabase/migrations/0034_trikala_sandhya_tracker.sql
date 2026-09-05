-- Ṛtam — personal Trikala Sandhya tracker
--
-- A private daily practice tracker, separate from everything else in this
-- schema: it isn't about temples or crowdsourcing, it's a devotee's own
-- record of whether they performed Sandhyavandanam at all three
-- sandhyas (morning/Prātaḥ, midday/Madhyahnika, evening/Sāyam) each day.
-- Gated behind having undergone Upanayanam, since Sandhyavandanam as a
-- nitya karma applies to a dvija after the sacred thread ceremony.
--
-- contribution_points (site contribution) and sandhya_tejas_points
-- (personal spiritual discipline) are deliberately kept as separate
-- columns/currencies — they measure completely different things.

alter table public.user_profiles
  add column if not exists upanayanam_completed boolean,
  add column if not exists sandhya_tejas_points integer not null default 0,
  add column if not exists last_tejas_milestone integer not null default 0;

comment on column public.user_profiles.upanayanam_completed is
  'Null = not yet asked. Gates visibility of the Trikala Sandhya tracker.';
comment on column public.user_profiles.sandhya_tejas_points is
  'Awarded only by the sandhya_streak_points trigger, in +108 blocks per unbroken 30-day Trikala Sandhya streak.';
comment on column public.user_profiles.last_tejas_milestone is
  'The highest streak-length (in days, always a multiple of 30) already paid out, so a milestone is never awarded twice.';

-- ── sandhya_logs ─────────────────────────────────────────────────────────

create table public.sandhya_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.user_profiles(id) on delete cascade,
  log_date date not null,
  morning boolean not null default false,
  madhyahnika boolean not null default false,
  evening boolean not null default false,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (user_id, log_date)
);

create index sandhya_logs_user_date_idx on public.sandhya_logs (user_id, log_date desc);

create trigger set_updated_at before update on public.sandhya_logs
  for each row execute function public.set_updated_at();

alter table public.sandhya_logs enable row level security;

-- Entirely private — not even moderators can read another devotee's
-- practice record. This is personal religious observance, not a public
-- contribution to the directory.
create policy "Users manage only their own sandhya logs"
  on public.sandhya_logs for all
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

grant select, insert, update on public.sandhya_logs to authenticated;

-- ── streak-based Sandhya Tejas points ───────────────────────────────────
--
-- Fires only on the transition into a fully-complete day (all three
-- sandhyas true), so re-saving an already-complete day is a no-op rather
-- than re-walking the streak every time. Walks backward day-by-day from
-- the newly-completed date counting consecutive complete days, then pays
-- out +108 for every 30-day multiple crossed since the last payout —
-- a loop rather than a single check, so a devotee who logs several
-- backfilled days at once still gets every milestone they earned.

create or replace function public.compute_sandhya_streak_and_award()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  is_complete boolean;
  was_complete boolean;
  streak integer := 1;
  check_date date;
  milestone integer;
begin
  is_complete := new.morning and new.madhyahnika and new.evening;
  was_complete := tg_op = 'UPDATE' and old.morning and old.madhyahnika and old.evening;

  if not is_complete or was_complete then
    return new;
  end if;

  check_date := new.log_date - 1;
  loop
    exit when check_date < new.log_date - 3650; -- sanity cap, ~10 years
    exit when not exists (
      select 1 from public.sandhya_logs
      where user_id = new.user_id and log_date = check_date
        and morning and madhyahnika and evening
    );
    streak := streak + 1;
    check_date := check_date - 1;
  end loop;

  select last_tejas_milestone into milestone from public.user_profiles where id = new.user_id;

  while streak >= milestone + 30 loop
    milestone := milestone + 30;
    update public.user_profiles
    set sandhya_tejas_points = sandhya_tejas_points + 108,
        last_tejas_milestone = milestone
    where id = new.user_id;
  end loop;

  return new;
end;
$$;

create trigger sandhya_streak_points
  after insert or update on public.sandhya_logs
  for each row execute function public.compute_sandhya_streak_and_award();

-- ── guard: sandhya_tejas_points/last_tejas_milestone are trigger-only ────

create or replace function public.guard_profile_privileges()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if auth.uid() is null or public.is_moderator() then
    return new;
  end if;

  if new.role is distinct from old.role then
    raise exception 'You cannot change your own role.';
  end if;

  if new.contribution_points is distinct from old.contribution_points then
    raise exception 'Contribution points are awarded automatically and cannot be set directly.';
  end if;

  if new.sandhya_tejas_points is distinct from old.sandhya_tejas_points
    or new.last_tejas_milestone is distinct from old.last_tejas_milestone then
    raise exception 'Sandhya Tejas points are awarded automatically and cannot be set directly.';
  end if;

  return new;
end;
$$;
