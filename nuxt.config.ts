// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },

  modules: ['@nuxtjs/tailwindcss', '@pinia/nuxt', '@nuxt/icon'],

  runtimeConfig: {
    // Server-side environment variables
    supabaseServiceRoleKey: process.env.SUPABASE_SERVICE_ROLE_KEY,
    
    // Public keys that are exposed to the client
    public: {
      supabaseUrl: process.env.NUXT_PUBLIC_SUPABASE_URL || 'https://xcuutkczmwhmslrhtnha.supabase.co',
      supabaseAnonKey: process.env.NUXT_PUBLIC_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhjdXV0a2N6bXdobXNscmh0bmhhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTQ4NTk5NDIsImV4cCI6MjA3MDQzNTk0Mn0._4q1kCKCHtMeqhiBFfJB5RxV0tJuC2XT_0a5bMlB93o',
    }
  },

  css: [
    '@/assets/css/main.css'
  ],

  components: {
    dirs: [
      '~/components'
    ]
  },

  typescript: {
    strict: true,
    typeCheck: true,
    shim: false
  },

  app: {
    // Global app yapılandırması
    pageTransition: { name: 'page', mode: 'out-in' }
  },

  // SSR settings
  ssr: true,
  nitro: {
    preset: 'vercel'
  },

  // Vercel için özel ayarlar
  experimental: {
    // Deneysel özellikleri etkinleştir
    componentIslands: true
  },

  // Route rules
  routeRules: {
    '/': { prerender: true },
    '/about': { prerender: true },
    '/contact': { prerender: true },
    '/faq': { prerender: true },
    '/links': { prerender: true },
    '/literature': { prerender: true },
    '/services': { prerender: true },
    '/submit-data': { prerender: true },
    '/search-data/**': { prerender: true }
  },

  compatibilityDate: '2025-01-17',

  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },

  pages: true, // pages klasöründeki dosyaların otomatik route oluşturması için
})