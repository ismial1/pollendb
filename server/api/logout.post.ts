import { createClient } from '@supabase/supabase-js'

export default defineEventHandler(async (event) => {
  try {
    // Server-side Supabase client - Service Role Key kullanarak RLS bypass
    const config = useRuntimeConfig()
    const supabaseUrl = config.public.supabaseUrl
    const supabaseKey = config.supabaseServiceRoleKey || config.public.supabaseAnonKey
    
    if (!supabaseUrl || !supabaseKey) {
      throw createError({
        statusCode: 500,
        statusMessage: 'Supabase konfigürasyonu eksik'
      })
    }

    const supabase = createClient(supabaseUrl, supabaseKey, {
      auth: {
        autoRefreshToken: false,
        persistSession: false
      }
    })

    // Kullanıcı çıkışı
    const { error } = await supabase.auth.signOut()

    if (error) {
      throw createError({
        statusCode: 500,
        statusMessage: 'Çıkış işlemi başarısız: ' + error.message
      })
    }

    return {
      success: true,
      message: 'Çıkış başarılı!'
    }

  } catch (error: any) {
    console.error('Logout error:', error)
    
    if (error.statusCode) {
      throw error
    }

    throw createError({
      statusCode: 500,
      statusMessage: 'Çıkış işlemi başarısız: ' + error.message
    })
  }
})
