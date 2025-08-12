import { createClient } from '@supabase/supabase-js'

export default defineEventHandler(async (event) => {
  try {
    const body = await readBody(event)
    const { email, password } = body

    // Validation
    if (!email || !password) {
      throw createError({
        statusCode: 400,
        statusMessage: 'Email ve password gerekli'
      })
    }

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

    // Kullanıcı girişi
    const { data: authData, error: authError } = await supabase.auth.signInWithPassword({
      email,
      password
    })

    if (authError) {
      throw createError({
        statusCode: 400,
        statusMessage: authError.message
      })
    }

    if (authData.user) {
      // Kullanıcı profilini al
      const { data: userData, error: profileError } = await supabase
        .from('users')
        .select('*')
        .eq('id', authData.user.id)
        .single()

      if (profileError) {
        console.warn('Profil bilgisi alınamadı:', profileError.message)
      }

      return {
        success: true,
        message: 'Giriş başarılı!',
        data: {
          user: userData || authData.user,
          session: authData.session
        }
      }
    }

    throw createError({
      statusCode: 500,
      statusMessage: 'Giriş işlemi başarısız'
    })

  } catch (error: any) {
    console.error('Login error:', error)
    
    if (error.statusCode) {
      throw error
    }

    throw createError({
      statusCode: 500,
      statusMessage: 'Giriş işlemi başarısız: ' + error.message
    })
  }
})
