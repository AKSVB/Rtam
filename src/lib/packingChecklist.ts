import type { Temple } from '../types/database'

/**
 * Derives a packing/prep checklist from the free-text fields a temple
 * already has — no new data entry required. Keyword-based and deliberately
 * simple; it's meant to prompt a traveller to re-read the relevant note,
 * not to be an exhaustive or authoritative packing list.
 */
export function generatePackingChecklist(
  temple: Pick<Temple, 'etiquette_notes' | 'accessibility_notes' | 'best_season_notes' | 'timings_notes'>,
): string[] {
  const haystack = [
    temple.etiquette_notes,
    temple.accessibility_notes,
    temple.best_season_notes,
    temple.timings_notes,
  ]
    .filter(Boolean)
    .join(' ')
    .toLowerCase()

  const items: string[] = []
  const add = (text: string) => {
    if (!items.includes(text)) items.push(text)
  }

  if (haystack.includes('dhoti') || haystack.includes('mundu') || haystack.includes('bare-chested')) {
    add('A mundu/dhoti (and a spare) — the dress code here is strictly enforced')
  }
  if (haystack.includes('saree') || haystack.includes('churidar')) {
    add('A saree, or churidar with a covering dupatta, per the dress code')
  }
  if (haystack.includes('leather')) {
    add('Leave leather items (belts, wallets, bags) back at your stay — not permitted past security')
  }
  if (haystack.includes('permit') || haystack.includes('registration') || haystack.includes('id')) {
    add('Government-issued photo ID, and any required permit or registration papers')
  }
  if (
    haystack.includes('trek') ||
    haystack.includes('climb') ||
    haystack.includes('uphill') ||
    haystack.includes('steps') ||
    haystack.includes('km')
  ) {
    add('Comfortable, already-broken-in walking shoes')
    add('A refillable water bottle')
  }
  if (haystack.includes('altitude') || haystack.includes('snow') || haystack.includes('cold')) {
    add('Warm, layered clothing — temperatures drop fast at altitude')
  }
  if (haystack.includes('medical fitness') || haystack.includes('fitness certificate')) {
    add('A medical fitness certificate, arranged in advance')
  }
  if (haystack.includes('monsoon') || haystack.includes('rain')) {
    add('A light raincoat or umbrella if travelling near the monsoon window')
  }
  if (haystack.includes('heat') || /\bhot\b/.test(haystack)) {
    add('Sun protection — hat, sunscreen, and extra water')
  }
  if (haystack.includes('phone') && (haystack.includes('not permitted') || haystack.includes('restrict'))) {
    add("Somewhere to store your phone/camera — they're restricted near the sanctum here")
  }

  // Generic, always-useful items — kept separate from the contextual ones above.
  const general = [
    'Small-denomination cash for hundi offerings and local transport',
    'A cloth bag to carry your shoes if there is no cloakroom',
  ]

  return [...items, ...general]
}
