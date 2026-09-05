import { useEffect, useState, type FormEvent } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useTemple } from '../hooks/useTempleDetail'
import { useSubmitEditSuggestion } from '../hooks/useEditSuggestions'
import { Button } from '../components/common/Button'
import { FormField, Select, TextArea, TextInput } from '../components/common/FormField'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import {
  EDITABLE_TEMPLE_FIELDS,
  EDITABLE_TEMPLE_FIELD_GROUPS,
  formatFieldValue,
  type EditableTempleField,
} from '../constants/editableTempleFields'
import { FOOD_TIER_LABELS, FRIENDLINESS_LABELS } from '../constants/enumLabels'
import type { FoodTierLevel, FriendlinessLevel, Temple } from '../types/database'

const NUMBER_FIELDS = new Set<EditableTempleField>([
  'food_distance_km',
  'river_distance_km',
  'nearest_airport_distance_km',
  'nearest_railway_distance_km',
  'construction_century',
])

const REQUIRED_TEXT_FIELDS = new Set<EditableTempleField>(['name', 'deity'])

function toTimeInputValue(value: string | null): string {
  return value ? value.slice(0, 5) : ''
}

function fieldToDraftString(temple: Temple, key: EditableTempleField): string {
  const value = temple[key]
  if (value === null || value === undefined) return ''
  if (key.endsWith('_at')) return toTimeInputValue(value as string)
  return String(value)
}

function draftStringToFieldValue(key: EditableTempleField, raw: string): Temple[EditableTempleField] {
  if (REQUIRED_TEXT_FIELDS.has(key)) return raw.trim() as Temple[EditableTempleField]
  if (NUMBER_FIELDS.has(key)) {
    return (raw.trim() === '' ? null : Number(raw)) as Temple[EditableTempleField]
  }
  return (raw.trim() === '' ? null : raw.trim()) as Temple[EditableTempleField]
}

function initialDraft(temple: Temple): Record<EditableTempleField, string> {
  const draft = {} as Record<EditableTempleField, string>
  for (const field of EDITABLE_TEMPLE_FIELDS) {
    draft[field.key] = fieldToDraftString(temple, field.key)
  }
  return draft
}

export function SuggestEditPage() {
  const { id } = useParams<{ id: string }>()
  const { user } = useAuth()
  const navigate = useNavigate()
  const { data: temple, isLoading } = useTemple(id)
  const submitSuggestion = useSubmitEditSuggestion()

  const [draft, setDraft] = useState<Record<EditableTempleField, string> | null>(null)
  const [note, setNote] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [submitted, setSubmitted] = useState(false)

  useEffect(() => {
    if (temple && !draft) setDraft(initialDraft(temple))
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [temple])

  if (isLoading) return <LoadingSpinner label="Loading temple…" />
  if (!temple) return <p className="text-charcoal-700">Temple not found.</p>
  if (!user) return <p className="text-charcoal-700">Log in to suggest an edit.</p>
  if (temple.status !== 'approved') {
    return (
      <div className="mx-auto max-w-lg rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">Not live yet</h1>
        <p className="mt-2 text-charcoal-700/80">
          This temple hasn't been approved yet, so it doesn't need a separate edit suggestion — its own
          submitter can still edit it directly.
        </p>
        <Button className="mt-6" onClick={() => navigate(`/temples/${temple.id}`)}>
          Back to {temple.name}
        </Button>
      </div>
    )
  }
  if (!draft) return <LoadingSpinner label="Preparing form…" />

  const current = draft

  const setField = (key: EditableTempleField, value: string) => {
    setDraft((prev) => (prev ? { ...prev, [key]: value } : prev))
  }

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    if (!draft) return
    setError(null)

    for (const key of REQUIRED_TEXT_FIELDS) {
      if (draft[key].trim() === '') {
        setError(`${EDITABLE_TEMPLE_FIELDS.find((f) => f.key === key)?.label} cannot be empty.`)
        return
      }
    }

    const changes: Partial<Temple> = {}
    for (const key of Object.keys(draft) as EditableTempleField[]) {
      const nextValue = draftStringToFieldValue(key, draft[key])
      if (nextValue !== temple[key]) {
        ;(changes as Record<string, unknown>)[key] = nextValue
      }
    }

    if (Object.keys(changes).length === 0) {
      setError("You haven't changed anything yet.")
      return
    }

    try {
      await submitSuggestion.mutateAsync({ templeId: temple.id, userId: user.id, changes, note })
      setSubmitted(true)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Something went wrong. Please try again.')
    }
  }

  if (submitted) {
    return (
      <div className="mx-auto max-w-lg rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">Thank you!</h1>
        <p className="mt-2 text-charcoal-700/80">
          Your suggested changes to {temple.name} are awaiting moderator review. You'll see them reflected here
          once approved, and they'll count toward your contribution points.
        </p>
        <Button className="mt-6" onClick={() => navigate(`/temples/${temple.id}`)}>
          Back to {temple.name}
        </Button>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-2xl">
      <Link to={`/temples/${temple.id}`} className="text-sm font-semibold text-maroon-700 hover:underline">
        ← Back to {temple.name}
      </Link>
      <h1 className="mb-1 mt-2 text-2xl font-bold text-charcoal-900">Suggest an Edit</h1>
      <p className="mb-6 text-sm text-charcoal-700/70">
        Change only what you actually know to be different. Everything below shows the current value — a
        moderator reviews every change before it goes live.
      </p>

      <form onSubmit={handleSubmit} className="flex flex-col gap-8">
        {EDITABLE_TEMPLE_FIELD_GROUPS.map((group) => (
          <fieldset key={group} className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
            <legend className="px-1 text-sm font-bold uppercase tracking-wide text-maroon-800">{group}</legend>
            {EDITABLE_TEMPLE_FIELDS.filter((f) => f.group === group).map((field) => {
              const helpText = `Current: ${formatFieldValue(field.key, temple[field.key])}`
              const value = current[field.key]

              if (field.kind === 'sandhya' || field.kind === 'samidhadhanam') {
                return (
                  <FormField key={field.key} label={field.label} htmlFor={field.key} helpText={helpText}>
                    <Select
                      id={field.key}
                      value={value}
                      onChange={(e) => setField(field.key, e.target.value)}
                    >
                      {(['yes', 'partial', 'no', 'unknown'] as FriendlinessLevel[]).map((v) => (
                        <option key={v} value={v}>
                          {FRIENDLINESS_LABELS[v]}
                        </option>
                      ))}
                    </Select>
                  </FormField>
                )
              }

              if (field.kind === 'foodTier') {
                return (
                  <FormField key={field.key} label={field.label} htmlFor={field.key} helpText={helpText}>
                    <Select
                      id={field.key}
                      value={value}
                      onChange={(e) => setField(field.key, e.target.value)}
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
                )
              }

              if (field.kind === 'textarea') {
                return (
                  <FormField key={field.key} label={field.label} htmlFor={field.key} helpText={helpText}>
                    <TextArea id={field.key} value={value} onChange={(e) => setField(field.key, e.target.value)} />
                  </FormField>
                )
              }

              return (
                <FormField key={field.key} label={field.label} htmlFor={field.key} helpText={helpText}>
                  <TextInput
                    id={field.key}
                    type={field.kind === 'time' ? 'time' : field.kind === 'number' ? 'number' : 'text'}
                    step={field.kind === 'number' ? 'any' : undefined}
                    value={value}
                    onChange={(e) => setField(field.key, e.target.value)}
                  />
                </FormField>
              )
            })}
          </fieldset>
        ))}

        <FormField
          label="Why are you suggesting this change?"
          htmlFor="suggestion-note"
          helpText="Optional, but a source or personal visit helps the moderator review it faster."
        >
          <TextArea id="suggestion-note" value={note} onChange={(e) => setNote(e.target.value)} />
        </FormField>

        {error && <p className="text-sm text-maroon-700">{error}</p>}
        <Button type="submit" disabled={submitSuggestion.isPending} className="self-start">
          {submitSuggestion.isPending ? 'Submitting…' : 'Submit Suggested Edit'}
        </Button>
      </form>
    </div>
  )
}
