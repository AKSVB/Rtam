import { useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useSubmitTemple, useUpdateTemple, useUploadTemplePhoto } from '../hooks/useSubmitTemple'
import { useTemple } from '../hooks/useTempleDetail'
import { Button } from '../components/common/Button'
import { FormField, Select, TextArea, TextInput } from '../components/common/FormField'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { LocationPicker } from '../components/temple/LocationPicker'
import { strings } from '../constants/strings'
import {
  FOOD_TIER_HELP,
  FOOD_TIER_LABELS,
  FRIENDLINESS_LABELS,
  SAMIDHADHANAM_HELP,
  SANDHYA_HELP,
  SIGNIFICANCE_TAGS,
} from '../constants/enumLabels'
import type { FoodTierLevel, FriendlinessLevel, NewTempleInput, Temple } from '../types/database'

const STEPS = ['basics', 'rituals', 'food', 'photos', 'review'] as const
type Step = (typeof STEPS)[number]

interface FormState {
  name: string
  deity: string
  sampradaya: string
  significance: string[]
  country: string
  state: string
  district: string
  town: string
  latitude: string
  longitude: string
  sandhya_friendly: FriendlinessLevel
  sandhya_notes: string
  samidhadhanam_friendly: FriendlinessLevel
  samidhadhanam_notes: string
  food_tier: FoodTierLevel
  food_source_name: string
  food_source_contact: string
  food_distance_km: string
  nearest_river_name: string
  river_distance_km: string
  best_season_notes: string
  sthala_purana: string
}

const initialState: FormState = {
  name: '',
  deity: '',
  sampradaya: '',
  significance: [],
  country: 'India',
  state: '',
  district: '',
  town: '',
  latitude: '',
  longitude: '',
  sandhya_friendly: 'unknown',
  sandhya_notes: '',
  samidhadhanam_friendly: 'unknown',
  samidhadhanam_notes: '',
  food_tier: 'unknown',
  food_source_name: '',
  food_source_contact: '',
  food_distance_km: '',
  nearest_river_name: '',
  river_distance_km: '',
  best_season_notes: '',
  sthala_purana: '',
}

function toNullableNumber(value: string): number | null {
  if (value.trim() === '') return null
  const n = Number(value)
  return Number.isFinite(n) ? n : null
}

function formStateFromTemple(t: Temple): FormState {
  return {
    name: t.name,
    deity: t.deity,
    sampradaya: t.sampradaya ?? '',
    significance: t.significance,
    country: t.country,
    state: t.state,
    district: t.district,
    town: t.town,
    latitude: String(t.latitude),
    longitude: String(t.longitude),
    sandhya_friendly: t.sandhya_friendly,
    sandhya_notes: t.sandhya_notes ?? '',
    samidhadhanam_friendly: t.samidhadhanam_friendly,
    samidhadhanam_notes: t.samidhadhanam_notes ?? '',
    food_tier: t.food_tier,
    food_source_name: t.food_source_name ?? '',
    food_source_contact: t.food_source_contact ?? '',
    food_distance_km: t.food_distance_km != null ? String(t.food_distance_km) : '',
    nearest_river_name: t.nearest_river_name ?? '',
    river_distance_km: t.river_distance_km != null ? String(t.river_distance_km) : '',
    best_season_notes: t.best_season_notes ?? '',
    sthala_purana: t.sthala_purana ?? '',
  }
}

export function AddTemplePage() {
  const { id } = useParams<{ id?: string }>()
  const isEditing = !!id
  const { user } = useAuth()
  const navigate = useNavigate()
  const submitTemple = useSubmitTemple()
  const updateTemple = useUpdateTemple()
  const uploadPhoto = useUploadTemplePhoto()
  const { data: existingTemple, isLoading: loadingExisting } = useTemple(id)

  const [stepIndex, setStepIndex] = useState(0)
  const [form, setForm] = useState<FormState>(initialState)
  const [loadedExistingInto, setLoadedExistingInto] = useState<string | null>(null)
  const [photoFiles, setPhotoFiles] = useState<File[]>([])
  const [submitting, setSubmitting] = useState(false)
  const [submitted, setSubmitted] = useState(false)
  const [submitError, setSubmitError] = useState<string | null>(null)

  // Populate the form once the existing temple has loaded, but only once —
  // otherwise every refetch (e.g. after the photo upload invalidates the
  // 'temple' query) would stomp on whatever the user has since typed. Done
  // during render (React's documented pattern for adjusting state when a
  // fetched value changes) rather than in an effect, which would cause an
  // extra render after the data arrives.
  if (existingTemple && loadedExistingInto !== existingTemple.id) {
    setLoadedExistingInto(existingTemple.id)
    setForm(formStateFromTemple(existingTemple))
  }

  const step: Step = STEPS[stepIndex]

  const update = <K extends keyof FormState>(key: K, value: FormState[K]) =>
    setForm((prev) => ({ ...prev, [key]: value }))

  const basicsValid =
    form.name.trim() &&
    form.deity.trim() &&
    form.country.trim() &&
    form.state.trim() &&
    form.district.trim() &&
    form.town.trim() &&
    form.latitude.trim() &&
    form.longitude.trim() &&
    !Number.isNaN(Number(form.latitude)) &&
    !Number.isNaN(Number(form.longitude))

  // The food_fields_require_known_tier DB constraint rejects
  // brahmin_run_kitchen/pure_veg_available unless at least a source name or
  // a distance is given — check it client-side so the failure is a helpful
  // inline message instead of a raw Postgres error at final submit.
  const foodValid =
    form.food_tier === 'unknown' ||
    form.food_tier === 'no_veg_confirmed_nearby' ||
    form.food_source_name.trim() !== '' ||
    form.food_distance_km.trim() !== ''

  const goNext = () => setStepIndex((i) => Math.min(i + 1, STEPS.length - 1))
  const goBack = () => setStepIndex((i) => Math.max(i - 1, 0))

  const handleFinalSubmit = async () => {
    if (!user) return
    setSubmitting(true)
    setSubmitError(null)
    try {
      const templeInput: NewTempleInput = {
        name: form.name.trim(),
        deity: form.deity.trim(),
        sampradaya: form.sampradaya.trim() || null,
        significance: form.significance,
        country: form.country.trim() || 'India',
        state: form.state.trim(),
        district: form.district.trim(),
        town: form.town.trim(),
        latitude: Number(form.latitude),
        longitude: Number(form.longitude),
        sandhya_friendly: form.sandhya_friendly,
        sandhya_notes: form.sandhya_notes.trim() || null,
        samidhadhanam_friendly: form.samidhadhanam_friendly,
        samidhadhanam_notes: form.samidhadhanam_notes.trim() || null,
        food_tier: form.food_tier,
        food_source_name: form.food_source_name.trim() || null,
        food_source_contact: form.food_source_contact.trim() || null,
        food_distance_km: toNullableNumber(form.food_distance_km),
        nearest_river_name: form.nearest_river_name.trim() || null,
        river_distance_km: toNullableNumber(form.river_distance_km),
        best_season_notes: form.best_season_notes.trim() || null,
        sthala_purana: form.sthala_purana.trim() || null,
      }

      const templeId = isEditing
        ? (await updateTemple.mutateAsync({ id: id!, temple: templeInput })).id
        : (await submitTemple.mutateAsync({ temple: templeInput, userId: user.id })).id

      for (const file of photoFiles) {
        await uploadPhoto.mutateAsync({ templeId, file, userId: user.id })
      }

      setSubmitted(true)
    } catch (err) {
      setSubmitError(err instanceof Error ? err.message : 'Something went wrong. Please try again.')
    } finally {
      setSubmitting(false)
    }
  }

  if (isEditing && loadingExisting) {
    return <LoadingSpinner label="Loading your submission…" />
  }

  if (isEditing && !existingTemple) {
    return (
      <div className="mx-auto max-w-lg rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">Can't edit this submission</h1>
        <p className="mt-2 text-charcoal-700/80">
          Either it doesn't exist, or it isn't yours to edit — you can only edit your own
          submissions while they're pending or awaiting changes.
        </p>
        <Button className="mt-6" onClick={() => navigate('/profile')}>
          Back to my profile
        </Button>
      </div>
    )
  }

  if (isEditing && existingTemple && existingTemple.status === 'approved') {
    return (
      <div className="mx-auto max-w-lg rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">Already live</h1>
        <p className="mt-2 text-charcoal-700/80">
          This temple has already been approved and published, so it can no longer be edited here.
        </p>
        <Button className="mt-6" onClick={() => navigate(`/temples/${existingTemple.id}`)}>
          View the temple page
        </Button>
      </div>
    )
  }

  if (submitted) {
    return (
      <div className="mx-auto max-w-lg rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">{strings.form.submitSuccessTitle}</h1>
        <p className="mt-2 text-charcoal-700/80">{strings.form.submitSuccessBody}</p>
        <Button className="mt-6" onClick={() => navigate('/')}>
          Back to search
        </Button>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-2xl">
      <h1 className="text-2xl font-bold text-charcoal-900">
        {isEditing ? 'Edit Temple Submission' : strings.nav.addTemple}
      </h1>

      <ol className="mt-4 flex flex-wrap gap-2 text-xs font-semibold">
        {STEPS.map((s, i) => (
          <li
            key={s}
            className={`rounded-full px-3 py-1 ${
              i === stepIndex
                ? 'bg-maroon-700 text-cream-50'
                : i < stepIndex
                  ? 'bg-cream-200 text-maroon-800'
                  : 'bg-stone-100 text-stone-400'
            }`}
          >
            {i + 1}. {strings.form.steps[s]}
          </li>
        ))}
      </ol>

      <div className="mt-6 flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
        {step === 'basics' && (
          <>
            <FormField label="Temple name" htmlFor="name" required>
              <TextInput id="name" value={form.name} onChange={(e) => update('name', e.target.value)} />
            </FormField>
            <FormField label="Presiding deity" htmlFor="deity" required>
              <TextInput id="deity" value={form.deity} onChange={(e) => update('deity', e.target.value)} />
            </FormField>
            <FormField
              label="Sampradaya"
              htmlFor="sampradaya"
              helpText="e.g. Smartha, Vaishnava, Madhwa, or leave blank if unknown"
            >
              <TextInput
                id="sampradaya"
                value={form.sampradaya}
                onChange={(e) => update('sampradaya', e.target.value)}
              />
            </FormField>
            <FormField
              label="Part of a well-known pilgrimage circuit?"
              htmlFor="significance"
              helpText="Optional — check any that apply"
            >
              <div id="significance" className="flex flex-wrap gap-3">
                {SIGNIFICANCE_TAGS.map((tag) => (
                  <label key={tag} className="flex min-h-9 items-center gap-2 text-sm text-charcoal-900">
                    <input
                      type="checkbox"
                      checked={form.significance.includes(tag)}
                      onChange={(e) =>
                        update(
                          'significance',
                          e.target.checked
                            ? [...form.significance, tag]
                            : form.significance.filter((t) => t !== tag),
                        )
                      }
                      className="h-5 w-5 rounded border-stone-300"
                    />
                    {tag}
                  </label>
                ))}
              </div>
            </FormField>
            <div className="grid grid-cols-1 gap-4 sm:grid-cols-4">
              <FormField label="Country" htmlFor="country" required>
                <TextInput id="country" value={form.country} onChange={(e) => update('country', e.target.value)} />
              </FormField>
              <FormField label="State" htmlFor="state" required>
                <TextInput id="state" value={form.state} onChange={(e) => update('state', e.target.value)} />
              </FormField>
              <FormField label="District" htmlFor="district" required>
                <TextInput
                  id="district"
                  value={form.district}
                  onChange={(e) => update('district', e.target.value)}
                />
              </FormField>
              <FormField label="Town / Village" htmlFor="town" required>
                <TextInput id="town" value={form.town} onChange={(e) => update('town', e.target.value)} />
              </FormField>
            </div>
            <FormField
              label="Where is it on the map?"
              htmlFor="location-picker"
              required
              helpText="You don't need coordinates — search for the place, use your current location, or just tap the map."
            >
              <div id="location-picker">
                <LocationPicker
                  latitude={form.latitude}
                  longitude={form.longitude}
                  onChange={(lat, lng) =>
                    setForm((prev) => ({ ...prev, latitude: lat, longitude: lng }))
                  }
                />
              </div>
            </FormField>
          </>
        )}

        {step === 'rituals' && (
          <>
            <FormField label="Sandhya-friendly?" htmlFor="sandhya_friendly" helpText={SANDHYA_HELP}>
              <Select
                id="sandhya_friendly"
                value={form.sandhya_friendly}
                onChange={(e) => update('sandhya_friendly', e.target.value as FriendlinessLevel)}
              >
                {(['yes', 'partial', 'no', 'unknown'] as FriendlinessLevel[]).map((v) => (
                  <option key={v} value={v}>
                    {FRIENDLINESS_LABELS[v]}
                  </option>
                ))}
              </Select>
            </FormField>
            <FormField label="Sandhya Vandanam notes" htmlFor="sandhya_notes">
              <TextArea
                id="sandhya_notes"
                value={form.sandhya_notes}
                onChange={(e) => update('sandhya_notes', e.target.value)}
                placeholder="Water access, quiet space, time windows…"
              />
            </FormField>
            <FormField
              label="Samidhadhanam-friendly?"
              htmlFor="samidhadhanam_friendly"
              helpText={SAMIDHADHANAM_HELP}
            >
              <Select
                id="samidhadhanam_friendly"
                value={form.samidhadhanam_friendly}
                onChange={(e) => update('samidhadhanam_friendly', e.target.value as FriendlinessLevel)}
              >
                {(['yes', 'partial', 'no', 'unknown'] as FriendlinessLevel[]).map((v) => (
                  <option key={v} value={v}>
                    {FRIENDLINESS_LABELS[v]}
                  </option>
                ))}
              </Select>
            </FormField>
            <FormField label="Samidhadhanam notes" htmlFor="samidhadhanam_notes">
              <TextArea
                id="samidhadhanam_notes"
                value={form.samidhadhanam_notes}
                onChange={(e) => update('samidhadhanam_notes', e.target.value)}
              />
            </FormField>
          </>
        )}

        {step === 'food' && (
          <>
            <FormField
              label="Food availability"
              htmlFor="food_tier"
              helpText={FOOD_TIER_HELP[form.food_tier]}
            >
              <Select
                id="food_tier"
                value={form.food_tier}
                onChange={(e) => update('food_tier', e.target.value as FoodTierLevel)}
              >
                {(
                  ['brahmin_run_kitchen', 'pure_veg_available', 'no_veg_confirmed_nearby', 'unknown'] as FoodTierLevel[]
                ).map((v) => (
                  <option key={v} value={v}>
                    {FOOD_TIER_LABELS[v]}
                  </option>
                ))}
              </Select>
            </FormField>

            {form.food_tier !== 'unknown' && form.food_tier !== 'no_veg_confirmed_nearby' && (
              <>
                <FormField
                  label="Food source name"
                  htmlFor="food_source_name"
                  error={!foodValid ? 'Give either a source name or a distance below.' : undefined}
                >
                  <TextInput
                    id="food_source_name"
                    value={form.food_source_name}
                    onChange={(e) => update('food_source_name', e.target.value)}
                  />
                </FormField>
                <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
                  <FormField label="Contact" htmlFor="food_source_contact">
                    <TextInput
                      id="food_source_contact"
                      value={form.food_source_contact}
                      onChange={(e) => update('food_source_contact', e.target.value)}
                    />
                  </FormField>
                  <FormField label="Distance (km)" htmlFor="food_distance_km">
                    <TextInput
                      id="food_distance_km"
                      type="number"
                      step="any"
                      value={form.food_distance_km}
                      onChange={(e) => update('food_distance_km', e.target.value)}
                    />
                  </FormField>
                </div>
              </>
            )}

            <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
              <FormField label="Nearest river" htmlFor="nearest_river_name">
                <TextInput
                  id="nearest_river_name"
                  value={form.nearest_river_name}
                  onChange={(e) => update('nearest_river_name', e.target.value)}
                />
              </FormField>
              <FormField label="Distance to river (km)" htmlFor="river_distance_km">
                <TextInput
                  id="river_distance_km"
                  type="number"
                  step="any"
                  value={form.river_distance_km}
                  onChange={(e) => update('river_distance_km', e.target.value)}
                />
              </FormField>
            </div>

            <FormField label="Best season to visit" htmlFor="best_season_notes">
              <TextArea
                id="best_season_notes"
                value={form.best_season_notes}
                onChange={(e) => update('best_season_notes', e.target.value)}
              />
            </FormField>

            <FormField
              label="Sthala Puranam"
              htmlFor="sthala_purana"
              helpText="The temple's traditional origin story, if you know it. Write it as tradition tells it — local and family accounts are welcome."
            >
              <TextArea
                id="sthala_purana"
                rows={6}
                value={form.sthala_purana}
                onChange={(e) => update('sthala_purana', e.target.value)}
                placeholder="Tradition holds that…"
              />
            </FormField>
          </>
        )}

        {step === 'photos' && (
          <FormField label="Photos" htmlFor="photos" helpText="Optional — you can add more later">
            <input
              id="photos"
              type="file"
              accept="image/*"
              multiple
              onChange={(e) => setPhotoFiles(Array.from(e.target.files ?? []))}
              className="min-h-11 w-full rounded-lg border border-stone-300 bg-white px-3 py-2"
            />
            {photoFiles.length > 0 && (
              <p className="text-xs text-charcoal-700/70">{photoFiles.length} photo(s) selected</p>
            )}
          </FormField>
        )}

        {step === 'review' && (
          <div className="flex flex-col gap-2 text-sm text-charcoal-900">
            <p className="font-bold">{form.name || '(no name)'}</p>
            <p>
              {form.deity} · {form.town}, {form.district}, {form.state}, {form.country}
            </p>
            {form.significance.length > 0 && <p>Circuit: {form.significance.join(', ')}</p>}
            <p>Sandhya-friendly: {FRIENDLINESS_LABELS[form.sandhya_friendly]}</p>
            <p>Samidhadhanam-friendly: {FRIENDLINESS_LABELS[form.samidhadhanam_friendly]}</p>
            <p>Food: {FOOD_TIER_LABELS[form.food_tier]}</p>
            <p>{photoFiles.length} photo(s) to upload</p>
            {submitError && <p className="text-maroon-700">{submitError}</p>}
          </div>
        )}

        <div className="mt-2 flex justify-between">
          <Button variant="ghost" type="button" onClick={goBack} disabled={stepIndex === 0}>
            Back
          </Button>
          {step === 'review' ? (
            <Button type="button" onClick={handleFinalSubmit} disabled={submitting}>
              {submitting
                ? strings.form.savingDraft
                : isEditing
                  ? 'Save & Resubmit'
                  : strings.form.submitTemple}
            </Button>
          ) : (
            <Button
              type="button"
              onClick={goNext}
              disabled={(step === 'basics' && !basicsValid) || (step === 'food' && !foodValid)}
            >
              Next
            </Button>
          )}
        </div>
      </div>
    </div>
  )
}
