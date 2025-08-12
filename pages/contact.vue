<template>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50 py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto">
      <!-- Başlık Bölümü -->
      <div class="text-center mb-12">
        <h1 class="text-3xl font-bold text-gray-900 mb-4">İletişime Geçin</h1>
        <p class="text-lg text-gray-600">Sorularınız için bize ulaşın, en kısa sürede dönüş yapacağız.</p>
      </div>

      <!-- İletişim Kartları -->
      <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-12">
        <!-- Email Kartı -->
        <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow">
          <div class="flex items-center space-x-4">
            <div class="bg-indigo-100 p-3 rounded-full">
              <svg class="h-6 w-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
            </div>
            <div>
              <h3 class="text-lg font-medium text-gray-900">Email</h3>
              <p class="text-gray-600">info@example.com</p>
            </div>
          </div>
        </div>

        <!-- Telefon Kartı -->
        <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow">
          <div class="flex items-center space-x-4">
            <div class="bg-indigo-100 p-3 rounded-full">
              <svg class="h-6 w-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
              </svg>
            </div>
            <div>
              <h3 class="text-lg font-medium text-gray-900">Telefon</h3>
              <p class="text-gray-600">+90 123 456 7890</p>
            </div>
          </div>
        </div>

        <!-- Adres Kartı -->
        <div class="bg-white p-6 rounded-xl shadow-sm hover:shadow-md transition-shadow">
          <div class="flex items-center space-x-4">
            <div class="bg-indigo-100 p-3 rounded-full">
              <svg class="h-6 w-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
            </div>
            <div>
              <h3 class="text-lg font-medium text-gray-900">Adres</h3>
              <p class="text-gray-600">İstanbul, Türkiye</p>
            </div>
          </div>
        </div>
      </div>

      <!-- İletişim Formu -->
      <div class="bg-white rounded-2xl shadow-xl overflow-hidden">
        <div class="p-8">
          <form @submit.prevent="handleSubmit" class="space-y-6">
            <!-- İsim Soyisim -->
            <div>
              <label for="name" class="block text-sm font-medium text-gray-700">
                İsim Soyisim <span class="text-red-500">*</span>
              </label>
              <input
                id="name"
                v-model="form.name"
                type="text"
                required
                maxlength="45"
                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                :class="{ 'border-red-300': errors.name }"
                @input="validateName"
              >
              <p v-if="errors.name" class="mt-1 text-sm text-red-600">{{ errors.name }}</p>
            </div>

            <!-- Email -->
            <div>
              <label for="email" class="block text-sm font-medium text-gray-700">
                Email <span class="text-red-500">*</span>
              </label>
              <input
                id="email"
                v-model="form.email"
                type="email"
                required
                maxlength="45"
                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                :class="{ 'border-red-300': errors.email }"
                @input="validateEmail"
              >
              <p v-if="errors.email" class="mt-1 text-sm text-red-600">{{ errors.email }}</p>
            </div>

            <!-- Konu -->
            <div>
              <label for="subject" class="block text-sm font-medium text-gray-700">
                Konu <span class="text-red-500">*</span>
              </label>
              <input
                id="subject"
                v-model="form.subject"
                type="text"
                required
                maxlength="120"
                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                :class="{ 'border-red-300': errors.subject }"
                @input="validateSubject"
              >
              <p v-if="errors.subject" class="mt-1 text-sm text-red-600">{{ errors.subject }}</p>
            </div>

            <!-- Mesaj -->
            <div>
              <label for="message" class="block text-sm font-medium text-gray-700">
                Mesaj <span class="text-red-500">*</span>
                <span class="float-right text-sm text-gray-500">
                  {{ form.message.length }}/600 karakter
                </span>
              </label>
              <textarea
                id="message"
                v-model="form.message"
                rows="4"
                maxlength="600"
                required
                class="mt-1 block w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500"
                :class="{ 
                  'border-red-300': errors.message,
                  'border-yellow-300': form.message.length > 550
                }"
                @input="validateMessageLength"
              ></textarea>
              <p v-if="errors.message" class="mt-1 text-sm text-red-600">{{ errors.message }}</p>
              <p 
                v-else-if="form.message.length > 550" 
                class="mt-1 text-sm text-yellow-600"
              >
                {{ 600 - form.message.length }} karakter kaldı
              </p>
            </div>

            <!-- Gönder Butonu -->
            <div>
              <button
                type="submit"
                :disabled="isLoading"
                class="w-full flex justify-center py-2.5 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed transition duration-200"
              >
                <svg
                  v-if="isLoading"
                  class="animate-spin -ml-1 mr-3 h-5 w-5 text-white"
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                >
                  <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                  <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                </svg>
                {{ isLoading ? 'Gönderiliyor...' : 'Gönder' }}
              </button>
            </div>
          </form>

          <!-- Başarı Mesajı -->
          <div
            v-if="successMessage"
            class="mt-4 p-4 rounded-md bg-green-50 border border-green-200 flex items-center space-x-2"
          >
            <svg class="h-5 w-5 text-green-400" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
            </svg>
            <span class="text-sm text-green-800">{{ successMessage }}</span>
          </div>

          <!-- Hata Mesajı -->
          <div
            v-if="errorMessage"
            class="mt-4 p-4 rounded-md bg-red-50 border border-red-200 flex items-center space-x-2"
          >
            <svg class="h-5 w-5 text-red-400" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
            </svg>
            <span class="text-sm text-red-800">{{ errorMessage }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useSupabaseStore } from '~/store/supabase'

const isLoading = ref(false)
const successMessage = ref('')
const errorMessage = ref('')

const form = ref({
  name: '',
  email: '',
  subject: '',
  message: ''
})

const errors = ref({
  name: '',
  email: '',
  subject: '',
  message: ''
})

const validateForm = () => {
  let isValid = true
  errors.value = {
    name: '',
    email: '',
    subject: '',
    message: ''
  }

  if (!form.value.name) {
    errors.value.name = 'İsim alanı zorunludur'
    isValid = false
  } else if (form.value.name.length > 45) {
    form.value.name = form.value.name.slice(0, 45)
  }

  if (!form.value.email) {
    errors.value.email = 'Email alanı zorunludur'
    isValid = false
  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.value.email)) {
    errors.value.email = 'Geçerli bir email adresi giriniz'
    isValid = false
  } else if (form.value.email.length > 45) {
    form.value.email = form.value.email.slice(0, 45)
  }

  if (!form.value.subject) {
    errors.value.subject = 'Konu alanı zorunludur'
    isValid = false
  } else if (form.value.subject.length > 120) {
    form.value.subject = form.value.subject.slice(0, 120)
  }

  if (!form.value.message) {
    errors.value.message = 'Mesaj alanı zorunludur'
    isValid = false
  } else if (form.value.message.length < 10) {
    errors.value.message = 'Mesaj en az 10 karakter olmalıdır'
    isValid = false
  } else if (form.value.message.length > 600) {
    errors.value.message = 'Mesaj 600 karakterden uzun olamaz'
    isValid = false
  }

  return isValid
}

const handleSubmit = async () => {
  if (!validateForm()) {
    return
  }

  try {
    isLoading.value = true
    errorMessage.value = ''
    successMessage.value = ''

    const supabaseStore = useSupabaseStore()
    
    // Supabase'e mesaj gönder
    const result = await supabaseStore.createMessage({
      name: form.value.name,
      email: form.value.email,
      subject: form.value.subject,
      message: form.value.message
    })

    if (result.success) {
      successMessage.value = 'Mesajınız başarıyla gönderildi. En kısa sürede size dönüş yapacağız.'
      form.value = {
        name: '',
        email: '',
        subject: '',
        message: ''
      }
    } else {
      throw new Error(result.error || 'Mesaj gönderimi başarısız oldu')
    }
  } catch (error) {
    console.error('Contact submit error:', error)
    errorMessage.value = 'Bir hata oluştu. Lütfen tekrar deneyiniz.'
  } finally {
    isLoading.value = false
  }
}

const validateMessageLength = () => {
  if (form.value.message.length > 600) {
    form.value.message = form.value.message.slice(0, 600)
  }
  
  // Mesaj validasyonu
  if (!form.value.message) {
    errors.value.message = 'Mesaj alanı zorunludur'
  } else if (form.value.message.length < 10) {
    errors.value.message = 'Mesaj en az 10 karakter olmalıdır'
  } else {
    errors.value.message = ''
  }
}

const validateSubject = () => {
  if (form.value.subject.length > 120) {
    form.value.subject = form.value.subject.slice(0, 120)
  }
  
  if (!form.value.subject) {
    errors.value.subject = 'Konu alanı zorunludur'
  } else {
    errors.value.subject = ''
  }
}

const validateName = () => {
  if (form.value.name.length > 45) {
    form.value.name = form.value.name.slice(0, 45)
  }
  
  if (!form.value.name) {
    errors.value.name = 'İsim alanı zorunludur'
  } else {
    errors.value.name = ''
  }
}

const validateEmail = () => {
  if (form.value.email.length > 45) {
    form.value.email = form.value.email.slice(0, 45)
  }

  if (!form.value.email) {
    errors.value.email = 'Email alanı zorunludur'
  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(form.value.email)) {
    errors.value.email = 'Geçerli bir email adresi giriniz'
  } else {
    errors.value.email = ''
  }
}
</script>

<style scoped>
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

/* Input focus stilleri */
input:focus, textarea:focus {
  box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.2);
}

/* Karakter sayacı animasyonu */
@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}

textarea:focus + .char-count {
  animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
}
</style> 