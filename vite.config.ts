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
      includeAssets: ['favicon.svg'],
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
          { src: '/icons/temple-icon.svg', sizes: 'any', type: 'image/svg+xml', purpose: 'maskable' },
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
        ],
      },
    }),
  ],
})
