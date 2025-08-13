<template>
  <div class="flex h-screen bg-gray-100">
    <!-- Sol Menü -->
    <aside class="fixed inset-y-0 left-0 w-64 bg-white shadow-lg z-10">
      <!-- Logo/Başlık -->
      <div class="h-16 flex items-center justify-center bg-indigo-600">
        <h1 class="text-white text-xl font-bold">Admin Panel</h1>
      </div>

      <!-- Menü Öğeleri -->
      <nav class="mt-6 px-4">
        <NuxtLink to="/admin" 
          class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-100 rounded-lg mb-2"
          :class="{ 'bg-gray-100': $route.path === '/admin' }">
          <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
          </svg>
          Dashboard
        </NuxtLink>

        <NuxtLink to="/admin/users" 
          class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-100 rounded-lg mb-2"
          :class="{ 'bg-gray-100': $route.path === '/admin/users' }">
          <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
          </svg>
          Kullanıcılar
        </NuxtLink>

        <NuxtLink v-if="isSuperAdmin" to="/admin/submissions" 
          class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-100 rounded-lg mb-2"
          :class="{ 'bg-gray-100': $route.path === '/admin/submissions' }">
          <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
          </svg>
          Veri Onayları (Süper Admin)
        </NuxtLink>

        <NuxtLink to="/admin/messages" 
          class="flex items-center px-4 py-3 text-gray-700 hover:bg-gray-100 rounded-lg mb-2"
          :class="{ 'bg-gray-100': $route.path === '/admin/messages' }">
          <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
          </svg>
          Mesajlar
        </NuxtLink>
      </nav>
    </aside>

    <!-- Ana İçerik -->
    <main class="flex-1 ml-64">
      <!-- Üst Bar -->
      <header class="h-16 bg-white shadow-sm flex items-center justify-between px-6">
        <h2 class="text-xl font-semibold text-gray-800">Admin Dashboard</h2>
        
        <!-- Ana Sayfaya Dön Butonu -->
        <NuxtLink 
          to="/"
          class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 transition-colors duration-200"
        >
          <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
          </svg>
          Ana Sayfaya Dön
        </NuxtLink>
      </header>

      <!-- Sayfa İçeriği -->
      <div class="p-6">
        <slot />
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'

// Süper admin kontrolü
const isSuperAdmin = ref(false)

const checkSuperAdminStatus = () => {
  const userData = localStorage.getItem('user')
  if (userData) {
    try {
      const user = JSON.parse(userData)
      isSuperAdmin.value = user.role === 'admin'
    } catch (error) {
      console.error('User data parse error:', error)
      isSuperAdmin.value = false
    }
  } else {
    isSuperAdmin.value = false
  }
}

onMounted(() => {
  checkSuperAdminStatus()
})
</script>

<style>
/* Temel stiller */
body {
  margin: 0;
  padding: 0;
}

/* Sol menü için sabit genişlik */
.w-64 {
  width: 16rem;
}

/* Ana içerik için sol margin */
.ml-64 {
  margin-left: 16rem;
}
</style> 