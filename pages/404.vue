<template>
  <div class="min-h-screen bg-gradient-to-br from-gray-50 to-purple-50 py-12">
    <div class="max-w-4xl mx-auto text-center px-4">
      <h1 class="text-6xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-purple-600 to-indigo-600 mb-4">
        404
      </h1>
      <p class="text-xl text-gray-600 mb-8">
        Aradığınız sayfa bulunamadı
      </p>
      <button 
        @click="$router.push('/')"
        class="px-6 py-3 bg-purple-600 text-white rounded-lg hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-purple-500 focus:ring-offset-2 transition-colors duration-200"
      >
        Ana Sayfaya Dön
      </button>
    </div>
  </div>
</template>

<script setup lang="ts">
// Script kısmı boş kalabilir
</script> 