import L from 'leaflet'

// Leaflet's default marker icons are referenced by relative URL, which Vite's
// bundling breaks. Point them at the bundled assets instead.
//
// This lives in its own module because more than one map component needs it:
// importing it for the side effect guarantees the fix is applied no matter
// which map the user happens to land on first.
import markerIcon2x from 'leaflet/dist/images/marker-icon-2x.png'
import markerIcon from 'leaflet/dist/images/marker-icon.png'
import markerShadow from 'leaflet/dist/images/marker-shadow.png'

L.Icon.Default.mergeOptions({
  iconRetinaUrl: markerIcon2x,
  iconUrl: markerIcon,
  shadowUrl: markerShadow,
})
