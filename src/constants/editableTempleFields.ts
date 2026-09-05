import type { Temple } from '../types/database'

// The fields a contributor may propose a change to on an already-approved
// temple, via a temple_edit_suggestions row. Deliberately excludes
// location (country/state/district/town/latitude/longitude), significance
// tags, and moderation/system columns — those either need the dedicated
// LocationPicker UI or carry enough structural risk that they stay behind
// the original-submitter-or-moderator path instead of open self-service.
//
// This list doubles as the allowlist used when a moderator applies an
// accepted suggestion (src/hooks/useEditSuggestions.ts) — only keys that
// appear here are ever spread into a `temples` update, regardless of what
// a `changes` jsonb blob actually contains.

export type EditableTempleField =
  | 'name'
  | 'native_name'
  | 'deity'
  | 'sampradaya'
  | 'sandhya_friendly'
  | 'sandhya_notes'
  | 'samidhadhanam_friendly'
  | 'samidhadhanam_notes'
  | 'food_tier'
  | 'food_source_name'
  | 'food_source_contact'
  | 'food_distance_km'
  | 'nearest_river_name'
  | 'river_distance_km'
  | 'best_season_notes'
  | 'morning_opens_at'
  | 'morning_closes_at'
  | 'evening_opens_at'
  | 'evening_closes_at'
  | 'timings_notes'
  | 'accessibility_notes'
  | 'nearest_airport_name'
  | 'nearest_airport_distance_km'
  | 'nearest_railway_station_name'
  | 'nearest_railway_distance_km'
  | 'emergency_contact_notes'
  | 'etiquette_notes'
  | 'architecture_style'
  | 'construction_century'
  | 'sthala_purana_source'
  | 'sthala_purana'

type FieldKind = 'text' | 'textarea' | 'number' | 'time' | 'sandhya' | 'samidhadhanam' | 'foodTier'

export interface EditableFieldConfig {
  key: EditableTempleField
  label: string
  kind: FieldKind
  group: string
}

export const EDITABLE_TEMPLE_FIELDS: EditableFieldConfig[] = [
  { key: 'name', label: 'Temple name', kind: 'text', group: 'Basics' },
  { key: 'native_name', label: 'Native-script name', kind: 'text', group: 'Basics' },
  { key: 'deity', label: 'Deity', kind: 'text', group: 'Basics' },
  { key: 'sampradaya', label: 'Sampradaya', kind: 'text', group: 'Basics' },

  { key: 'sandhya_friendly', label: 'Sandhya-friendly', kind: 'sandhya', group: 'Rituals' },
  { key: 'sandhya_notes', label: 'Sandhya Vandanam notes', kind: 'textarea', group: 'Rituals' },
  { key: 'samidhadhanam_friendly', label: 'Samidhadhanam-friendly', kind: 'samidhadhanam', group: 'Rituals' },
  { key: 'samidhadhanam_notes', label: 'Samidhadhanam notes', kind: 'textarea', group: 'Rituals' },

  { key: 'food_tier', label: 'Food availability', kind: 'foodTier', group: 'Food & River' },
  { key: 'food_source_name', label: 'Food source name', kind: 'text', group: 'Food & River' },
  { key: 'food_source_contact', label: 'Food source contact', kind: 'text', group: 'Food & River' },
  { key: 'food_distance_km', label: 'Distance to food (km)', kind: 'number', group: 'Food & River' },
  { key: 'nearest_river_name', label: 'Nearest river', kind: 'text', group: 'Food & River' },
  { key: 'river_distance_km', label: 'Distance to river (km)', kind: 'number', group: 'Food & River' },
  { key: 'best_season_notes', label: 'Best season to visit', kind: 'textarea', group: 'Food & River' },

  { key: 'morning_opens_at', label: 'Morning opens at', kind: 'time', group: 'Timings' },
  { key: 'morning_closes_at', label: 'Morning closes at', kind: 'time', group: 'Timings' },
  { key: 'evening_opens_at', label: 'Evening opens at', kind: 'time', group: 'Timings' },
  { key: 'evening_closes_at', label: 'Evening closes at', kind: 'time', group: 'Timings' },
  { key: 'timings_notes', label: 'Timings notes', kind: 'textarea', group: 'Timings' },

  { key: 'accessibility_notes', label: 'Accessibility', kind: 'textarea', group: 'Practical Info' },
  { key: 'nearest_airport_name', label: 'Nearest airport', kind: 'text', group: 'Practical Info' },
  { key: 'nearest_airport_distance_km', label: 'Airport distance (km)', kind: 'number', group: 'Practical Info' },
  { key: 'nearest_railway_station_name', label: 'Nearest railway station', kind: 'text', group: 'Practical Info' },
  { key: 'nearest_railway_distance_km', label: 'Railway distance (km)', kind: 'number', group: 'Practical Info' },
  { key: 'emergency_contact_notes', label: 'Emergency contact', kind: 'textarea', group: 'Practical Info' },
  { key: 'etiquette_notes', label: 'Etiquette / before you go', kind: 'textarea', group: 'Practical Info' },

  { key: 'architecture_style', label: 'Architecture style', kind: 'text', group: 'History' },
  { key: 'construction_century', label: 'Construction century (CE)', kind: 'number', group: 'History' },
  { key: 'sthala_purana_source', label: 'Sthala Puranam source', kind: 'text', group: 'History' },
  { key: 'sthala_purana', label: 'Sthala Puranam', kind: 'textarea', group: 'History' },
]

export const EDITABLE_TEMPLE_FIELD_KEYS = new Set<string>(EDITABLE_TEMPLE_FIELDS.map((f) => f.key))

export const EDITABLE_TEMPLE_FIELD_GROUPS = Array.from(new Set(EDITABLE_TEMPLE_FIELDS.map((f) => f.group)))

/** Human-readable rendering of one field's value, for the moderator's diff view. */
export function formatFieldValue(key: EditableTempleField, value: Temple[EditableTempleField]): string {
  if (value === null || value === undefined || value === '') return '(empty)'
  if (key.endsWith('_at')) return String(value).slice(0, 5)
  return String(value)
}
