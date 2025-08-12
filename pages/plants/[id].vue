<template>
  <div class="container mx-auto p-4">
    <div v-if="plant" class="max-w-2xl mx-auto bg-white rounded-lg shadow-lg p-6">
      <h1 class="text-2xl font-bold mb-4">{{ plant.name }}</h1>
      <img 
        :src="plant.image_url || '/images/pollen-1.jpg'" 
        :alt="plant.name" 
        class="w-full h-64 object-cover rounded-lg mb-4"
        @error="(event) => { event.target.src = '/images/pollen-1.jpg'; }"
      />
      <div class="space-y-2">
        <p><strong>Family:</strong> {{ plant.family }}</p>
        <p><strong>Pollen Unit:</strong> {{ plant.pollen_unit }}</p>
        <p><strong>Dispersal Unit:</strong> {{ plant.dispersal_unit }}</p>
        <p><strong>Size:</strong> {{ plant.size }}</p>
        <p><strong>Shape:</strong> {{ plant.shape }}</p>
        <p><strong>Polarity:</strong> {{ plant.polarity }}</p>
        <p><strong>Aperture Number:</strong> {{ plant.aperture_number }}</p>
        <p><strong>Pollen Class:</strong> {{ plant.pollen_class }}</p>
        <p class="mt-4"><strong>Description:</strong> {{ plant.description }}</p>
      </div>
      <button 
        @click="goBack()" 
        class="mt-6 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
      >
        Geri Dön
      </button>
    </div>
    <div v-else class="max-w-2xl mx-auto bg-white rounded-lg shadow-lg p-6 text-center">
      <p class="text-gray-600">Bitki bulunamadı.</p>
      <button 
        @click="goBack()" 
        class="mt-4 px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
      >
        Geri Dön
      </button>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useSupabaseStore } from '~/store/supabase'

const route = useRoute()
const supabaseStore = useSupabaseStore()
const plant = ref(null)

onMounted(async () => {
  const plantId = parseInt(route.params.id)
  if (plantId) {
    plant.value = supabaseStore.plants.find(p => p.id === plantId)
  }
})

const goBack = () => {
  window.history.back()
}
</script> 