/**
 * Copyright/good-faith notice shown on the library and every book page.
 * `compact` is a one-line version for the browse grid; the full version
 * (book detail pages) also names the removal mechanism explicitly.
 */
export function LibraryDisclaimer({ compact = false }: { compact?: boolean }) {
  if (compact) {
    return (
      <p className="rounded-lg border border-gold-400/30 bg-gold-400/10 px-3 py-2 text-xs text-charcoal-700/70">
        📚 Books here are shared by individual devotees, in good faith, for spiritual and educational
        purposes only, in the interest of the wider public good. No copyright infringement is intended —
        rights holders may request removal from any book's page.
      </p>
    )
  }

  return (
    <div className="rounded-lg border border-gold-400/30 bg-gold-400/10 px-4 py-3 text-xs leading-relaxed text-charcoal-700/70">
      <p>
        📚 This book was uploaded by an individual devotee, in good faith and for spiritual and
        educational purposes only, in the interest of the wider public good — not for any commercial
        purpose. Ṛtam does not claim ownership of, or any copyright in, this work, and no copyright
        infringement is intended.
      </p>
      <p className="mt-2">
        If you hold the rights to this work and did not authorize its being shared here, please use the{' '}
        <strong>Report</strong> button below to request its removal — a moderator will review it promptly.
      </p>
    </div>
  )
}
