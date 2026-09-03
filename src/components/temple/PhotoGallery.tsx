import type { TemplePhoto } from '../../types/database'
import { strings } from '../../constants/strings'

export function PhotoGallery({ photos, templeName }: { photos: TemplePhoto[]; templeName: string }) {
  if (photos.length === 0) {
    return <p className="text-sm text-charcoal-700/70">{strings.temple.noPhotos}</p>
  }

  return (
    <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 md:grid-cols-4">
      {photos.map((photo) => (
        <img
          key={photo.id}
          src={photo.url}
          alt={`Photo of ${templeName}`}
          loading="lazy"
          className="aspect-square w-full rounded-lg object-cover"
        />
      ))}
    </div>
  )
}
