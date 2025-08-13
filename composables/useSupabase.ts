import { createClient } from '@supabase/supabase-js'

// Singleton pattern - tek bir Supabase instance
let supabaseInstance: any = null

export const useSupabase = () => {
  // Eğer instance zaten varsa, onu kullan
  if (supabaseInstance) {
    return {
      supabase: supabaseInstance,
      // Auth helpers
      auth: {
        signUp: (email: string, password: string) => 
          supabaseInstance.auth.signUp({ email, password }),
        signIn: (email: string, password: string) => 
          supabaseInstance.auth.signInWithPassword({ email, password }),
        signOut: () => supabaseInstance.auth.signOut(),
        getUser: () => supabaseInstance.auth.getUser(),
        onAuthStateChange: (callback: any) => 
          supabaseInstance.auth.onAuthStateChange(callback)
      },
      // Database helpers
      db: {
        // Plants table
        getPlants: () => supabaseInstance.from('plants').select('*'),
        getPlantById: (id: number) => supabaseInstance.from('plants').select('*').eq('id', id).single(),
        createPlant: (plant: any) => supabaseInstance.from('plants').insert(plant),
        updatePlant: (id: number, plant: any) => supabaseInstance.from('plants').update(plant).eq('id', id),
        deletePlant: (id: number) => supabaseInstance.from('plants').delete().eq('id', id),
        
        // Users table
        getUsers: () => supabaseInstance.from('users').select('*'),
        getUserById: (id: string) => supabaseInstance.from('users').select('*').eq('id', id).single(),
        updateUser: (id: string, user: any) => supabaseInstance.from('users').update(user).eq('id', id),
        
        // Submissions table
        getSubmissions: () => supabaseInstance.from('submissions').select('*'),
        createSubmission: (submission: any) => supabaseInstance.from('submissions').insert(submission),
        updateSubmission: (id: number, submission: any) => supabaseInstance.from('submissions').update(submission).eq('id', id),
        
        // Messages table
        getMessages: () => supabaseInstance.from('messages').select('*'),
        createMessage: (message: any) => supabaseInstance.from('messages').insert(message),
      }
    }
  }

  const config = useRuntimeConfig()
  const supabaseUrl = config.public.supabaseUrl
  const supabaseKey = config.public.supabaseAnonKey
  

  
  if (!supabaseUrl || !supabaseKey) {
    if (process.client) {
      console.error('Environment variables not found:', {
        supabaseUrl: !!supabaseUrl,
        supabaseKey: !!supabaseKey,
        config: config.public
      })
    }
    throw new Error('Missing Supabase environment variables')
  }

  // Yeni instance oluştur ve sakla
  supabaseInstance = createClient(supabaseUrl as string, supabaseKey as string, {
    auth: {
      storage: process.client ? window.localStorage : undefined,
      autoRefreshToken: true,
      persistSession: true,
      detectSessionInUrl: true
    }
  })
  
  return {
    supabase: supabaseInstance,
    // Auth helpers
    auth: {
      signUp: (email: string, password: string) => 
        supabaseInstance.auth.signUp({ email, password }),
      signIn: (email: string, password: string) => 
        supabaseInstance.auth.signInWithPassword({ email, password }),
      signOut: () => supabaseInstance.auth.signOut(),
      getUser: () => supabaseInstance.auth.getUser(),
      onAuthStateChange: (callback: any) => 
        supabaseInstance.auth.onAuthStateChange(callback)
    },
    // Database helpers
    db: {
      // Plants table
      getPlants: () => supabaseInstance.from('plants').select('*'),
      getPlantById: (id: number) => supabaseInstance.from('plants').select('*').eq('id', id).single(),
      createPlant: (plant: any) => supabaseInstance.from('plants').insert(plant),
      updatePlant: (id: number, plant: any) => supabaseInstance.from('plants').update(plant).eq('id', id),
      deletePlant: (id: number) => supabaseInstance.from('plants').delete().eq('id', id),
      
      // Users table
      getUsers: () => supabaseInstance.from('users').select('*'),
      getUserById: (id: string) => supabaseInstance.from('users').select('*').eq('id', id).single(),
      updateUser: (id: string, user: any) => supabaseInstance.from('users').update(user).eq('id', id),
      
      // Submissions table
      getSubmissions: () => supabaseInstance.from('submissions').select('*'),
      createSubmission: (submission: any) => supabaseInstance.from('submissions').insert(submission),
      updateSubmission: (id: number, submission: any) => supabaseInstance.from('submissions').update(submission).eq('id', id),
      
      // Messages table
      getMessages: () => supabaseInstance.from('messages').select('*'),
      createMessage: (message: any) => supabaseInstance.from('messages').insert(message),
    }
  }
}
