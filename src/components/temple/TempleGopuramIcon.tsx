/** A simple stepped-gopuram glyph, used as a placeholder for temples with no photo yet. */
export function TempleGopuramIcon({ className }: { className?: string }) {
  return (
    <svg viewBox="0 0 64 64" fill="none" className={className} aria-hidden>
      <path
        d="M32 6l6 8h-4v5h6l7 9h-5v5h8l7 9H7l7-9h8v-5h-5l7-9h6v-5h-4l6-8z"
        fill="currentColor"
        opacity="0.9"
      />
      <rect x="10" y="42" width="44" height="6" fill="currentColor" opacity="0.9" />
      <rect x="26" y="50" width="5" height="8" fill="currentColor" opacity="0.7" />
      <rect x="33" y="50" width="5" height="8" fill="currentColor" opacity="0.7" />
    </svg>
  )
}
