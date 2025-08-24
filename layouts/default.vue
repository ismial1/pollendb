<template>
  <div class=" relative">
    <Disclosure as="nav" class="bg-gradient-to-r from-blue-600 to-blue-800" v-slot="{ open }">
      <div class="mx-auto max-w-7xl px-2 sm:px-6 lg:px-8">
        <div class="relative flex h-16 items-center justify-between">
          <div class="absolute inset-y-0 left-0 flex items-center sm:hidden">
            <!-- Mobile menu button-->
            <DisclosureButton class="relative inline-flex items-center justify-center rounded-md p-2 text-gray-400 hover:bg-blue-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white">
              <span class="absolute -inset-0.5" />
              <span class="sr-only">Open main menu</span>
              <Bars3Icon v-if="!open" class="block h-6 w-6" aria-hidden="true" />
              <XMarkIcon v-else class="block h-6 w-6" aria-hidden="true" />
            </DisclosureButton>
          </div>
          <div class="flex flex-1 items-center justify-center sm:items-stretch sm:justify-start">
            <div class="flex flex-shrink-0 items-center">
              <NuxtLink to="/">
                <img class="h-8 w-auto cursor-pointer" src="" alt="" />
              </NuxtLink>
            </div>
            <div class="hidden sm:ml-6 sm:flex sm:space-x-8">
              <div class="flex space-x-4">
                <NuxtLink to="/" :class="[currentRoute === '/' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'rounded-md px-3 py-2 text-sm font-medium']">
                  Ana Sayfa
                </NuxtLink>
                <NuxtLink v-if="isAdminOrModerator" to="/submit-data" :class="[currentRoute === '/submit-data' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'rounded-md px-3 py-2 text-sm font-medium']">
                  Veri Ekle
                </NuxtLink>
                
                <!-- Search Data Dropdown -->
                <Menu as="div" class="relative">
                  <MenuButton :class="[isSearchRoute ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'rounded-md px-3 py-2 text-sm font-medium inline-flex items-center']">
                    <span>Veri Ara</span>
                    <ChevronDownIcon class="ml-2 h-4 w-4" aria-hidden="true" />
                  </MenuButton>
                  <transition
                    enter-active-class="transition ease-out duration-100"
                    enter-from-class="transform opacity-0 scale-95"
                    enter-to-class="transform opacity-100 scale-100"
                    leave-active-class="transition ease-in duration-75"
                    leave-from-class="transform opacity-100 scale-100"
                    leave-to-class="transform opacity-0 scale-95"
                  >
                    <MenuItems class="absolute left-0 z-10 mt-2 w-48 origin-top-right rounded-md bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none">
                      <MenuItem v-slot="{ active }">
                        <NuxtLink to="/search-data/alphabetical" :class="[active ? 'bg-gray-100' : '', 'block px-4 py-2 text-sm text-gray-700']">
                          Alphabetical
                        </NuxtLink>
                      </MenuItem>
                      <MenuItem v-slot="{ active }">
                        <NuxtLink to="/search-data/combined" :class="[active ? 'bg-gray-100' : '', 'block px-4 py-2 text-sm text-gray-700']">
                          Combined
                        </NuxtLink>
                      </MenuItem>
                      <MenuItem v-slot="{ active }">
                        <NuxtLink to="/search-data/taxonomic" :class="[active ? 'bg-gray-100' : '', 'block px-4 py-2 text-sm text-gray-700']">
                          Taxonomic
                        </NuxtLink>
                      </MenuItem>
                    </MenuItems>
                  </transition>
                </Menu>

                <!-- Ana menü linki -->

              

                <!-- Hakkımızda Butonu -->
                <NuxtLink to="/about" :class="[currentRoute === '/about' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'rounded-md px-3 py-2 text-sm font-medium']">
                  Hakkımızda
                </NuxtLink>

                <!-- İletişim Butonu -->
                <NuxtLink to="/contact" :class="[currentRoute === '/contact' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'rounded-md px-3 py-2 text-sm font-medium']">
                  İletişim
                </NuxtLink>
                
            






              </div>
            </div>
          </div>
          
          <div class="absolute inset-y-0 right-0 flex items-center pr-2 sm:static sm:inset-auto sm:ml-6 sm:pr-0">
          

            <!-- Giriş yapılmadıysa Giriş Yap butonu -->
            <div v-if="!isAuthenticated" class="ml-3">
              <NuxtLink 
                to="/auth/login" 
                class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500"
              >
                Giriş Yap
              </NuxtLink>
            </div>

            <!-- Giriş yapıldıysa Profile dropdown -->
            <Menu v-else as="div" class="relative ml-3">
              <div class="flex items-center space-x-3">
                <!-- Admin Panel Girişi Butonu (Sadece adminler için) -->
                <NuxtLink 
                  v-if="isAdmin"
                  to="/admin"
                  class="inline-flex items-center px-3 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-purple-600 hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500 transition-colors duration-200"
                >
                  <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z" />
                  </svg>
                  Panel Girişi
                </NuxtLink>
                
                <MenuButton class="relative flex rounded-full bg-gray-800 text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800">
                  <span class="absolute -inset-1.5" />
                  <span class="sr-only">Open user menu</span>
                  <div class="h-8 w-8 rounded-full bg-gradient-to-r from-indigo-600 to-purple-600 flex items-center justify-center">
                    <span class="text-white font-medium text-sm">
                      {{ userInitials }}
                    </span>
                  </div>
                </MenuButton>
              </div>
              <transition enter-active-class="transition ease-out duration-100" enter-from-class="transform opacity-0 scale-95" enter-to-class="transform opacity-100 scale-100" leave-active-class="transition ease-in duration-75" leave-from-class="transform opacity-100 scale-100" leave-to-class="transform opacity-0 scale-95">
                <MenuItems class="absolute right-0 z-10 mt-2 w-56 origin-top-right rounded-md bg-white outline-1 -outline-offset-1 outline-white/10">
                  <div class="py-1">
                    <!-- Kullanıcı Bilgisi -->
                    <div class="px-4 py-3 border-b border-gray-700">
                      <p class="text-sm font-medium text-gray-700">{{ user?.full_name || 'Kullanıcı' }}</p>
                      <p class="text-xs text-gray-600">{{ user?.email }}</p>
                    </div>
                    

                 
                      <MenuItem v-slot="{ active }">
                        <NuxtLink
                          to="/profil"
                          :class="[
                            active ? 'bg-gray-100' : '',
                            'inline-flex w-full px-4 py-2 text-sm text-gray-700 text-center'
                          ]"
                        >
                          Profil
                        </NuxtLink>
                      </MenuItem>
                    
                    
                    <form method="POST" @submit.prevent="handleLogout">
                      <MenuItem v-slot="{ active }">
                        <button 
                          type="submit" 
                          :class="[
                            active ? 'bg-gray-100' : '',
                            'inline-flex w-full px-4 py-2 text-sm text-gray-700 text-center'
                          ]"
                        >
                          Çıkış Yap
                        </button>
                      </MenuItem>
                    </form>
                  </div>
                </MenuItems>
              </transition>
            </Menu>
          </div>
        </div>
      </div>
        

      <DisclosurePanel class="sm:hidden">
        <div class="space-y-1 px-2 pb-3 pt-2 bg-gradient-to-r from-blue-600 to-blue-800">
          <DisclosureButton as="div">
            <NuxtLink to="/" :class="[currentRoute === '/' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'block rounded-md px-3 py-2 text-base font-medium']">
              Ana Sayfa
            </NuxtLink>
          </DisclosureButton>
          <DisclosureButton v-if="isAdminOrModerator" as="div">
            <NuxtLink to="/submit-data" :class="[currentRoute === '/submit-data' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'block rounded-md px-3 py-2 text-base font-medium']">
              Veri Ekle
            </NuxtLink>
          </DisclosureButton>


          <div class="w-full">
            <button 
              @click="isSearchOpen = !isSearchOpen"
              class="flex items-center justify-between w-full px-3 py-2 text-base font-medium text-gray-300 hover:bg-blue-600 hover:text-white rounded-md transition-colors duration-200"
            >
              <span>Veri Ara</span>
              <svg class="w-4 h-4 transition-transform duration-200" :class="{ 'rotate-180': isSearchOpen }" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <div v-if="isSearchOpen" class="pl-6 mt-2 space-y-1">
              <NuxtLink to="/search-data/alphabetical" :class="[currentRoute === '/search-data/alphabetical' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'block rounded-md px-3 py-2 text-sm font-medium']">
                Alphabetical
              </NuxtLink>
              <NuxtLink to="/search-data/combined" :class="[currentRoute === '/search-data/combined' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'block rounded-md px-3 py-2 text-sm font-medium']">
                Combined
              </NuxtLink>
              <NuxtLink to="/search-data/taxonomic" :class="[currentRoute === '/search-data/taxonomic' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'block rounded-md px-3 py-2 text-sm font-medium']">
                Taxonomic
              </NuxtLink>
            </div>
          </div>

    

          <DisclosureButton as="div">
            <NuxtLink to="/about" :class="[currentRoute === '/about' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'block rounded-md px-3 py-2 text-base font-medium']">
              Hakkımızda
            </NuxtLink>
          </DisclosureButton>


          <DisclosureButton as="div">
            <NuxtLink to="/contact" :class="[currentRoute === '/contact' ? 'bg-blue-800 text-white' : 'text-gray-300 hover:bg-blue-600 hover:text-white', 'block rounded-md px-3 py-2 text-base font-medium flex items-center']">
              
              İletişim
            </NuxtLink>
          </DisclosureButton>
          
        </div>
      </DisclosurePanel>
    </Disclosure>
    <slot />
  </div>
 
 
  
   <div>
    <footer class="bg-gray-900 text-white">
    <div class="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8">
      <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
        <!-- Logo ve Açıklama -->
        <div class="col-span-1 md:col-span-1">
          <div class="flex items-center mb-4">
            <img src="/" alt="Polen DB Logo" class="h-10 w-auto mr-3" />
            <span class="text-xl font-bold">Polen DB</span>
          </div>
          <p class="text-gray-400 mb-4">
            Uludağ Üniversitesi Biyoloji Bölümü Polen Araştırma ve Veri Merkezi
          </p>
          <div class="flex space-x-6">
            <a href="#" class="text-gray-400 hover:text-white">
              <span class="sr-only">Facebook</span>
              <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.094 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.562V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z" />
              </svg>
            </a>
            <a href="#" class="text-gray-400 hover:text-white">
              <span class="sr-only">Twitter</span>
              <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M8.29 20.251c7.547 0 11.675-6.253 11.675-11.675 0-.178 0-.355-.012-.53A8.348 8.348 0 0022 5.92a8.19 8.19 0 01-2.357.646 4.118 4.118 0 001.804-2.27 8.224 8.224 0 01-2.605.996 4.107 4.107 0 00-6.993 3.743 11.65 11.65 0 01-8.457-4.287 4.106 4.106 0 001.27 5.477A4.072 4.072 0 012.8 9.713v.052a4.105 4.105 0 003.292 4.022 4.095 4.095 0 01-1.853.07 4.108 4.108 0 003.834 2.85A8.233 8.233 0 012 18.407a11.616 11.616 0 006.29 1.84" />
              </svg>
            </a>
            <a href="#" class="text-gray-400 hover:text-white">
              <span class="sr-only">LinkedIn</span>
              <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                <path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z" />
              </svg>
            </a>
          </div>
        </div>

        <!-- Hızlı Erişim -->
        <div>
          <h3 class="text-sm font-semibold text-gray-300 uppercase tracking-wider mb-4">
            Hızlı Erişim
          </h3>
          <ul class="space-y-3">
            <li>
              <router-link to="/about" class="text-gray-400 hover:text-white">
                Hakkımızda
              </router-link>
            </li>
            <li>
              <router-link to="/services" class="text-gray-400 hover:text-white">
                Hizmetlerimiz
              </router-link>
            </li>
            <li>
              <router-link to="/search-data/combined" class="text-gray-400 hover:text-white">
                Polen Veritabanı
              </router-link>
            </li>
            <li>
              <router-link to="/" class="text-gray-400 hover:text-white">
                Yayınlar
              </router-link>
            </li>
            <li>
              <router-link to="/faq" class="text-gray-400 hover:text-white flex items-center">
                <svg class="h-4 w-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                Sıkça Sorulan Sorular
              </router-link>
            </li>
          </ul>
        </div>

        <!-- Yardım & Destek -->
        <div>
          <h3 class="text-sm font-semibold text-gray-300 uppercase tracking-wider mb-4">
            Yardım & Destek
          </h3>
          <ul class="space-y-3">
            <li>
              <router-link to="/faq" class="text-gray-400 hover:text-white flex items-center">
                <svg class="h-4 w-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
                SSS
              </router-link>
            </li>
            <li>
              <router-link to="/contact" class="text-gray-400 hover:text-white flex items-center">
                <svg class="h-4 w-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                </svg>
                İletişim Formu
              </router-link>
            </li>
          </ul>
        </div>

        <!-- İletişim -->
        <div>
          <h3 class="text-sm font-semibold text-gray-300 uppercase tracking-wider mb-4">
            İletişim
          </h3>
          <ul class="space-y-3 text-gray-400">
            <li class="flex items-center">
              <svg class="h-5 w-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              <span>Uludağ Üniversitesi, Görükle Kampüsü, Bursa</span>
            </li>
            <li class="flex items-center">
              <svg class="h-5 w-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
              <a href="mailto:info@polendb.edu.tr" class="hover:text-white">
                info@polendb.edu.tr
              </a>
            </li>
            <li class="flex items-center">
              <svg class="h-5 w-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
              </svg>
              <a href="tel:+902242941000" class="hover:text-white">
                +90 224 294 1000
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Alt Footer -->
    <div class="bg-gray-800">
      <div class="max-w-7xl mx-auto py-4 px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col md:flex-row justify-between items-center space-y-4 md:space-y-0">
          <p class="text-gray-400 text-sm text-center md:text-left">
            © {{ new Date().getFullYear() }} Polen DB. Tüm hakları saklıdır.
          </p>
          <div class="flex space-x-6">
            <router-link to="/" class="text-sm text-gray-400 hover:text-white">
              Gizlilik Politikası
            </router-link>
            <router-link to="/" class="text-sm text-gray-400 hover:text-white">
              Kullanım Şartları
            </router-link>
          </div>
        </div>
      </div>
    </div>
  </footer>
  </div>





</template>

<script setup>
import { Disclosure, DisclosureButton, DisclosurePanel, Menu, MenuButton, MenuItem, MenuItems } from '@headlessui/vue'
import { Bars3Icon, BellIcon, XMarkIcon, ChevronDownIcon } from '@heroicons/vue/24/outline'
import { computed, ref, onMounted, watch } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
const currentRoute = computed(() => route.path)

// Search Data sayfalarından birinde mi kontrol et
const isSearchRoute = computed(() => {
  return currentRoute.value.startsWith('/search-data')
})



// Mobile search dropdown durumu
const isSearchOpen = ref(false)

// Authentication state
const isAuthenticated = ref(false)
const user = ref(null)

// Kullanıcının giriş yapıp yapmadığını kontrol et
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

const userInitials = computed(() => {
  if (!user.value?.full_name) return 'U'
  const nameParts = user.value.full_name.split(' ')
  if (nameParts.length >= 2) {
    return (nameParts[0][0] + nameParts[1][0]).toUpperCase()
  }
  return user.value.full_name[0]?.toUpperCase() || 'U'
})

// Admin kontrolü
const isAdmin = computed(() => {
  return user.value?.role === 'admin'
})

// Admin veya Moderator kontrolü
const isAdminOrModerator = computed(() => {
  return user.value?.role === 'admin' || user.value?.role === 'moderator'
})

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
    
    // Ana sayfaya yönlendir
    window.location.href = '/'
  }
}

// Lifecycle
onMounted(() => {
  checkAuthStatus()
  
  // Storage event listener for cross-tab sync
  window.addEventListener('storage', checkAuthStatus)
  
  // Custom event listener for login/logout
  document.addEventListener('auth-update', checkAuthStatus)
})

// Watch for auth changes
watch(() => isAuthenticated.value, (newVal, oldVal) => {
  if (newVal !== oldVal) {
    console.log('Auth state changed:', newVal)
  }
})
</script>