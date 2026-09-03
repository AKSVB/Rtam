import { useEffect, useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { isUsernameAvailable } from '../hooks/useContributors'
import { Button } from '../components/common/Button'
import { FormField, TextInput } from '../components/common/FormField'
import { strings } from '../constants/strings'

const USERNAME_PATTERN = /^[a-z0-9_]{3,30}$/

export function SignupPage() {
  const { signUp } = useAuth()
  const navigate = useNavigate()
  const [displayName, setDisplayName] = useState('')
  const [username, setUsername] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [done, setDone] = useState(false)
  // Keyed by the name it refers to, so a slow response for an earlier
  // keystroke can never be mistaken for the answer about what's typed now.
  const [checked, setChecked] = useState<{ name: string; available: boolean | null } | null>(null)

  const normalized = username.trim().toLowerCase()
  const formatValid = USERNAME_PATTERN.test(normalized)

  const available = checked?.name === normalized ? checked.available : null
  const checking = formatValid && checked?.name !== normalized

  // Debounced availability check so we aren't querying on every keystroke.
  useEffect(() => {
    if (!formatValid) return
    let cancelled = false
    const timer = setTimeout(async () => {
      const result = await isUsernameAvailable(normalized)
      if (!cancelled) setChecked({ name: normalized, available: result })
    }, 400)
    return () => {
      cancelled = true
      clearTimeout(timer)
    }
  }, [normalized, formatValid])

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    if (!formatValid) {
      setError('Please pick a username of 3–30 characters, using only letters, numbers and underscores.')
      return
    }
    setLoading(true)
    setError(null)
    const { error: signUpError } = await signUp(email, password, displayName, normalized)
    setLoading(false)
    if (signUpError) {
      setError(signUpError)
      return
    }
    setDone(true)
  }

  if (done) {
    return (
      <div className="mx-auto max-w-sm rounded-xl border border-cream-200 bg-white p-8 text-center">
        <h1 className="text-xl font-bold text-charcoal-900">Welcome, @{normalized}</h1>
        <p className="mt-2 text-charcoal-700/80">
          We've sent a confirmation link to {email}. Confirm your email, then log in and start
          contributing.
        </p>
        <Button className="mt-6" onClick={() => navigate('/login')}>
          Go to Login
        </Button>
      </div>
    )
  }

  const usernameHint = () => {
    if (!username) return undefined
    if (!formatValid) return '3–30 characters: lowercase letters, numbers and underscores only.'
    if (checking) return 'Checking availability…'
    if (available === true) return `@${normalized} is available.`
    if (available === false) return `@${normalized} is already taken.`
    return undefined
  }

  return (
    <div className="mx-auto max-w-sm">
      <h1 className="mb-6 text-2xl font-bold text-charcoal-900">{strings.auth.signupTitle}</h1>
      <form onSubmit={handleSubmit} className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
        <FormField
          label={strings.auth.usernameLabel}
          htmlFor="username"
          required
          helpText={usernameHint()}
          error={available === false ? 'Please choose a different username.' : undefined}
        >
          <div className="flex items-center gap-2">
            <span className="text-lg font-semibold text-charcoal-700/60">@</span>
            <TextInput
              id="username"
              required
              value={username}
              onChange={(e) => setUsername(e.target.value.replace(/\s/g, ''))}
              placeholder="ravi_sharma"
              autoCapitalize="none"
              autoCorrect="off"
              spellCheck={false}
            />
          </div>
        </FormField>
        <FormField
          label={strings.auth.displayNameLabel}
          htmlFor="displayName"
          required
          helpText="Your full name, shown alongside your @username."
        >
          <TextInput
            id="displayName"
            required
            value={displayName}
            onChange={(e) => setDisplayName(e.target.value)}
          />
        </FormField>
        <FormField label={strings.auth.emailLabel} htmlFor="email" required>
          <TextInput
            id="email"
            type="email"
            required
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </FormField>
        <FormField label={strings.auth.passwordLabel} htmlFor="password" required>
          <TextInput
            id="password"
            type="password"
            required
            minLength={6}
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </FormField>
        {error && <p className="text-sm text-maroon-700">{error}</p>}
        <Button type="submit" disabled={loading || available === false || !formatValid}>
          {loading ? 'Creating account…' : strings.auth.signupCta}
        </Button>
        <p className="text-center text-sm text-charcoal-700/80">
          {strings.auth.hasAccount}{' '}
          <Link to="/login" className="font-semibold text-maroon-700 hover:underline">
            {strings.nav.login}
          </Link>
        </p>
      </form>
    </div>
  )
}
