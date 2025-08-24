<template>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 to-purple-50">
    <!-- Mobil Overlay -->
    <div 
      v-if="isSidebarOpen && isMobile" 
      @click="toggleSidebar"
      class="fixed inset-0 bg-black bg-opacity-50 z-20 lg:hidden"
    ></div>

    <!-- Sol Menü -->
    <aside 
      :class="[
        'fixed inset-y-0 left-0 bg-white/90 backdrop-blur-sm shadow-xl z-30 transition-all duration-300 ease-in-out',
        isSidebarOpen ? 'w-64' : 'w-16',
        isMobile && !isSidebarOpen ? '-translate-x-full' : 'translate-x-0'
      ]"
    >
      <!-- Logo/Başlık -->
      <div class="h-16 flex items-center justify-center bg-gradient-to-r from-indigo-600 to-purple-600 relative">
        <!-- Toggle Button -->
        <button 
          @click="toggleSidebar"
          :class="[
            'bg-white/20 text-white rounded-full p-1.5 hover:bg-white/30 transition-all duration-200 backdrop-blur-sm',
            isSidebarOpen ? 'absolute left-3' : 'mx-auto'
          ]"
        >
          <svg v-if="isSidebarOpen" class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
          </svg>
          <svg v-else class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7" />
          </svg>
        </button>
        
        <h1 v-if="isSidebarOpen" class="text-white text-xl font-bold">Admin Panel</h1>
      </div>

      <!-- Menü Öğeleri -->
      <nav class="mt-6 px-4">
        <NuxtLink to="/admin" 
          class="flex items-center px-4 py-3 text-gray-700 hover:bg-indigo-50 hover:text-indigo-700 rounded-xl mb-2 transition-all duration-200 group"
          :class="{ 'bg-indigo-100 text-indigo-700 shadow-md': $route.path === '/admin' }"
          @click="isMobile && toggleSidebar()">
          <svg class="w-5 h-5 transition-all duration-200" :class="isSidebarOpen ? 'mr-3 group-hover:scale-110' : 'mx-auto'" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
          </svg>
          <span v-if="isSidebarOpen" class="font-medium">Dashboard</span>
        </NuxtLink>

        <NuxtLink to="/admin/users" 
          class="flex items-center px-4 py-3 text-gray-700 hover:bg-indigo-50 hover:text-indigo-700 rounded-xl mb-2 transition-all duration-200 group"
          :class="{ 'bg-indigo-100 text-indigo-700 shadow-md': $route.path === '/admin/users' }"
          @click="isMobile && toggleSidebar()">
          <svg class="w-5 h-5 transition-all duration-200" :class="isSidebarOpen ? 'mr-3 group-hover:scale-110' : 'mx-auto'" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z" />
          </svg>
          <span v-if="isSidebarOpen" class="font-medium">Kullanıcılar</span>
        </NuxtLink>

        <NuxtLink v-if="isSuperAdmin" to="/admin/submissions" 
          class="flex items-center px-4 py-3 text-gray-700 hover:bg-indigo-50 hover:text-indigo-700 rounded-xl mb-2 transition-all duration-200 group"
          :class="{ 'bg-indigo-100 text-indigo-700 shadow-md': $route.path === '/admin/submissions' }"
          @click="isMobile && toggleSidebar()">
          <svg class="w-5 h-5 transition-all duration-200" :class="isSidebarOpen ? 'mr-3 group-hover:scale-110' : 'mx-auto'" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
          </svg>
          <span v-if="isSidebarOpen" class="font-medium">Veri Onayları</span>
        </NuxtLink>

        <NuxtLink to="/admin/messages" 
          class="flex items-center px-4 py-3 text-gray-700 hover:bg-indigo-50 hover:text-indigo-700 rounded-xl mb-2 transition-all duration-200 group"
          :class="{ 'bg-indigo-100 text-indigo-700 shadow-md': $route.path === '/admin/messages' }"
          @click="isMobile && toggleSidebar()">
          <svg class="w-5 h-5 transition-all duration-200" :class="isSidebarOpen ? 'mr-3 group-hover:scale-110' : 'mx-auto'" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
          </svg>
          <span v-if="isSidebarOpen" class="font-medium">Mesajlar</span>
        </NuxtLink>
      </nav>
    </aside>

    <!-- Ana İçerik -->
    <main 
      :class="[
        'transition-all duration-300 ease-in-out',
        isMobile ? 'ml-0' : (isSidebarOpen ? 'ml-64' : 'ml-16')
      ]"
    >
      <!-- Üst Bar -->
      <header class="bg-white/80 backdrop-blur-sm shadow-sm border-b border-white/20">
        <div class="h-16 flex items-center justify-between px-4 lg:px-6">
          <!-- Mobil Menü Butonu -->
          <button 
            v-if="isMobile"
            @click="toggleSidebar"
            class="lg:hidden p-2 rounded-md text-gray-600 hover:text-gray-900 hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500"
          >
            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
          </button>
          
          <div class="flex items-center space-x-4">
            
          </div>
          
          <!-- Ana Sayfaya Dön Butonu -->
          <NuxtLink 
            to="/"
            class="inline-flex items-center px-4 lg:px-6 py-2 lg:py-3 bg-gradient-to-r from-indigo-600 to-purple-600 text-white text-sm lg:text-base font-medium rounded-xl hover:from-indigo-700 hover:to-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-all duration-200 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5"
          >
            <svg class="w-4 h-4 lg:w-5 lg:h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
            </svg>
            <span class="hidden sm:inline">Ana Sayfaya Dön</span>
            <span class="sm:hidden">Ana Sayfa</span>
          </NuxtLink>
        </div>
      </header>

      <!-- Sayfa İçeriği -->
      <div class="p-4 lg:p-8">
        <slot />
      </div>
    </main>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'

// Sidebar durumu
const isSidebarOpen = ref(true)

// Mobil kontrolü
const isMobile = ref(false)

// Süper admin kontrolü
const isSuperAdmin = ref(false)

// Sidebar'ı aç/kapat
const toggleSidebar = () => {
  isSidebarOpen.value = !isSidebarOpen.value
}

// Mobil kontrolü
const checkMobile = () => {
  isMobile.value = window.innerWidth < 1024 // lg breakpoint
  if (isMobile.value) {
    isSidebarOpen.value = false // Mobilde varsayılan olarak kapalı
  }
}

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
  checkMobile()
  
  // Window resize event listener
  window.addEventListener('resize', checkMobile)
})

// Cleanup
onUnmounted(() => {
  window.removeEventListener('resize', checkMobile)
})
</script>

<style>
/* Temel stiller */
body {
  margin: 0;
  padding: 0;
}

/* Smooth transitions */
.transition-all {
  transition-property: all;
}

.duration-300 {
  transition-duration: 300ms;
}

.ease-in-out {
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}

/* Backdrop blur */
.backdrop-blur-sm {
  backdrop-filter: blur(4px);
}

/* Gradient text */
.bg-clip-text {
  -webkit-background-clip: text;
  background-clip: text;
}
</style> 