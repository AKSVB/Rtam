import { Route, Routes } from 'react-router-dom'
import { Layout } from './components/layout/Layout'
import { ProtectedRoute } from './components/common/ProtectedRoute'
import { HomePage } from './pages/HomePage'
import { TempleDetailPage } from './pages/TempleDetailPage'
import { AddTemplePage } from './pages/AddTemplePage'
import { TripPlannerPage } from './pages/TripPlannerPage'
import { ModeratorQueuePage } from './pages/ModeratorQueuePage'
import { LoginPage } from './pages/LoginPage'
import { SignupPage } from './pages/SignupPage'
import { ProfilePage } from './pages/ProfilePage'
import { ContributorsPage } from './pages/ContributorsPage'
import { PublicProfilePage } from './pages/PublicProfilePage'

function App() {
  return (
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
        <Route path="/login" element={<LoginPage />} />
        <Route path="/signup" element={<SignupPage />} />
        <Route
          path="/profile"
          element={
            <ProtectedRoute>
              <ProfilePage />
            </ProtectedRoute>
          }
        />
      </Route>
    </Routes>
  )
}

export default App
