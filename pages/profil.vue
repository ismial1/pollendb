<template>
  <div> <!-- Ana root element -->
    <!-- Profil Sayfası İçeriği -->
    <div class="min-h-screen bg-gray-100 py-8">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <!-- Profil Başlığı -->
        <div class="mb-8">
          <h1 class="text-3xl font-bold text-gray-900">Profil Bilgileri</h1>
          <p class="mt-2 text-sm text-gray-600">Hesap bilgilerinizi buradan güncelleyebilirsiniz.</p>
        </div>

        <!-- Ana İçerik -->
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
          <!-- Sol Kolon: Profil Kartı -->
          <div class="lg:col-span-1">
            <div class="bg-white shadow rounded-lg p-6">
              <div class="text-center">
                <div class="relative inline-block">
                  <img
                    :src="user.avatar || '/'"
                    alt="Profil Fotoğrafı"
                    class="h-32 w-32 rounded-full object-cover border-4 border-white shadow-lg"
                  />
                  <button
                    class="absolute bottom-0 right-0 bg-indigo-600 p-2 rounded-full text-white hover:bg-indigo-700 transition"
                    @click="$refs.fileInput.click()"
                  >
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z" />
                    </svg>
                  </button>
                </div>
                <h3 class="mt-4 text-xl font-semibold text-gray-900">{{ user.name }}</h3>
                <p class="text-gray-500">{{ user.email }}</p>
              </div>

              <div class="mt-6 border-t border-gray-200 pt-4">
                <div class="flex items-center justify-between mb-4">
                  <span class="text-sm font-medium text-gray-500">Üyelik Durumu</span>
                  <span class="px-3 py-1 text-xs font-semibold text-green-800 bg-green-100 rounded-full">Aktif</span>
                </div>
                <div class="flex items-center justify-between">
                  <span class="text-sm font-medium text-gray-500">Son Giriş</span>
                  <span class="text-sm text-gray-900">{{ user.lastLogin }}</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Sağ Kolon: Bilgi Formu -->
          <div class="lg:col-span-2">
            <div class="bg-white shadow rounded-lg divide-y divide-gray-200">
              <!-- Kişisel Bilgiler -->
              <div class="p-6">
                <h3 class="text-lg font-medium text-gray-900 mb-4">Kişisel Bilgiler</h3>
                <form @submit.prevent="updateProfile" class="space-y-6">
                  <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                      <label class="block text-sm font-medium text-gray-700">Ad Soyad</label>
                      <input
                        type="text"
                        v-model="user.name"
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                      />
                    </div>
                    <div>
                      <label class="block text-sm font-medium text-gray-700">E-posta</label>
                      <input
                        type="email"
                        v-model="user.email"
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                      />
                    </div>
                    <div>
                      <label class="block text-sm font-medium text-gray-700">Telefon</label>
                      <input
                        type="tel"
                        v-model="user.phone"
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                      />
                    </div>
                    <div>
                      <label class="block text-sm font-medium text-gray-700">Doğum Tarihi</label>
                      <input
                        type="date"
                        v-model="user.birthDate"
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                      />
                    </div>
                  </div>

                  <div class="flex justify-end space-x-3">
                    <button
                      type="button"
                      class="px-4 py-2 border border-gray-300 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-50"
                      @click="resetForm"
                    >
                      İptal
                    </button>
                    <button
                      type="submit"
                      class="px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    >
                      Kaydet
                    </button>
                  </div>
                </form>
              </div>

              <!-- Şifre Değiştirme -->
              <div class="p-6">
                <h3 class="text-lg font-medium text-gray-900 mb-4">Şifre Değiştir</h3>
                <form @submit.prevent="updatePassword" class="space-y-6">
                  <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <div>
                      <label class="block text-sm font-medium text-gray-700">Mevcut Şifre</label>
                      <input
                        type="password"
                        v-model="passwords.current"
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                      />
                    </div>
                    <div>
                      <label class="block text-sm font-medium text-gray-700">Yeni Şifre</label>
                      <input
                        type="password"
                        v-model="passwords.new"
                        class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                      />
                    </div>
                  </div>
                  <div class="flex justify-end">
                    <button
                      type="submit"
                      class="px-4 py-2 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    >
                      Şifreyi Güncelle
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Gizli dosya input'u -->
      <input
        type="file"
        ref="fileInput"
        @change="handleFileUpload"
        accept="image/*"
        class="hidden"
      />
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useToast } from 'vue-toastification'

const toast = useToast()
const fileInput = ref(null)

const user = ref({
  name: 'John Doe',
  email: 'john@example.com',
  phone: '+90 555 123 4567',
  birthDate: '1990-01-01',
  avatar: null,
  lastLogin: '2024-03-20 15:30'
})

const passwords = ref({
  current: '',
  new: ''
})

const updateProfile = async () => {
  try {
    // API çağrısı burada yapılacak
    toast.success('Profil bilgileri başarıyla güncellendi')
  } catch (error) {
    toast.error('Bir hata oluştu')
  }
}

const updatePassword = async () => {
  try {
    // API çağrısı burada yapılacak
    toast.success('Şifreniz başarıyla güncellendi')
    passwords.value = { current: '', new: '' }
  } catch (error) {
    toast.error('Şifre güncellenirken bir hata oluştu')
  }
}

const handleFileUpload = async (event) => {
  const file = event.target.files[0]
  if (!file) return

  // Dosya tipini kontrol et
  if (!file.type.startsWith('image/')) {
    toast.error('Lütfen sadece resim dosyası yükleyin')
    return
  }

  // Dosya boyutunu kontrol et (örn: 5MB)
  if (file.size > 5 * 1024 * 1024) {
    toast.error('Dosya boyutu 5MB\'dan küçük olmalıdır')
    return
  }

  try {
    // Dosyayı base64'e çevir
    const reader = new FileReader()
    reader.onload = async (e) => {
      try {
        // Önizleme için base64'ü göster
        user.value.avatar = e.target.result
        toast.success('Profil fotoğrafı başarıyla güncellendi')
      } catch (error) {
        toast.error('Fotoğraf yüklenirken bir hata oluştu')
        user.value.avatar = null
      }
    }
    reader.readAsDataURL(file)
  } catch (error) {
    toast.error('Dosya işlenirken bir hata oluştu')
  }
}

const resetForm = () => {
  // Form resetleme mantığı
}
</script>

<style scoped>
.hidden {
  display: none;
}
</style>
  