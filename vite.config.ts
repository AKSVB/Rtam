import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'
import { VitePWA } from 'vite-plugin-pwa'
import { defineConfig } from 'vite'

// https://vite.dev/config/
export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
    VitePWA({
      registerType: 'autoUpdate',
      includeAssets: ['favicon.svg', 'apple-touch-icon.png'],
      manifest: {
        name: 'Ṛtam',
        short_name: 'Ṛtam',
        description:
          'From the Jyotirlingas to your nearest village temple — find places that support daily rituals, food, and stay.',
        theme_color: '#7a1f2b',
        background_color: '#fdfbf7',
        display: 'standalone',
        start_url: '/',
        icons: [
          { src: '/icons/temple-icon.svg', sizes: 'any', type: 'image/svg+xml' },
          { src: '/icons/icon-192.png', sizes: '192x192', type: 'image/png' },
          { src: '/icons/icon-512.png', sizes: '512x512', type: 'image/png' },
          { src: '/icons/icon-512.png', sizes: '512x512', type: 'image/png', purpose: 'maskable' },
        ],
      },
      workbox: {
        globPatterns: ['**/*.{js,css,html,svg,png,ico}'],
        // Without this, the SW's default SPA navigation fallback serves the
        // cached app shell for *any* full-page navigation — including
        // /sitemap.xml and /robots.txt — to a browser that already has this
        // PWA installed. Crawlers (which don't run service workers) were
        // never affected, but exclude these so a real browser sees the
        // actual files too.
        navigateFallbackDenylist: [/^\/sitemap\.xml$/, /^\/robots\.txt$/],
        runtimeCaching: [
          {
            urlPattern: /^https:\/\/[abc]\.tile\.openstreetmap\.org\/.*/,
            handler: 'CacheFirst',
            options: {
              cacheName: 'osm-tiles',
              expiration: { maxEntries: 200, maxAgeSeconds: 60 * 60 * 24 * 30 },
            },
          },
          {
            // Temple/book data from Supabase's REST API — NetworkFirst so a
            // connected visitor always sees fresh data, but a temple or
            // library page already opened once still renders offline (e.g.
            // at a remote hill temple with no signal) from the last-seen
            // response, falling back after a short timeout rather than
            // hanging on a dead connection.
            urlPattern: /^https:\/\/[^/]+\.supabase\.co\/rest\/v1\/.*/,
            handler: 'NetworkFirst',
            options: {
              cacheName: 'supabase-data',
              networkTimeoutSeconds: 4,
              expiration: { maxEntries: 300, maxAgeSeconds: 60 * 60 * 24 * 7 },
              cacheableResponse: { statuses: [0, 200] },
            },
          },
          {
            // Temple/book cover photos — small, so safe to cache generously;
            // deliberately excludes the large PDFs under /storage/.../devotional-books/,
            // which stay network-only so the service worker never tries to
            // hold a 100 MB file in the browser's cache quota.
            urlPattern: ({ url }) =>
              url.hostname.endsWith('.supabase.co') &&
              url.pathname.startsWith('/storage/v1/object/public/') &&
              !url.pathname.includes('/devotional-books/'),
            handler: 'CacheFirst',
            options: {
              cacheName: 'supabase-images',
              expiration: { maxEntries: 500, maxAgeSeconds: 60 * 60 * 24 * 30 },
              cacheableResponse: { statuses: [0, 200] },
            },
          },
        ],
      },
    }),
  ],
})
