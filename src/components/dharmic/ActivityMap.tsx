import { useEffect, useRef, type RefObject } from 'react'
import { MapContainer, TileLayer, useMap } from 'react-leaflet'
import L from 'leaflet'
import 'leaflet.markercluster'
import { DHARMIC_ACTIVITY_TYPE_LABELS } from '../../constants/enumLabels'
import type { DharmicActivityWithMeta } from '../../hooks/useDharmicActivities'
import '../../lib/leafletIcons'

const INDIA_CENTER: [number, number] = [22.5, 79.0]

function escapeHtml(s: string) {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;')
}

function ClusterLayer({ activities }: { activities: DharmicActivityWithMeta[] }) {
  const map = useMap()

  useEffect(() => {
    const clusterGroup = L.markerClusterGroup()

    activities.forEach((activity) => {
      const marker = L.marker([activity.latitude, activity.longitude])
      const dateLabel = new Date(activity.activity_date).toLocaleDateString('en-IN', {
        day: 'numeric',
        month: 'short',
        year: 'numeric',
      })
      const templeLink = activity.temple_id
        ? `<br /><a href="/temples/${activity.temple_id}">View temple</a>`
        : ''
      marker.bindPopup(
        `<strong>${escapeHtml(activity.title)}</strong><br />` +
          `${escapeHtml(DHARMIC_ACTIVITY_TYPE_LABELS[activity.activity_type])} · ${dateLabel}<br />` +
          `${escapeHtml(activity.town)}, ${escapeHtml(activity.state)}` +
          templeLink,
      )
      clusterGroup.addLayer(marker)
    })

    map.addLayer(clusterGroup)
    return () => {
      map.removeLayer(clusterGroup)
    }
  }, [map, activities])

  return null
}

function FitBounds({
  activities,
  boundsSet,
}: {
  activities: DharmicActivityWithMeta[]
  boundsSet: RefObject<boolean>
}) {
  const map = useMap()

  useEffect(() => {
    if (boundsSet.current || activities.length === 0) return
    const bounds = L.latLngBounds(activities.map((a) => [a.latitude, a.longitude]))
    map.fitBounds(bounds, { padding: [32, 32], maxZoom: 10 })
    boundsSet.current = true
  }, [map, activities, boundsSet])

  return null
}

export function ActivityMap({ activities }: { activities: DharmicActivityWithMeta[] }) {
  const boundsSet = useRef(false)

  return (
    <div className="h-[60vh] min-h-[360px] w-full overflow-hidden rounded-xl border border-cream-200">
      <MapContainer center={INDIA_CENTER} zoom={5} scrollWheelZoom className="h-full w-full">
        <TileLayer
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        <FitBounds activities={activities} boundsSet={boundsSet} />
        <ClusterLayer activities={activities} />
      </MapContainer>
    </div>
  )
}
