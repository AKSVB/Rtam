-- Ṛtam — a lightweight photo-sharing wall ("Dharma Wall"): any signed-up,
-- non-banned member can post a photo — from a Samishti Sandhyavandanam
-- gathering, a temple visit, or anything dharma-adjacent — optionally
-- tagged to a temple. Other members can like and comment. Published
-- immediately rather than moderation-queued, the same as temple_reviews:
-- this is personal expression, not a factual claim about a temple, so it
-- doesn't need a moderator's sign-off before appearing — but moderators
-- (and the poster) can still delete anything, same as reviews.

insert into storage.buckets (id, name, public)
values ('community-photos', 'community-photos', true)
on conflict (id) do nothing;

create policy "Community post photos are publicly readable"
  on storage.objects for select
  using (bucket_id = 'community-photos');

create policy "Users can upload their own community post photos"
  on storage.objects for insert
  to authenticated
  with check (
    bucket_id = 'community-photos'
    and (storage.foldername(name))[1] = auth.uid()::text
    and not public.is_banned()
  );

create policy "Users can delete their own community post photos"
  on storage.objects for delete
  using (bucket_id = 'community-photos' and (storage.foldername(name))[1] = auth.uid()::text);

-- ── posts ──────────────────────────────────────────────────────────────

create table public.community_posts (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references public.user_profiles(id) on delete cascade,
  image_url text not null,
  caption text,
  -- Optional tags — a photo can be "at this temple" and/or "from this
  -- dharmic activity" (e.g. a specific Samishti Sandhyavandanam proposal),
  -- but neither is required: "whatever they'd feel like" needs to work too.
  temple_id uuid references public.temples(id) on delete set null,
  activity_id uuid references public.dharmic_activities(id) on delete set null,
  created_at timestamptz not null default now()
);

create index community_posts_created_at_idx on public.community_posts (created_at desc);
create index community_posts_user_id_idx on public.community_posts (user_id);
create index community_posts_temple_id_idx on public.community_posts (temple_id);

alter table public.community_posts enable row level security;

create policy "Community posts are publicly readable"
  on public.community_posts for select
  using (true);

create policy "Authenticated non-banned users can post"
  on public.community_posts for insert
  to authenticated
  with check (user_id = auth.uid() and not public.is_banned());

create policy "Owners can edit their own post caption"
  on public.community_posts for update
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

create policy "Owners can delete their own post"
  on public.community_posts for delete
  using (user_id = auth.uid());

create policy "Moderators can delete any post"
  on public.community_posts for delete
  using (public.is_moderator());

grant select, insert, update, delete on public.community_posts to authenticated;
grant select on public.community_posts to anon;

-- +5 for sharing a photo — the same weight as a temple photo upload.
create or replace function public.points_on_community_post()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if tg_op = 'INSERT' then
    perform public.award_points(new.user_id, 5);
  elsif tg_op = 'DELETE' then
    perform public.award_points(old.user_id, -5);
  end if;
  return null;
end;
$$;

create trigger community_post_points
  after insert or delete on public.community_posts
  for each row execute function public.points_on_community_post();

-- ── likes ────────────────────────────────────────────────────────────

create table public.community_post_likes (
  post_id uuid not null references public.community_posts(id) on delete cascade,
  user_id uuid not null references public.user_profiles(id) on delete cascade,
  created_at timestamptz not null default now(),
  primary key (post_id, user_id)
);

create index community_post_likes_post_id_idx on public.community_post_likes (post_id);

alter table public.community_post_likes enable row level security;

-- Same privacy stance as dharmic_activity_votes: a like pairs a person
-- with what they liked, so the raw row is restricted to the liker and
-- moderators; everyone else sees only the aggregate via the view below.
create policy "Users can see their own likes, moderators any"
  on public.community_post_likes for select
  using (user_id = auth.uid() or public.is_moderator());

create policy "Authenticated users can like a post"
  on public.community_post_likes for insert
  to authenticated
  with check (user_id = auth.uid() and not public.is_banned());

create policy "Users can remove their own like"
  on public.community_post_likes for delete
  using (user_id = auth.uid());

grant select, insert, delete on public.community_post_likes to authenticated;

create view public.community_post_like_counts as
  select post_id, count(*)::int as likes_count
  from public.community_post_likes
  group by post_id;

grant select on public.community_post_like_counts to anon, authenticated;

-- ── comments ─────────────────────────────────────────────────────────

create table public.community_post_comments (
  id uuid primary key default gen_random_uuid(),
  post_id uuid not null references public.community_posts(id) on delete cascade,
  user_id uuid not null references public.user_profiles(id) on delete cascade,
  comment text not null,
  created_at timestamptz not null default now()
);

create index community_post_comments_post_id_idx on public.community_post_comments (post_id, created_at);

alter table public.community_post_comments enable row level security;

create policy "Comments are publicly readable"
  on public.community_post_comments for select
  using (true);

create policy "Authenticated non-banned users can comment"
  on public.community_post_comments for insert
  to authenticated
  with check (user_id = auth.uid() and not public.is_banned());

create policy "Owners can edit their own comment"
  on public.community_post_comments for update
  using (user_id = auth.uid())
  with check (user_id = auth.uid());

create policy "Owners can delete their own comment"
  on public.community_post_comments for delete
  using (user_id = auth.uid());

create policy "Moderators can delete any comment"
  on public.community_post_comments for delete
  using (public.is_moderator());

grant select, insert, update, delete on public.community_post_comments to authenticated;
grant select on public.community_post_comments to anon;
