-- Ṛtam — crowdsourced live darshan wait times, alongside the existing
-- open/closed live status reports. At a handful of very popular temples
-- (Tirupati, Vaishno Devi, Siddhivinayak...) the queue length is the single
-- biggest unknown for a pilgrim planning their visit, and it isn't
-- something any static schedule field can capture — it changes hour to
-- hour. Unlike temple_status_reports this deliberately has no "one report
-- per person per day" constraint: a devotee standing in a moving line
-- updating their own estimate every 20 minutes is exactly the signal this
-- feature wants, not something to guard against.

create table public.temple_wait_reports (
  id uuid primary key default gen_random_uuid(),
  temple_id uuid not null references public.temples(id) on delete cascade,
  reported_by uuid not null references public.user_profiles(id) on delete cascade,
  wait_minutes integer not null check (wait_minutes >= 0 and wait_minutes <= 720),
  note text,
  created_at timestamptz not null default now()
);

create index temple_wait_reports_temple_id_idx
  on public.temple_wait_reports (temple_id, created_at desc);

alter table public.temple_wait_reports enable row level security;

create policy "Wait reports on visible temples are publicly readable"
  on public.temple_wait_reports for select
  using (
    exists (
      select 1 from public.temples t
      where t.id = temple_id
        and (t.status = 'approved' or t.submitted_by = auth.uid() or public.is_moderator())
    )
  );

create policy "Authenticated users can report a temple's wait time"
  on public.temple_wait_reports for insert
  to authenticated
  with check (
    reported_by = auth.uid()
    and not public.is_banned()
    and exists (select 1 from public.temples t where t.id = temple_id and t.status = 'approved')
  );

create policy "Reporters can delete their own wait reports"
  on public.temple_wait_reports for delete
  using (reported_by = auth.uid());

create policy "Moderators can delete any wait report"
  on public.temple_wait_reports for delete
  using (public.is_moderator());

grant select, insert, delete on public.temple_wait_reports to anon, authenticated;

-- +1 for reporting a wait time — same weight as a live status check-in,
-- since it's the same kind of quick, point-in-time community signal.
create or replace function public.points_on_wait_report()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if tg_op = 'INSERT' then
    perform public.award_points(new.reported_by, 1);
  elsif tg_op = 'DELETE' then
    perform public.award_points(old.reported_by, -1);
  end if;
  return null;
end;
$$;

create trigger wait_report_points
  after insert or delete on public.temple_wait_reports
  for each row execute function public.points_on_wait_report();
