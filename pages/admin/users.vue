<template>
  <div>
    <!-- Başlık ve Arama Bölümü -->
    <div class="mb-6 flex justify-between items-center">
      <h1 class="text-2xl font-semibold text-gray-900">Kullanıcı Yönetimi</h1>
      <div class="flex space-x-3">
        <div class="relative">
          <input 
            type="text" 
            v-model="searchQuery"
            placeholder="Kullanıcı ara..." 
            class="pl-10 pr-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
          >
          <svg class="w-5 h-5 text-gray-400 absolute left-3 top-2.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
          </svg>
        </div>
        <button 
          @click="refreshUsers"
          class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 flex items-center"
        >
          <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
          </svg>
          Yenile
        </button>
      </div>
    </div>

    <!-- Loading State -->
    <div v-if="loading" class="flex justify-center items-center py-8">
      <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-600"></div>
      <span class="ml-2 text-gray-600">Kullanıcılar yükleniyor...</span>
    </div>

    <!-- Error State -->
    <div v-else-if="error" class="bg-red-50 border border-red-200 rounded-lg p-4 mb-6">
      <div class="flex">
        <svg class="w-5 h-5 text-red-400 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
        <span class="text-red-800">{{ error }}</span>
      </div>
    </div>

    <!-- Kullanıcı Tablosu -->
    <div v-else class="bg-white rounded-lg shadow overflow-hidden">
      <table class="min-w-full divide-y divide-gray-200">
        <thead class="bg-gray-50">
          <tr>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kullanıcı</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">E-posta</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Rol</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Kayıt Tarihi</th>
            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">İşlemler</th>
          </tr>
        </thead>
        <tbody class="bg-white divide-y divide-gray-200">
          <tr v-for="user in filteredUsers" :key="user.id">
            <td class="px-6 py-4 whitespace-nowrap">
              <div class="flex items-center">
                <div class="h-10 w-10 rounded-full bg-gray-200 flex items-center justify-center">
                  <span class="text-lg font-medium text-gray-600">{{ user.full_name ? user.full_name.charAt(0) : user.email.charAt(0) }}</span>
                </div>
                <div class="ml-4">
                  <div class="text-sm font-medium text-gray-900">{{ user.full_name || 'İsimsiz Kullanıcı' }}</div>
                  <div class="text-sm text-gray-500">ID: {{ user.id }}</div>
                </div>
              </div>
            </td>
            <td class="px-6 py-4 whitespace-nowrap">
              <div class="text-sm text-gray-900">{{ user.email }}</div>
            </td>
            <td class="px-6 py-4 whitespace-nowrap">
              <div class="flex items-center space-x-2">
                <span :class="{
                  'px-2 py-1 text-xs font-semibold rounded-full': true,
                  'bg-purple-100 text-purple-800': user.role === 'admin',
                  'bg-blue-100 text-blue-800': user.role === 'user',
                  'bg-gray-100 text-gray-800': user.role === 'moderator'
                }">
                  {{ user.role === 'admin' ? 'Admin' : 
                     user.role === 'moderator' ? 'Moderatör' : 'Kullanıcı' }}
                </span>
                <select 
                  v-model="user.role" 
                  @change="updateUserRole(user)"
                  class="px-2 py-1 text-xs border rounded focus:ring-2 focus:ring-indigo-500"
                  :disabled="user.role === 'admin' || getCurrentUser()?.role !== 'admin'"
                  :title="getRoleSelectTitle(user)"
                >
                  <option value="user">Kullanıcı</option>
                  <option value="moderator">Moderatör</option>
                  <option value="admin">Admin</option>
                </select>
              </div>
            </td>
            <td class="px-6 py-4 whitespace-nowrap">
              <div class="text-sm text-gray-900">{{ formatDate(user.created_at) }}</div>
            </td>
            <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
              <div class="flex space-x-2">
                <button 
                  @click="deleteUser(user)" 
                  class="text-red-600 hover:text-red-900"
                  :disabled="!canDeleteUser(user)"
                  :title="getDeleteButtonTitle(user)"
                >
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                  </svg>
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Boş Durum -->
    <div v-if="!loading && !error && filteredUsers.length === 0" class="text-center py-8">
      <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197m13.5-9a2.5 2.5 0 11-5 0 2.5 2.5 0 015 0z" />
      </svg>
      <h3 class="mt-2 text-sm font-medium text-gray-900">Kullanıcı bulunamadı</h3>
      <p class="mt-1 text-sm text-gray-500">{{ searchQuery ? 'Arama kriterlerinize uygun kullanıcı yok.' : 'Henüz kullanıcı kaydı yok.' }}</p>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useSupabase } from '~/composables/useSupabase'

const router = useRouter()

definePageMeta({
  layout: 'custom'
})

const { supabase } = useSupabase()

// Reactive state
const users = ref([])
const loading = ref(true)
const error = ref(null)
const searchQuery = ref('')

// Filtrelenmiş kullanıcılar
const filteredUsers = computed(() => {
  if (!searchQuery.value) return users.value
  
  return users.value.filter(user => 
    (user.full_name && user.full_name.toLowerCase().includes(searchQuery.value.toLowerCase())) ||
    user.email.toLowerCase().includes(searchQuery.value.toLowerCase())
  )
})

// Admin yetki kontrolü
const checkAdminAccess = () => {
  const token = localStorage.getItem('token')
  const userData = localStorage.getItem('user')
  
  if (!token || !userData) {
    router.push('/auth/login')
    return false
  }
  
  try {
    const user = JSON.parse(userData)
    
    // Sadece admin rolü olan kullanıcılar erişebilir
    if (user.role !== 'admin') {
      router.push('/404')
      return false
    }
    
    return true
  } catch (error) {
    console.error('User data parse error:', error)
    localStorage.removeItem('token')
    localStorage.removeItem('user')
    router.push('/auth/login')
    return false
  }
}

// Kullanıcıları yükle
const loadUsers = async () => {
  try {
    loading.value = true
    error.value = null
    
    // Admin yetki kontrolü
    if (!checkAdminAccess()) {
      return
    }
    
    // Tüm kullanıcıları getir
    const { data, error: fetchError } = await supabase
      .from('users')
      .select('*')
      .order('created_at', { ascending: false })
    
    if (fetchError) throw fetchError
    
    users.value = data || []
  } catch (err) {
    console.error('Kullanıcılar yüklenirken hata:', err)
    error.value = 'Kullanıcılar yüklenirken bir hata oluştu: ' + err.message
  } finally {
    loading.value = false
  }
}

// Kullanıcı rolünü güncelle
const updateUserRole = async (user) => {
  // Sadece adminler rol değiştirebilir
  const currentUser = getCurrentUser()
  if (currentUser?.role !== 'admin') {
    alert('Sadece adminler kullanıcı rollerini değiştirebilir!')
    // Kullanıcıları yeniden yükle (rol değişikliğini geri al)
    await loadUsers()
    return
  }
  
  try {
    console.log('Güncellenecek kullanıcı:', user)
    
    const { data, error: updateError } = await supabase
      .from('users')
      .update({ role: user.role })
      .eq('id', user.id)
      .select()
    
    if (updateError) {
      console.error('Update error:', updateError)
      throw updateError
    }
    
    console.log('Güncelleme sonucu:', data)
    
    // Başarı mesajı göster
    alert(`${user.full_name || user.email} kullanıcısının rolü ${user.role} olarak güncellendi.`)
    
    // Kullanıcıları yeniden yükle
    await loadUsers()
  } catch (err) {
    console.error('Rol güncellenirken hata:', err)
    alert('Rol güncellenirken bir hata oluştu: ' + err.message)
    
    // Hata durumunda kullanıcıları yeniden yükle
    await loadUsers()
  }
}

// Yetki kontrol fonksiyonları
const getCurrentUser = () => {
  const userData = localStorage.getItem('user')
  return userData ? JSON.parse(userData) : null
}

const canDeleteUser = (user) => {
  const currentUser = getCurrentUser()
  
  // Admin herkesi silebilir
  if (currentUser?.role === 'admin') {
    return true
  }
  
  return false
}

const getDeleteButtonTitle = (user) => {
  const currentUser = getCurrentUser()
  
  if (currentUser?.role === 'admin') {
    return 'Kullanıcıyı sil'
  }
  
  return 'Yetkiniz yok'
}

const getRoleSelectTitle = (user) => {
  const currentUser = getCurrentUser()
  
  if (user.role === 'admin') {
    return 'Admin rolü değiştirilemez'
  }
  
  if (currentUser?.role !== 'admin') {
    return 'Sadece adminler rol değiştirebilir'
  }
  
  return 'Rol seçin'
}

// Kullanıcı sil
const deleteUser = async (user) => {
  if (!canDeleteUser(user)) {
    alert('Bu kullanıcıyı silme yetkiniz yok!')
    return
  }
  
  if (!confirm(`${user.full_name || user.email} kullanıcısını silmek istediğinize emin misiniz?`)) {
    return
  }
  
  try {
    const { error: deleteError } = await supabase
      .from('users')
      .delete()
      .eq('id', user.id)
    
    if (deleteError) throw deleteError
    
    // Kullanıcıyı listeden kaldır
    users.value = users.value.filter(u => u.id !== user.id)
    
    alert('Kullanıcı başarıyla silindi.')
  } catch (err) {
    console.error('Kullanıcı silinirken hata:', err)
    alert('Kullanıcı silinirken bir hata oluştu.')
  }
}

// Kullanıcıları yenile
const refreshUsers = () => {
  loadUsers()
}

// Tarih formatla
const formatDate = (dateString) => {
  if (!dateString) return 'Bilinmiyor'
  
  const date = new Date(dateString)
  return date.toLocaleDateString('tr-TR', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit'
  })
}

// Sayfa yüklendiğinde kullanıcıları yükle
onMounted(() => {
  loadUsers()
})
</script>