<template>
  <nav class="bg-white shadow-lg border-b border-gray-200">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between items-center h-16">
        <!-- Logo ve Ana Menü -->
        <div class="flex items-center space-x-8">
          <NuxtLink to="/" class="flex items-center space-x-2">
            <div class="w-8 h-8 bg-gradient-to-r from-indigo-600 to-purple-600 rounded-lg flex items-center justify-center">
              <span class="text-white font-bold text-sm">P</span>
            </div>
            <span class="text-xl font-bold text-gray-900">PolenDB</span>
          </NuxtLink>
          
          <div class="hidden md:flex items-center space-x-6">
            <NuxtLink to="/" class="nav-link">Ana Sayfa</NuxtLink>
            <NuxtLink to="/about" class="nav-link">Hakkımızda</NuxtLink>
            <NuxtLink to="/search-data" class="nav-link">Polen Arama</NuxtLink>
            <NuxtLink to="/submit-data" class="nav-link">Veri Gönder</NuxtLink>
          </div>
        </div>

        <!-- Sağ Taraf - Avatar/Login -->
        <div class="flex items-center space-x-4">
          <!-- Giriş yapmamış kullanıcılar için -->
          <div v-if="!isAuthenticated" class="flex items-center space-x-3">
            <NuxtLink 
              to="/auth/login" 
              class="text-gray-700 hover:text-indigo-600 px-3 py-2 rounded-md text-sm font-medium transition-colors duration-200"
            >
              Giriş Yap
            </NuxtLink>
            <NuxtLink 
              to="/auth/register" 
              class="bg-indigo-600 hover:bg-indigo-700 text-white px-4 py-2 rounded-lg text-sm font-medium transition-colors duration-200"
            >
              Üye Ol
            </NuxtLink>
          </div>

          <!-- Giriş yapmış kullanıcılar için -->
          <div v-else class="relative">
            <button
              @click="toggleDropdown"
              class="flex items-center space-x-2 text-gray-700 hover:text-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 rounded-full p-1 transition-colors duration-200"
            >
              <div class="w-8 h-8 bg-gradient-to-r from-indigo-600 to-purple-600 rounded-full flex items-center justify-center">
                <span class="text-white font-medium text-sm">
                  {{ userInitials }}
                </span>
              </div>
              <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>

            <!-- Dropdown Menu -->
            <div 
              v-if="showDropdown"
              class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg border border-gray-200 py-2 z-50"
            >
              <!-- Kullanıcı Bilgisi -->
              <div class="px-4 py-3 border-b border-gray-100">
                <p class="text-sm font-medium text-gray-900">{{ user?.full_name || user?.email }}</p>
                <p class="text-xs text-gray-500">{{ user?.email }}</p>
              </div>

              <!-- Menü Öğeleri -->
              <NuxtLink 
                to="/profil" 
                class="flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-indigo-50 hover:text-indigo-600 transition-colors duration-200"
                @click="showDropdown = false"
              >
                <svg class="w-4 h-4 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z" />
                </svg>
                Profil
              </NuxtLink>

              <button
                @click="handleLogout"
                class="w-full flex items-center px-4 py-2 text-sm text-gray-700 hover:bg-red-50 hover:text-red-600 transition-colors duration-200"
              >
                <svg class="w-4 h-4 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 16l4-4m0 0l-4-4m4 4H7m6 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h4a3 3 0 013 3v1" />
                </svg>
                Çıkış Yap
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Mobile Menu Button -->
    <div class="md:hidden">
      <button
        @click="toggleMobileMenu"
        class="text-gray-700 hover:text-indigo-600 focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2 p-2"
      >
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
        </svg>
      </button>
    </div>

    <!-- Mobile Menu -->
    <div v-if="showMobileMenu" class="md:hidden">
      <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3 bg-white border-t border-gray-200">
        <NuxtLink to="/" class="mobile-nav-link">Ana Sayfa</NuxtLink>
        <NuxtLink to="/about" class="mobile-nav-link">Hakkımızda</NuxtLink>
        <NuxtLink to="/search-data" class="mobile-nav-link">Polen Arama</NuxtLink>
        <NuxtLink to="/submit-data" class="mobile-nav-link">Veri Gönder</NuxtLink>
        
        <!-- Mobile Auth Links -->
        <div v-if="!isAuthenticated" class="pt-4 border-t border-gray-200">
          <NuxtLink to="/auth/login" class="mobile-nav-link">Giriş Yap</NuxtLink>
          <NuxtLink to="/auth/register" class="mobile-nav-link">Üye Ol</NuxtLink>
        </div>
        
        <div v-else class="pt-4 border-t border-gray-200">
          <NuxtLink to="/profil" class="mobile-nav-link">Profil</NuxtLink>
          <button @click="handleLogout" class="mobile-nav-link w-full text-left">Çıkış Yap</button>
        </div>
      </div>
    </div>
  </nav>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted, watch } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

// State
const showDropdown = ref(false)
const showMobileMenu = ref(false)
const user = ref(null)
const isAuthenticated = ref(false)

// Computed
const userInitials = computed(() => {
  if (!user.value?.full_name) return 'U'
  return user.value.full_name
    .split(' ')
    .map(name => name.charAt(0))
    .join('')
    .toUpperCase()
    .slice(0, 2)
})

// Methods
const toggleDropdown = () => {
  showDropdown.value = !showDropdown.value
}

const toggleMobileMenu = () => {
  showMobileMenu.value = !showMobileMenu.value
}

const checkAuthStatus = () => {
  const token = localStorage.getItem('token')
  const userData = localStorage.getItem('user')
  
  if (token && userData) {
    try {
      user.value = JSON.parse(userData)
      isAuthenticated.value = true
    } catch (error) {
      console.error('User data parse error:', error)
      clearAuthData()
    }
  } else {
    clearAuthData()
  }
}

const clearAuthData = () => {
  localStorage.removeItem('token')
  localStorage.removeItem('user')
  user.value = null
  isAuthenticated.value = false
}

const handleLogout = async () => {
  try {
    // API'ye logout isteği gönder
    await fetch('/api/logout', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      }
    })
  } catch (error) {
    console.error('Logout error:', error)
  } finally {
    // Local storage'ı temizle
    clearAuthData()
    showDropdown.value = false
    showMobileMenu.value = false
    
    // Ana sayfaya yönlendir
    router.push('/')
  }
}

// Click outside dropdown handler
const handleClickOutside = (event) => {
  if (showDropdown.value && !event.target.closest('.relative')) {
    showDropdown.value = false
  }
}

// Lifecycle
onMounted(() => {
  checkAuthStatus()
  document.addEventListener('click', handleClickOutside)
  
  // Storage event listener for cross-tab sync
  window.addEventListener('storage', checkAuthStatus)
})

onUnmounted(() => {
  document.removeEventListener('click', handleClickOutside)
  window.removeEventListener('storage', checkAuthStatus)
})

// Watch for auth changes (when user logs in from another component)
watch(() => isAuthenticated.value, (newVal) => {
  if (newVal) {
    checkAuthStatus()
  }
})
</script>

<style scoped>
.nav-link {
  @apply text-gray-700 hover:text-indigo-600 px-3 py-2 rounded-md text-sm font-medium transition-colors duration-200;
}

.mobile-nav-link {
  @apply block px-3 py-2 text-base font-medium text-gray-700 hover:text-indigo-600 hover:bg-indigo-50 rounded-md transition-colors duration-200;
}

/* Active link styles */
.router-link-active {
  @apply text-indigo-600 bg-indigo-50;
}

/* Dropdown animation */
.dropdown-enter-active,
.dropdown-leave-active {
  transition: opacity 0.2s, transform 0.2s;
}

.dropdown-enter-from,
.dropdown-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
</style> 