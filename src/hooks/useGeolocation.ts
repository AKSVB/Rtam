import { useState } from 'react'

export interface Coords {
  latitude: number
  longitude: number
}

/** Wraps the browser geolocation prompt used inline in a couple of places (HomePage's "near me", LocationPicker) into one reusable hook. */
export function useGeolocation() {
  const [coords, setCoords] = useState<Coords | null>(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState<string | null>(null)

  const request = () => {
    if (!navigator.geolocation) {
      setError("Your browser doesn't support location — try browsing the full list instead.")
      return
    }
    setLoading(true)
    setError(null)
    navigator.geolocation.getCurrentPosition(
      (position) => {
        setLoading(false)
        setCoords({ latitude: position.coords.latitude, longitude: position.coords.longitude })
      },
      () => {
        setLoading(false)
        setError('Could not get your location. You can still browse the full list.')
      },
      { timeout: 10_000 },
    )
  }

  return { coords, loading, error, request }
}
