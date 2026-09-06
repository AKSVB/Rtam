import { useEffect, useState, type FormEvent } from 'react'
import { Link, useNavigate, useSearchParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useTemple } from '../hooks/useTempleDetail'
import { useSubmitDharmicActivity } from '../hooks/useDharmicActivities'
import { Button } from '../components/common/Button'
import { FormField, TextArea, TextInput, Select } from '../components/common/FormField'
import { TemplePicker } from '../components/common/TemplePicker'
import { LocationPicker } from '../components/temple/LocationPicker'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import { strings } from '../constants/strings'
import { DHARMIC_ACTIVITY_TYPE_LABELS } from '../constants/enumLabels'
import type { DharmicActivityType, NewDharmicActivityInput, Temple } from '../types/database'

const ACTIVITY_TYPES = Object.keys(DHARMIC_ACTIVITY_TYPE_LABELS) as DharmicActivityType[]

export function AddDharmicActivityPage() {
  const { user } = useAuth()
  const navigate = useNavigate()
  const [params] = useSearchParams()
  const submitActivity = useSubmitDharmicActivity()

  const prefilledType = params.get('type')
  const prefilledTempleId = params.get('templeId') ?? undefined
  const { data: prefilledTemple, isLoading: loadingPrefilledTemple } = useTemple(prefilledTempleId)

  const [activityType, setActivityType] = useState<DharmicActivityType>(
    ACTIVITY_TYPES.includes(prefilledType as DharmicActivityType)
      ? (prefilledType as DharmicActivityType)
      : 'pravachanam',
  )
  const [temple, setTemple] = useState<Temple | null>(null)
  const [useCustomVenue, setUseCustomVenue] = useState(false)
  const [venueName, setVenueName] = useState('')
  const [venueState, setVenueState] = useState('')
  const [venueTown, setVenueTown] = useState('')
  const [latitude, setLatitude] = useState('')
  const [longitude, setLongitude] = useState('')
  const [title, setTitle] = useState('')
  const [titleTouched, setTitleTouched] = useState(false)
  const [speakerName, setSpeakerName] = useState('')
  const [date, setDate] = useState('')
  const [time, setTime] = useState('')
  const [description, setDescription] = useState('')
  const [sourceUrl, setSourceUrl] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [submitted, setSubmitted] = useState(false)

  // Prefill from ?templeId=… (e.g. the "Propose Samishti Sandhyavandanam
  // here" link on a temple's own page) once it loads.
  useEffect(() => {
    if (prefilledTemple && !temple) setTemple(prefilledTemple)
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [prefilledTemple])

  // A sensible default title once a temple is picked for a Samishti
  // proposal — contributors can still overwrite it.
  useEffect(() => {
    if (activityType === 'samishti_sandhyavandanam' && temple && !titleTouched) {
      setTitle(`Samishti Sandhyavandanam at ${temple.name}`)
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [activityType, temple])

  useEffect(() => {
    if (activityType === 'samishti_sandhyavandanam') setUseCustomVenue(false)
  }, [activityType])

  if (loadingPrefilledTemple) return <LoadingSpinner label="Loading…" />
  if (!user) return <p className="text-charcoal-700">Log in to post a dharmic activity.</p>

  const isSamishti = activityType === 'samishti_sandhyavandanam'
  const venueValid = isSamishti
    ? !!temple
    : useCustomVenue
      ? venueName.trim() && venueState.trim() && venueTown.trim() && latitude && longitude
      : !!temple
  const valid = title.trim() && date && venueValid

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    if (!valid) return
    setError(null)

    const venue =
      !isSamishti && useCustomVenue
        ? {
            temple_id: null,
            venue_name: venueName.trim(),
            state: venueState.trim(),
            town: venueTown.trim(),
            latitude: Number(latitude),
            longitude: Number(longitude),
          }
        : {
            temple_id: temple!.id,
            venue_name: null,
            state: temple!.state,
            town: temple!.town,
            latitude: temple!.latitude,
            longitude: temple!.longitude,
          }

    const activity: NewDharmicActivityInput = {
      activity_type: activityType,
      title: title.trim(),
      speaker_name: speakerName.trim() || null,
      activity_date: date,
      activity_time: time || null,
      description: description.trim() || null,
      source_url: sourceUrl.trim() || null,
      ...venue,
    }

    try {
      await submitActivity.mutateAsync({ activity, userId: user.id })
      setSubmitted(true)
    } catch (err) {
      setError(err instanceof Error ? err.message : 'Something went wrong. Please try again.')
    }
  }

  if (submitted) {
    return (
      <div className="mx-auto max-w-lg rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">Thank you!</h1>
        <p className="mt-2 text-charcoal-700/80">{strings.addActivity.submitSuccessBody}</p>
        <div className="mt-6 flex flex-wrap justify-center gap-3">
          <Button
            onClick={() =>
              navigate(isSamishti ? '/samishti-sandhyavandanam' : '/dharmic-feed')
            }
          >
            {isSamishti ? 'Back to Samishti Sandhyavandanam' : 'Back to the feed'}
          </Button>
        </div>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-xl">
      <Link
        to={isSamishti ? '/samishti-sandhyavandanam' : '/dharmic-feed'}
        className="text-sm font-semibold text-maroon-700 hover:underline"
      >
        ← Back
      </Link>
      <h1 className="mb-6 mt-2 text-2xl font-bold text-charcoal-900">
        {isSamishti ? strings.samishti.proposeTemple : strings.addActivity.title}
      </h1>

      <form onSubmit={handleSubmit} className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
        <FormField label={strings.addActivity.activityType} htmlFor="activity-type" required>
          <Select
            id="activity-type"
            value={activityType}
            onChange={(e) => setActivityType(e.target.value as DharmicActivityType)}
          >
            {ACTIVITY_TYPES.map((t) => (
              <option key={t} value={t}>
                {DHARMIC_ACTIVITY_TYPE_LABELS[t]}
              </option>
            ))}
          </Select>
        </FormField>

        <FormField label={strings.addActivity.activityTitle} htmlFor="activity-title" required>
          <TextInput
            id="activity-title"
            value={title}
            onChange={(e) => {
              setTitle(e.target.value)
              setTitleTouched(true)
            }}
            placeholder={strings.addActivity.activityTitlePlaceholder}
          />
        </FormField>

        {!isSamishti && (
          <FormField label={strings.addActivity.speakerName} htmlFor="activity-speaker">
            <TextInput id="activity-speaker" value={speakerName} onChange={(e) => setSpeakerName(e.target.value)} />
          </FormField>
        )}

        <FormField label={strings.addActivity.temple} htmlFor="activity-temple" required>
          {useCustomVenue ? (
            <div className="flex flex-col gap-3">
              <TextInput
                placeholder={strings.addActivity.venueName}
                value={venueName}
                onChange={(e) => setVenueName(e.target.value)}
              />
              <div className="grid grid-cols-1 gap-3 sm:grid-cols-2">
                <TextInput placeholder="State" value={venueState} onChange={(e) => setVenueState(e.target.value)} />
                <TextInput placeholder="Town" value={venueTown} onChange={(e) => setVenueTown(e.target.value)} />
              </div>
              <LocationPicker
                latitude={latitude}
                longitude={longitude}
                onChange={(lat, lng) => {
                  setLatitude(lat)
                  setLongitude(lng)
                }}
              />
            </div>
          ) : (
            <TemplePicker value={temple} onChange={setTemple} />
          )}
          {!isSamishti && (
            <label className="mt-2 flex items-center gap-2 text-sm text-charcoal-700">
              <input
                type="checkbox"
                checked={useCustomVenue}
                onChange={(e) => {
                  setUseCustomVenue(e.target.checked)
                  setTemple(null)
                }}
                className="h-4 w-4 rounded border-stone-300"
              />
              {strings.addActivity.useCustomVenue}
            </label>
          )}
        </FormField>

        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label={strings.addActivity.date} htmlFor="activity-date" required>
            <TextInput id="activity-date" type="date" value={date} onChange={(e) => setDate(e.target.value)} />
          </FormField>
          <FormField label={strings.addActivity.time} htmlFor="activity-time">
            <TextInput id="activity-time" type="time" value={time} onChange={(e) => setTime(e.target.value)} />
          </FormField>
        </div>

        <FormField label={strings.addActivity.description} htmlFor="activity-description">
          <TextArea id="activity-description" value={description} onChange={(e) => setDescription(e.target.value)} />
        </FormField>

        <FormField label={strings.addActivity.sourceUrl} htmlFor="activity-source">
          <TextInput
            id="activity-source"
            type="url"
            value={sourceUrl}
            onChange={(e) => setSourceUrl(e.target.value)}
            placeholder="https://…"
          />
        </FormField>

        {error && <p className="text-sm text-maroon-700">{error}</p>}
        <Button type="submit" disabled={!valid || submitActivity.isPending} className="self-start">
          {submitActivity.isPending ? 'Submitting…' : strings.addActivity.submit}
        </Button>
      </form>
    </div>
  )
}
