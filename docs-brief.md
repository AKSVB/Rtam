# Claude Code Prompt — Brahmin Temple & Community Directory App

Copy everything below into Claude Code as your project brief.

---

## PROJECT BRIEF

Build a web app called **"SanskritiConnect"** (working title — feel free to suggest better ones) for a Brahmin community distributed across India and the diaspora. The app is a crowdsourced directory + light community platform focused on temple/pilgrimage travel: finding temples that support daily rituals, food, and stay.

Build this as a **Progressive Web App (PWA)** so it works on both desktop and mobile from one codebase, installable on phones without app-store submission.

### Tech stack (use free/open tools — no paid APIs required to run at small-to-medium scale)
- Frontend: React + TypeScript + Vite
- Styling: Tailwind CSS
- Backend/DB/Auth/Storage: Supabase (free tier — Postgres, auth, file storage, row-level security)
- Maps: Leaflet.js + OpenStreetMap tiles (no Google Maps API key needed)
- Hosting: structure the app so it can deploy to Vercel or Netlify free tier
- State management: React Query (for server state) + minimal local state — avoid over-engineering

### Build in phases. Complete and verify each phase before moving to the next. Start with Phase 1 only unless told otherwise.

---

## PHASE 1 — Core Temple Directory (MVP)

This is the entire scope for v1. Do not build social feed, groups, matrimony, or purohit directory yet — those come later.

### Data model — `temples` table
- `id` (uuid, pk)
- `name` (text)
- `deity` (text)
- `sampradaya` (text, nullable — e.g. Smartha/Vaishnava/Madhwa/other)
- `state`, `district`, `town` (text)
- `latitude`, `longitude` (float)
- `sandhya_friendly` (enum: yes / no / partial / unknown)
- `sandhya_notes` (text, nullable — e.g. water access, quiet space, time windows)
- `samidhadhanam_friendly` (enum: yes / no / partial / unknown)
- `samidhadhanam_notes` (text, nullable)
- `food_tier` (enum: **brahmin_run_kitchen** / **pure_veg_available** / **no_veg_confirmed_nearby** / unknown)
  - `brahmin_run_kitchen`: temple or a nearby verified establishment has Brahmin-run cooking
  - `pure_veg_available`: no Brahmin-run kitchen known, but a confirmed pure-vegetarian option exists nearby
  - `no_veg_confirmed_nearby`: no known veg option confirmed yet (still useful to flag rather than leave blank)
- `food_source_name`, `food_source_contact`, `food_distance_km` (nullable — populated when food_tier isn't "unknown")
- `nearest_river_name`, `river_distance_km` (nullable)
- `best_season_notes` (text, nullable)
- `submitted_by` (uuid, fk -> users)
- `status` (enum: pending / approved / rejected) — default `pending`
- `verified_by` (uuid, nullable, fk -> users, moderator who approved)
- `created_at`, `updated_at` (timestamps)

### Data model — `temple_stays` table (nearby accommodation)
- `id`, `temple_id` (fk)
- `name`, `contact`, `address`
- `distance_to_temple_km`, `distance_to_river_km` (nullable)
- `pure_veg_kitchen` (bool), `puja_room_available` (bool)
- `price_range` (text, e.g. "₹800–1500/night")
- `notes` (text, nullable)

### Data model — `temple_photos` table
- `id`, `temple_id` (fk), `url`, `uploaded_by`, `created_at`

### Data model — `users` table (use Supabase Auth, extend with a profile table)
- `id` (matches Supabase auth uid)
- `display_name`
- `home_city` (nullable)
- `role` (enum: member / moderator / admin — default member)
- `contribution_points` (int, default 0)

### Data model — `temple_reviews` table (simple ratings/comments)
- `id`, `temple_id` (fk), `user_id` (fk), `rating` (1–5), `comment` (text, nullable), `created_at`

### Row-level security
- Anyone (including anonymous) can **read** approved temples/stays/photos
- Only authenticated users can **submit** new temples/stays/reviews (status defaults to pending for temples)
- Only users with role = moderator/admin can approve/reject/edit others' submissions
- Users can edit/delete their own pending submissions and reviews

---

## PHASE 1 — Required Screens/Pages

1. **Home / Search page**
   - Search bar (by temple name, deity, or location)
   - Filter panel: state, sandhya-friendly, samidhadhanam-friendly, food tier, "has nearby river"
   - Toggle between **map view** (Leaflet, pins clustered by region) and **list view** (cards)
   - Each card shows: name, location, deity, small badges for sandhya/samidhadhanam/food tier

2. **Temple detail page**
   - All fields displayed clearly with readable labels (not raw enum values — e.g. show "Brahmin-run kitchen available" not `brahmin_run_kitchen`)
   - Photo gallery
   - Nearby stays list (cards with contact info)
   - Reviews section (list + "add review" form for logged-in users)
   - "Add to my trip list" button (see Trip Planner below)

3. **Add/Edit Temple form**
   - Multi-step guided form matching the data model above
   - Inline helper text explaining what counts as "Sandhya-friendly" vs "Samidhadhanam-friendly" vs each food tier, so contributors fill it consistently
   - Photo upload (Supabase Storage)
   - On submit: status = pending, show confirmation + "your submission is awaiting review"

4. **Trip Planner (lightweight, local-storage based for v1)**
   - Users can add temples to a personal trip list (no login required — store in browser localStorage; if logged in, sync to a `trip_lists` table)
   - Shows selected temples on one map, sorted by rough geographic proximity
   - Shareable link (generates a read-only URL with the list of temple IDs as a query param)

5. **Moderator queue page** (visible only to moderator/admin role)
   - List of pending temple/stay submissions
   - Approve / reject (with optional feedback note) / edit-then-approve
   - Simple table view is fine — no need for anything fancy

6. **Auth pages**
   - Sign up / log in via Supabase Auth (email/password is fine for v1; phone OTP can come later)
   - Basic profile page (display name, home city, view own contribution points and submissions)

---

## DESIGN GUIDELINES

- Clean, warm, respectful aesthetic — not garish. Suggested palette: cream/off-white background, deep maroon or saffron as accent, dark charcoal text. Avoid stock "generic SaaS" blue-and-white look.
- Large tap targets and readable font sizes — assume some users are older and on mid-range phones.
- Fully responsive: mobile-first, but usable on desktop too.
- Use real semantic HTML and accessible components (labels on all form fields, alt text on images, sufficient color contrast).

---

## WHAT NOT TO BUILD YET (explicitly out of scope for Phase 1)

- No social feed, posts, follows, or groups
- No matrimony features of any kind
- No purohit/service directory
- No payment processing or marketplace
- No native mobile app — PWA only for now
- No multi-language UI yet (English only for v1; structure text strings so translation can be added later — e.g. a single strings/constants file rather than hardcoded text scattered everywhere)

---

## DELIVERABLE FOR THIS SESSION

1. Scaffold the project (Vite + React + TS + Tailwind), set up Supabase client and environment variable structure (use placeholder `.env.example`)
2. Write the SQL migration files for all tables + RLS policies described above
3. Build all Phase 1 screens listed above with working navigation between them
4. Seed the database with 5–10 realistic example temple entries (across different states, mixing food tiers and friendliness levels) so the app is demoable immediately
5. Provide a short README explaining how to run locally, set up a free Supabase project, and deploy to Vercel/Netlify

After this is working, I'll come back with Phase 2 requirements (social feed, groups, Panchangam tools, purohit directory).
