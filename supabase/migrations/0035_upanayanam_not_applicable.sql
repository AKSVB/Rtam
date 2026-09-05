-- Ṛtam — add "not applicable" to the Upanayanam question
--
-- The original boolean (yes/no) implicitly framed "no" as "not yet" —
-- wrong for women and for traditions where Upanayanam isn't performed at
-- all, for whom the question simply doesn't apply. Replaces the boolean
-- with a three-state text column; null still means "not yet asked".

alter table public.user_profiles
  add column if not exists upanayanam_status text
  check (upanayanam_status in ('yes', 'no', 'not_applicable'));

update public.user_profiles
set upanayanam_status = case
  when upanayanam_completed = true then 'yes'
  when upanayanam_completed = false then 'no'
  else null
end
where upanayanam_status is null;

alter table public.user_profiles drop column if exists upanayanam_completed;

comment on column public.user_profiles.upanayanam_status is
  'Null = not yet asked. yes/no = has or has not undergone Upanayanam; not_applicable = the ceremony is not part of this person''s tradition (e.g. most women, or castes that do not perform it). Gates the Trikala Sandhya tracker (yes only).';
