<template>
  <div class="bg-white rounded-xl shadow-md overflow-hidden hover:shadow-xl transition-shadow duration-300 border border-gray-100">
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
          @click="$emit('show-details', plant)"
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
</template>

<script setup lang="ts">
import type { Database } from '@/types/supabase'

type Plant = Database['public']['Tables']['plants']['Row']

defineProps<{
  plant: Plant
}>()

defineEmits<{
  (e: 'show-details', plant: Plant): void
}>()
</script>