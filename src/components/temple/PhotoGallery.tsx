import { useState } from 'react'
import type { TemplePhoto } from '../../types/database'
import { strings } from '../../constants/strings'

/**
 * Most of these photographs are CC BY / CC BY-SA from Wikimedia Commons,
 * which obliges us to name the photographer and the licence wherever the
 * image appears — so the credit line is not optional decoration.
 */
function Credit({ photo }: { photo: TemplePhoto }) {
  if (!photo.credit && !photo.license) return null
  const text = [photo.credit, photo.license].filter(Boolean).join(' · ')
  return photo.source_url ? (
    <a
      href={photo.source_url}
      target="_blank"
      rel="noopener noreferrer nofollow"
      className="block truncate text-[11px] text-charcoal-700/60 hover:text-maroon-700 hover:underline"
      title={text}
    >
      {text}
    </a>
  ) : (
    <span className="block truncate text-[11px] text-charcoal-700/60" title={text}>
      {text}
    </span>
  )
}

export function PhotoGallery({ photos, templeName }: { photos: TemplePhoto[]; templeName: string }) {
  const [lightbox, setLightbox] = useState<TemplePhoto | null>(null)

  if (photos.length === 0) {
    return <p className="text-sm text-charcoal-700/70">{strings.temple.noPhotos}</p>
  }

  return (
    <>
      <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 md:grid-cols-4">
        {photos.map((photo) => (
          <figure key={photo.id} className="flex flex-col gap-1">
            <button
              type="button"
              onClick={() => setLightbox(photo)}
              className="overflow-hidden rounded-lg focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-maroon-700"
              aria-label={`View larger photo of ${templeName}`}
            >
              <img
                src={photo.url}
                alt={photo.caption ?? `Photo of ${templeName}`}
                loading="lazy"
                className="aspect-square w-full object-cover transition-transform hover:scale-105"
              />
            </button>
            <figcaption>
              <Credit photo={photo} />
            </figcaption>
          </figure>
        ))}
      </div>

      {lightbox && (
        <div
          className="fixed inset-0 z-50 flex flex-col items-center justify-center gap-3 bg-charcoal-900/90 p-4"
          role="dialog"
          aria-modal="true"
          aria-label={`Photo of ${templeName}`}
          onClick={() => setLightbox(null)}
        >
          <img
            src={lightbox.url}
            alt={lightbox.caption ?? `Photo of ${templeName}`}
            className="max-h-[80vh] max-w-full rounded-lg object-contain"
          />
          <div className="text-center text-sm text-cream-100">
            {lightbox.caption && <p>{lightbox.caption}</p>}
            {(lightbox.credit || lightbox.license) && (
              <p className="mt-1 text-cream-200/70">
                {[lightbox.credit, lightbox.license].filter(Boolean).join(' · ')}
                {lightbox.source_url && (
                  <>
                    {' — '}
                    <a
                      href={lightbox.source_url}
                      target="_blank"
                      rel="noopener noreferrer nofollow"
                      className="underline"
                      onClick={(e) => e.stopPropagation()}
                    >
                      source
                    </a>
                  </>
                )}
              </p>
            )}
          </div>
          <button
            type="button"
            onClick={() => setLightbox(null)}
            className="rounded-lg bg-cream-100 px-4 py-2 text-sm font-semibold text-charcoal-900"
          >
            Close
          </button>
        </div>
      )}
    </>
  )
}
