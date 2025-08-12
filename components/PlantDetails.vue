<template>
  <div class="fixed inset-0 z-50 overflow-y-auto">
    <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
      <div class="fixed inset-0 transition-opacity bg-gray-500 bg-opacity-75" @click="$emit('close')"></div>

      <div class="inline-block w-full max-w-4xl p-6 my-8 overflow-hidden text-left align-middle transition-all transform bg-white shadow-xl rounded-2xl"
           @click.stop>
        <div class="flex items-center justify-between pb-3 border-b border-gray-200">
          <h3 class="text-2xl font-bold leading-6 text-gray-900">
            {{ plant.name }}
          </h3>
          <button 
            @click="$emit('close')"
            class="p-1 text-gray-400 hover:text-gray-500 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2 rounded-full"
          >
            <span class="sr-only">Kapat</span>
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>

        <!-- Fotoğraflar Bölümü -->
        <div v-if="allImages.length > 0" class="mt-6 mb-6">
          <h4 class="text-lg font-semibold text-gray-800 mb-4">Polen Fotoğrafları</h4>
          
          <!-- Tüm Fotoğraflar Grid -->
          <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
            <div v-for="(imageUrl, index) in allImages" :key="index" class="text-center">
              <img 
                :src="imageUrl" 
                :alt="`${plant.name} polen fotoğrafı ${index + 1}`"
                class="w-full h-32 object-cover rounded-lg shadow-md hover:shadow-lg transition-shadow cursor-pointer"
                @click="openImageModal(imageUrl)"
                @error="handleImageError"
              />
              <p class="text-xs text-gray-500 mt-2">Fotoğraf {{ index + 1 }}</p>
            </div>
          </div>
        </div>

        <div class="mt-4">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
            <!-- Ana Özellikler -->
            <div class="bg-purple-50 p-4 rounded-lg">
              <h4 class="text-lg font-semibold text-purple-800 mb-3">Ana Özellikler</h4>
              <div class="space-y-2">
                <div class="flex items-center">
                  <span class="text-sm font-medium text-gray-500 w-32">Polen Birimi:</span>
                  <span class="text-sm text-gray-900">{{ plant.pollen_unit }}</span>
                </div>
                <div class="flex items-center">
                  <span class="text-sm font-medium text-gray-500 w-32">Dağılım:</span>
                  <span class="text-sm text-gray-900">{{ plant.dispersal_unit }}</span>
                </div>
                <div class="flex items-center">
                  <span class="text-sm font-medium text-gray-500 w-32">Polen Sınıfı:</span>
                  <span class="text-sm text-gray-900">{{ plant.pollen_class }}</span>
                </div>
              </div>
            </div>

            <!-- Fiziksel Özellikler -->
            <div class="bg-blue-50 p-4 rounded-lg">
              <h4 class="text-lg font-semibold text-blue-800 mb-3">Fiziksel Özellikler</h4>
              <div class="space-y-2">
                <div class="flex items-center">
                  <span class="text-sm font-medium text-gray-500 w-32">Boyut:</span>
                  <span class="text-sm text-gray-900">{{ plant.size }}</span>
                </div>
                <div class="flex items-center">
                  <span class="text-sm font-medium text-gray-500 w-32">Şekil:</span>
                  <span class="text-sm text-gray-900">{{ plant.shape }}</span>
                </div>
                <div class="flex items-center">
                  <span class="text-sm font-medium text-gray-500 w-32">Polarite:</span>
                  <span class="text-sm text-gray-900">{{ plant.polarity }}</span>
                </div>
              </div>
            </div>

            <!-- Apertur Özellikleri -->
            <div class="bg-green-50 p-4 rounded-lg">
              <h4 class="text-lg font-semibold text-green-800 mb-3">Apertur Özellikleri</h4>
              <div class="space-y-2">
                <div class="flex items-center">
                  <span class="text-sm font-medium text-gray-500 w-32">Apertur Sayısı:</span>
                  <span class="text-sm text-gray-900">{{ plant.aperture_number }}</span>
                </div>
                <div class="flex items-center">
                  <span class="text-sm font-medium text-gray-500 w-32">Apertur Tipi:</span>
                  <span class="text-sm text-gray-900">{{ plant.aperture_type }}</span>
                </div>
              </div>
            </div>

            <!-- Diğer Özellikler -->
            <div class="bg-yellow-50 p-4 rounded-lg">
              <h4 class="text-lg font-semibold text-yellow-800 mb-3">Diğer Özellikler</h4>
              <div class="space-y-2">
                <div class="flex items-center">
                  <span class="text-sm font-medium text-gray-500 w-32">Ornamantasyon:</span>
                  <span class="text-sm text-gray-900">{{ plant.ornamentation_lm }}</span>
                </div>
                <div class="flex items-center">
                  <span class="text-sm font-medium text-gray-500 w-32">Tektum:</span>
                  <span class="text-sm text-gray-900">{{ plant.tectum }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="mt-6 flex justify-end">
          <button
            @click="$emit('close')"
            class="inline-flex items-center px-4 py-2 text-sm font-medium text-white bg-purple-600 rounded-lg hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500 transition-colors duration-200"
          >
            Kapat
          </button>
        </div>
      </div>
    </div>

    <!-- Büyük Fotoğraf Modal -->
    <div v-if="selectedImage" class="fixed inset-0 z-60 overflow-y-auto" @click="closeImageModal">
      <div class="flex items-center justify-center min-h-screen px-4 pt-4 pb-20 text-center sm:block sm:p-0">
        <div class="fixed inset-0 transition-opacity bg-black bg-opacity-90"></div>
        <div class="inline-block w-full max-w-6xl p-6 my-8 overflow-hidden text-center align-middle transition-all transform">
          <div class="flex justify-center items-center">
            <img 
              :src="selectedImage" 
              alt="Büyük fotoğraf görünümü"
              class="w-full h-[600px] object-contain rounded-lg shadow-2xl"
            />
          </div>
          <div class="mt-6 text-center">
            <button
              @click="closeImageModal"
              class="inline-flex items-center px-6 py-3 text-base font-medium text-white bg-gray-600 rounded-lg hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500 transition-colors duration-200"
            >
              Kapat
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import type { Database } from '@/types/supabase'

type Plant = Database['public']['Tables']['plants']['Row']

const props = defineProps<{
  plant: Plant
}>()

defineEmits<{
  (e: 'close'): void
}>()

// Büyük fotoğraf modal için
const selectedImage = ref<string | null>(null)

// Tüm fotoğrafları birleştir
const allImages = computed(() => {
  const images = []
  
  // Ana fotoğraf varsa ekle
  if (props.plant.image_url) {
    images.push(props.plant.image_url)
  }
  
  // Diğer fotoğraflar varsa ekle
  if (props.plant.images && props.plant.images.length > 0) {
    images.push(...props.plant.images)
  }
  
  return images
})

// Fotoğraf yükleme hatası durumunda
const handleImageError = (event: Event) => {
  const img = event.target as HTMLImageElement
  img.style.display = 'none'
}

// Büyük fotoğraf modal'ını aç
const openImageModal = (imageUrl: string) => {
  selectedImage.value = imageUrl
}

// Büyük fotoğraf modal'ını kapat (sadece modal kapanır, detay sayfası açık kalır)
const closeImageModal = () => {
  selectedImage.value = null
}
</script> 