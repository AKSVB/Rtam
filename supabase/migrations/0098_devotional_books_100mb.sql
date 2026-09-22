-- Ṛtam — raise the devotional-books bucket's own file size limit to 100 MB
-- to match the app-side check in useDevotionalBooks.ts. Without this, the
-- bucket falls back to the project's global default (often 50 MB), which
-- would silently reject a 60-100 MB upload the app itself had just approved.

update storage.buckets
set file_size_limit = 104857600, -- 100 MB
    allowed_mime_types = array['application/pdf', 'image/jpeg', 'image/png', 'image/webp']
where id = 'devotional-books';
