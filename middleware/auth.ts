import { useSupabaseStore } from '~/store/supabase'

export default defineNuxtRouteMiddleware((to, from) => {
  // Client-side'da localStorage kontrolü yap
  if (process.client) {
    const token = localStorage.getItem('token')
    const userData = localStorage.getItem('user')
    
    // Protected routes için authentication kontrolü
    if (to.path.startsWith('/admin') || to.path.startsWith('/profil') || to.path === '/submit-data') {
      if (!token || !userData) {
        // Giriş yapılmamışsa login sayfasına yönlendir
        return navigateTo('/auth/login')
      }
      
      // User data'yı parse et ve kontrol et
      try {
        const user = JSON.parse(userData)
        if (!user.id || !user.email) {
          throw new Error('Invalid user data')
        }
      } catch (error) {
        console.error('User data parse error:', error)
        // Bozuk user data varsa temizle ve login'e yönlendir
        localStorage.removeItem('token')
        localStorage.removeItem('user')
        return navigateTo('/auth/login')
      }
    }
    
    // Admin routes için admin kontrolü
    if (to.path.startsWith('/admin')) {
      try {
        const user = JSON.parse(userData || '{}')
        if (user.role !== 'admin') {
          return navigateTo('/')
        }
      } catch (error) {
        return navigateTo('/')
      }
    }
  }
}) 