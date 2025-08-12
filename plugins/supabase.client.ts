import { useSupabaseStore } from '~/store/supabase'

export default defineNuxtPlugin((nuxtApp) => {
  // Only run on client side
  if (process.server) return
  
  // Use nextTick to ensure client-side execution
  nuxtApp.hook('app:mounted', async () => {
    const supabaseStore = useSupabaseStore()
    
    // Check auth state on app start
    await supabaseStore.checkAuth()
    
    // Listen for auth state changes
    const { supabase } = useSupabase()
    supabase.auth.onAuthStateChange(async (event: string, session: any) => {
      if (event === 'SIGNED_IN' && session?.user) {
        // Get user profile
        const { data: userData } = await supabase.from('users').select('*').eq('id', session.user.id).single()
        supabaseStore.user = userData
        supabaseStore.session = session
      } else if (event === 'SIGNED_OUT') {
        supabaseStore.user = null
        supabaseStore.session = null
      }
    })
  })
  
  // Provide supabase to the app
  return {
    provide: {
      supabase: useSupabase()
    }
  }
})
