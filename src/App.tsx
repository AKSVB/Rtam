import { lazy, Suspense } from 'react'
import { Route, Routes } from 'react-router-dom'
import { Layout } from './components/layout/Layout'
import { ProtectedRoute } from './components/common/ProtectedRoute'
import { LoadingSpinner } from './components/common/LoadingSpinner'
import { HomePage } from './pages/HomePage'

// Code-split every route past the homepage — keeps the initial bundle to
// just what's needed for the first paint, and each other page loads its own
// chunk on demand instead of all shipping in one large bundle.
const TempleDetailPage = lazy(() =>
  import('./pages/TempleDetailPage').then((m) => ({ default: m.TempleDetailPage })),
)
const AddTemplePage = lazy(() => import('./pages/AddTemplePage').then((m) => ({ default: m.AddTemplePage })))
const AddStayPage = lazy(() => import('./pages/AddStayPage').then((m) => ({ default: m.AddStayPage })))
const SuggestEditPage = lazy(() =>
  import('./pages/SuggestEditPage').then((m) => ({ default: m.SuggestEditPage })),
)
const TripPlannerPage = lazy(() =>
  import('./pages/TripPlannerPage').then((m) => ({ default: m.TripPlannerPage })),
)
const ModeratorQueuePage = lazy(() =>
  import('./pages/ModeratorQueuePage').then((m) => ({ default: m.ModeratorQueuePage })),
)
const AdminUsersPage = lazy(() =>
  import('./pages/AdminUsersPage').then((m) => ({ default: m.AdminUsersPage })),
)
const LoginPage = lazy(() => import('./pages/LoginPage').then((m) => ({ default: m.LoginPage })))
const SignupPage = lazy(() => import('./pages/SignupPage').then((m) => ({ default: m.SignupPage })))
const ForgotPasswordPage = lazy(() =>
  import('./pages/ForgotPasswordPage').then((m) => ({ default: m.ForgotPasswordPage })),
)
const ResetPasswordPage = lazy(() =>
  import('./pages/ResetPasswordPage').then((m) => ({ default: m.ResetPasswordPage })),
)
const ProfilePage = lazy(() => import('./pages/ProfilePage').then((m) => ({ default: m.ProfilePage })))
const ContributorsPage = lazy(() =>
  import('./pages/ContributorsPage').then((m) => ({ default: m.ContributorsPage })),
)
const FestivalCalendarPage = lazy(() =>
  import('./pages/FestivalCalendarPage').then((m) => ({ default: m.FestivalCalendarPage })),
)
const CircuitsPage = lazy(() => import('./pages/CircuitsPage').then((m) => ({ default: m.CircuitsPage })))
const CircuitDetailPage = lazy(() =>
  import('./pages/CircuitDetailPage').then((m) => ({ default: m.CircuitDetailPage })),
)
const PublicProfilePage = lazy(() =>
  import('./pages/PublicProfilePage').then((m) => ({ default: m.PublicProfilePage })),
)
const NotFoundPage = lazy(() => import('./pages/NotFoundPage').then((m) => ({ default: m.NotFoundPage })))

function App() {
  return (
    <Suspense fallback={<LoadingSpinner label="Loading…" />}>
      <Routes>
        <Route element={<Layout />}>
          <Route path="/" element={<HomePage />} />
          <Route path="/temples/:id" element={<TempleDetailPage />} />
          <Route
            path="/temples/new"
            element={
              <ProtectedRoute>
                <AddTemplePage />
              </ProtectedRoute>
            }
          />
          <Route
            path="/temples/:id/edit"
            element={
              <ProtectedRoute>
                <AddTemplePage />
              </ProtectedRoute>
            }
          />
          <Route
            path="/temples/:id/add-stay"
            element={
              <ProtectedRoute>
                <AddStayPage />
              </ProtectedRoute>
            }
          />
          <Route
            path="/temples/:id/suggest-edit"
            element={
              <ProtectedRoute>
                <SuggestEditPage />
              </ProtectedRoute>
            }
          />
          <Route path="/festivals" element={<FestivalCalendarPage />} />
          <Route path="/circuits" element={<CircuitsPage />} />
          <Route path="/circuits/:tag" element={<CircuitDetailPage />} />
          <Route path="/trip" element={<TripPlannerPage />} />
          <Route path="/contributors" element={<ContributorsPage />} />
          <Route path="/u/:username" element={<PublicProfilePage />} />
          <Route
            path="/moderate"
            element={
              <ProtectedRoute requireModerator>
                <ModeratorQueuePage />
              </ProtectedRoute>
            }
          />
          <Route
            path="/admin/users"
            element={
              <ProtectedRoute requireAdmin>
                <AdminUsersPage />
              </ProtectedRoute>
            }
          />
          <Route path="/login" element={<LoginPage />} />
          <Route path="/signup" element={<SignupPage />} />
          <Route path="/forgot-password" element={<ForgotPasswordPage />} />
          <Route path="/reset-password" element={<ResetPasswordPage />} />
          <Route
            path="/profile"
            element={
              <ProtectedRoute>
                <ProfilePage />
              </ProtectedRoute>
            }
          />
          <Route path="*" element={<NotFoundPage />} />
        </Route>
      </Routes>
    </Suspense>
  )
}

export default App
