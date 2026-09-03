import { useState, type FormEvent } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { Button } from '../components/common/Button'
import { FormField, TextInput } from '../components/common/FormField'
import { strings } from '../constants/strings'

export function SignupPage() {
  const { signUp } = useAuth()
  const navigate = useNavigate()
  const [displayName, setDisplayName] = useState('')
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)
  const [done, setDone] = useState(false)

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError(null)
    const { error: signUpError } = await signUp(email, password, displayName)
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
        <h1 className="text-xl font-bold text-charcoal-900">Check your inbox</h1>
        <p className="mt-2 text-charcoal-700/80">
          We've sent a confirmation link to {email}. Confirm your email, then log in.
        </p>
        <Button className="mt-6" onClick={() => navigate('/login')}>
          Go to Login
        </Button>
      </div>
    )
  }

  return (
    <div className="mx-auto max-w-sm">
      <h1 className="mb-6 text-2xl font-bold text-charcoal-900">{strings.auth.signupTitle}</h1>
      <form onSubmit={handleSubmit} className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
        <FormField label={strings.auth.displayNameLabel} htmlFor="displayName" required>
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
        <Button type="submit" disabled={loading}>
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
