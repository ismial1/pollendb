<template>
  <div class="min-h-screen bg-gradient-to-br from-gray-50 to-purple-50 py-12">
    <!-- Başlık -->
    <div class="max-w-4xl mx-auto text-center mb-12 px-4">
      <h1 class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-purple-600 to-indigo-600 mb-4">
        Taksonomik Arama
      </h1>
      <p class="text-lg text-gray-600">
        Bitkileri taksonomik sınıflandırmaya göre keşfedin
      </p>
    </div>

    <!-- Ana İçerik -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="bg-white rounded-2xl shadow-xl overflow-hidden border border-gray-100">
        <!-- Filtreler -->
        <div class="p-6 bg-gradient-to-r from-purple-50 to-indigo-50 border-b border-gray-200">
          <div class="max-w-3xl mx-auto space-y-6">
            <!-- Order ve Family Dropdown'ları -->
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
              <div class="space-y-2">
                <label class="block text-sm font-medium text-gray-700">Order</label>
                <div class="relative">
                  <select 
                    v-model="selectedOrder"
                    class="block w-full pl-4 pr-10 py-3 text-base border-gray-300 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-purple-500 rounded-xl transition-all duration-200"
                  >
                    <option value="">Tüm Order'lar</option>
                    <option v-for="order in Object.keys(orderFamilyMap)" :key="order" :value="order">
                      {{ order }}
                    </option>
                  </select>
                  <div class="absolute inset-y-0 right-0 flex items-center px-2 pointer-events-none">
                    <svg class="h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </div>
                </div>
              </div>

              <div class="space-y-2">
                <label class="block text-sm font-medium text-gray-700">Family</label>
                <div class="relative">
                  <select 
                    v-model="selectedFamily"
                    class="block w-full pl-4 pr-10 py-3 text-base border-gray-300 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:border-purple-500 rounded-xl transition-all duration-200"
                  >
                    <option value="">Tüm Family'ler</option>
                    <option v-for="family in availableFamilies" :key="family" :value="family">
                      {{ family }}
                    </option>
                  </select>
                  <div class="absolute inset-y-0 right-0 flex items-center px-2 pointer-events-none">
                    <svg class="h-5 w-5 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd" />
                    </svg>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Sonuçlar -->
        <div class="p-6">
          <div v-if="selectedOrder || selectedFamily" class="space-y-6">
            <div class="flex justify-center">
              <div class="w-full">
                <div v-if="filteredPlants && filteredPlants.length > 0" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4">
                  <PlantCard
                    v-for="plant in filteredPlants"
                    :key="plant.id"
                    :plant="plant"
                    @show-details="showPlantDetails"
                  />
                </div>
                
                <!-- Sonuç bulunamadı mesajı -->
                <div v-else class="text-center py-12">
                  <div class="inline-flex items-center justify-center p-4 bg-yellow-50 rounded-lg">
                    <svg class="w-6 h-6 text-yellow-400 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                    </svg>
                    <p class="text-sm text-yellow-700">Aradığınız kriterlere uygun bitki bulunamadı.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Filtre seçilmediğinde gösterilecek mesaj -->
          <div v-else class="text-center py-12">
            <p class="text-gray-500">Filtreleme yapmak için Order veya Family seçin.</p>
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
import type { Database } from '@/types/supabase'

type Plant = Database['public']['Tables']['plants']['Row']
import { ref, computed, onMounted } from 'vue'
import PlantDetails from '@/components/PlantDetails.vue'
import PlantCard from '@/components/PlantCard.vue'
import { useSupabaseStore } from '~/store/supabase'

const supabaseStore = useSupabaseStore()

// Interface tanımı
interface OrderFamilyMap {
  [key: string]: string[]
}

// State
const isLoading = ref(false)
const error = ref('')

const selectedOrder = ref('')
const selectedFamily = ref('')
const selectedPlant = ref<Plant | null>(null)

// Order - Family eşleşmeleri
const orderFamilyMap: OrderFamilyMap = {
  'Asterales': ['Asteraceae', 'Campanulaceae'],
  'Lamiales': ['Lamiaceae', 'Plantaginaceae', 'Oleaceae'],
  'Rosales': ['Rosaceae', 'Moraceae'],
  'Liliales': ['Liliaceae', 'Colchicaceae'],
  'Asparagales': ['Orchidaceae', 'Asparagaceae', 'Amaryllidaceae']
}



// Seçili Order'a göre kullanılabilir Family'ler
const availableFamilies = computed(() => {
  if (!supabaseStore.plants || supabaseStore.plants.length === 0) {
    return []
  }
  
  if (!selectedOrder.value) {
    const families = supabaseStore.plants
      .map(plant => plant.family)
      .filter(Boolean) // null/undefined değerleri filtrele
    return [...new Set(families)]
  }
  
  return orderFamilyMap[selectedOrder.value] || []
})

// Filtrelenmiş bitkiler
const filteredPlants = computed(() => {
  if (!supabaseStore.plants || supabaseStore.plants.length === 0) {
    return []
  }
  
  return supabaseStore.plants.filter(plant => {
    if (!plant || !plant.family) return false
    
    const matchesOrder = !selectedOrder.value || 
      (orderFamilyMap[selectedOrder.value] || []).includes(plant.family)
    
    const matchesFamily = !selectedFamily.value || 
      plant.family === selectedFamily.value

    return matchesOrder && matchesFamily
  })
})

// Bitki detaylarını göster
const showPlantDetails = (plant: Plant) => {
  selectedPlant.value = plant
}

// Bitki detaylarını kapat
const closePlantDetails = () => {
  selectedPlant.value = null
}

// Supabase'den veri çekme
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
    console.error('Veri çekme hatası:', err)
  } finally {
    isLoading.value = false
  }
}

onMounted(() => {
  fetchPlants()
})
</script>
  
 
  