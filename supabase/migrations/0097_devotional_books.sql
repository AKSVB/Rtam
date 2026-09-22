-- Ṛtam — a crowdsourced library of devotional PDFs (stotras, puranas,
-- itihasas, bhajan collections...), moderated the same way temples are:
-- anyone signed in can submit one, it stays private to them until a
-- moderator approves it, and only approved books are publicly visible.
-- This deliberately does not seed any books itself — copyright status
-- varies wildly across devotional texts, and that judgment belongs to
-- the person uploading (and the moderator reviewing), not a migration.

create table public.devotional_books (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  author text,
  deity text,
  language text not null,
  category text not null check (
    category in ('stotra', 'purana', 'itihasa', 'upanishad', 'veda', 'bhajan', 'panchang', 'biography', 'other')
  ),
  description text,
  page_count integer,
  file_size_bytes bigint,
  cover_image_url text,
  pdf_url text not null,
  submitted_by uuid not null references public.user_profiles(id) on delete cascade,
  status text not null default 'pending' check (status in ('pending', 'approved', 'rejected')),
  moderator_note text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index devotional_books_status_idx on public.devotional_books (status);
create index devotional_books_category_idx on public.devotional_books (category);
create index devotional_books_submitted_by_idx on public.devotional_books (submitted_by);

create trigger set_updated_at before update on public.devotional_books
  for each row execute function public.set_updated_at();

alter table public.devotional_books enable row level security;

create policy "Approved books are publicly readable"
  on public.devotional_books for select
  using (
    status = 'approved'
    or submitted_by = auth.uid()
    or public.is_moderator()
  );

create policy "Authenticated users can submit books"
  on public.devotional_books for insert
  to authenticated
  with check (submitted_by = auth.uid() and status = 'pending' and not public.is_banned());

create policy "Owners can edit their own pending book submissions"
  on public.devotional_books for update
  using (submitted_by = auth.uid() and status = 'pending')
  with check (submitted_by = auth.uid() and status = 'pending');

create policy "Moderators can edit any book"
  on public.devotional_books for update
  using (public.is_moderator())
  with check (public.is_moderator());

create policy "Owners can delete their own pending book submissions"
  on public.devotional_books for delete
  using (submitted_by = auth.uid() and status = 'pending');

create policy "Moderators can delete any book"
  on public.devotional_books for delete
  using (public.is_moderator());

grant select, insert, update, delete on public.devotional_books to anon, authenticated;

-- ── storage ──────────────────────────────────────────────────────────────

insert into storage.buckets (id, name, public)
values ('devotional-books', 'devotional-books', true)
on conflict (id) do nothing;

create policy "Devotional book files are publicly readable"
  on storage.objects for select
  using (bucket_id = 'devotional-books');

create policy "Users can upload their own devotional book files"
  on storage.objects for insert
  to authenticated
  with check (
    bucket_id = 'devotional-books'
    and (storage.foldername(name))[1] = auth.uid()::text
    and not public.is_banned()
  );

create policy "Users can delete their own devotional book files"
  on storage.objects for delete
  using (bucket_id = 'devotional-books' and (storage.foldername(name))[1] = auth.uid()::text);

-- ── points ───────────────────────────────────────────────────────────────
-- +10 when a submitted book is approved — same weight as an accepted edit,
-- since sourcing and describing a legitimate devotional text correctly is
-- comparable effort. -10 if later un-approved, so points reflect what is
-- actually live.

create or replace function public.points_on_book_review()
returns trigger
language plpgsql
security definer set search_path = public
as $$
begin
  if new.status = 'approved' and old.status is distinct from 'approved' then
    perform public.award_points(new.submitted_by, 10);
  elsif old.status = 'approved' and new.status is distinct from 'approved' then
    perform public.award_points(new.submitted_by, -10);
  end if;
  return new;
end;
$$;

create trigger book_approval_points
  after update of status on public.devotional_books
  for each row execute function public.points_on_book_review();
