-- Ṛtam — social layer: mutual-follow connections, DM-style messaging
-- gated on mutual follow, and opt-in sandhya-streak sharing with
-- reminders between followers.
--
-- Design notes:
--   - "Follow" here is a request/accept model, not Twitter-style
--     unilateral following: sending a request only creates follows
--     rows (both directions, atomically) once the other person accepts.
--     That mutuality is what gates messaging — sending, not just
--     starting a thread, is re-checked at the database level so it
--     can't be bypassed by a stale client.
--   - sandhya_logs (migration 0034) stays exactly as private as it was
--     made — "not even moderators can read another devotee's practice
--     record". Nothing here grants row-level access to it. Instead, a
--     single derived number (the current streak length) is exposed
--     through a SECURITY DEFINER function, and only when the streak's
--     owner has opted in via share_sandhya_streak AND the viewer is a
--     mutual follower (or the owner themselves).
--   - No separate notifications table: a streak reminder is just a
--     specially-flavoured message sent into the pair's own
--     conversation (kind = 'streak_reminder'), and a pending follow
--     request is its own signal (queried directly, no extra table
--     needed to know one exists).

alter table public.user_profiles
  add column if not exists share_sandhya_streak boolean not null default false;

comment on column public.user_profiles.share_sandhya_streak is
  'Opt-in: when true, mutual followers can see this user''s current Trikala Sandhya streak length (a single number) via current_sandhya_streak(). The underlying sandhya_logs rows stay fully private regardless.';

-- ── follow_requests ──────────────────────────────────────────────────────

create type follow_request_status as enum ('pending', 'accepted', 'declined');

create table public.follow_requests (
  id uuid primary key default gen_random_uuid(),
  requester_id uuid not null references public.user_profiles (id) on delete cascade,
  addressee_id uuid not null references public.user_profiles (id) on delete cascade,
  status follow_request_status not null default 'pending',
  created_at timestamptz not null default now(),
  responded_at timestamptz,
  constraint follow_requests_not_self check (requester_id <> addressee_id)
);

-- Only one *pending* request per ordered pair — a declined request
-- doesn't permanently block a future one, so this is a partial index
-- rather than a table-wide unique constraint.
create unique index follow_requests_pending_pair_idx
  on public.follow_requests (requester_id, addressee_id)
  where status = 'pending';

create index follow_requests_addressee_idx on public.follow_requests (addressee_id, status);
create index follow_requests_requester_idx on public.follow_requests (requester_id, status);

alter table public.follow_requests enable row level security;

create policy "See your own sent or received follow requests"
  on public.follow_requests for select
  using (requester_id = auth.uid() or addressee_id = auth.uid());

create policy "Send a follow request"
  on public.follow_requests for insert
  with check (requester_id = auth.uid() and not public.is_banned());

create policy "Addressee responds to a pending request"
  on public.follow_requests for update
  using (addressee_id = auth.uid() and status = 'pending')
  with check (addressee_id = auth.uid());

create policy "Requester withdraws their own pending request"
  on public.follow_requests for delete
  using (requester_id = auth.uid() and status = 'pending');

grant select, insert, update, delete on public.follow_requests to authenticated;

-- ── follows ──────────────────────────────────────────────────────────────
-- Directed edges. A request being accepted creates both directions at
-- once (see the trigger below), so in practice every edge here has a
-- mirror — but modelling it as directed keeps "who follows whom" a
-- plain query and leaves room for a future one-way "follow" without a
-- schema change.

create table public.follows (
  id uuid primary key default gen_random_uuid(),
  follower_id uuid not null references public.user_profiles (id) on delete cascade,
  followee_id uuid not null references public.user_profiles (id) on delete cascade,
  created_at timestamptz not null default now(),
  constraint follows_not_self check (follower_id <> followee_id),
  unique (follower_id, followee_id)
);

create index follows_follower_idx on public.follows (follower_id);
create index follows_followee_idx on public.follows (followee_id);

alter table public.follows enable row level security;

-- Public, like the rest of a contributor's profile (display name,
-- points, photos) — just the graph, never message content or the
-- private sandhya log.
create policy "Follow graph is publicly readable"
  on public.follows for select
  using (true);

-- No insert policy: rows are only ever created by the accept-request
-- trigger below, which runs SECURITY DEFINER as the table owner and so
-- isn't subject to RLS.
create policy "Either side of a connection can remove it"
  on public.follows for delete
  using (follower_id = auth.uid() or followee_id = auth.uid());

grant select, delete on public.follows to authenticated;

-- ── helper: mutual follow check ─────────────────────────────────────────

create or replace function public.is_mutual_follow(a uuid, b uuid)
returns boolean
language sql
security definer
set search_path = public
stable
as $$
  select exists (select 1 from public.follows where follower_id = a and followee_id = b)
     and exists (select 1 from public.follows where follower_id = b and followee_id = a);
$$;

grant execute on function public.is_mutual_follow(uuid, uuid) to authenticated;

-- ── follow_requests triggers ─────────────────────────────────────────────

create or replace function public.guard_follow_request_insert()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if public.is_mutual_follow(new.requester_id, new.addressee_id) then
    raise exception 'You already follow each other.';
  end if;
  if exists (
    select 1 from public.follow_requests
    where status = 'pending'
      and ((requester_id = new.requester_id and addressee_id = new.addressee_id)
        or (requester_id = new.addressee_id and addressee_id = new.requester_id))
  ) then
    raise exception 'There is already a pending request between you two.';
  end if;
  return new;
end;
$$;

create trigger guard_follow_request_insert
  before insert on public.follow_requests
  for each row execute function public.guard_follow_request_insert();

create or replace function public.handle_follow_request_response()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if new.status = old.status then
    return new;
  end if;

  new.responded_at := now();

  if new.status = 'accepted' then
    insert into public.follows (follower_id, followee_id) values (new.requester_id, new.addressee_id)
      on conflict do nothing;
    insert into public.follows (follower_id, followee_id) values (new.addressee_id, new.requester_id)
      on conflict do nothing;
  end if;

  return new;
end;
$$;

create trigger follow_request_response
  before update on public.follow_requests
  for each row execute function public.handle_follow_request_response();

-- ── conversations & messages ────────────────────────────────────────────
-- One row per pair, canonically ordered (user_one_id < user_two_id) so
-- there's never more than one conversation between the same two people.

create table public.conversations (
  id uuid primary key default gen_random_uuid(),
  user_one_id uuid not null references public.user_profiles (id) on delete cascade,
  user_two_id uuid not null references public.user_profiles (id) on delete cascade,
  created_at timestamptz not null default now(),
  last_message_at timestamptz not null default now(),
  constraint conversations_ordered_pair check (user_one_id < user_two_id),
  unique (user_one_id, user_two_id)
);

create index conversations_user_one_idx on public.conversations (user_one_id, last_message_at desc);
create index conversations_user_two_idx on public.conversations (user_two_id, last_message_at desc);

alter table public.conversations enable row level security;

create policy "Participants can see their own conversations"
  on public.conversations for select
  using (user_one_id = auth.uid() or user_two_id = auth.uid());

-- No insert/update policy: conversations are only created via
-- get_or_create_conversation() below, and last_message_at is only
-- touched by the new-message trigger — both SECURITY DEFINER.

grant select on public.conversations to authenticated;

create table public.messages (
  id uuid primary key default gen_random_uuid(),
  conversation_id uuid not null references public.conversations (id) on delete cascade,
  sender_id uuid not null references public.user_profiles (id) on delete cascade,
  kind text not null default 'text' check (kind in ('text', 'streak_reminder')),
  body text not null check (char_length(btrim(body)) between 1 and 4000),
  created_at timestamptz not null default now(),
  read_at timestamptz
);

create index messages_conversation_idx on public.messages (conversation_id, created_at);

alter table public.messages enable row level security;

create policy "Participants can read messages in their conversations"
  on public.messages for select
  using (
    exists (
      select 1 from public.conversations c
      where c.id = messages.conversation_id
        and (c.user_one_id = auth.uid() or c.user_two_id = auth.uid())
    )
  );

create policy "Send a message as yourself into your own conversation"
  on public.messages for insert
  with check (
    sender_id = auth.uid()
    and not public.is_banned()
    and exists (
      select 1 from public.conversations c
      where c.id = messages.conversation_id
        and (c.user_one_id = auth.uid() or c.user_two_id = auth.uid())
    )
  );

create policy "Recipient marks a message read"
  on public.messages for update
  using (
    exists (
      select 1 from public.conversations c
      where c.id = messages.conversation_id
        and (c.user_one_id = auth.uid() or c.user_two_id = auth.uid())
        and messages.sender_id <> auth.uid()
    )
  )
  with check (read_at is not null);

grant select, insert, update on public.messages to authenticated;

-- Belt-and-suspenders: even if a client somehow gets a conversation id
-- for two people who have since unfollowed each other, block the send
-- at the database level rather than relying on the UI not offering it.
create or replace function public.guard_message_requires_mutual_follow()
returns trigger
language plpgsql
security definer set search_path = public
as $$
declare
  a uuid;
  b uuid;
begin
  select user_one_id, user_two_id into a, b from public.conversations where id = new.conversation_id;
  if not public.is_mutual_follow(a, b) then
    raise exception 'You can only message people who follow you back.';
  end if;
  return new;
end;
$$;

create trigger message_requires_mutual_follow
  before insert on public.messages
  for each row execute function public.guard_message_requires_mutual_follow();

-- The "recipient marks read" USING clause can't stop them rewriting
-- other columns via the same UPDATE, so pin every column but read_at.
create or replace function public.guard_message_only_read_at_editable()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if new.body is distinct from old.body
    or new.kind is distinct from old.kind
    or new.sender_id is distinct from old.sender_id
    or new.conversation_id is distinct from old.conversation_id
    or new.created_at is distinct from old.created_at then
    raise exception 'Only read_at can be updated on a message.';
  end if;
  return new;
end;
$$;

create trigger message_only_read_at_editable
  before update on public.messages
  for each row execute function public.guard_message_only_read_at_editable();

create or replace function public.touch_conversation_last_message()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  update public.conversations set last_message_at = new.created_at where id = new.conversation_id;
  return new;
end;
$$;

create trigger touch_conversation_last_message
  after insert on public.messages
  for each row execute function public.touch_conversation_last_message();

create or replace function public.get_or_create_conversation(other_user uuid)
returns uuid
language plpgsql
security definer set search_path = public
as $$
declare
  me uuid := auth.uid();
  a uuid;
  b uuid;
  conv_id uuid;
begin
  if me is null then
    raise exception 'Not authenticated.';
  end if;
  if not public.is_mutual_follow(me, other_user) then
    raise exception 'You can only message people who follow you back.';
  end if;

  a := least(me, other_user);
  b := greatest(me, other_user);

  select id into conv_id from public.conversations where user_one_id = a and user_two_id = b;
  if conv_id is null then
    insert into public.conversations (user_one_id, user_two_id) values (a, b)
      returning id into conv_id;
  end if;
  return conv_id;
end;
$$;

grant execute on function public.get_or_create_conversation(uuid) to authenticated;

-- ── streak sharing (see column comment above for the privacy design) ────
-- Mirrors the exact walk-back-from-today logic already used client-side
-- in src/lib/sandhya.ts (computeStreak) for the signed-in user's own
-- streak, so the number shown to a friend always matches what the
-- owner sees on their own profile.

create or replace function public.current_sandhya_streak(target_user uuid)
returns integer
language plpgsql
security definer set search_path = public
stable
as $$
declare
  me uuid := auth.uid();
  can_view boolean;
  streak integer := 0;
  check_date date := current_date;
  complete boolean;
begin
  if me is null then
    return null;
  end if;

  if target_user = me then
    can_view := true;
  else
    select share_sandhya_streak into can_view from public.user_profiles where id = target_user;
    can_view := coalesce(can_view, false) and public.is_mutual_follow(me, target_user);
  end if;

  if not can_view then
    return null;
  end if;

  select morning and madhyahnika and evening into complete
  from public.sandhya_logs where user_id = target_user and log_date = check_date;
  if not coalesce(complete, false) then
    check_date := check_date - 1;
  end if;

  loop
    exit when streak > 3650; -- sanity cap, ~10 years
    select morning and madhyahnika and evening into complete
    from public.sandhya_logs where user_id = target_user and log_date = check_date;
    exit when not coalesce(complete, false);
    streak := streak + 1;
    check_date := check_date - 1;
  end loop;

  return streak;
end;
$$;

grant execute on function public.current_sandhya_streak(uuid) to authenticated;

-- ── streak reminders ─────────────────────────────────────────────────────
-- A lightweight nudge delivered as a message in the pair's own
-- conversation, rate-limited to once per 20 hours per (sender,
-- recipient) direction so it can't be used to spam someone.

create or replace function public.send_streak_reminder(target_user uuid, custom_message text default null)
returns uuid
language plpgsql
security definer set search_path = public
as $$
declare
  me uuid := auth.uid();
  conv_id uuid;
  new_message_id uuid;
  last_sent timestamptz;
  sender_name text;
begin
  if me is null then
    raise exception 'Not authenticated.';
  end if;
  if not public.is_mutual_follow(me, target_user) then
    raise exception 'You can only send a reminder to someone who follows you back.';
  end if;

  conv_id := public.get_or_create_conversation(target_user);

  select max(created_at) into last_sent
  from public.messages
  where conversation_id = conv_id and kind = 'streak_reminder' and sender_id = me;

  if last_sent is not null and last_sent > now() - interval '20 hours' then
    raise exception 'You already sent this person a reminder recently.';
  end if;

  select display_name into sender_name from public.user_profiles where id = me;

  insert into public.messages (conversation_id, sender_id, kind, body)
  values (
    conv_id,
    me,
    'streak_reminder',
    coalesce(nullif(btrim(custom_message), ''), sender_name || ' nudged you to keep up your Sandhya streak today! 🔥')
  )
  returning id into new_message_id;

  return new_message_id;
end;
$$;

grant execute on function public.send_streak_reminder(uuid, text) to authenticated;
