import { useEffect, useState } from 'react'
import { MapContainer, Marker, TileLayer, useMap, useMapEvents } from 'react-leaflet'
import L from 'leaflet'
import { TextInput } from '../common/FormField'
import { Button } from '../common/Button'
import '../../lib/leafletIcons'

const INDIA_CENTER: [number, number] = [22.5, 79.0]

interface Props {
  latitude: string
  longitude: string
  onChange: (lat: string, lng: string) => void
}

/** Drops/moves the pin wherever the user clicks. */
function ClickHandler({ onChange }: { onChange: Props['onChange'] }) {
  useMapEvents({
    click(e) {
      onChange(e.latlng.lat.toFixed(6), e.latlng.lng.toFixed(6))
    },
  })
  return null
}

/** Recenters the map when a search result or geolocation sets a new point. */
function Recenter({ position }: { position: [number, number] | null }) {
  const map = useMap()
  useEffect(() => {
    if (position) map.setView(position, 15)
  }, [map, position])
  return null
}

interface SearchResult {
  display_name: string
  lat: string
  lon: string
}

export function LocationPicker({ latitude, longitude, onChange }: Props) {
  const [query, setQuery] = useState('')
  const [results, setResults] = useState<SearchResult[]>([])
  const [searching, setSearching] = useState(false)
  const [searchError, setSearchError] = useState<string | null>(null)
  const [recenterTo, setRecenterTo] = useState<[number, number] | null>(null)

  const parsed =
    latitude && longitude && !Number.isNaN(Number(latitude)) && !Number.isNaN(Number(longitude))
      ? ([Number(latitude), Number(longitude)] as [number, number])
      : null

  // Nominatim (OpenStreetMap's own geocoder) — free, no API key, but it asks
  // for light usage, so this only fires on an explicit search press.
  const runSearch = async (e: React.FormEvent) => {
    e.preventDefault()
    if (!query.trim()) return
    setSearching(true)
    setSearchError(null)
    try {
      const url = `https://nominatim.openstreetmap.org/search?format=json&limit=5&q=${encodeURIComponent(query)}`
      const res = await fetch(url, { headers: { Accept: 'application/json' } })
      if (!res.ok) throw new Error('Search failed')
      const data: SearchResult[] = await res.json()
      setResults(data)
      if (data.length === 0) setSearchError('No matching place found. Try a nearby town, or just click the map.')
    } catch {
      setSearchError('Could not reach the search service. You can still click the map to place the pin.')
    } finally {
      setSearching(false)
    }
  }

  const choose = (r: SearchResult) => {
    const lat = Number(r.lat).toFixed(6)
    const lng = Number(r.lon).toFixed(6)
    onChange(lat, lng)
    setRecenterTo([Number(lat), Number(lng)])
    setResults([])
    setQuery(r.display_name.split(',').slice(0, 2).join(','))
  }

  const useMyLocation = () => {
    if (!navigator.geolocation) return
    navigator.geolocation.getCurrentPosition(
      (pos) => {
        const lat = pos.coords.latitude.toFixed(6)
        const lng = pos.coords.longitude.toFixed(6)
        onChange(lat, lng)
        setRecenterTo([Number(lat), Number(lng)])
      },
      () => setSearchError('Could not get your location. You can click the map instead.'),
    )
  }

  return (
    <div className="flex flex-col gap-3">
      <div className="flex flex-col gap-2 sm:flex-row">
        <TextInput
          placeholder="Search for the town or temple…"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          onKeyDown={(e) => {
            if (e.key === 'Enter') runSearch(e as unknown as React.FormEvent)
          }}
          aria-label="Search for a place"
        />
        <div className="flex gap-2">
          <Button type="button" variant="secondary" onClick={runSearch} disabled={searching}>
            {searching ? 'Searching…' : 'Search'}
          </Button>
          <Button type="button" variant="ghost" onClick={useMyLocation}>
            📍 I'm here
          </Button>
        </div>
      </div>

      {results.length > 0 && (
        <ul className="divide-y divide-cream-200 overflow-hidden rounded-lg border border-cream-200 bg-white">
          {results.map((r) => (
            <li key={`${r.lat},${r.lon}`}>
              <button
                type="button"
                onClick={() => choose(r)}
                className="w-full px-3 py-2 text-left text-sm text-charcoal-900 hover:bg-cream-100"
              >
                {r.display_name}
              </button>
            </li>
          ))}
        </ul>
      )}

      {searchError && <p className="text-xs text-maroon-700">{searchError}</p>}

      <div className="h-80 w-full overflow-hidden rounded-xl border border-cream-200">
        <MapContainer
          center={parsed ?? INDIA_CENTER}
          zoom={parsed ? 15 : 5}
          scrollWheelZoom
          className="h-full w-full"
        >
          <TileLayer
            attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
          />
          <ClickHandler onChange={onChange} />
          <Recenter position={recenterTo} />
          {parsed && (
            <Marker
              position={parsed}
              draggable
              eventHandlers={{
                dragend: (e) => {
                  const m = e.target as L.Marker
                  const { lat, lng } = m.getLatLng()
                  onChange(lat.toFixed(6), lng.toFixed(6))
                },
              }}
            />
          )}
        </MapContainer>
      </div>

      <p className="text-xs text-charcoal-700/70">
        {parsed
          ? `Pin placed at ${parsed[0].toFixed(5)}, ${parsed[1].toFixed(5)} — drag it to fine-tune.`
          : 'Search for the place above, tap "I\'m here", or click directly on the map to drop a pin.'}
      </p>
    </div>
  )
}
