export default defineEventHandler(async (event) => {
  try {
    const config = useRuntimeConfig()
    
    const response = await $fetch('/rest/v1/plants', {
      baseURL: config.public.supabaseUrl,
      headers: {
        'apikey': config.public.supabaseAnonKey,
        'Authorization': `Bearer ${config.public.supabaseAnonKey}`
      }
    })

    return { plants: response }
  } catch (error) {
    console.error('Plants fetch error:', error)
    throw createError({
      statusCode: 500,
      statusMessage: 'Plants fetch failed',
      data: error
    })
  }
})

