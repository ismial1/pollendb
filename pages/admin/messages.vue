<template>
  <div>
    <!-- Başlık ve Arama -->
    <div class="mb-6">
      <!-- Başlık -->
      <div class="mb-4">
        <h1 class="text-2xl font-semibold text-gray-900">Mesajlar</h1>
      </div>
      
      <!-- Filtreler ve Butonlar -->
      <div class="space-y-3">
        <!-- Arama -->
        <div class="relative">
          <input 
            type="text" 
            v-model="searchQuery"
            placeholder="Mesajlarda ara..." 
            class="w-full pl-10 pr-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
          >
          <svg class="w-5 h-5 text-gray-400 absolute left-3 top-2.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
          </svg>
        </div>
        
        <!-- Filtreler ve Yenile -->
        <div class="flex flex-col sm:flex-row space-y-2 sm:space-y-0 sm:space-x-3">
          <select 
            v-model="statusFilter"
            class="border rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"
          >
            <option value="all">Tüm Mesajlar</option>
            <option value="unread">Okunmamış</option>
            <option value="read">Okunmuş</option>
            <option value="replied">Yanıtlandı</option>
          </select>
          <button
            @click="refreshMessages"
            :disabled="loading"
            class="inline-flex items-center px-3 py-2 border border-gray-300 shadow-sm text-sm leading-4 font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50"
          >
            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
            </svg>
            Yenile
          </button>
        </div>
      </div>
    </div>

    <!-- Loading State -->
    <div v-if="loading" class="flex justify-center items-center py-12">
      <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-600"></div>
      <span class="ml-3 text-gray-600">Mesajlar yükleniyor...</span>
    </div>

    <!-- Desktop Mesaj Listesi -->
    <div v-else-if="filteredMessages.length > 0" class="bg-white rounded-lg shadow overflow-hidden hidden lg:block">
      <div class="divide-y divide-gray-200">
        <div v-for="message in filteredMessages" 
             :key="message.id" 
             :class="['p-6 hover:bg-gray-50 transition-colors cursor-pointer',
                     {'bg-indigo-50': message.status === 'unread'}]"
             @click="openMessage(message)">
          <div class="flex items-center justify-between">
            <!-- Gönderen Bilgisi -->
            <div class="flex items-center space-x-3">
              <div class="flex-shrink-0">
                <div class="w-10 h-10 rounded-full bg-gray-200 flex items-center justify-center">
                  <span class="text-gray-600 font-medium">{{ message.name[0].toUpperCase() }}</span>
                </div>
              </div>
              <div>
                <h3 class="text-sm font-medium text-gray-900">
                  {{ message.name }}
                  <span class="ml-2 text-sm text-gray-500">{{ message.email }}</span>
                </h3>
                <p class="text-sm text-gray-500">{{ formatDate(message.created_at) }}</p>
              </div>
            </div>

            <!-- Durum ve Aksiyonlar -->
            <div class="flex items-center space-x-4">
              <span v-if="message.status === 'unread'" 
                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-indigo-100 text-indigo-800">
                Yeni
              </span>
              <span v-else-if="message.status === 'read'" 
                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800">
                Okundu
              </span>
              <span v-else-if="message.status === 'replied'" 
                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                Yanıtlandı
              </span>
              <div class="flex items-center space-x-2">
                <button @click.stop="markAsRead(message)" 
                        v-if="message.status === 'unread'"
                        class="text-gray-400 hover:text-gray-500"
                        title="Okundu olarak işaretle">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                </button>
                <button @click.stop="markAsReplied(message)" 
                        v-if="message.status !== 'replied'"
                        class="text-gray-400 hover:text-green-500"
                        title="Yanıtlandı olarak işaretle">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6" />
                  </svg>
                </button>
                <button @click.stop="deleteMessage(message.id)" 
                        class="text-gray-400 hover:text-red-500"
                        title="Mesajı sil">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                  </svg>
                </button>
              </div>
            </div>
          </div>

          <!-- Mesaj İçeriği -->
          <div class="mt-4">
            <h4 class="text-base font-medium text-gray-900">{{ message.subject }}</h4>
            <p class="mt-1 text-sm text-gray-600 line-clamp-2">{{ message.message }}</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Mobil Mesaj Kartları -->
    <div v-else-if="filteredMessages.length > 0" class="lg:hidden space-y-4">
      <div v-for="message in filteredMessages" 
           :key="message.id" 
           :class="['bg-white rounded-lg shadow p-4 cursor-pointer',
                   {'bg-indigo-50': message.status === 'unread'}]"
           @click="openMessage(message)">
        <!-- Gönderen Bilgisi -->
        <div class="flex items-start space-x-3 mb-4">
          <div class="flex-shrink-0">
            <div class="w-12 h-12 rounded-full bg-gray-200 flex items-center justify-center">
              <span class="text-gray-600 font-medium text-lg">{{ message.name[0].toUpperCase() }}</span>
            </div>
          </div>
          <div class="flex-1 min-w-0">
            <h3 class="text-lg font-medium text-gray-900 mb-1">{{ message.name }}</h3>
            <p class="text-sm text-gray-500 mb-2">{{ message.email }}</p>
            <p class="text-xs text-gray-400">{{ formatDate(message.created_at) }}</p>
          </div>
        </div>

        <!-- Durum -->
        <div class="mb-3">
          <span v-if="message.status === 'unread'" 
                class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-indigo-100 text-indigo-800">
            Yeni
          </span>
          <span v-else-if="message.status === 'read'" 
                class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-yellow-100 text-yellow-800">
            Okundu
          </span>
          <span v-else-if="message.status === 'replied'" 
                class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
            Yanıtlandı
          </span>
        </div>

        <!-- Mesaj İçeriği -->
        <div class="mb-4">
          <h4 class="text-base font-medium text-gray-900 mb-2">{{ message.subject }}</h4>
          <p class="text-sm text-gray-600 line-clamp-3">{{ message.message }}</p>
        </div>

        <!-- Aksiyon Butonları -->
        <div class="flex items-center justify-between pt-3 border-t border-gray-200">
          <div class="flex items-center space-x-2">
            <button @click.stop="markAsRead(message)" 
                    v-if="message.status === 'unread'"
                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-gray-600 bg-gray-100 border border-gray-200 rounded-lg hover:bg-gray-200 hover:text-gray-700 focus:outline-none focus:ring-2 focus:ring-gray-500"
                    title="Okundu olarak işaretle">
              <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
              Okundu
            </button>
            <button @click.stop="markAsReplied(message)" 
                    v-if="message.status !== 'replied'"
                    class="inline-flex items-center px-3 py-2 text-sm font-medium text-green-600 bg-green-100 border border-green-200 rounded-lg hover:bg-green-200 hover:text-green-700 focus:outline-none focus:ring-2 focus:ring-green-500"
                    title="Yanıtlandı olarak işaretle">
              <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 10h10a8 8 0 018 8v2M3 10l6 6m-6-6l6-6" />
              </svg>
              Yanıtlandı
            </button>
          </div>
          <button @click.stop="deleteMessage(message.id)" 
                  class="inline-flex items-center px-3 py-2 text-sm font-medium text-red-600 bg-red-100 border border-red-200 rounded-lg hover:bg-red-200 hover:text-red-700 focus:outline-none focus:ring-2 focus:ring-red-500"
                  title="Mesajı sil">
            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
            </svg>
            Sil
          </button>
        </div>
      </div>
    </div>

    <!-- Empty State -->
    <div v-else class="text-center py-12">
      <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
      </svg>
      <h3 class="mt-2 text-sm font-medium text-gray-900">Henüz mesaj yok</h3>
      <p class="mt-1 text-sm text-gray-500">İletişim formundan gelen mesajlar burada görünecek.</p>
    </div>

    <!-- Mesaj Detay Modalı -->
    <div v-if="selectedMessage" 
         class="fixed inset-0 bg-gray-500 bg-opacity-75 flex items-center justify-center p-4 z-50">
      <div class="bg-white rounded-lg shadow-xl max-w-2xl w-full max-h-[80vh] overflow-y-auto">
        <div class="p-6">
                     <!-- Modal Header -->
           <div>
             <h3 class="text-lg font-medium text-gray-900">{{ selectedMessage.subject }}</h3>
             <p class="mt-1 text-sm text-gray-500">
               {{ selectedMessage.name }} ({{ selectedMessage.email }})
             </p>
             <p class="text-sm text-gray-500">{{ formatDate(selectedMessage.created_at) }}</p>
           </div>

          <!-- Modal Content -->
          <div class="mt-6">
            <p class="text-gray-600 whitespace-pre-line">{{ selectedMessage.message }}</p>
          </div>

          <!-- Modal Footer -->
          <div class="mt-6 flex justify-end">
            <button @click="selectedMessage = null" 
                    class="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-md">
              Kapat
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useSupabase } from '~/composables/useSupabase'

definePageMeta({
  layout: 'custom'
})

// Admin yetki kontrolü
const checkAdminAccess = () => {
  const token = localStorage.getItem('token')
  const userData = localStorage.getItem('user')
  
  if (!token || !userData) {
    window.location.href = '/auth/login'
    return false
  }
  
  try {
    const user = JSON.parse(userData)
    
    if (user.role !== 'admin') {
      window.location.href = '/404'
      return false
    }
    
    return true
  } catch (error) {
    console.error('User data parse error:', error)
    localStorage.removeItem('token')
    localStorage.removeItem('user')
    window.location.href = '/auth/login'
    return false
  }
}

const { supabase } = useSupabase()
const loading = ref(false)
const messages = ref([])
const selectedMessage = ref(null)

// Filtreler
const searchQuery = ref('')
const statusFilter = ref('all')

// Filtrelenmiş mesajlar
const filteredMessages = computed(() => {
  return messages.value
    .filter(message => {
      if (statusFilter.value !== 'all' && message.status !== statusFilter.value) return false
      
      const searchLower = searchQuery.value.toLowerCase()
      return message.name.toLowerCase().includes(searchLower) ||
             message.email.toLowerCase().includes(searchLower) ||
             message.subject.toLowerCase().includes(searchLower) ||
             message.message.toLowerCase().includes(searchLower)
    })
})

// Mesajları yükle
const loadMessages = async () => {
  if (!checkAdminAccess()) return
  
     try {
     loading.value = true
     
     // Admin kullanıcı bilgisini kontrol et
     const userData = localStorage.getItem('user')
     const user = JSON.parse(userData)
     
     // Direkt Supabase'den çekelim
     const { data, error } = await supabase
       .from('messages')
       .select('*')
       .order('created_at', { ascending: false })
     
     if (error) {
       console.error('Supabase error:', error)
       throw error
     }
     
     messages.value = data || []
    
  } catch (error) {
    console.error('Mesajlar yüklenirken hata:', error)
  } finally {
    loading.value = false
  }
}

// Mesaj işlemleri
const openMessage = (message) => {
  selectedMessage.value = message
  if (message.status === 'unread') {
    markAsRead(message)
  }
}

const markAsRead = async (message) => {
  try {
    const { error } = await supabase
      .from('messages')
      .update({ status: 'read' })
      .eq('id', message.id)
    
    if (error) throw error
    
    // Listeyi güncelle
    const messageIndex = messages.value.findIndex(msg => msg.id === message.id)
    if (messageIndex !== -1) {
      messages.value[messageIndex].status = 'read'
    }
    
    if (selectedMessage.value?.id === message.id) {
      selectedMessage.value.status = 'read'
    }
  } catch (error) {
    console.error('Mesaj güncellenirken hata:', error)
    alert('Mesaj güncellenirken bir hata oluştu')
  }
}

const markAsReplied = async (message) => {
  try {
    const { error } = await supabase
      .from('messages')
      .update({ status: 'replied' })
      .eq('id', message.id)
    
    if (error) throw error
    
    // Listeyi güncelle
    const messageIndex = messages.value.findIndex(msg => msg.id === message.id)
    if (messageIndex !== -1) {
      messages.value[messageIndex].status = 'replied'
    }
    
    if (selectedMessage.value?.id === message.id) {
      selectedMessage.value.status = 'replied'
    }
  } catch (error) {
    console.error('Mesaj güncellenirken hata:', error)
    alert('Mesaj güncellenirken bir hata oluştu')
  }
}

const deleteMessage = async (messageId) => {
  if (!confirm('Bu mesajı silmek istediğinizden emin misiniz?')) {
    return
  }
  
  try {
    const { error } = await supabase
      .from('messages')
      .delete()
      .eq('id', messageId)
    
    if (error) throw error
    
    // Listeyi güncelle
    messages.value = messages.value.filter(msg => msg.id !== messageId)
    
    if (selectedMessage.value?.id === messageId) {
      selectedMessage.value = null
    }
  } catch (error) {
    console.error('Mesaj silinirken hata:', error)
    alert('Mesaj silinirken bir hata oluştu')
  }
}

const replyToMessage = (message) => {
  // Yanıtlama fonksiyonu - email açma
  const subject = `Re: ${message.subject}`
  const body = `\n\n--- Orijinal Mesaj ---\nGönderen: ${message.name} (${message.email})\nTarih: ${formatDate(message.created_at)}\n\n${message.message}`
  
  const mailtoLink = `mailto:${message.email}?subject=${encodeURIComponent(subject)}&body=${encodeURIComponent(body)}`
  window.open(mailtoLink)
}

// Mesajları yenile
const refreshMessages = () => {
  loadMessages()
}

// Tarih formatla
const formatDate = (dateString) => {
  const date = new Date(dateString)
  return date.toLocaleDateString('tr-TR', {
    year: 'numeric',
    month: 'long',
    day: 'numeric',
    hour: '2-digit',
    minute: '2-digit'
  })
}

onMounted(() => {
  loadMessages()
})
</script>

<style scoped>
.line-clamp-2 {
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}
</style> 