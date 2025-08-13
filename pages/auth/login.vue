<template>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50 py-12 px-4 sm:px-6 lg:px-8 flex items-center justify-center">
    <div class="max-w-md w-full bg-white rounded-2xl shadow-xl overflow-hidden">
      <!-- Logo ve Başlık -->
      <div class="bg-gradient-to-r from-indigo-600 to-purple-600 px-10 py-8 text-center">
        <img 
          class="mx-auto h-12 w-auto mb-4" 
          src="" 
          alt="Logo"
        >
        <h2 class="text-2xl font-bold text-white">
          Hoş Geldiniz
        </h2>
        <p class="mt-2 text-sm text-indigo-100">
          Devam etmek için lütfen giriş yapın
        </p>
      </div>

      <!-- Form -->
      <div class="p-10">
        <form class="space-y-6" @submit.prevent="handleLogin">
          <!-- Email Input -->
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700">
              E-posta <span class="text-red-500">*</span>
            </label>
            <div class="mt-1 relative">
                             <input
                 id="email"
                 v-model="form.email"
                 type="email"
                 required
                 autocomplete="username"
                 :class="[
                   'appearance-none block w-full px-3 py-2.5 border-2 rounded-lg transition-colors duration-200',
                   errors.email 
                     ? 'border-red-300 focus:ring-red-500 focus:border-red-500' 
                     : 'border-gray-200 focus:ring-indigo-500 focus:border-indigo-500'
                 ]"
                 placeholder="ornek@email.com"
                 @blur="validateEmail"
               >
              <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
                <svg 
                  v-if="errors.email" 
                  class="h-5 w-5 text-red-500" 
                  fill="currentColor" 
                  viewBox="0 0 20 20"
                >
                  <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
                </svg>
              </div>
            </div>
            <p v-if="errors.email" class="mt-1 text-sm text-red-600">{{ errors.email }}</p>
          </div>

          <!-- Şifre Input -->
          <div>
            <label for="password" class="block text-sm font-medium text-gray-700">
              Şifre <span class="text-red-500">*</span>
            </label>
            <div class="mt-1 relative">
              <input
                id="password"
                v-model="form.password"
                :type="showPassword ? 'text' : 'password'"
                required
                autocomplete="current-password"
                :class="[
                  'appearance-none block w-full px-3 py-2.5 border-2 rounded-lg transition-colors duration-200',
                  errors.password 
                    ? 'border-red-300 focus:ring-red-500 focus:border-red-500' 
                    : 'border-gray-200 focus:ring-indigo-500 focus:border-indigo-500'
                ]"
                placeholder="••••••••"
                @blur="validatePassword"
              >
              <button
                type="button"
                @click="showPassword = !showPassword"
                class="absolute inset-y-0 right-0 pr-3 flex items-center"
              >
                <svg v-if="!showPassword" class="h-5 w-5 text-gray-400 hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                </svg>
                <svg v-else class="h-5 w-5 text-gray-400 hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                </svg>
              </button>
            </div>
            <p v-if="errors.password" class="mt-1 text-sm text-red-600">{{ errors.password }}</p>
          </div>

          <!-- Beni Hatırla & Şifremi Unuttum -->
          <div class="flex items-center justify-between">
            <div class="flex items-center">
              <input
                id="remember-me"
                name="remember-me"
                type="checkbox"
                class="h-4 w-4 text-indigo-600 focus:ring-indigo-500 border-gray-300 rounded"
              >
              <label for="remember-me" class="ml-2 block text-sm text-gray-900">
                Beni hatırla
              </label>
            </div>

            <div class="text-sm">
              <router-link
                to="/auth/forgot-password"
                class="font-medium text-indigo-600 hover:text-indigo-500 cursor-pointer"
              >
                Şifremi Unuttum
              </router-link>
            </div>
          </div>

          <!-- Giriş Butonu -->
          <div>
            <button
              type="submit"
              :disabled="isLoading || hasErrors || !isFormValid"
              class="w-full flex justify-center py-2.5 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white 
                     bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 
                     focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500
                     disabled:opacity-50 disabled:cursor-not-allowed
                     transition duration-200"
            >
              <svg
                v-if="isLoading"
                class="animate-spin -ml-1 mr-3 h-5 w-5 text-white"
                
                fill="none"
                viewBox="0 0 24 24"
              >
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              {{ isLoading ? 'Giriş yapılıyor...' : 'Giriş Yap' }}
            </button>
          </div>

          <!-- API Hata Mesajı -->
          <div 
            v-if="apiError" 
            class="mt-4 p-4 rounded-lg bg-red-50 border border-red-200 flex items-center space-x-2"
          >
            <svg class="h-5 w-5 text-red-400" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
            </svg>
            <span class="text-sm text-red-800">{{ apiError }}</span>
          </div>
        </form>
      </div>

      <!-- Form altına eklenecek kısım -->
      <div class="px-10 pb-10 -mt-2">
        <div class="relative">
          <div class="absolute inset-0 flex items-center">
            <div class="w-full border-t border-gray-200"></div>
          </div>
          <div class="relative flex justify-center text-sm">
            <span class="px-2 bg-white text-gray-500">veya</span>
          </div>
        </div>

        <div class="mt-6 text-center">
          <p class="text-sm text-gray-600">
            Henüz üye değil misiniz?
          </p>
          <router-link 
            to="/auth/register" 
            class="mt-3 w-full inline-flex justify-center items-center px-4 py-2.5 border border-transparent text-sm font-medium rounded-lg
                   text-indigo-600 bg-indigo-50 hover:bg-indigo-100
                   focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500
                   transition-colors duration-200"
          >
            <svg 
              class="mr-2 h-5 w-5" 
              fill="none" 
              stroke="currentColor" 
              viewBox="0 0 24 24"
            >
              <path 
                stroke-linecap="round" 
                stroke-linejoin="round" 
                stroke-width="2" 
                d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z"
              />
            </svg>
            Hemen Üye Ol
          </router-link>
        </div>

        <!-- Alt bilgi -->
        <p class="mt-4 text-xs text-center text-gray-500">
          Üye olarak, 
          <a href="#" class="text-indigo-600 hover:text-indigo-500">Kullanım Koşulları</a> ve 
          <a href="#" class="text-indigo-600 hover:text-indigo-500">Gizlilik Politikası</a>'nı 
          kabul etmiş olursunuz.
        </p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'

const router = useRouter()
const route = useRoute()
const showPassword = ref(false)
const isLoading = ref(false)
const apiError = ref('')
const redirectPath = ref('')

// Form state
const form = ref({
  email: '',
  password: '',
  rememberMe: false
})

// Validation errors
const errors = ref({
  email: '',
  password: ''
})

// Email validasyonu
const validateEmail = () => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  if (!form.value.email) {
    errors.value.email = 'E-posta adresi gereklidir'
  } else if (!emailRegex.test(form.value.email)) {
    errors.value.email = 'Geçerli bir e-posta adresi giriniz'
  } else {
    errors.value.email = ''
  }
}

// Şifre validasyonu
const validatePassword = () => {
  if (!form.value.password) {
    errors.value.password = 'Şifre gereklidir'
  } else if (form.value.password.length < 6) {
    errors.value.password = 'Şifre en az 6 karakter olmalıdır'
  } else {
    errors.value.password = ''
  }
}

// Form geçerlilik kontrolü
const isFormValid = computed(() => {
  return form.value.email && 
         form.value.password && 
         !errors.value.email && 
         !errors.value.password
})

// Redirect parametresini al
onMounted(() => {
  redirectPath.value = route.query.redirect || '/'
})

// Hata durumu kontrolü
const hasErrors = computed(() => {
  return Object.values(errors.value).some(error => error !== '')
})

// Login işlemi
const handleLogin = async () => {
  try {
    // Form validasyonu
    validateEmail()
    validatePassword()
    
    if (!isFormValid.value) {
      return
    }

    isLoading.value = true
    apiError.value = ''

    // API isteği
    const response = await fetch('/api/login', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        email: form.value.email,
        password: form.value.password,
        rememberMe: form.value.rememberMe
      })
    })

    if (!response.ok) {
      const error = await response.json()
      throw new Error(error.message || 'Giriş başarısız')
    }

    const data = await response.json()
    
    // Login başarılı
    localStorage.setItem('token', data.data.session.access_token)
    localStorage.setItem('user', JSON.stringify(data.data.user))
    
    // Header'ı güncellemek için custom event gönder
    document.dispatchEvent(new CustomEvent('auth-update'))
    
    // Redirect path'e yönlendir
    router.push(redirectPath.value)

  } catch (error) {
    apiError.value = error.message || 'Bir hata oluştu. Lütfen tekrar deneyin.'
  } finally {
    isLoading.value = false
  }
}
</script>

<style scoped>
/* Input focus ring stilini özelleştirme */
input:focus {
  box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.2);
}

/* Gradient animasyonu */
.bg-gradient-to-r {
  background-size: 200% 200%;
  animation: gradient 15s ease infinite;
}

@keyframes gradient {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* Router link stilleri */
.router-link-active {
  background-color: rgb(238, 242, 255); /* bg-indigo-100 */
}

.router-link-exact-active:hover {
  transform: translateY(-1px);
  transition: transform 0.2s;
}

/* Select elementinin placeholder rengi */
select option[value=""][disabled] {
  color: #9ca3af;
}

/* Firefox için özel stil */
select:-moz-focusring {
  color: transparent;
  text-shadow: 0 0 0 #000;
}

/* Select ok işareti rengi */
select {
  color: #000;
}

/* Placeholder rengi */
select:invalid {
  color: #9ca3af;
}
</style>

