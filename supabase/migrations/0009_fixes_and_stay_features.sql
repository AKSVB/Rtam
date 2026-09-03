-- Ṛtam — fix the resubmission dead-end, and support editable stays
--
-- Bug: the update policy for temples/stays only allowed touching a row
-- while status = 'pending'. Once a moderator rejected a submission, the
-- owner could see the rejection feedback on their profile but had no way
-- to act on it — RLS silently blocked any edit forever. Loosen the USING
-- clause to also allow status = 'rejected', while the WITH CHECK clause
-- (unchanged) still forces the saved row back to 'pending', so an edited
-- rejection re-enters the moderation queue rather than going live unseen.

drop policy if exists "Owners can edit their own pending temple submissions" on public.temples;

create policy "Owners can edit their own pending or rejected temples"
  on public.temples for update
  using (submitted_by = auth.uid() and status in ('pending', 'rejected'))
  with check (submitted_by = auth.uid() and status = 'pending');

drop policy if exists "Owners can edit their own pending stay submissions" on public.temple_stays;

create policy "Owners can edit their own pending or rejected stays"
  on public.temple_stays for update
  using (submitted_by = auth.uid() and status in ('pending', 'rejected'))
  with check (submitted_by = auth.uid() and status = 'pending');

-- Stays didn't have a rejection-feedback column either, unlike temples.
alter table public.temple_stays
  add column if not exists moderator_note text;
