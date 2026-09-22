-- Gender is asked so the Sandhyavandanam temple-door prompt (a devotional
-- nitya-karma nudge, traditionally observed by men after Upanayanam) can be
-- shown only to devotees who've told us they're male — everyone else simply
-- never sees it. Null means "not asked / prefers not to say", and is treated
-- the same as female for this gate: the prompt stays hidden unless the user
-- has explicitly opted in as male.
alter table public.user_profiles
  add column gender text check (gender in ('male', 'female'));
