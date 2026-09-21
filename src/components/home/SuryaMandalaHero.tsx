import { useEffect, useRef } from 'react'
import * as THREE from 'three'
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js'

// Ṛtam's palette, as literal hex — this file can't reach into Tailwind's
// CSS custom properties, so the values are copied from src/index.css and
// must be kept in sync by hand if that palette ever changes.
const GOLD_LIGHT = 0xe6c778

// Ashima Arts / Stefan Gustavson's classic 3D simplex noise (MIT-licensed,
// the standard GLSL implementation used across WebGL shader work) — drives
// both the surface turbulence (vertex shader) and the granulation pattern
// (fragment shader) of the plasma core below.
const SNOISE_GLSL = /* glsl */ `
vec3 mod289(vec3 x){return x-floor(x*(1.0/289.0))*289.0;}
vec4 mod289(vec4 x){return x-floor(x*(1.0/289.0))*289.0;}
vec4 permute(vec4 x){return mod289(((x*34.0)+1.0)*x);}
vec4 taylorInvSqrt(vec4 r){return 1.79284291400159 - 0.85373472095314 * r;}
float snoise(vec3 v){
  const vec2 C = vec2(1.0/6.0, 1.0/3.0);
  const vec4 D = vec4(0.0, 0.5, 1.0, 2.0);
  vec3 i  = floor(v + dot(v, C.yyy));
  vec3 x0 = v - i + dot(i, C.xxx);
  vec3 g = step(x0.yzx, x0.xyz);
  vec3 l = 1.0 - g;
  vec3 i1 = min(g.xyz, l.zxy);
  vec3 i2 = max(g.xyz, l.zxy);
  vec3 x1 = x0 - i1 + C.xxx;
  vec3 x2 = x0 - i2 + C.yyy;
  vec3 x3 = x0 - D.yyy;
  i = mod289(i);
  vec4 p = permute(permute(permute(
            i.z + vec4(0.0, i1.z, i2.z, 1.0))
          + i.y + vec4(0.0, i1.y, i2.y, 1.0))
          + i.x + vec4(0.0, i1.x, i2.x, 1.0));
  float n_ = 0.142857142857;
  vec3 ns = n_ * D.wyz - D.xzx;
  vec4 j = p - 49.0 * floor(p * ns.z * ns.z);
  vec4 x_ = floor(j * ns.z);
  vec4 y_ = floor(j - 7.0 * x_);
  vec4 x = x_ * ns.x + ns.yyyy;
  vec4 y = y_ * ns.x + ns.yyyy;
  vec4 h = 1.0 - abs(x) - abs(y);
  vec4 b0 = vec4(x.xy, y.xy);
  vec4 b1 = vec4(x.zw, y.zw);
  vec4 s0 = floor(b0)*2.0 + 1.0;
  vec4 s1 = floor(b1)*2.0 + 1.0;
  vec4 sh = -step(h, vec4(0.0));
  vec4 a0 = b0.xzyw + s0.xzyw*sh.xxyy;
  vec4 a1 = b1.xzyw + s1.xzyw*sh.zzww;
  vec3 p0 = vec3(a0.xy, h.x);
  vec3 p1 = vec3(a0.zw, h.y);
  vec3 p2 = vec3(a1.xy, h.z);
  vec3 p3 = vec3(a1.zw, h.w);
  vec4 norm = taylorInvSqrt(vec4(dot(p0,p0), dot(p1,p1), dot(p2,p2), dot(p3,p3)));
  p0 *= norm.x; p1 *= norm.y; p2 *= norm.z; p3 *= norm.w;
  vec4 m = max(0.6 - vec4(dot(x0,x0), dot(x1,x1), dot(x2,x2), dot(x3,x3)), 0.0);
  m = m * m;
  return 42.0 * dot(m*m, vec4(dot(p0,x0), dot(p1,x1), dot(p2,x2), dot(p3,x3)));
}
`

// Multi-octave displacement: a big, slow-moving low-frequency term does
// the actual "lumpy solid ball" shaping (this is what breaks the silhouette
// away from a smooth circle), with a finer, faster term layered on top for
// boiling plasma detail. Shared between the true vertex position and two
// nearby samples so the vertex shader can build a real, displacement-aware
// normal instead of reusing the sphere's smooth analytic one.
const DISPLACE_FN = /* glsl */ `
  uniform float uTime;
  uniform float uPulse;
  ${SNOISE_GLSL}
  float displace(vec3 p) {
    float big = snoise(p * 1.15 + uTime * 0.05) * 0.62;
    float mid = snoise(p * 2.4 - uTime * 0.09) * 0.28;
    float fine = snoise(p * 5.5 + uTime * 0.2) * 0.12;
    return (big + mid + fine) * (0.16 + uPulse * 0.05);
  }
`

const PLASMA_VERTEX = /* glsl */ `
  varying vec3 vNormal;
  varying vec3 vViewPos;
  varying float vElevation;
  ${DISPLACE_FN}
  void main() {
    vec3 n = normalize(normal);
    float e = displace(n);
    vElevation = e;
    vec3 displaced = position + n * e;

    // Finite-difference two nearby points on the sphere to rebuild a normal
    // that actually reflects the bumps above, not the underlying smooth
    // icosahedron — without this, lighting reads flat no matter how lumpy
    // the silhouette gets.
    vec3 up = abs(n.y) < 0.99 ? vec3(0.0, 1.0, 0.0) : vec3(1.0, 0.0, 0.0);
    vec3 tangent = normalize(cross(up, n));
    vec3 bitangent = cross(n, tangent);
    float eps = 0.06;
    vec3 nT = normalize(n + tangent * eps);
    vec3 nB = normalize(n + bitangent * eps);
    vec3 pT = nT * (1.0 + displace(nT));
    vec3 pB = nB * (1.0 + displace(nB));
    vec3 pC = n * (1.0 + e);
    vec3 newNormal = normalize(cross(pB - pC, pT - pC));
    if (dot(newNormal, n) < 0.0) newNormal = -newNormal;

    vNormal = normalize(normalMatrix * newNormal);
    vec4 mv = modelViewMatrix * vec4(displaced, 1.0);
    vViewPos = mv.xyz;
    gl_Position = projectionMatrix * mv;
  }
`

const PLASMA_FRAGMENT = /* glsl */ `
  uniform float uPulse;
  uniform vec3 uLightDir;
  varying vec3 vNormal;
  varying vec3 vViewPos;
  varying float vElevation;
  void main() {
    vec3 N = normalize(vNormal);
    vec3 V = normalize(-vViewPos);
    vec3 L = normalize(uLightDir);

    float diff = dot(N, L);
    // Wrap lighting so the night side still glows like banked embers
    // rather than going flat black — this is a sun, not a moon.
    float wrap = 0.45;
    float lighting = clamp((diff + wrap) / (1.0 + wrap), 0.0, 1.0);

    vec3 ember = vec3(0.30, 0.05, 0.03);
    vec3 core = vec3(0.95, 0.42, 0.08);
    vec3 hot = vec3(1.0, 0.82, 0.42);
    vec3 white = vec3(1.0, 0.97, 0.88);

    float elev = clamp(vElevation * 1.6 + 0.5, 0.0, 1.0);
    vec3 color = mix(ember, core, lighting);
    color = mix(color, hot, pow(lighting, 1.3));
    color = mix(color, white, pow(lighting, 3.0) * elev * 0.6);

    float fresnel = pow(1.0 - max(dot(N, V), 0.0), 2.3);
    color += hot * fresnel * (0.35 + uPulse * 0.4) * (0.4 + lighting * 0.6);

    gl_FragColor = vec4(color, 1.0);
  }
`

const GLOW_VERTEX = /* glsl */ `
  varying vec3 vNormal;
  varying vec3 vViewPos;
  void main() {
    vNormal = normalize(normalMatrix * normal);
    vec4 mv = modelViewMatrix * vec4(position, 1.0);
    vViewPos = mv.xyz;
    gl_Position = projectionMatrix * mv;
  }
`

const GLOW_FRAGMENT = /* glsl */ `
  uniform vec3 uColor;
  uniform float uPower;
  uniform float uIntensity;
  varying vec3 vNormal;
  varying vec3 vViewPos;
  void main() {
    vec3 viewDir = normalize(-vViewPos);
    float fresnel = pow(1.0 - max(dot(normalize(vNormal), viewDir), 0.0), uPower);
    gl_FragColor = vec4(uColor, fresnel * uIntensity);
  }
`

/**
 * A soft gradient "energy tongue" sprite texture — bright near its base,
 * tapering to nothing at both the tip and the edges — generated once on
 * a small canvas rather than shipped as an image asset. Used (additive-
 * blended, on a base-pivoted plane) for the tejas bursts below; this is
 * what keeps them reading as glowing plasma rather than the hard-edged
 * solid cones an earlier version used, which looked like needles.
 */
function createTejasTexture(): THREE.CanvasTexture {
  const size = 128
  const canvas = document.createElement('canvas')
  canvas.width = size
  canvas.height = size
  const ctx = canvas.getContext('2d')!

  const lengthGradient = ctx.createLinearGradient(0, size, 0, 0)
  lengthGradient.addColorStop(0, 'rgba(255,150,60,0)')
  lengthGradient.addColorStop(0.1, 'rgba(255,210,130,0.95)')
  lengthGradient.addColorStop(0.35, 'rgba(255,190,110,0.7)')
  lengthGradient.addColorStop(1, 'rgba(255,140,50,0)')
  ctx.fillStyle = lengthGradient
  ctx.fillRect(0, 0, size, size)

  const widthGradient = ctx.createLinearGradient(0, 0, size, 0)
  widthGradient.addColorStop(0, 'rgba(0,0,0,0)')
  widthGradient.addColorStop(0.5, 'rgba(0,0,0,1)')
  widthGradient.addColorStop(1, 'rgba(0,0,0,0)')
  ctx.globalCompositeOperation = 'destination-in'
  ctx.fillStyle = widthGradient
  ctx.fillRect(0, 0, size, size)

  const texture = new THREE.CanvasTexture(canvas)
  texture.needsUpdate = true
  return texture
}

/**
 * A "ball of illuminating solar radiation" — Savitṛ, the pre-dawn light
 * of the Gayatri Mantra (Rigveda 3.62.10), rendered as one solid,
 * genuinely volumetric body rather than a flat motif or appendages
 * stuck onto one: a high-resolution icosphere displaced by multi-octave
 * 3D simplex noise (so the lumpy, boiling silhouette is real geometry,
 * not a texture), with a hand-rebuilt normal so it actually shades like
 * the bumps it has. Lit from a fixed direction while the sphere itself
 * slowly rotates, so a real lit/dark terminator sweeps across the
 * surface continuously — that motion, not a rim glow, is what reads as
 * "solid 3D" rather than "flat circle." Two additive fresnel shells give
 * it a soft corona, the whole thing breathes on a slow pulse, and tejas
 * bursts — soft gradient sprites, not solid geometry — erupt outward in
 * random directions on independent, staggered cycles.
 *
 * OrbitControls drives the camera fully around it in 3D. Built in raw
 * Three.js (no React Three Fiber: its peer-dependency range doesn't yet
 * cover React 19.3). Degrades to a single static (but still orbitable)
 * frame under prefers-reduced-motion, and reports failure so the caller
 * can fall back to the plain photo hero if WebGL isn't available at all.
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
    const camera = new THREE.PerspectiveCamera(48, 1, 0.1, 100)
    camera.position.set(3.6, 1.8, 5.6)

    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2))
    renderer.setClearColor(0x000000, 0)
    container.appendChild(renderer.domElement)
    renderer.domElement.style.display = 'block'
    renderer.domElement.style.width = '100%'
    renderer.domElement.style.height = '100%'

    const controls = new OrbitControls(camera, renderer.domElement)
    controls.target.set(0, 0, 0)
    controls.enablePan = false
    controls.minDistance = 3.2
    controls.maxDistance = 9
    controls.minPolarAngle = Math.PI * 0.15
    controls.maxPolarAngle = Math.PI * 0.85
    controls.enableDamping = !prefersReducedMotion
    controls.dampingFactor = 0.08
    controls.autoRotate = !prefersReducedMotion
    controls.autoRotateSpeed = 0.5
    controls.update()

    const core = new THREE.Group()
    scene.add(core)

    // ── Plasma sphere — the light itself, not a symbol of it. Lit by a
    // fixed light direction in view space, so as the sphere self-rotates
    // a real terminator (lit/dark boundary) sweeps across its bumpy
    // surface — the strongest possible cue that this is a solid 3D body,
    // not a flat glowing disc. ─────────────────────────────────────────
    const coreRadius = 1.3
    const plasmaUniforms = {
      uTime: { value: 0 },
      uPulse: { value: 0 },
      uLightDir: { value: new THREE.Vector3(0.6, 0.45, 0.9).normalize() },
    }
    const plasma = new THREE.Mesh(
      new THREE.IcosahedronGeometry(coreRadius, isNarrow ? 4 : 5),
      new THREE.ShaderMaterial({
        uniforms: plasmaUniforms,
        vertexShader: PLASMA_VERTEX,
        fragmentShader: PLASMA_FRAGMENT,
      }),
    )
    core.add(plasma)

    // ── Corona: two additive fresnel-glow shells, breathing slightly out
    // of phase with each other and the core. ──────────────────────────────
    const innerGlowUniforms = { uColor: { value: new THREE.Color(0xf6c945) }, uPower: { value: 1.6 }, uIntensity: { value: 1.1 } }
    const innerGlow = new THREE.Mesh(
      new THREE.SphereGeometry(coreRadius * 1.28, 48, 48),
      new THREE.ShaderMaterial({
        uniforms: innerGlowUniforms,
        vertexShader: GLOW_VERTEX,
        fragmentShader: GLOW_FRAGMENT,
        transparent: true,
        blending: THREE.AdditiveBlending,
        depthWrite: false,
        side: THREE.FrontSide,
      }),
    )
    core.add(innerGlow)

    const outerGlowUniforms = { uColor: { value: new THREE.Color(0xe2572b) }, uPower: { value: 2.4 }, uIntensity: { value: 0.85 } }
    const outerGlow = new THREE.Mesh(
      new THREE.SphereGeometry(coreRadius * 1.75, 48, 48),
      new THREE.ShaderMaterial({
        uniforms: outerGlowUniforms,
        vertexShader: GLOW_VERTEX,
        fragmentShader: GLOW_FRAGMENT,
        transparent: true,
        blending: THREE.AdditiveBlending,
        depthWrite: false,
        side: THREE.FrontSide,
      }),
    )
    core.add(outerGlow)

    // ── Tejas bursts — pulses of the sun's own radiance erupting outward
    // in random directions, each on an independent cycle: a fast launch
    // off the surface, then a slower fade, so a few are always mid-burst
    // without ever looking synchronized or mechanical. Soft gradient
    // sprites (see createTejasTexture), additive-blended, rather than
    // solid geometry — the earlier cone-based version read as needles
    // stuck into the sun rather than radiance leaving it. ────────────────
    const tejasTexture = createTejasTexture()
    const tejasCount = isNarrow ? 9 : 16
    // Base-pivoted plane: translated so local y=0 is the flare's root
    // (anchored just inside the sphere) and y=1 is its tip, so scaling
    // instance.y alone grows it outward from the surface.
    const tejasGeometry = new THREE.PlaneGeometry(0.5, 1)
    tejasGeometry.translate(0, 0.5, 0)
    const tejas = new THREE.InstancedMesh(
      tejasGeometry,
      new THREE.MeshBasicMaterial({
        map: tejasTexture,
        color: 0xffd88a,
        transparent: true,
        blending: THREE.AdditiveBlending,
        depthWrite: false,
        side: THREE.DoubleSide,
      }),
      tejasCount,
    )
    const tejasDirs: THREE.Vector3[] = []
    const tejasPhase: number[] = []
    const tejasCycle: number[] = []
    const UP = new THREE.Vector3(0, 1, 0)
    for (let i = 0; i < tejasCount; i++) {
      tejasDirs.push(
        new THREE.Vector3(Math.random() * 2 - 1, Math.random() * 2 - 1, Math.random() * 2 - 1).normalize(),
      )
      tejasPhase.push(Math.random())
      tejasCycle.push(2.2 + Math.random() * 2.6)
    }
    core.add(tejas)

    // ── Starfield ───────────────────────────────────────────────────────
    const starCount = isNarrow ? 260 : 500
    const starPositions = new Float32Array(starCount * 3)
    for (let i = 0; i < starCount; i++) {
      const radius = 6 + Math.random() * 10
      const theta = Math.random() * Math.PI * 2
      const phi = Math.acos(Math.random() * 2 - 1)
      starPositions[i * 3] = radius * Math.sin(phi) * Math.cos(theta)
      starPositions[i * 3 + 1] = radius * Math.sin(phi) * Math.sin(theta)
      starPositions[i * 3 + 2] = radius * Math.cos(phi)
    }
    const starGeometry = new THREE.BufferGeometry()
    starGeometry.setAttribute('position', new THREE.BufferAttribute(starPositions, 3))
    const stars = new THREE.Points(
      starGeometry,
      new THREE.PointsMaterial({ color: GOLD_LIGHT, size: 0.045, transparent: true, opacity: 0.7, sizeAttenuation: true }),
    )
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

    // ── Tap/click pulse ────────────────────────────────────────────────
    let pulse = 0
    const handlePointerDown = () => {
      pulse = 1
    }
    renderer.domElement.addEventListener('pointerdown', handlePointerDown)

    // ── Animation loop ──────────────────────────────────────────────────
    let frameId = 0
    const clock = new THREE.Clock()
    const dummy = new THREE.Object3D()
    const tejasQuat = new THREE.Quaternion()

    const renderFrame = () => {
      const delta = clock.getDelta()
      const elapsed = clock.elapsedTime
      controls.update()

      pulse *= 0.94
      // A slow "breathing" pulse — the illumination that awakens the
      // intellect, not a mechanical blink.
      const breath = Math.sin(elapsed * 0.55) * 0.5 + 0.5
      const pulseValue = breath * 0.6 + pulse * 0.7
      plasmaUniforms.uTime.value = elapsed
      plasmaUniforms.uPulse.value = pulseValue
      innerGlowUniforms.uIntensity.value = 1.0 + breath * 0.35 + pulse * 0.6
      outerGlowUniforms.uIntensity.value = 0.7 + breath * 0.3 + pulse * 0.5
      const scale = 1 + breath * 0.035 + pulse * 0.07
      core.scale.setScalar(scale)

      // Self-rotation independent of the orbit camera — under a fixed
      // light direction this sweeps a real lit/dark terminator across the
      // bumpy surface, which is what actually sells "solid 3D sphere"
      // even before the viewer touches it.
      core.rotation.y += delta * 0.18
      core.rotation.x += delta * 0.05

      for (let i = 0; i < tejasCount; i++) {
        const t = (elapsed / tejasCycle[i] + tejasPhase[i]) % 1
        // Fast launch (0 → 1 over the first 15% of the cycle), then a
        // slower eased decay — an eruption, not a symmetric breathe.
        const envelope =
          t < 0.15 ? (() => { const r = t / 0.15; return r * r * (3 - 2 * r) })() : (() => { const d = (t - 0.15) / 0.85; return 1 - d * d })()

        const dir = tejasDirs[i]
        tejasQuat.setFromUnitVectors(UP, dir)
        dummy.position.copy(dir).multiplyScalar(coreRadius * 0.9)
        dummy.quaternion.copy(tejasQuat)
        const length = 0.04 + envelope * coreRadius * 1.15
        const width = 0.3 + envelope * 0.7
        dummy.scale.set(width, length, 1)
        dummy.updateMatrix()
        tejas.setMatrixAt(i, dummy.matrix)
      }
      tejas.instanceMatrix.needsUpdate = true

      stars.rotation.y += 0.0004

      renderer.render(scene, camera)
      frameId = requestAnimationFrame(renderFrame)
    }

    if (prefersReducedMotion) {
      renderer.render(scene, camera)
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
      tejasTexture.dispose()
      renderer.dispose()
    }
  }, [onFailed])

  return <div ref={containerRef} className="h-full w-full cursor-grab touch-none active:cursor-grabbing" />
}
