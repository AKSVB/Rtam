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
