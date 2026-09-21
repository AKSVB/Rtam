-- Ṛtam — a Duolingo-style leaderboard among mutual follows: everyone the
-- caller follows back who has opted into share_sandhya_streak, plus the
-- caller themself, ranked by current streak. Reuses current_sandhya_streak()
-- for the actual computation (and its permission check) rather than
-- duplicating the streak-counting loop here.

create or replace function public.mutual_streak_leaderboard()
returns table (
  user_id uuid,
  username text,
  display_name text,
  avatar_url text,
  streak integer,
  is_self boolean
)
language plpgsql
security definer set search_path = public
stable
as $$
declare
  me uuid := auth.uid();
begin
  if me is null then
    return;
  end if;

  return query
  select s.id, s.username, s.display_name, s.avatar_url, s.streak, s.is_self
  from (
    select p.id, p.username, p.display_name, p.avatar_url,
      public.current_sandhya_streak(p.id) as streak, false as is_self
    from public.follows f
    join public.user_profiles p on p.id = f.followee_id
    where f.follower_id = me and p.share_sandhya_streak = true

    union all

    select p.id, p.username, p.display_name, p.avatar_url,
      public.current_sandhya_streak(p.id) as streak, true as is_self
    from public.user_profiles p
    where p.id = me
  ) s
  order by s.streak desc nulls last, s.is_self desc;
end;
$$;

grant execute on function public.mutual_streak_leaderboard() to authenticated;
