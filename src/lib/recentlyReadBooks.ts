// A per-browser "continue reading" shelf for the devotional library. This is
// a per-viewer convenience (which book did *this device* last open), not
// state that needs to be shared or read back by anyone else, so it lives in
// localStorage rather than the database — and every access is wrapped since
// localStorage can throw or come back empty in private browsing.

const KEY = 'rtam:recently-read-books'
const MAX_ENTRIES = 8

export function recordBookOpened(bookId: string): void {
  try {
    const existing = getRecentlyReadIds().filter((id) => id !== bookId)
    const next = [bookId, ...existing].slice(0, MAX_ENTRIES)
    localStorage.setItem(KEY, JSON.stringify(next))
  } catch {
    /* private-browsing / storage disabled — fine to just not persist */
  }
}

export function getRecentlyReadIds(): string[] {
  try {
    const raw = localStorage.getItem(KEY)
    if (!raw) return []
    const parsed = JSON.parse(raw)
    return Array.isArray(parsed) ? parsed.filter((v): v is string => typeof v === 'string') : []
  } catch {
    return []
  }
}
