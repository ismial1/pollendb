<template>
  <div class="min-h-screen flex items-center justify-center bg-gradient-to-br from-indigo-500 to-purple-600 py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-md w-full space-y-8 bg-white p-8 rounded-lg shadow-xl">
      <div>
        <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
          Şifremi Unuttum
        </h2>
        <p class="mt-2 text-center text-sm text-gray-600">
          E-posta adresinizi girin, size şifre sıfırlama bağlantısı gönderelim.
        </p>
      </div>
      <form class="mt-8 space-y-6" @submit.prevent="handleSubmit">
        <div class="rounded-md shadow-sm -space-y-px">
          <div>
            <label for="email-address" class="sr-only">E-posta adresi</label>
            <input
              id="email-address"
              name="email"
              type="email"
              v-model="email"
              required
              class="appearance-none rounded-md relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 focus:z-10 sm:text-sm"
              placeholder="E-posta adresi"
            />
          </div>
        </div>

        <div v-if="message" :class="['text-center text-sm', messageClass]">
          {{ message }}
        </div>

        <div>
          <button
            type="submit"
            :disabled="loading"
            class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
          >
            <span v-if="loading" class="absolute left-0 inset-y-0 flex items-center pl-3">
              <!-- Loading spinner -->
              <svg class="animate-spin h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
            </span>
            {{ loading ? 'Gönderiliyor...' : 'Şifre Sıfırlama Bağlantısı Gönder' }}
          </button>
        </div>

        <div class="text-center">
          <router-link
            to="/"
            class="font-medium text-indigo-600 hover:text-indigo-500"
          >
            Giriş sayfasına dön
          </router-link>
        </div>
      </form>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const email = ref('')
const loading = ref(false)
const message = ref('')
const messageClass = ref('')

const handleSubmit = async () => {
  loading.value = true
  message.value = ''
  
  try {
    // Burada API çağrısı yapılacak
    await new Promise(resolve => setTimeout(resolve, 1500)) // Simüle edilmiş API çağrısı
    
    message.value = 'Şifre sıfırlama bağlantısı e-posta adresinize gönderildi.'
    messageClass.value = 'text-green-600'
    
    // 3 saniye sonra login sayfasına yönlendir
    setTimeout(() => {
      router.push('/login')
    }, 3000)
  } catch (error) {
    message.value = 'Bir hata oluştu. Lütfen tekrar deneyin.'
    messageClass.value = 'text-red-600'
  } finally {
    loading.value = false
  }
}
</script> 