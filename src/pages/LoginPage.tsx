import { useState, type FormEvent } from 'react'
import { Link, useLocation, useNavigate } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'
import { Button } from '../components/common/Button'
import { FormField, TextInput } from '../components/common/FormField'
import { strings } from '../constants/strings'

export function LoginPage() {
  const { signIn } = useAuth()
  const navigate = useNavigate()
  const location = useLocation()
  const [email, setEmail] = useState('')
  const [password, setPassword] = useState('')
  const [error, setError] = useState<string | null>(null)
  const [loading, setLoading] = useState(false)

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault()
    setLoading(true)
    setError(null)
    const { error: signInError } = await signIn(email, password)
    setLoading(false)
    if (signInError) {
      setError(signInError)
      return
    }
    const from = (location.state as { from?: string } | null)?.from ?? '/'
    navigate(from, { replace: true })
  }

  return (
    <div className="mx-auto max-w-sm">
      <h1 className="mb-6 text-2xl font-bold text-charcoal-900">{strings.auth.loginTitle}</h1>
      <form onSubmit={handleSubmit} className="flex flex-col gap-4 rounded-xl border border-cream-200 bg-white p-5">
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
            value={password}
            onChange={(e) => setPassword(e.target.value)}
          />
        </FormField>
        {error && <p className="text-sm text-maroon-700">{error}</p>}
        <Button type="submit" disabled={loading}>
          {loading ? 'Logging in…' : strings.auth.loginCta}
        </Button>
        <p className="text-center text-sm text-charcoal-700/80">
          {strings.auth.noAccount}{' '}
          <Link to="/signup" className="font-semibold text-maroon-700 hover:underline">
            {strings.nav.signup}
          </Link>
        </p>
      </form>
    </div>
  )
}
