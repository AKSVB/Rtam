import { MhahPanchang } from 'mhah-panchang'

// Standard Sanskrit spellings, in the same order as the library's own
// internal Masa index (0 = Vaishakha … 11 = Chaitra) — verified against
// mhah-panchang's own name_en_IN constants ("Baisakha", "Bhadraba", etc.),
// which use Odia-influenced spelling.
const MASA_NAMES = [
  'Vaishakha',
  'Jyeshtha',
  'Ashadha',
  'Shravana',
  'Bhadrapada',
  'Ashwin',
  'Kartika',
  'Margashirsha',
  'Pausha',
  'Magha',
  'Phalguna',
  'Chaitra',
]

const TITHI_NOTES: Record<string, string> = {
  Ekadashi: 'Ekadashi — a traditional fasting (upavasa) day.',
  Purnima: 'Purnima — full moon; a traditional fasting/vrat day in most traditions.',
  Amavasya: 'Amavasya — new moon; ancestor remembrance (tarpana) is traditionally observed.',
  Chaturthi: 'Chaturthi — traditionally associated with Ganesha/Vinayaka worship.',
  Shashti: 'Shashti — traditionally associated with Subramanya/Skanda worship.',
  Ashtami: 'Ashtami — traditionally associated with Devi or Krishna worship depending on the month.',
  Navami: 'Navami — traditionally a significant day within Navaratri when it falls in Ashwin.',
}

export interface TodaysPanchang {
  weekday: string
  tithi: string
  tithiEndsAt: Date
  paksha: 'Shukla' | 'Krishna'
  nakshatra: string
  nakshatraEndsAt: Date
  purnimantaMasa: string
  amantaMasa: string
  note: string | null
}

/**
 * Verified against drikpanchang.com for a reference date before shipping:
 * tithi/nakshatra end-times and the Purnimanta month name matched exactly.
 * The Amanta month name isn't returned by the library directly — during
 * Krishna Paksha the Amanta month is still the *previous* month by name
 * (it doesn't roll over until the following Amavasya), so it's derived
 * as purnimantaIndex - 1; during Shukla Paksha the two systems agree.
 * This was cross-checked against the same reference date and matched.
 */
export function getTodaysPanchang(date: Date = new Date()): TodaysPanchang {
  const mhah = new MhahPanchang()
  const calc = mhah.calculate(date)
  const cal = mhah.calendar(date, 13.0827, 80.2707, 0) // reference point only — tithi/nakshatra timing is not location-sensitive

  const paksha = calc.Paksha.name_en_IN as 'Shukla' | 'Krishna'
  const purnimantaIno: number = cal.Masa.ino
  const amantaIno = paksha === 'Krishna' ? (purnimantaIno - 1 + 12) % 12 : purnimantaIno

  const tithiName = calc.Tithi.name_en_IN as string
  const note = TITHI_NOTES[tithiName] ?? null

  return {
    weekday: calc.Day.name_en_UK,
    tithi: tithiName,
    tithiEndsAt: new Date(calc.Tithi.end),
    paksha,
    nakshatra: calc.Nakshatra.name_en_IN,
    nakshatraEndsAt: new Date(calc.Nakshatra.end),
    purnimantaMasa: MASA_NAMES[purnimantaIno],
    amantaMasa: MASA_NAMES[amantaIno],
    note,
  }
}
