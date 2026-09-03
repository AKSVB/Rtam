import { Navigate } from 'react-router-dom'
import type { ReactNode } from 'react'
import { useAuth } from '../../context/AuthContext'
import { LoadingSpinner } from './LoadingSpinner'

export function ProtectedRoute({
  children,
  requireModerator = false,
}: {
  children: ReactNode
  requireModerator?: boolean
}) {
  const { user, profile, loading } = useAuth()

  if (loading) return <LoadingSpinner label="Checking your session…" />
  if (!user) return <Navigate to="/login" replace />
  if (requireModerator && profile && profile.role === 'member') {
    return <Navigate to="/" replace />
  }

  return <>{children}</>
}
