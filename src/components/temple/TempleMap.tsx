import { useEffect, useRef, type RefObject } from 'react'
import { MapContainer, TileLayer, useMap } from 'react-leaflet'
import L from 'leaflet'
import 'leaflet.markercluster'
import type { Temple } from '../../types/database'

// Default Leaflet marker icons reference image URLs that don't resolve
// correctly under Vite's bundling — point them at the shipped assets.
import markerIcon2x from 'leaflet/dist/images/marker-icon-2x.png'
import markerIcon from 'leaflet/dist/images/marker-icon.png'
import markerShadow from 'leaflet/dist/images/marker-shadow.png'

L.Icon.Default.mergeOptions({
  iconRetinaUrl: markerIcon2x,
  iconUrl: markerIcon,
  shadowUrl: markerShadow,
})

const INDIA_CENTER: [number, number] = [22.5, 79.0]

function ClusterLayer({ temples }: { temples: Temple[] }) {
  const map = useMap()

  useEffect(() => {
    const clusterGroup = L.markerClusterGroup()

    temples.forEach((temple) => {
      const marker = L.marker([temple.latitude, temple.longitude])
      marker.bindPopup(
        `<strong>${temple.name}</strong><br />${temple.town}, ${temple.state}<br /><a href="/temples/${temple.id}">View details</a>`,
      )
      clusterGroup.addLayer(marker)
    })

    map.addLayer(clusterGroup)
    return () => {
      map.removeLayer(clusterGroup)
    }
  }, [map, temples])

  return null
}

export function TempleMap({ temples }: { temples: Temple[] }) {
  const boundsSet = useRef(false)

  return (
    <div className="h-[70vh] min-h-[420px] w-full overflow-hidden rounded-xl border border-cream-200">
      <MapContainer center={INDIA_CENTER} zoom={5} scrollWheelZoom className="h-full w-full">
        <TileLayer
          attribution='&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
          url="https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png"
        />
        <FitBounds temples={temples} boundsSet={boundsSet} />
        <ClusterLayer temples={temples} />
      </MapContainer>
    </div>
  )
}

function FitBounds({
  temples,
  boundsSet,
}: {
  temples: Temple[]
  boundsSet: RefObject<boolean>
}) {
  const map = useMap()

  useEffect(() => {
    if (boundsSet.current || temples.length === 0) return
    const bounds = L.latLngBounds(temples.map((t) => [t.latitude, t.longitude]))
    map.fitBounds(bounds, { padding: [32, 32], maxZoom: 10 })
    boundsSet.current = true
  }, [map, temples, boundsSet])

  return null
}
