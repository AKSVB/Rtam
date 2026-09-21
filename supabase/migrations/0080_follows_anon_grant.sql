-- Ṛtam — fix: the follow graph was meant to be publicly readable (its
-- RLS policy already says "using (true)"), but migration 0079 only
-- granted select to `authenticated`. Base GRANTs are evaluated before
-- RLS even runs (see migration 0003's note on why this project needs
-- them explicit), so an anonymous visitor to a public profile page hit
-- a bare 401 trying to read follower/following counts.

grant select on public.follows to anon;
