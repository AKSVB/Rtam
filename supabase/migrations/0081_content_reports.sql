-- Ṛtam — user-reportable content: lets any signed-in devotee flag a
-- review or Dharma Wall post as inappropriate/spam, and gives moderators
-- a queue to act on it. Distinct from the existing moderator queue (which
-- reviews NEW submissions before they go live) — this is about content
-- that's already live and someone ran into while browsing.

create type report_target_type as enum ('temple_review', 'community_post');
create type report_status as enum ('open', 'dismissed', 'resolved');

create table public.content_reports (
  id uuid primary key default gen_random_uuid(),
  reporter_id uuid not null references public.user_profiles(id) on delete cascade,
  target_type report_target_type not null,
  target_id uuid not null,
  -- Snapshot of what was reported, taken client-side at report time, so
  -- moderators can still see the offending text even after it's edited or
  -- (once acted on) deleted.
  content_snapshot text not null check (char_length(content_snapshot) <= 1000),
  link_path text not null,
  reason text not null check (char_length(reason) between 1 and 500),
  status report_status not null default 'open',
  resolved_by uuid references public.user_profiles(id),
  resolved_at timestamptz,
  created_at timestamptz not null default now()
);

create index content_reports_status_idx on public.content_reports (status, created_at);

-- One open report per person per piece of content — repeat flags don't
-- pile up the queue, and the reporter can already see theirs is pending.
create unique index content_reports_reporter_target_open_idx
  on public.content_reports (reporter_id, target_type, target_id)
  where status = 'open';

alter table public.content_reports enable row level security;

create policy "Reporters can file a report"
  on public.content_reports for insert
  to authenticated
  with check (reporter_id = auth.uid() and status = 'open');

create policy "Reporters can see their own reports"
  on public.content_reports for select
  using (reporter_id = auth.uid());

create policy "Moderators can see all reports"
  on public.content_reports for select
  using (public.is_moderator());

create policy "Moderators can resolve reports"
  on public.content_reports for update
  using (public.is_moderator())
  with check (public.is_moderator());

grant select, insert, update on public.content_reports to authenticated;
