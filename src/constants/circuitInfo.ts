/**
 * Short, factual blurbs for each well-known pilgrimage circuit — shown on
 * the Circuits pages for context. Keyed by the exact significance tag
 * string stored in temples.significance, so a new tag simply shows the
 * generic fallback until someone adds an entry here.
 */
export interface CircuitInfo {
  /** One or two sentences on what defines the circuit. */
  blurb: string
  /** The traditional/expected count, if the circuit has a fixed number of members. */
  expectedCount?: number
}

export const CIRCUIT_INFO: Record<string, CircuitInfo> = {
  Jyotirlinga: {
    blurb:
      'Twelve shrines across India where Shiva is worshipped as a jyotirlinga, a "linga of light" — among the most revered Shaiva pilgrimage sites.',
    expectedCount: 12,
  },
  'Shakti Peetha': {
    blurb:
      'Sites where a part of the goddess Sati is said to have fallen after Shiva carried her body across the cosmos in grief. Traditions vary on the exact count and even on which sites qualify — commonly cited lists range from 18 (Ashtadasha) to 51 — so this list draws from several overlapping traditions rather than one fixed set.',
  },
  'Pancha Bhoota Sthalam': {
    blurb:
      'Five Shiva temples in Tamil Nadu, each associated with one of the five classical elements — earth, water, fire, air, and space.',
    expectedCount: 5,
  },
  'Char Dham': {
    blurb:
      'The four sites — Badrinath, Dwarka, Puri, and Rameswaram — that together form the classic pan-India pilgrimage circuit said to have been designated by Adi Shankaracharya.',
    expectedCount: 4,
  },
  'Sapta Puri': {
    blurb:
      'Seven cities held to grant moksha (liberation): Ayodhya, Mathura, Haridwar, Kashi (Varanasi), Kanchipuram, Ujjain, and Dwarka.',
    expectedCount: 7,
  },
  'Char Peetham': {
    blurb:
      'The four monastic seats (mathas) founded by Adi Shankaracharya in the four corners of India — Sringeri, Dwarka, Puri, and Jyotirmath (Badrinath/Joshimath).',
    expectedCount: 4,
  },
  Ashtavinayak: {
    blurb:
      'Eight ancient Ganesha temples in Maharashtra, traditionally visited in a fixed sequence over a single pilgrimage.',
    expectedCount: 8,
  },
  Arupadaiveedu: {
    blurb: 'The six sacred abodes of Murugan (Kartikeya) in Tamil Nadu.',
    expectedCount: 6,
  },
  'Panch Kedar': {
    blurb:
      'Five Shiva temples in the Garhwal Himalaya — Kedarnath, Tungnath, Rudranath, Madhyamaheshwar, and Kalpeshwar — tied to the legend of the Pandavas seeking Shiva\'s forgiveness after the Kurukshetra war.',
    expectedCount: 5,
  },
  'Panch Badri': {
    blurb:
      'Five Vishnu temples in the Garhwal Himalaya named for Badrinath (the principal shrine) — Vishal Badri, Yogadhyan Badri, Bhavishya Badri, Vridha Badri, and Adi Badri.',
    expectedCount: 5,
  },
  'Panch Prayag': {
    blurb:
      'The five sacred confluences where tributaries join the Alaknanda river in Garhwal — Vishnuprayag, Nandaprayag, Karnaprayag, Rudraprayag, and Devprayag, the last giving rise to the Ganga itself.',
    expectedCount: 5,
  },
  'Pancharama Kshetra': {
    blurb:
      'Five Shiva temples on the Godavari delta in Andhra Pradesh, tradition holding that Shiva\'s linga shattered into five pieces during the slaying of the demon Tarakasura, each piece consecrated at one of these sites.',
    expectedCount: 5,
  },
  'Pancharanga Kshetram': {
    blurb:
      'Five temples to Ranganatha (a form of Vishnu) strung along the Kaveri river from Karnataka to Tamil Nadu.',
    expectedCount: 5,
  },
  'Navagraha Sthalam': {
    blurb:
      'Nine temples around Kumbakonam and the Cauvery delta in Tamil Nadu, each housing a shrine to one of the nine planetary deities (Navagraha) alongside its presiding Shiva.',
    expectedCount: 9,
  },
  'Nava Tirupati': {
    blurb:
      'Nine Vishnu shrines strung along the Thamirabarani river in Tamil Nadu, each a Divya Desam glorified by the Alvar poet-saints.',
    expectedCount: 9,
  },
  'Trilinga Kshetra': {
    blurb:
      'Three ancient Shiva temples — Srisailam, Draksharamam, and Kaleshwaram — traditionally said to mark the historical boundaries of the Telugu-speaking land ("Trilinga Desham").',
    expectedCount: 3,
  },
  'Nava Kailasam': {
    blurb:
      'Nine Shiva temples strung along the Thamirabarani river in Tirunelveli and Thoothukudi, Tamil Nadu — tradition holds a disciple of Agastya installed a linga wherever each of nine flowers he floated downriver came to rest.',
    expectedCount: 9,
  },
  'Nava Narasimha': {
    blurb:
      'Nine distinct shrines to Narasimha, Vishnu\'s man-lion avatara, scattered across the forested hills of Ahobilam, Andhra Pradesh — the site where he is held to have slain the demon king Hiranyakashipu.',
    expectedCount: 9,
  },
  'Chota Char Dham': {
    blurb:
      'The Uttarakhand Himalayan pilgrimage circuit of Yamunotri, Gangotri, Kedarnath, and Badrinath — the "small four abodes," distinct from the pan-India Char Dham.',
    expectedCount: 4,
  },
  'Saptha Sthana Mylapore': {
    blurb:
      'Seven Shiva temples in and around Mylapore, Chennai, traditionally said to have been worshipped by the Saptarishis (seven sages) — six small neighbourhood shrines plus the much larger Kapaleeshwarar Temple.',
    expectedCount: 7,
  },
}

export const DEFAULT_CIRCUIT_BLURB =
  'A group of temples traditionally visited together as part of a single named pilgrimage circuit.'
