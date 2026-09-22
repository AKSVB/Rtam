-- Ṛtam — award Sandhya Tejas points for every individual sandhya recorded
-- (Prātaḥ, Madhyahnika, Sāyam), not only for completing all three in a day.
--
-- Previously sandhya_tejas_points only moved in +108 jumps when a devotee
-- crossed a 30-day unbroken streak of *fully complete* days — a devotee who
-- faithfully logs individual sandhyas but occasionally misses one in a day
-- (breaking the "complete day" streak) earned nothing at all, which doesn't
-- match how tejas is meant to build up from daily practice. Now each
-- newly-recorded sandhya (false/unset -> true) earns +1 point immediately,
-- and the +108-per-30-day-streak bonus on top is unchanged — the streak
-- bonus rewards consistency, the per-sandhya point rewards the practice
-- itself.

comment on column public.user_profiles.sandhya_tejas_points is
  'Awarded only by the sandhya_streak_points trigger: +1 for each sandhya (Pratah/Madhyahnika/Sayam) newly recorded as performed, plus +108 per unbroken 30-day streak of fully-complete days.';

create or replace function public.compute_sandhya_streak_and_award()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  is_complete boolean;
  was_complete boolean;
  newly_recorded integer := 0;
  streak integer := 1;
  check_date date;
  milestone integer;
begin
  -- +1 per sandhya newly marked performed this save, regardless of whether
  -- the day ends up complete. tg_op = 'INSERT' has no OLD row, so every
  -- true field on the new row counts as newly recorded.
  if new.morning and (tg_op = 'INSERT' or not old.morning) then
    newly_recorded := newly_recorded + 1;
  end if;
  if new.madhyahnika and (tg_op = 'INSERT' or not old.madhyahnika) then
    newly_recorded := newly_recorded + 1;
  end if;
  if new.evening and (tg_op = 'INSERT' or not old.evening) then
    newly_recorded := newly_recorded + 1;
  end if;

  if newly_recorded > 0 then
    update public.user_profiles
    set sandhya_tejas_points = sandhya_tejas_points + newly_recorded
    where id = new.user_id;
  end if;

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
