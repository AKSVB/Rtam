// Phone cameras routinely produce 3-8 MB originals. At Supabase's free 1 GB
// storage tier that's only a couple hundred photos across the whole site,
// and every one of those megabytes is also billed as egress on every page
// view. Downscaling and re-encoding before upload keeps a typical photo in
// the low hundreds of KB with no visible quality loss at the sizes temple
// cards and detail pages actually display images.

const MAX_DIMENSION = 1600
const JPEG_QUALITY = 0.82
// Small files (screenshots, already-compressed images) aren't worth the
// re-encode — skip them rather than risk making them larger.
const SKIP_BELOW_BYTES = 300 * 1024

export async function compressImageForUpload(file: File): Promise<File> {
  if (!file.type.startsWith('image/') || file.type === 'image/svg+xml' || file.type === 'image/gif') {
    return file
  }
  if (file.size <= SKIP_BELOW_BYTES) return file

  try {
    const { image, width: srcWidth, height: srcHeight, cleanup } = await loadImage(file)
    try {
      const scale = Math.min(1, MAX_DIMENSION / Math.max(srcWidth, srcHeight))
      const width = Math.round(srcWidth * scale)
      const height = Math.round(srcHeight * scale)

      const canvas = document.createElement('canvas')
      canvas.width = width
      canvas.height = height
      const ctx = canvas.getContext('2d')
      if (!ctx) return file
      ctx.drawImage(image, 0, 0, width, height)

      const blob = await new Promise<Blob | null>((resolve) =>
        canvas.toBlob(resolve, 'image/jpeg', JPEG_QUALITY),
      )
      if (!blob || blob.size >= file.size) return file

      const newName = file.name.replace(/\.[^.]+$/, '') + '.jpg'
      return new File([blob], newName, { type: 'image/jpeg' })
    } finally {
      cleanup()
    }
  } catch {
    // Unsupported format, corrupt file, canvas tainted, whatever — upload
    // the original rather than block the contributor's submission over an
    // optimization that isn't essential to it succeeding.
    return file
  }
}

async function loadImage(
  file: File,
): Promise<{ image: CanvasImageSource; width: number; height: number; cleanup: () => void }> {
  if ('createImageBitmap' in window) {
    const bitmap = await createImageBitmap(file)
    return { image: bitmap, width: bitmap.width, height: bitmap.height, cleanup: () => bitmap.close() }
  }

  const url = URL.createObjectURL(file)
  const img = await new Promise<HTMLImageElement>((resolve, reject) => {
    const el = new Image()
    el.onload = () => resolve(el)
    el.onerror = reject
    el.src = url
  })
  return {
    image: img,
    width: img.naturalWidth,
    height: img.naturalHeight,
    cleanup: () => URL.revokeObjectURL(url),
  }
}
