import { useEffect, useRef } from 'react'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'

// Ṛtam's palette, as literal hex — this file can't reach into Tailwind's
// CSS custom properties, so the values are copied from src/index.css and
// must be kept in sync by hand if that palette ever changes.
const GOLD = 0xd4af37
const GOLD_LIGHT = 0xe6c778
const MAROON = 0x7a1f2b
const VERMILION = 0xe2572b
const PEACOCK = 0x1f7a6c
const TURMERIC = 0xf6c945
const CREAM = 0xfdfbf7

/** One flattened diamond "petal" shape, used to build the lotus ring via InstancedMesh. */
function petalGeometry() {
  const shape = new THREE.Shape()
  shape.moveTo(0, 0)
  shape.quadraticCurveTo(0.35, 0.55, 0, 1.15)
  shape.quadraticCurveTo(-0.35, 0.55, 0, 0)
  return new THREE.ExtrudeGeometry(shape, { depth: 0.04, bevelEnabled: false })
}

/**
 * An interactive, genuinely-3D "Surya Mandala" — an armillary-sphere-like
 * arrangement of tilted, crossing rings around a glowing sun core, with an
 * orbiting lotus-petal ring and a starfield behind it. Built in raw
 * Three.js (no React Three Fiber: its peer-dependency range doesn't yet
 * cover React 19.3, and this is a single self-contained scene that doesn't
 * benefit much from a declarative wrapper).
 *
 * The camera — not the object — is what orbits: drag rotates all the way
 * around the sphere of rings, scroll/pinch dollies in and out, and it
 * auto-rotates slowly when idle so the 3D depth reads even without input.
 * Degrades to a single static (but still drag-orbitable) frame under
 * prefers-reduced-motion, and reports failure so the caller can fall back
 * to the plain photo hero if WebGL isn't available at all.
 */
export function SuryaMandalaHero({ onFailed }: { onFailed?: () => void }) {
  const containerRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const container = containerRef.current
    if (!container) return

    let renderer: THREE.WebGLRenderer
    try {
      renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true, powerPreference: 'low-power' })
    } catch {
      onFailed?.()
      return
    }

    const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches
    const isNarrow = container.clientWidth < 480

    const scene = new THREE.Scene()
    const camera = new THREE.PerspectiveCamera(50, 1, 0.1, 100)
    // An elevated 3/4 angle rather than head-on — this is what makes the
    // rings read immediately as tilted circles in space rather than flat
    // ellipses painted on a backdrop.
    camera.position.set(5.5, 3.2, 8.5)

    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
    renderer.setClearColor(0x000000, 0)
    container.appendChild(renderer.domElement)
    renderer.domElement.style.display = 'block'
    renderer.domElement.style.width = '100%'
    renderer.domElement.style.height = '100%'

    // ── Orbit controls — the camera, not the object, is what the user
    // drags around, which is what actually sells the "3D" of it. ─────────
    const controls = new OrbitControls(camera, renderer.domElement)
    controls.target.set(0, 0, 0)
    controls.enablePan = false
    controls.minDistance = 5
    controls.maxDistance = 15
    controls.minPolarAngle = Math.PI * 0.12
    controls.maxPolarAngle = Math.PI * 0.85
    controls.enableDamping = !prefersReducedMotion
    controls.dampingFactor = 0.08
    controls.autoRotate = !prefersReducedMotion
    controls.autoRotateSpeed = 0.7
    controls.update()

    // ── Lighting ────────────────────────────────────────────────────────
    scene.add(new THREE.AmbientLight(CREAM, 0.55))
    const sunLight = new THREE.PointLight(GOLD_LIGHT, 70, 40, 2)
    sunLight.position.set(0, 0, 0)
    scene.add(sunLight)
    const rimLight = new THREE.DirectionalLight(VERMILION, 0.4)
    rimLight.position.set(-6, 4, -4)
    scene.add(rimLight)

    const mandala = new THREE.Group()
    scene.add(mandala)

    // ── Sun core ────────────────────────────────────────────────────────
    const core = new THREE.Mesh(
      new THREE.IcosahedronGeometry(0.85, 2),
      new THREE.MeshStandardMaterial({
        color: TURMERIC,
        emissive: GOLD,
        emissiveIntensity: 1.4,
        roughness: 0.35,
        metalness: 0.2,
      }),
    )
    mandala.add(core)

    const coreGlow = new THREE.Mesh(
      new THREE.SphereGeometry(1.15, 24, 24),
      new THREE.MeshBasicMaterial({ color: GOLD_LIGHT, transparent: true, opacity: 0.22 }),
    )
    mandala.add(coreGlow)

    // ── Concentric rings — an armillary sphere: each tilted on TWO axes
    // and offset in depth, so from any orbit angle they visibly cross and
    // overlap rather than nesting flat inside each other. ────────────────
    const ringConfigs = [
      { radius: 1.9, tube: 0.032, color: GOLD, rotX: 0.35, rotY: 0.15, y: 0, speed: 0.11 },
      { radius: 2.6, tube: 0.026, color: VERMILION, rotX: -0.6, rotY: 0.7, y: 0.08, speed: -0.075 },
      { radius: 3.3, tube: 0.022, color: PEACOCK, rotX: 1.05, rotY: -0.35, y: -0.12, speed: 0.055 },
      { radius: 4.0, tube: 0.02, color: MAROON, rotX: -1.25, rotY: 0.5, y: 0.15, speed: -0.04 },
    ]
    const rings = ringConfigs.map((cfg) => {
      const ring = new THREE.Mesh(
        new THREE.TorusGeometry(cfg.radius, cfg.tube, 16, 100),
        new THREE.MeshStandardMaterial({
          color: cfg.color,
          emissive: cfg.color,
          emissiveIntensity: 0.45,
          roughness: 0.4,
          transparent: true,
          opacity: 0.9,
        }),
      )
      ring.rotation.x = cfg.rotX
      ring.rotation.y = cfg.rotY
      ring.position.y = cfg.y
      mandala.add(ring)
      return { mesh: ring, speed: cfg.speed }
    })

    // ── Lotus petal ring (instanced for one draw call) ───────────────────
    const petalCount = isNarrow ? 10 : 16
    const petalRadius = 2.6
    const petals = new THREE.InstancedMesh(
      petalGeometry(),
      new THREE.MeshStandardMaterial({
        color: GOLD_LIGHT,
        emissive: GOLD,
        emissiveIntensity: 0.25,
        roughness: 0.5,
        side: THREE.DoubleSide,
      }),
      petalCount,
    )
    const dummy = new THREE.Object3D()
    for (let i = 0; i < petalCount; i++) {
      const angle = (i / petalCount) * Math.PI * 2
      dummy.position.set(Math.cos(angle) * petalRadius, Math.sin(angle) * petalRadius, -0.3)
      dummy.rotation.z = angle - Math.PI / 2
      dummy.scale.setScalar(0.75)
      dummy.updateMatrix()
      petals.setMatrixAt(i, dummy.matrix)
    }
    petals.rotation.x = 0.1
    mandala.add(petals)

    // ── Starfield ───────────────────────────────────────────────────────
    const starCount = isNarrow ? 260 : 500
    const starPositions = new Float32Array(starCount * 3)
    for (let i = 0; i < starCount; i++) {
      const radius = 7 + Math.random() * 11
      const theta = Math.random() * Math.PI * 2
      const phi = Math.acos(Math.random() * 2 - 1)
      starPositions[i * 3] = radius * Math.sin(phi) * Math.cos(theta)
      starPositions[i * 3 + 1] = radius * Math.sin(phi) * Math.sin(theta)
      starPositions[i * 3 + 2] = radius * Math.cos(phi)
    }
    const starGeometry = new THREE.BufferGeometry()
    starGeometry.setAttribute('position', new THREE.BufferAttribute(starPositions, 3))
    const starMaterial = new THREE.PointsMaterial({
      color: GOLD_LIGHT,
      size: 0.05,
      transparent: true,
      opacity: 0.8,
      sizeAttenuation: true,
    })
    const stars = new THREE.Points(starGeometry, starMaterial)
    scene.add(stars)

    // ── Resize ──────────────────────────────────────────────────────────
    const resize = () => {
      const { clientWidth, clientHeight } = container
      if (clientWidth === 0 || clientHeight === 0) return
      camera.aspect = clientWidth / clientHeight
      camera.updateProjectionMatrix()
      renderer.setSize(clientWidth, clientHeight)
      if (prefersReducedMotion) renderer.render(scene, camera)
    }
    resize()
    const resizeObserver = new ResizeObserver(resize)
    resizeObserver.observe(container)

    // ── Tap/click pulse — a little tactile flash on top of the orbit drag ─
    let pulse = 0
    const handlePointerDown = () => {
      pulse = 1
    }
    renderer.domElement.addEventListener('pointerdown', handlePointerDown)

    // ── Animation loop ──────────────────────────────────────────────────
    let frameId = 0
    const clock = new THREE.Clock()

    const renderFrame = () => {
      const elapsed = clock.getElapsedTime()
      controls.update()

      mandala.rotation.y += 0.0012
      for (const { mesh, speed } of rings) {
        mesh.rotation.z += speed * 0.02
      }
      petals.rotation.z -= 0.0035

      pulse *= 0.94
      const material = core.material as THREE.MeshStandardMaterial
      material.emissiveIntensity = 1.4 + Math.sin(elapsed * 1.2) * 0.2 + pulse * 1.5
      core.scale.setScalar(1 + Math.sin(elapsed * 1.2) * 0.02 + pulse * 0.08)

      renderer.render(scene, camera)
      frameId = requestAnimationFrame(renderFrame)
    }

    if (prefersReducedMotion) {
      renderer.render(scene, camera)
      // No ambient animation, but a drag/scroll from the user should still
      // re-render — OrbitControls fires 'change' on every user-driven move.
      controls.addEventListener('change', () => renderer.render(scene, camera))
    } else {
      frameId = requestAnimationFrame(renderFrame)
    }

    return () => {
      cancelAnimationFrame(frameId)
      resizeObserver.disconnect()
      renderer.domElement.removeEventListener('pointerdown', handlePointerDown)
      controls.dispose()
      container.removeChild(renderer.domElement)
      scene.traverse((obj) => {
        if (obj instanceof THREE.Mesh || obj instanceof THREE.Points || obj instanceof THREE.InstancedMesh) {
          obj.geometry.dispose()
          const mats = Array.isArray(obj.material) ? obj.material : [obj.material]
          mats.forEach((m) => m.dispose())
        }
      })
      renderer.dispose()
    }
  }, [onFailed])

  return <div ref={containerRef} className="h-full w-full cursor-grab touch-none active:cursor-grabbing" />
}
