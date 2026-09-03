// Mirrors the Postgres schema in supabase/migrations/0001_schema.sql

export type FriendlinessLevel = 'yes' | 'no' | 'partial' | 'unknown'

export type FoodTierLevel =
  | 'brahmin_run_kitchen'
  | 'pure_veg_available'
  | 'no_veg_confirmed_nearby'
  | 'unknown'

export type SubmissionStatus = 'pending' | 'approved' | 'rejected'

export type UserRole = 'member' | 'moderator' | 'admin'

export interface UserProfile {
  id: string
  display_name: string
  home_city: string | null
  role: UserRole
  contribution_points: number
  created_at: string
  updated_at: string
}

export interface Temple {
  id: string
  name: string
  deity: string
  sampradaya: string | null
  significance: string[]
  country: string
  state: string
  district: string
  town: string
  latitude: number
  longitude: number

  sandhya_friendly: FriendlinessLevel
  sandhya_notes: string | null

  samidhadhanam_friendly: FriendlinessLevel
  samidhadhanam_notes: string | null

  food_tier: FoodTierLevel
  food_source_name: string | null
  food_source_contact: string | null
  food_distance_km: number | null

  nearest_river_name: string | null
  river_distance_km: number | null

  best_season_notes: string | null

  submitted_by: string | null
  status: SubmissionStatus
  verified_by: string | null
  moderator_note: string | null

  created_at: string
  updated_at: string
}

export interface TempleStay {
  id: string
  temple_id: string
  name: string
  contact: string | null
  address: string
  distance_to_temple_km: number | null
  distance_to_river_km: number | null
  pure_veg_kitchen: boolean
  puja_room_available: boolean
  price_range: string | null
  notes: string | null
  submitted_by: string | null
  status: SubmissionStatus
  created_at: string
  updated_at: string
}

export interface TemplePhoto {
  id: string
  temple_id: string
  url: string
  uploaded_by: string | null
  created_at: string
}

export interface TempleReview {
  id: string
  temple_id: string
  user_id: string
  rating: number
  comment: string | null
  created_at: string
  user_profiles?: Pick<UserProfile, 'display_name'>
}

export interface TripList {
  id: string
  user_id: string
  name: string
  temple_ids: string[]
  created_at: string
  updated_at: string
}

// Form-facing shape for creating a new temple submission
export type NewTempleInput = Omit<
  Temple,
  'id' | 'submitted_by' | 'status' | 'verified_by' | 'moderator_note' | 'created_at' | 'updated_at'
>

export type NewStayInput = Omit<
  TempleStay,
  'id' | 'submitted_by' | 'status' | 'created_at' | 'updated_at'
>
