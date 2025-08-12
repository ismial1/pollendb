<template>
  <div class="min-h-screen bg-gradient-to-br from-gray-50 to-purple-50 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Başlık -->
      <div class="max-w-3xl mx-auto text-center mb-12">
        <h1 class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-purple-600 to-indigo-600 mb-4">
          Alfabetik Arama
        </h1>
        <p class="text-lg text-gray-600">
          Bitki adı veya özelliklerine göre alfabetik olarak arayın
        </p>
      </div>

      <!-- Arama Kısmı -->
      <div class="mb-12">
        <div class="max-w-2xl mx-auto">
          <div class="relative group">
            <div class="absolute inset-0 bg-purple-200 rounded-lg blur opacity-75 group-hover:opacity-100 transition duration-200"></div>
            <div class="relative">
              <input
                v-model="searchQuery"
                type="text"
                placeholder="Bitki adı veya özellik ara..."
                class="w-full px-4 py-3 rounded-lg border border-gray-300 focus:ring-2 focus:ring-purple-500 focus:border-purple-500 transition-colors duration-200"
              />
              <div class="absolute right-3 top-3 text-gray-400">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                </svg>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Bitkiler Listesi -->
      <div class="bg-white rounded-lg shadow-lg overflow-hidden">
        <div class="bg-gradient-to-r from-purple-600 to-purple-800 p-3">
          <h2 class="text-xl font-bold text-white text-center">
            {{ searchQuery ? 'Arama Sonuçları' : 'Tüm Bitkiler' }}
          </h2>
        </div>
        
        <!-- Loading State -->
        <div v-if="isLoading" class="p-6 text-center">
          <div class="animate-spin rounded-full h-12 w-12 border-b-2 border-purple-600 mx-auto"></div>
          <p class="mt-4 text-gray-600">Veriler yükleniyor...</p>
        </div>
        
        <!-- Error State -->
        <div v-else-if="error" class="p-6 text-center">
          <div class="text-red-500 mb-4">
            <svg class="w-12 h-12 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z" />
            </svg>
          </div>
          <p class="text-red-600 mb-4">{{ error }}</p>
          <button 
            @click="fetchPlants"
            class="px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700 transition-colors"
          >
            Tekrar Dene
          </button>
        </div>
        
        <!-- Plants List -->
        <div v-else class="p-6">
          <div v-if="sortedAndFilteredPlants.length" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            <div v-for="plant in sortedAndFilteredPlants" 
                 :key="plant.id" 
                 class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-xl transition-shadow duration-300 border border-gray-100">
              <!-- Bitki Resmi -->
              <div class="w-full h-48 bg-gray-200 overflow-hidden">
                <img 
                  :src="plant.image_url || '/images/pollen-1.jpg'" 
                  :alt="plant.name"
                  class="w-full h-full object-cover hover:scale-105 transition-transform duration-300"
                  @error="(event) => { const target = event.target as HTMLImageElement; target.src = '/images/pollen-1.jpg'; }"
                  @load="() => {}"
                />
              </div>
              
              <div class="p-6">
                <div class="flex items-center justify-between">
                  <h3 class="text-lg font-bold text-gray-900">{{ plant.name }}</h3>
                  <span class="px-3 py-1 text-sm font-semibold text-purple-600 bg-purple-100 rounded-full">
                    {{ plant.pollen_class }}
                  </span>
                </div>
                
                <div class="mt-4 grid grid-cols-2 gap-4">
                  <div class="space-y-2">
                    <p class="text-sm">
                      <span class="font-medium text-gray-500">Polen Birimi:</span>
                      <span class="ml-1 text-gray-900">{{ plant.pollen_unit }}</span>
                    </p>
                    <p class="text-sm">
                      <span class="font-medium text-gray-500">Dağılım:</span>
                      <span class="ml-1 text-gray-900">{{ plant.dispersal_unit }}</span>
                    </p>
                  </div>
                  <div class="space-y-2">
                    <p class="text-sm">
                      <span class="font-medium text-gray-500">Boyut:</span>
                      <span class="ml-1 text-gray-900">{{ plant.size }}</span>
                    </p>
                    <p class="text-sm">
                      <span class="font-medium text-gray-500">Şekil:</span>
                      <span class="ml-1 text-gray-900">{{ plant.shape }}</span>
                    </p>
                  </div>
                </div>
                

                <div class="mt-6 flex justify-end">
                  <button 
                    @click="showPlantDetails(plant)"
                    class="w-full inline-flex items-center justify-center px-4 py-2 text-sm font-medium text-white bg-purple-600 rounded-lg hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500 transition-colors duration-200"
                  >
                    Detayları Göster
                    <svg class="ml-2 -mr-1 w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
                    </svg>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <div v-else class="text-center py-8">
            <p class="text-gray-500">Aradığınız kriterlere uygun bitki bulunamadı.</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Plant Details Modal -->
    <PlantDetails
      v-if="selectedPlant"
      :plant="selectedPlant"
      @close="closePlantDetails"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import type { Database } from '@/types/supabase'

type Plant = Database['public']['Tables']['plants']['Row']
import PlantDetails from '@/components/PlantDetails.vue'
import { useSupabaseStore } from '~/store/supabase'

const supabaseStore = useSupabaseStore()
const selectedPlant = ref<Plant | null>(null)
const searchQuery = ref('')
const isLoading = ref(false)
const error = ref('')

// Supabase'den veri çek
const fetchPlants = async () => {
  try {
    isLoading.value = true
    error.value = ''
    
    const result = await supabaseStore.fetchPlants()
    if (!result.success) {
      throw new Error(result.error || 'Veri çekilemedi')
    }
    
  } catch (err) {
    error.value = (err as Error).message || 'Bir hata oluştu'
    console.error('Plants fetch error:', err)
  } finally {
    isLoading.value = false
  }
}

// Sayfa yüklendiğinde veri çek
onMounted(() => {
  fetchPlants()
})

// Alfabetik sıralama ve filtreleme
const sortedAndFilteredPlants = computed(() => {
  let filtered = searchQuery.value
    ? supabaseStore.plants.filter(plant => {
        const query = searchQuery.value.toLowerCase()
        return (
          plant.name?.toLowerCase().includes(query) ||
          plant.pollen_unit?.toLowerCase().includes(query) ||
          plant.dispersal_unit?.toLowerCase().includes(query) ||
          plant.pollen_class?.toLowerCase().includes(query) ||
          plant.size?.toLowerCase().includes(query) ||
          plant.polarity?.toLowerCase().includes(query) ||
          plant.shape?.toLowerCase().includes(query) ||
          plant.aperture_number?.toLowerCase().includes(query) ||
          plant.aperture_type?.toLowerCase().includes(query)
        )
      })
    : supabaseStore.plants

  // Alfabetik sıralama
  return filtered.sort((a, b) => a.name.localeCompare(b.name))
})

// Bitki detaylarını göster
const showPlantDetails = (plant: Plant) => {
  selectedPlant.value = plant
}

// Bitki detaylarını kapat
const closePlantDetails = () => {
  selectedPlant.value = null
}
</script>

