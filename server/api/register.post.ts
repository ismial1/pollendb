import { createClient } from '@supabase/supabase-js'

export default defineEventHandler(async (event) => {
  try {
    const body = await readBody(event)
    const { email, password, fullName } = body

    // Validation
    if (!email || !password || !fullName) {
      throw createError({
        statusCode: 400,
        statusMessage: 'Email, password ve full name gerekli'
      })
    }

    if (password.length < 8) {
      throw createError({
        statusCode: 400,
        statusMessage: 'Şifre en az 8 karakter olmalı'
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

    // Kullanıcı kaydı
    const { data: authData, error: authError } = await supabase.auth.signUp({
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
      // Kullanıcı profilini oluştur
      const { error: profileError } = await supabase.from('users').insert({
        id: authData.user.id,
        email: authData.user.email!,
        full_name: fullName,
        role: 'user'
      })

      if (profileError) {
        throw createError({
          statusCode: 500,
          statusMessage: 'Profil oluşturulamadı: ' + profileError.message
        })
      }
    }

    return {
      success: true,
      message: 'Kayıt başarılı! Email adresinizi kontrol edin.',
      data: authData
    }

  } catch (error: any) {
    console.error('Register error:', error)
    
    if (error.statusCode) {
      throw error
    }

    throw createError({
      statusCode: 500,
      statusMessage: 'Kayıt işlemi başarısız: ' + error.message
    })
  }
})
