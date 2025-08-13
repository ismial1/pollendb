import { defineStore } from 'pinia'
import type { Database } from '~/types/supabase'

type Plant = Database['public']['Tables']['plants']['Row']
type User = Database['public']['Tables']['users']['Row']
type Submission = Database['public']['Tables']['submissions']['Row']
type Message = Database['public']['Tables']['messages']['Row']

export const useSupabaseStore = defineStore('supabase', () => {
  // Composable'ları setup function içinde kullan
  const { supabase } = useSupabase()
  
  // State
  const user = ref<User | null>(null)
  const session = ref<any>(null)
  const plants = ref<Plant[]>([])
  const submissions = ref<Submission[]>([])
  const messages = ref<Message[]>([])
  
  const loading = ref({
    plants: false,
    submissions: false,
    messages: false,
    auth: false
  })
  
  const error = ref<string | null>(null)
  
  // Getters
  const isAuthenticated = computed(() => !!user.value)
  const isAdmin = computed(() => user.value?.role === 'admin')
  const getPlantById = computed(() => (id: number) => plants.value.find(plant => plant.id === id))
  const getUserSubmissions = computed(() => submissions.value.filter(sub => sub.user_id === user.value?.id))
  
  // Options state
  const options = ref({
    families: [] as any[],
    pollen_units: [] as any[],
    dispersal_units: [] as any[],
    pollen_classes: [] as any[],
    pollen_sizes: [] as any[],
    hydrated_sizes: [] as any[],
    polarities: [] as any[],
    shapes: [] as any[],
    outlines: [] as any[],
    pe_ratios: [] as any[],
    orientations: [] as any[],
    aperture_numbers: [] as any[],
    aperture_types: [] as any[],
    aperture_conditions: [] as any[],
    aperture_peculiarities: [] as any[],
    wall_thicknesses: [] as any[],
    tectum_types: [] as any[],
    infratectum_types: [] as any[],
    foot_layer_types: [] as any[],
    nexine_types: [] as any[],
    sexine_types: [] as any[],
    ornamentation_types: [] as any[],
    coating_types: [] as any[],
    lm_types: [] as any[],
    wall_structure_types: [] as any[]
  })

  // Actions
  const signUp = async (email: string, password: string, fullName: string) => {
    loading.value.auth = true
    error.value = null
    
    try {
      const { data, error: signUpError } = await supabase.auth.signUp({ email, password })
      
      if (signUpError) throw signUpError
      
      if (data.user) {
        // Create user profile
        await supabase.from('users').insert({
          id: data.user.id,
          email: data.user.email!,
          full_name: fullName,
          role: 'user'
        })
      }
      
      return { success: true, data }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    } finally {
      loading.value.auth = false
    }
  }
  
  const signIn = async (email: string, password: string) => {
    loading.value.auth = true
    error.value = null
    
    try {
      const { data, error: signInError } = await supabase.auth.signInWithPassword({ email, password })
      
      if (signInError) throw signInError
      
      if (data.user) {
        // Get user profile
        const { data: userData } = await supabase.from('users').select('*').eq('id', data.user.id).single()
        user.value = userData
      }
      
      session.value = data.session
      return { success: true, data }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    } finally {
      loading.value.auth = false
    }
  }
  
  const signOut = async () => {
    try {
      await supabase.auth.signOut()
      user.value = null
      session.value = null
      return { success: true }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    }
  }
  
  const checkAuth = async () => {
    // Only run on client side
    if (process.server) return
    
    try {
      const { data: { user: supabaseUser } } = await supabase.auth.getUser()
      
      if (supabaseUser) {
        const { data: userData } = await supabase.from('users').select('*').eq('id', supabaseUser.id).single()
        user.value = userData
      }
    } catch (err: any) {
      console.error('Auth check error:', err)
    }
  }
  
  const fetchPlants = async () => {
    loading.value.plants = true
    error.value = null
    
    try {
      const { data, error: fetchError } = await supabase.from('plants').select('*')
      
      if (fetchError) throw fetchError
      
      plants.value = data || []
      return { success: true, data }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    } finally {
      loading.value.plants = false
    }
  }
  
  const createPlant = async (plantData: Partial<Plant>) => {
    error.value = null
    
    try {
      const { data, error: createError } = await supabase.from('plants').insert(plantData)
      
      if (createError) throw createError
      
      if (data) {
        plants.value.push(data[0])
      }
      
      return { success: true, data }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    }
  }
  
  const updatePlant = async (id: number, plantData: Partial<Plant>) => {
    error.value = null
    
    try {
      const { data, error: updateError } = await supabase.from('plants').update(plantData).eq('id', id)
      
      if (updateError) throw updateError
      
      if (data) {
        const index = plants.value.findIndex(p => p.id === id)
        if (index !== -1) {
          plants.value[index] = data[0]
        }
      }
      
      return { success: true, data }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    }
  }
  
  const fetchSubmissions = async () => {
    loading.value.submissions = true
    error.value = null
    
    try {
      const { data, error: fetchError } = await supabase.from('submissions').select('*')
      
      if (fetchError) throw fetchError
      
      submissions.value = data || []
      return { success: true, data }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    } finally {
      loading.value.submissions = false
    }
  }
  
  const createSubmission = async (submissionData: any) => {
    error.value = null
    
    try {
      const { data, error: createError } = await supabase.from('submissions').insert({
        ...submissionData,
        user_id: user.value?.id
      })
      
      if (createError) throw createError
      
      if (data) {
        submissions.value.push(data[0])
      }
      
      return { success: true, data }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    }
  }
  
  const fetchMessages = async () => {
    loading.value.messages = true
    error.value = null
    
    try {
      const { data, error: fetchError } = await supabase.from('messages').select('*')
      
      if (fetchError) throw fetchError
      
      messages.value = data || []
      return { success: true, data }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    } finally {
      loading.value.messages = false
    }
  }
  
  const createMessage = async (messageData: Partial<Message>) => {
    error.value = null
    
    try {
      const { data, error: createError } = await supabase.from('messages').insert(messageData)
      
      if (createError) throw createError
      
      return { success: true, data }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    }
  }
  
  const uploadImage = async (file: File, fileName: string) => {
    error.value = null
    
    try {
      // Önce bucket'ı kontrol et
      const { data: buckets, error: bucketError } = await supabase.storage.listBuckets()
      if (bucketError) {
        console.error('Bucket list error:', bucketError)
        throw bucketError
      }
      
      // plants bucket'ı var mı kontrol et
      const plantsBucket = buckets.find((bucket: any) => bucket.name === 'plants')
      if (!plantsBucket) {
        console.error('Plants bucket not found')
        throw new Error('Plants bucket not found')
      }
      
      // Resmi Storage'a yükle
      const { data, error: uploadError } = await supabase.storage
        .from('plants')
        .upload(fileName, file, {
          cacheControl: '3600',
          upsert: false
        })
      
      if (uploadError) {
        console.error('Storage upload error:', uploadError)
        throw uploadError
      }
      
      // Public URL'ini al
      const { data: urlData } = supabase.storage
        .from('plants')
        .getPublicUrl(fileName)
      
      return { success: true, url: urlData.publicUrl }
    } catch (err: any) {
      console.error('Image upload error:', err)
      error.value = err.message
      return { success: false, error: err.message }
    }
  }

  // Options actions
  const fetchOptions = async () => {
    try {
      // Fetch all options in parallel
      const [
        { data: familiesData },
        { data: pollenUnitsData },
        { data: dispersalUnitsData },
        { data: pollenClassesData },
        { data: pollenSizesData },
        { data: hydratedSizesData },
        { data: polaritiesData },
        { data: shapesData },
        { data: outlinesData },
        { data: peRatiosData },
        { data: orientationsData },
        { data: apertureNumbersData },
        { data: apertureTypesData },
        { data: apertureConditionsData },
        { data: aperturePeculiaritiesData },
        { data: wallThicknessesData },
        { data: tectumTypesData },
        { data: infratectumTypesData },
        { data: footLayerTypesData },
        { data: nexineTypesData },
        { data: sexineTypesData },
        { data: ornamentationTypesData },
        { data: coatingTypesData },
        { data: lmTypesData },
        { data: wallStructureTypesData }
      ] = await Promise.all([
        supabase.from('families').select('*').order('sort_order'),
        supabase.from('pollen_units').select('*').order('sort_order'),
        supabase.from('dispersal_units').select('*').order('sort_order'),
        supabase.from('pollen_classes').select('*').order('sort_order'),
        supabase.from('pollen_sizes').select('*').order('sort_order'),
        supabase.from('hydrated_sizes').select('*').order('sort_order'),
        supabase.from('polarities').select('*').order('sort_order'),
        supabase.from('shapes').select('*').order('sort_order'),
        supabase.from('outlines').select('*').order('sort_order'),
        supabase.from('pe_ratios').select('*').order('sort_order'),
        supabase.from('orientations').select('*').order('sort_order'),
        supabase.from('aperture_numbers').select('*').order('sort_order'),
        supabase.from('aperture_types').select('*').order('sort_order'),
        supabase.from('aperture_conditions').select('*').order('sort_order'),
        supabase.from('aperture_peculiarities').select('*').order('sort_order'),
        supabase.from('wall_thicknesses').select('*').order('sort_order'),
        supabase.from('tectum_types').select('*').order('sort_order'),
        supabase.from('infratectum_types').select('*').order('sort_order'),
        supabase.from('foot_layer_types').select('*').order('sort_order'),
        supabase.from('nexine_types').select('*').order('sort_order'),
        supabase.from('sexine_types').select('*').order('sort_order'),
        supabase.from('ornamentation_types').select('*').order('sort_order'),
        supabase.from('coating_types').select('*').order('sort_order'),
        supabase.from('lm_types').select('*').order('sort_order'),
        supabase.from('wall_structure_types').select('*').order('sort_order')
      ])

      options.value = {
        families: familiesData || [],
        pollen_units: pollenUnitsData || [],
        dispersal_units: dispersalUnitsData || [],
        pollen_classes: pollenClassesData || [],
        pollen_sizes: pollenSizesData || [],
        hydrated_sizes: hydratedSizesData || [],
        polarities: polaritiesData || [],
        shapes: shapesData || [],
        outlines: outlinesData || [],
        pe_ratios: peRatiosData || [],
        orientations: orientationsData || [],
        aperture_numbers: apertureNumbersData || [],
        aperture_types: apertureTypesData || [],
        aperture_conditions: apertureConditionsData || [],
        aperture_peculiarities: aperturePeculiaritiesData || [],
        wall_thicknesses: wallThicknessesData || [],
        tectum_types: tectumTypesData || [],
        infratectum_types: infratectumTypesData || [],
        foot_layer_types: footLayerTypesData || [],
        nexine_types: nexineTypesData || [],
        sexine_types: sexineTypesData || [],
        ornamentation_types: ornamentationTypesData || [],
        coating_types: coatingTypesData || [],
        lm_types: lmTypesData || [],
        wall_structure_types: wallStructureTypesData || []
      }

      return { success: true }
    } catch (err: any) {
      error.value = err.message
      return { success: false, error: err.message }
    }
  }

  const getOptionsByCategory = (tableName: string, category: string) => {
    const tableMap: { [key: string]: any[] } = {
      'families': options.value.families,
      'pollen_units': options.value.pollen_units,
      'dispersal_units': options.value.dispersal_units,
      'pollen_classes': options.value.pollen_classes,
      'pollen_sizes': options.value.pollen_sizes,
      'hydrated_sizes': options.value.hydrated_sizes,
      'polarities': options.value.polarities,
      'shapes': options.value.shapes,
      'outlines': options.value.outlines,
      'pe_ratios': options.value.pe_ratios,
      'orientations': options.value.orientations,
      'aperture_numbers': options.value.aperture_numbers,
      'aperture_types': options.value.aperture_types,
      'aperture_conditions': options.value.aperture_conditions,
      'aperture_peculiarities': options.value.aperture_peculiarities,
      'wall_thicknesses': options.value.wall_thicknesses,
      'tectum_types': options.value.tectum_types,
      'infratectum_types': options.value.infratectum_types,
      'foot_layer_types': options.value.foot_layer_types,
      'nexine_types': options.value.nexine_types,
      'sexine_types': options.value.sexine_types,
      'ornamentation_types': options.value.ornamentation_types,
      'coating_types': options.value.coating_types,
      'lm_types': options.value.lm_types,
      'wall_structure_types': options.value.wall_structure_types
    }

    const tableData = tableMap[tableName] || []
    return tableData
  }
  
  return {
    // State
    user,
    session,
    plants,
    submissions,
    messages,
    options,
    loading,
    error,
    
    // Getters
    isAuthenticated,
    isAdmin,
    getPlantById,
    getUserSubmissions,
    
    // Actions
    signUp,
    signIn,
    signOut,
    checkAuth,
    fetchPlants,
    createPlant,
    updatePlant,
    fetchSubmissions,
    createSubmission,
    fetchMessages,
    createMessage,
    uploadImage,
    fetchOptions,
    getOptionsByCategory
  }
})
