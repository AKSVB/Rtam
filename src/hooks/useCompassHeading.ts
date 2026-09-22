import { useEffect, useState } from 'react'

type PermissionRequester = () => Promise<'granted' | 'denied'>

function getPermissionRequester(): PermissionRequester | undefined {
  if (typeof DeviceOrientationEvent === 'undefined') return undefined
  return (DeviceOrientationEvent as unknown as { requestPermission?: PermissionRequester }).requestPermission
}

/**
 * How far, in degrees clockwise, the current screen orientation is rotated
 * from the device's "natural" one — e.g. 90 when a phone whose natural
 * orientation is portrait is being held in landscape. Both alpha and
 * webkitCompassHeading are defined relative to the physical device, not
 * the screen's current "up", so without this a compass held in landscape
 * (or on a tablet, whose natural orientation is often landscape already)
 * reads off by a fixed 90/180/270° — the other classic source of a web
 * compass "pointing the wrong way" alongside the absolute/relative alpha
 * issue, and explicitly called out in MDN's orientation-and-motion guide.
 */
function getScreenAngle(): number {
  if (typeof screen !== 'undefined' && screen.orientation && typeof screen.orientation.angle === 'number') {
    return screen.orientation.angle
  }
  // Older iOS exposed only this, in the opposite sign convention to
  // screen.orientation.angle (negative when rotated clockwise).
  const legacy = (window as unknown as { orientation?: number }).orientation
  return typeof legacy === 'number' ? -legacy : 0
}

/**
 * Best-effort device compass heading (0-360°, 0 = device top pointing
 * north), from the `deviceorientation` event. There's no magnetometer
 * calibration here — accuracy varies a lot by device and browser — so this
 * powers a "point your phone" nicety on top of the bearing/distance numbers,
 * never the only way to read the result.
 *
 * iOS Safari requires an explicit user gesture to grant motion/orientation
 * access (`needsPermission`/`enable`); most other browsers fire the event
 * without asking.
 */
export function useCompassHeading() {
  const [heading, setHeading] = useState<number | null>(null)
  const [supported] = useState(() => typeof DeviceOrientationEvent !== 'undefined')
  const [needsPermission, setNeedsPermission] = useState(() => !!getPermissionRequester())
  const [denied, setDenied] = useState(false)

  useEffect(() => {
    if (!supported || needsPermission) return

    const applyEvent = (e: DeviceOrientationEvent) => {
      const screenAngle = getScreenAngle()
      const iosHeading = (e as DeviceOrientationEvent & { webkitCompassHeading?: number }).webkitCompassHeading
      if (typeof iosHeading === 'number') {
        // iOS's webkitCompassHeading is always magnetic-north-referenced,
        // but still relative to the device's physical top, not the
        // screen's current "up" — still needs the screen-angle correction.
        setHeading((iosHeading + screenAngle + 360) % 360)
      } else if (e.alpha != null) {
        // The textbook DeviceOrientation spec derivation says compass
        // heading = 360 - alpha, but that inverted the turning direction
        // in practice (confirmed on a real Android device: the needle
        // swung the wrong way when turning, and so read as a fixed offset
        // too, since an inverted reading only coincidentally matches truth
        // at one heading and diverges everywhere else) — this browser's
        // alpha already increases in the same clockwise sense as compass
        // heading, so it's used directly instead of inverted.
        //
        // Plain 'deviceorientation' only guarantees alpha is genuinely
        // north-referenced when e.absolute is true; otherwise it's relative
        // to whatever direction the phone faced when tracking started, and
        // using it anyway is the earlier "calibration" bug this hook had —
        // a wrong-but-confident reading is worse than none, so it's skipped.
        if (e.absolute) setHeading((e.alpha + screenAngle + 360) % 360)
      }
    }

    // 'deviceorientationabsolute' (Chrome/Android) is explicitly
    // north-referenced whenever it fires at all, so it's preferred and
    // takes over from the plain event once it starts firing.
    let gotAbsoluteEvent = false
    const onAbsolute = (e: DeviceOrientationEvent) => {
      gotAbsoluteEvent = true
      applyEvent(e)
    }
    const onPlain = (e: DeviceOrientationEvent) => {
      if (gotAbsoluteEvent) return
      applyEvent(e)
    }

    window.addEventListener('deviceorientationabsolute', onAbsolute)
    window.addEventListener('deviceorientation', onPlain)
    return () => {
      window.removeEventListener('deviceorientationabsolute', onAbsolute)
      window.removeEventListener('deviceorientation', onPlain)
    }
  }, [supported, needsPermission])

  const enable = async () => {
    const requestPermission = getPermissionRequester()
    if (!requestPermission) return
    const result = await requestPermission()
    if (result === 'granted') {
      setNeedsPermission(false)
    } else {
      // Falls back to the north-up view rather than leaving the "Enable
      // device compass" button stuck forever with no explanation.
      setDenied(true)
    }
  }

  return { heading, supported, needsPermission: needsPermission && !denied, enable }
}
