import type { FoodTierLevel, FriendlinessLevel } from '../types/database'

// Human-readable labels for raw enum values. Keeping these centralized means
// the UI never shows a raw db value like "brahmin_run_kitchen" to a user.

export const FRIENDLINESS_LABELS: Record<FriendlinessLevel, string> = {
  yes: 'Yes',
  no: 'No',
  partial: 'Partially',
  unknown: 'Not yet known',
}

export const FRIENDLINESS_BADGE_LABELS: Record<
  'sandhya' | 'samidhadhanam',
  Record<FriendlinessLevel, string>
> = {
  sandhya: {
    yes: 'Sandhya-friendly',
    no: 'Not Sandhya-friendly',
    partial: 'Partially Sandhya-friendly',
    unknown: 'Sandhya-friendliness unknown',
  },
  samidhadhanam: {
    yes: 'Samidhadhanam-friendly',
    no: 'Not Samidhadhanam-friendly',
    partial: 'Partially Samidhadhanam-friendly',
    unknown: 'Samidhadhanam-friendliness unknown',
  },
}

export const FOOD_TIER_LABELS: Record<FoodTierLevel, string> = {
  brahmin_run_kitchen: 'Brahmin-run kitchen available',
  pure_veg_available: 'Pure vegetarian option nearby',
  no_veg_confirmed_nearby: 'No veg option confirmed yet',
  unknown: 'Food availability unknown',
}

export const FOOD_TIER_SHORT_LABELS: Record<FoodTierLevel, string> = {
  brahmin_run_kitchen: 'Brahmin kitchen',
  pure_veg_available: 'Pure veg nearby',
  no_veg_confirmed_nearby: 'No veg confirmed',
  unknown: 'Food unknown',
}

export const FOOD_TIER_HELP: Record<FoodTierLevel, string> = {
  brahmin_run_kitchen:
    'The temple itself, or a nearby establishment you have personally verified, is run/cooked by Brahmins.',
  pure_veg_available:
    'No Brahmin-run kitchen is known, but there is a confirmed pure-vegetarian (no onion/garlic ideally) option nearby.',
  no_veg_confirmed_nearby:
    'You looked, but could not confirm any suitable veg option yet. Still worth flagging rather than leaving blank.',
  unknown: 'You have no information about food options at this location.',
}

// Well-known pilgrimage groupings a temple can be tagged with. Free-form in
// the database (text[]), but the UI offers this curated list so filtering
// and badges stay consistent — contributors can still add other tags
// directly if they know the exact spelling used elsewhere in the circuit.
export const SIGNIFICANCE_TAGS = [
  'Jyotirlinga',
  'Shakti Peetha',
  'Pancha Bhoota Sthalam',
  'Char Dham',
  'Sapta Puri',
  'Char Peetham',
  'Ashtavinayak',
  'Arupadaiveedu',
  'Panch Kedar',
  'Panch Badri',
  'Panch Prayag',
  'Pancharama Kshetra',
  'Pancharanga Kshetram',
  'Navagraha Sthalam',
  'Nava Tirupati',
  'Trilinga Kshetra',
  'Nava Kailasam',
  'Nava Narasimha',
  'Chota Char Dham',
  'Saptha Sthana Mylapore',
] as const

export const SANDHYA_HELP =
  'Is there a clean water source (river, tank, tap) and a reasonably quiet space where someone could perform Sandhya Vandanam at this location?'

export const SAMIDHADHANAM_HELP =
  'Is there space and, ideally, firewood/samidha access for performing Samidhadhanam (Aupasana) at or near this location?'

export const MONTH_NAMES = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
] as const
