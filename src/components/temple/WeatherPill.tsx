import { useTempleWeather } from '../../hooks/useTempleWeather'

/** Current conditions at a temple, shown inline near the location line. Renders nothing while loading or on failure — this is a bonus, not core data. */
export function WeatherPill({ latitude, longitude }: { latitude: number; longitude: number }) {
  const { data: weather } = useTempleWeather(latitude, longitude)
  if (!weather) return null

  return (
    <span className="inline-flex items-center gap-1.5 rounded-full border border-cream-200 bg-white px-3 py-1 text-sm text-charcoal-700/80">
      <span aria-hidden>{weather.icon}</span>
      {Math.round(weather.temperatureC)}°C, {weather.description.toLowerCase()} right now
    </span>
  )
}
