# Ṛtam

A crowdsourced temple & pilgrimage directory for the Brahmin community — find temples that support daily rituals (Sandhya Vandanam, Samidhadhanam), Brahmin-run or pure-veg food, and nearby stays. Built as an installable Progressive Web App.

The name comes from *ṛtam* (ऋतम्), the Vedic concept of cosmic and ritual order.

**Phase 1 (this build):** core temple directory, search/filter, map + list views, temple detail pages, a guided multi-step submission form, a lightweight trip planner, and a moderator approval queue.

## Tech stack

- **Frontend:** React + TypeScript + Vite
- **Styling:** Tailwind CSS v4
- **Backend:** Supabase (Postgres, Auth, Storage, Row-Level Security) — free tier
- **Maps:** Leaflet.js + OpenStreetMap tiles (no API key needed)
- **State:** TanStack React Query for server state; local component state elsewhere
- **PWA:** vite-plugin-pwa (installable, offline app shell + cached map tiles)

## 1. Run locally

```bash
npm install
cp .env.example .env
```

Fill in `.env` with your Supabase project's URL and anon key (see step 2), then:

```bash
npm run dev
```

The app runs at `http://localhost:5173`.

## 2. Set up a free Supabase project

1. Create a project at [supabase.com](https://supabase.com) (free tier is enough for small/medium scale).
2. In the Supabase dashboard, go to the **SQL Editor** and run the migration files in order:
   - `supabase/migrations/0001_schema.sql` — tables, enums, triggers
   - `supabase/migrations/0002_rls.sql` — Row Level Security policies + the `temple-photos` storage bucket
3. (Optional but recommended for demoing) Run `supabase/seed.sql` to load ~56 real temples — all 12 Jyotirlingas, the 4 Char Dham, a well-documented set of Shakti Peethas, all 5 Pancha Bhoota Sthalams, more Sapta Puri cities, and other major pan-India temples. See the note in that file about what's fact-checked (location, deity, general geography) versus intentionally left `unknown` (Brahmin-specific ritual logistics) for the community to fill in.
4. Go to **Project Settings → API** and copy the **Project URL** and **anon public key** into your `.env` file as `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY`.
5. Sign up for an account in the running app, then in the Supabase **Table Editor**, open `user_profiles` and change your row's `role` to `moderator` or `admin` so you can access `/moderate` and approve submissions (including your own, and the seed data if you didn't run the seed script as a superuser).

> If you skip the CLI and only use the SQL Editor as above, that's enough — the Supabase CLI is not required for Phase 1.

### Using the Supabase CLI instead (optional)

```bash
supabase link --project-ref your-project-ref
supabase db push
```

This applies everything under `supabase/migrations/` in order.

## 3. Deploy (Vercel or Netlify, free tier)

Both platforms auto-detect this as a Vite app.

**Vercel**
```bash
npm i -g vercel
vercel
```
Set `VITE_SUPABASE_URL` and `VITE_SUPABASE_ANON_KEY` as environment variables in the Vercel project settings, then redeploy.

**Netlify**
```bash
npm i -g netlify-cli
netlify deploy --build
```
Build command: `npm run build`, publish directory: `dist`. Set the same two environment variables in Netlify's site settings.

The app is installable on phones directly from the deployed URL (no app-store submission needed) via "Add to Home Screen" / the browser's install prompt.

## Project structure

```
src/
  components/     # layout, temple-specific, and shared form/UI components
  constants/      # single source of truth for enum labels and UI strings (i18n-ready)
  context/        # AuthContext (Supabase Auth session + profile)
  hooks/          # React Query hooks for temples, reviews, moderation, trip lists
  pages/          # one component per route
  types/          # TypeScript types mirroring the Postgres schema
supabase/
  migrations/     # SQL schema + RLS policies, run in order
  seed.sql        # demo data
```

## What's out of scope for Phase 1

Social feed, groups, matrimony, purohit directory, payments, native mobile apps, and non-English UI are intentionally not built yet. Phase 2 will cover these.
