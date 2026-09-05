export function Avatar({
  url,
  name,
  size = 40,
  className = '',
}: {
  url?: string | null
  name: string
  size?: number
  className?: string
}) {
  if (url) {
    return (
      <img
        src={url}
        alt=""
        width={size}
        height={size}
        className={`shrink-0 rounded-full object-cover ring-2 ring-gold-400/60 ${className}`}
        style={{ width: size, height: size }}
      />
    )
  }

  return (
    <div
      aria-hidden
      className={`flex shrink-0 items-center justify-center rounded-full bg-gradient-to-br from-maroon-700 to-maroon-900 font-semibold text-cream-50 ring-2 ring-gold-400/60 ${className}`}
      style={{ width: size, height: size, fontSize: size * 0.4 }}
    >
      {name.charAt(0).toUpperCase()}
    </div>
  )
}
