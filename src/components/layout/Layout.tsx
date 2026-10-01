import { useEffect } from 'react'
import { Outlet } from 'react-router-dom'
import { Navbar } from './Navbar'
import { Footer } from './Footer'
import { PanchangBar } from './PanchangBar'
import { AmbientBackground } from './AmbientBackground'
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
    <div className="flex min-h-screen flex-col bg-cream-50 print:bg-white">
      <div className="print:hidden">
        <AmbientBackground />
        <PanchangBar />
        <Navbar />
      </div>
      <main className="mx-auto w-full max-w-6xl flex-1 px-4 py-6 print:max-w-none print:p-0">
        <Outlet />
      </main>
      <div className="print:hidden">
        <Footer />
      </div>
    </div>
  )
}
