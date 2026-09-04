import { useEffect } from 'react'
import { Outlet } from 'react-router-dom'
import { Navbar } from './Navbar'
import { Footer } from './Footer'
import { useAuth } from '../../context/AuthContext'
import { useToast } from '../../context/ToastContext'

export function Layout() {
  const { bannedNotice, clearBannedNotice } = useAuth()
  const { toast } = useToast()

  useEffect(() => {
    if (!bannedNotice) return
    toast(bannedNotice, 'error')
    clearBannedNotice()
  }, [bannedNotice, clearBannedNotice, toast])

  return (
    <div className="flex min-h-screen flex-col bg-cream-50">
      <Navbar />
      <main className="mx-auto w-full max-w-6xl flex-1 px-4 py-6">
        <Outlet />
      </main>
      <Footer />
    </div>
  )
}
