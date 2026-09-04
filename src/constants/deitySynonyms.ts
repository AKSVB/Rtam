// Groups of names that refer to the same deity, grounded in what actually
// appears in temples.deity across this directory (e.g. "Krishna" and "Rama"
// never say "Vishnu" outright, so searching "Vishnu" alone would miss them).
// Searching any alias in a group also matches every other alias in it.
export const DEITY_SYNONYM_GROUPS: string[][] = [
  ['shiva', 'mahadev', 'mahadeva', 'eswara', 'easwara', 'ishwar', 'chandramouleeswara', 'nataraja'],
  [
    'vishnu',
    'narayana',
    'krishna',
    'rama',
    'narasimha',
    'vitthal',
    'perumal',
    'ranganatha',
    'venkateswara',
    'padmanabha',
  ],
  ['devi', 'amman', 'mata', 'kali', 'durga', 'parvati', 'bhagavathy', 'bhagavati', 'shakti'],
]

/** Every alias in every group the given search term matches (itself included), or [] if it matches none. */
export function expandDeitySynonyms(term: string): string[] {
  const lower = term.trim().toLowerCase()
  for (const group of DEITY_SYNONYM_GROUPS) {
    if (group.includes(lower)) return group
  }
  return []
}
