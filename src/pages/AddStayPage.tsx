import { useState, type FormEvent } from 'react'
import { Link, useNavigate, useParams } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { useSubmitStay } from '../hooks/useSubmitTemple'
import { useTemple } from '../hooks/useTempleDetail'
import { Button } from '../components/common/Button'
import { FormField, TextArea, TextInput } from '../components/common/FormField'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import type { NewStayInput } from '../types/database'

export function AddStayPage() {
  const { id } = useParams<{ id: string }>()
  const { user } = useAuth()
  const navigate = useNavigate()
  const { data: temple, isLoading: loadingTemple } = useTemple(id)
  const submitStay = useSubmitStay()

  const [name, setName] = useState('')
  const [contact, setContact] = useState('')
  const [address, setAddress] = useState('')
  const [distanceToTemple, setDistanceToTemple] = useState('')
  const [distanceToRiver, setDistanceToRiver] = useState('')
  const [pureVegKitchen, setPureVegKitchen] = useState(false)
  const [pujaRoom, setPujaRoom] = useState(false)
  const [priceRange, setPriceRange] = useState('')
  const [notes, setNotes] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [submitted, setSubmitted] = useState(false)

  if (loadingTemple) return <LoadingSpinner label="Loading temple…" />
  if (!temple) return <p className="text-charcoal-700">Temple not found.</p>
  if (!user) return <p className="text-charcoal-700">Log in to add a stay.</p>

  const valid = name.trim() && address.trim()

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    if (!valid) return
    setError(null)
    const toNumber = (s: string) => (s.trim() === '' ? null : Number(s))
    const stay: NewStayInput = {
      temple_id: temple.id,
      name: name.trim(),
      contact: contact.trim() || null,
      address: address.trim(),
      distance_to_temple_km: toNumber(distanceToTemple),
      distance_to_river_km: toNumber(distanceToRiver),
      pure_veg_kitchen: pureVegKitchen,
      puja_room_available: pujaRoom,
      price_range: priceRange.trim() || null,
      notes: notes.trim() || null,
    }
    try {
      await submitStay.mutateAsync({ stay, userId: user.id })
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
          Your stay listing for {temple.name} is awaiting moderator review, and will appear once
          approved.
        </p>
        <Button className="mt-6" onClick={() => navigate(`/temples/${temple.id}`)}>
          Back to {temple.name}
        </Button>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-xl">
      <Link to={`/temples/${temple.id}`} className="text-sm font-semibold text-maroon-700 hover:underline">
        ← Back to {temple.name}
      </Link>
      <h1 className="mb-6 mt-2 text-2xl font-bold text-charcoal-900">Add a Nearby Stay</h1>

      <form onSubmit={handleSubmit} className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
        <FormField label="Name" htmlFor="stay-name" required>
          <TextInput id="stay-name" value={name} onChange={(e) => setName(e.target.value)} />
        </FormField>
        <FormField label="Address" htmlFor="stay-address" required>
          <TextArea id="stay-address" value={address} onChange={(e) => setAddress(e.target.value)} />
        </FormField>
        <FormField label="Contact" htmlFor="stay-contact">
          <TextInput id="stay-contact" value={contact} onChange={(e) => setContact(e.target.value)} />
        </FormField>
        <div className="grid grid-cols-1 gap-4 sm:grid-cols-2">
          <FormField label="Distance to temple (km)" htmlFor="stay-dist-temple">
            <TextInput
              id="stay-dist-temple"
              type="number"
              step="any"
              value={distanceToTemple}
              onChange={(e) => setDistanceToTemple(e.target.value)}
            />
          </FormField>
          <FormField label="Distance to river (km)" htmlFor="stay-dist-river">
            <TextInput
              id="stay-dist-river"
              type="number"
              step="any"
              value={distanceToRiver}
              onChange={(e) => setDistanceToRiver(e.target.value)}
            />
          </FormField>
        </div>
        <FormField label="Price range" htmlFor="stay-price" helpText='e.g. "₹800–1500/night"'>
          <TextInput id="stay-price" value={priceRange} onChange={(e) => setPriceRange(e.target.value)} />
        </FormField>
        <div className="flex flex-wrap gap-4">
          <label className="flex min-h-11 items-center gap-2 text-sm font-medium text-charcoal-900">
            <input
              type="checkbox"
              checked={pureVegKitchen}
              onChange={(e) => setPureVegKitchen(e.target.checked)}
              className="h-5 w-5 rounded border-stone-300"
            />
            Pure veg kitchen
          </label>
          <label className="flex min-h-11 items-center gap-2 text-sm font-medium text-charcoal-900">
            <input
              type="checkbox"
              checked={pujaRoom}
              onChange={(e) => setPujaRoom(e.target.checked)}
              className="h-5 w-5 rounded border-stone-300"
            />
            Puja room available
          </label>
        </div>
        <FormField label="Notes" htmlFor="stay-notes">
          <TextArea id="stay-notes" value={notes} onChange={(e) => setNotes(e.target.value)} />
        </FormField>
        {error && <p className="text-sm text-maroon-700">{error}</p>}
        <Button type="submit" disabled={!valid || submitStay.isPending} className="self-start">
          {submitStay.isPending ? 'Submitting…' : 'Submit Stay'}
        </Button>
      </form>
    </div>
  )
}
