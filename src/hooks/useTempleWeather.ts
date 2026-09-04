import { useQuery } from '@tanstack/react-query'

export interface TempleWeather {
  temperatureC: number
  humidityPct: number
  isDay: boolean
  description: string
  icon: string
}

// WMO weather codes (https://open-meteo.com/en/docs), collapsed to the
// handful of conditions worth showing a pilgrim planning a visit.
function describeWeatherCode(code: number, isDay: boolean): { description: string; icon: string } {
  if (code === 0) return { description: 'Clear sky', icon: isDay ? '☀️' : '🌙' }
  if (code === 1 || code === 2) return { description: 'Partly cloudy', icon: isDay ? '🌤️' : '☁️' }
  if (code === 3) return { description: 'Overcast', icon: '☁️' }
  if (code === 45 || code === 48) return { description: 'Foggy', icon: '🌫️' }
  if (code >= 51 && code <= 57) return { description: 'Drizzle', icon: '🌦️' }
  if (code >= 61 && code <= 67) return { description: 'Rain', icon: '🌧️' }
  if (code >= 71 && code <= 77) return { description: 'Snow', icon: '❄️' }
  if (code >= 80 && code <= 82) return { description: 'Rain showers', icon: '🌦️' }
  if (code >= 95) return { description: 'Thunderstorm', icon: '⛈️' }
  return { description: 'Weather unavailable', icon: '🌡️' }
}

/**
 * Current conditions at a temple's coordinates, from Open-Meteo — free,
 * no API key, and directly relevant to the "best season to visit" notes.
 * Fails silently (returns no data) rather than breaking the page, since
 * this is a nice-to-have rather than core temple data.
 */
export function useTempleWeather(latitude: number | undefined, longitude: number | undefined) {
  return useQuery({
    queryKey: ['temple-weather', latitude, longitude],
    queryFn: async (): Promise<TempleWeather> => {
      const url = `https://api.open-meteo.com/v1/forecast?latitude=${latitude}&longitude=${longitude}&current=temperature_2m,relative_humidity_2m,weather_code,is_day&timezone=auto`
      const res = await fetch(url)
      if (!res.ok) throw new Error(`Weather request failed: ${res.status}`)
      const data = await res.json()
      const isDay = data.current.is_day === 1
      const { description, icon } = describeWeatherCode(data.current.weather_code, isDay)
      return {
        temperatureC: data.current.temperature_2m,
        humidityPct: data.current.relative_humidity_2m,
        isDay,
        description,
        icon,
      }
    },
    enabled: latitude != null && longitude != null,
    staleTime: 15 * 60_000,
    retry: 1,
  })
}
