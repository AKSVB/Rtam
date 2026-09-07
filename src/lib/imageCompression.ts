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

// Anything but a fresh iPhone camera shot is a decent chance of being HEIC —
// the format iOS has saved photos in by default since 2017. No browser but
// Safari can decode HEIC into a <canvas> or even show it in a plain <img>,
// so left alone, uploading one of these "older" photos would silently
// "succeed" (the bytes reach storage fine) while rendering as a broken
// image everywhere, including for the person who just posted it — which is
// indistinguishable from the upload having failed. Converting to JPEG
// first, before the resize step below, is what actually fixes that.
function isHeic(file: File): boolean {
  const type = file.type.toLowerCase()
  if (type === 'image/heic' || type === 'image/heif') return true
  // Some browsers report HEIC files with an empty or generic MIME type
  // (e.g. iOS Safari in some contexts), so fall back to the extension.
  return /\.hei[cf]$/i.test(file.name)
}

async function convertHeicToJpeg(file: File): Promise<File> {
  const heic2any = (await import('heic2any')).default
  const result = await heic2any({ blob: file, toType: 'image/jpeg', quality: JPEG_QUALITY })
  const blob = Array.isArray(result) ? result[0] : result
  const newName = file.name.replace(/\.[^.]+$/, '') + '.jpg'
  return new File([blob], newName, { type: 'image/jpeg' })
}

export async function compressImageForUpload(file: File, maxDimension: number = MAX_DIMENSION): Promise<File> {
  if (isHeic(file)) {
    try {
      file = await convertHeicToJpeg(file)
    } catch {
      // Conversion failed, so we're back to an undisplayable file — but
      // that's the same outcome as before this existed. Still upload it
      // rather than block the post entirely over a best-effort conversion.
      return file
    }
  }

  if (!file.type.startsWith('image/') || file.type === 'image/svg+xml' || file.type === 'image/gif') {
    return file
  }
  if (file.size <= SKIP_BELOW_BYTES) return file

  try {
    const { image, width: srcWidth, height: srcHeight, cleanup } = await loadImage(file)
    try {
      const scale = Math.min(1, maxDimension / Math.max(srcWidth, srcHeight))
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
