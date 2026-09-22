import { useMemo, useState } from 'react'
import { Link } from 'react-router-dom'
import { useGeolocation } from '../hooks/useGeolocation'
import { useCompassHeading } from '../hooks/useCompassHeading'
import { useTemplesByTag, useTemplesNearLocation } from '../hooks/useTemples'
import { bearingDeg, cardinalDirection, haversineKm } from '../lib/geo'
import { CIRCUIT_INFO } from '../constants/circuitInfo'
import { Select } from '../components/common/FormField'
import { Button } from '../components/common/Button'
import { LoadingSpinner } from '../components/common/LoadingSpinner'
import type { Temple } from '../types/database'

const CIRCUIT_TAGS = Object.keys(CIRCUIT_INFO).sort()

function googleMapsDirectionsUrl(temple: Temple): string {
  return `https://www.google.com/maps/dir/?api=1&destination=${temple.latitude},${temple.longitude}`
}

/** The nearest temple carrying `tag`, computed client-side from coords — small enough lists (a handful to a couple dozen per circuit) that this beats adding a bespoke RPC. */
function useNearestInCircuit(tag: string | undefined, coords: { latitude: number; longitude: number } | null) {
  const { data: temples, isLoading } = useTemplesByTag(tag)
  const nearest = useMemo(() => {
    if (!coords || !temples || temples.length === 0) return null
    return temples
      .map((t) => ({ ...t, distanceKm: haversineKm([coords.latitude, coords.longitude], [t.latitude, t.longitude]) }))
      .sort((a, b) => a.distanceKm - b.distanceKm)[0]
  }, [coords, temples])
  return { nearest, isLoading }
}

/** A compass rose SVG — a static ring of ordinal labels plus a needle rotated to point at the target's bearing. */
function CompassRose({ rotation }: { rotation: number }) {
  return (
    <svg viewBox="0 0 200 200" className="mx-auto w-56 max-w-full" role="img" aria-label="Compass">
      <circle cx="100" cy="100" r="94" fill="none" stroke="currentColor" className="text-gold-400/50" strokeWidth="2" />
      <circle cx="100" cy="100" r="72" fill="none" stroke="currentColor" className="text-gold-400/25" strokeWidth="1" />
      {(['N', 'E', 'S', 'W'] as const).map((label, i) => {
        const angle = i * 90
        const rad = (angle * Math.PI) / 180
        const x = 100 + 82 * Math.sin(rad)
        const y = 100 - 82 * Math.cos(rad)
        return (
          <text
            key={label}
            x={x}
            y={y}
            textAnchor="middle"
            dominantBaseline="middle"
            className={label === 'N' ? 'fill-maroon-800 text-sm font-bold' : 'fill-charcoal-700/50 text-xs font-semibold'}
          >
            {label}
          </text>
        )
      })}
      <g style={{ transform: `rotate(${rotation}deg)`, transformOrigin: '100px 100px', transition: 'transform 0.3s ease-out' }}>
        <polygon points="100,26 112,100 100,86 88,100" className="fill-maroon-700" />
        <polygon points="100,174 112,100 100,114 88,100" className="fill-charcoal-700/30" />
      </g>
      <circle cx="100" cy="100" r="5" className="fill-gold-500" />
    </svg>
  )
}

/**
 * A literal spiritual compass: point yourself toward the nearest temple —
 * or the nearest stop on a named circuit like the Jyotirlingas — from
 * wherever you're standing. Entirely client-side: reuses the same lat/long
 * data and haversine math already powering "temples near me" and the trip
 * planner, plus the device's compass sensor where the browser exposes one.
 */
export function CompassPage() {
  const { coords, loading, error, request } = useGeolocation()
  const { heading, supported: headingSupported, needsPermission, enable } = useCompassHeading()
  const [target, setTarget] = useState<'nearest' | string>('nearest')

  const { data: nearestOverall, isLoading: nearestLoading } = useTemplesNearLocation(
    target === 'nearest' ? coords : null,
    1,
  )
  const { nearest: nearestInCircuit, isLoading: circuitLoading } = useNearestInCircuit(
    target === 'nearest' ? undefined : target,
    target === 'nearest' ? null : coords,
  )

  const result = target === 'nearest' ? nearestOverall?.[0] : nearestInCircuit
  const resultLoading = target === 'nearest' ? nearestLoading : circuitLoading

  const bearing = coords && result ? bearingDeg([coords.latitude, coords.longitude], [result.latitude, result.longitude]) : null
  const needleRotation = bearing == null ? 0 : bearing - (heading ?? 0)

  return (
    <div className="mx-auto flex max-w-lg flex-col gap-6 text-center">
      <div>
        <h1 className="font-display text-2xl font-bold text-maroon-900">🧭 Kṣetra Compass</h1>
        <p className="mt-1 text-sm text-charcoal-700/70">
          Point yourself toward the nearest temple — or the nearest stop on a named circuit — from wherever
          you're standing.
        </p>
      </div>

      {!coords ? (
        <div className="rounded-xl border border-cream-200 bg-white p-6">
          <Button onClick={request} disabled={loading}>
            {loading ? 'Finding you…' : '📍 Find my direction'}
          </Button>
          {error && <p className="mt-3 text-sm text-maroon-700">{error}</p>}
        </div>
      ) : (
        <>
          <div className="mx-auto w-full max-w-xs text-left">
            <Select value={target} onChange={(e) => setTarget(e.target.value)}>
              <option value="nearest">Nearest temple, any kind</option>
              {CIRCUIT_TAGS.map((tag) => (
                <option key={tag} value={tag}>
                  Nearest {tag}
                </option>
              ))}
            </Select>
          </div>

          {resultLoading ? (
            <LoadingSpinner label="Orienting…" />
          ) : !result ? (
            <p className="text-sm text-charcoal-700/70">No temples found for that yet.</p>
          ) : (
            <>
              <CompassRose rotation={needleRotation} />

              {headingSupported && needsPermission && (
                <Button variant="secondary" onClick={enable}>
                  🧲 Enable device compass
                </Button>
              )}
              {(!headingSupported || (!needsPermission && heading == null)) && (
                <p className="text-xs text-charcoal-700/50">
                  North-up view — hold your phone flat like a map, or use a compass app alongside this.
                </p>
              )}

              <div className="rounded-xl border border-gold-400/40 bg-white p-5">
                <p className="font-display text-lg font-semibold text-maroon-900">{result.name}</p>
                <p className="mt-1 text-sm text-charcoal-700/70">
                  {result.distanceKm.toFixed(0)} km {cardinalDirection(bearing!)} of you · {result.town}, {result.state}
                </p>
                <div className="mt-4 flex flex-wrap justify-center gap-3">
                  <a
                    href={googleMapsDirectionsUrl(result)}
                    target="_blank"
                    rel="noreferrer"
                    className="inline-flex min-h-11 items-center gap-2 rounded-lg border border-gold-400 bg-gold-400/15 px-4 py-2.5 text-sm font-semibold text-maroon-800 hover:bg-gold-400/25"
                  >
                    🗺️ Get directions
                  </a>
                  <Link
                    to={`/temples/${result.id}`}
                    className="inline-flex min-h-11 items-center gap-2 rounded-lg border border-maroon-200 bg-cream-100 px-4 py-2.5 text-sm font-semibold text-maroon-800 hover:bg-cream-200"
                  >
                    View temple →
                  </Link>
                </div>
              </div>
            </>
          )}

          <button
            type="button"
            onClick={request}
            className="text-xs font-medium text-charcoal-700/50 underline-offset-2 hover:text-maroon-700 hover:underline"
          >
            Refresh my location
          </button>
        </>
      )}
    </div>
  )
}
