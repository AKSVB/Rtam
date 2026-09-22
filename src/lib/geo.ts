/** Great-circle distance between two [lat, lng] points, in kilometres. */
export function haversineKm(a: [number, number], b: [number, number]): number {
  const R = 6371
  const dLat = ((b[0] - a[0]) * Math.PI) / 180
  const dLon = ((b[1] - a[1]) * Math.PI) / 180
  const lat1 = (a[0] * Math.PI) / 180
  const lat2 = (b[0] * Math.PI) / 180
  const h = Math.sin(dLat / 2) ** 2 + Math.sin(dLon / 2) ** 2 * Math.cos(lat1) * Math.cos(lat2)
  return 2 * R * Math.asin(Math.sqrt(h))
}

/** Initial compass bearing (0-360°, 0 = north) for the great-circle path from `a` to `b`. */
export function bearingDeg(a: [number, number], b: [number, number]): number {
  const toRad = (d: number) => (d * Math.PI) / 180
  const lat1 = toRad(a[0])
  const lat2 = toRad(b[0])
  const dLon = toRad(b[1] - a[1])
  const y = Math.sin(dLon) * Math.cos(lat2)
  const x = Math.cos(lat1) * Math.sin(lat2) - Math.sin(lat1) * Math.cos(lat2) * Math.cos(dLon)
  const deg = (Math.atan2(y, x) * 180) / Math.PI
  return (deg + 360) % 360
}

const CARDINAL_POINTS = [
  'N',
  'NNE',
  'NE',
  'ENE',
  'E',
  'ESE',
  'SE',
  'SSE',
  'S',
  'SSW',
  'SW',
  'WSW',
  'W',
  'WNW',
  'NW',
  'NNW',
]

/** The nearest of the 16 compass points (N, NNE, NE, ...) for a bearing in degrees. */
export function cardinalDirection(bearing: number): string {
  return CARDINAL_POINTS[Math.round(bearing / 22.5) % 16]
}

/** Nearest-neighbour ordering — good enough for a short pilgrimage-trip list, not a TSP solver. */
export function sortByProximity<T extends { latitude: number; longitude: number }>(items: T[]): T[] {
  if (items.length <= 1) return items
  const remaining = [...items]
  const ordered: T[] = [remaining.shift()!]
  while (remaining.length > 0) {
    const last = ordered[ordered.length - 1]
    remaining.sort(
      (a, b) =>
        haversineKm([last.latitude, last.longitude], [a.latitude, a.longitude]) -
        haversineKm([last.latitude, last.longitude], [b.latitude, b.longitude]),
    )
    ordered.push(remaining.shift()!)
  }
  return ordered
}
