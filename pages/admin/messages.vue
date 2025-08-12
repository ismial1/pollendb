<template>
  <div>
    <!-- Başlık ve Arama -->
    <div class="mb-6 flex justify-between items-center">
      <h1 class="text-2xl font-semibold text-gray-900">Mesajlar</h1>
      <div class="flex space-x-3">
        <div class="relative">
          <input 
            type="text" 
            v-model="searchQuery"
            placeholder="Mesajlarda ara..." 
            class="pl-10 pr-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
          >
          <svg class="w-5 h-5 text-gray-400 absolute left-3 top-2.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
          </svg>
        </div>
        <select 
          v-model="statusFilter"
          class="border rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"
        >
          <option value="all">Tüm Mesajlar</option>
          <option value="unread">Okunmamış</option>
          <option value="read">Okunmuş</option>
          <option value="archived">Arşivlenmiş</option>
        </select>
      </div>
    </div>

    <!-- Mesaj Listesi -->
    <div class="bg-white rounded-lg shadow overflow-hidden">
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
                  <span class="text-gray-600 font-medium">{{ message.sender.name[0] }}</span>
                </div>
              </div>
              <div>
                <h3 class="text-sm font-medium text-gray-900">
                  {{ message.sender.name }}
                  <span class="ml-2 text-sm text-gray-500">{{ message.sender.email }}</span>
                </h3>
                <p class="text-sm text-gray-500">{{ message.date }}</p>
              </div>
            </div>

            <!-- Durum ve Aksiyonlar -->
            <div class="flex items-center space-x-4">
              <span v-if="message.status === 'unread'" 
                    class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-indigo-100 text-indigo-800">
                Yeni
              </span>
              <div class="flex items-center space-x-2">
                <button @click.stop="archiveMessage(message)" 
                        class="text-gray-400 hover:text-gray-500">
                  <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 8h14M5 8a2 2 0 110-4h14a2 2 0 110 4M5 8v10a2 2 0 002 2h10a2 2 0 002-2V8m-9 4h4" />
                  </svg>
                </button>
                <button @click.stop="deleteMessage(message)" 
                        class="text-gray-400 hover:text-red-500">
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
            <p class="mt-1 text-sm text-gray-600 line-clamp-2">{{ message.content }}</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Mesaj Detay Modalı -->
    <div v-if="selectedMessage" 
         class="fixed inset-0 bg-gray-500 bg-opacity-75 flex items-center justify-center p-4">
      <div class="bg-white rounded-lg shadow-xl max-w-2xl w-full max-h-[80vh] overflow-y-auto">
        <div class="p-6">
          <!-- Modal Header -->
          <div class="flex justify-between items-start">
            <div>
              <h3 class="text-lg font-medium text-gray-900">{{ selectedMessage.subject }}</h3>
              <p class="mt-1 text-sm text-gray-500">
                {{ selectedMessage.sender.name }} ({{ selectedMessage.sender.email }})
              </p>
              <p class="text-sm text-gray-500">{{ selectedMessage.date }}</p>
            </div>
            <button @click="selectedMessage = null" 
                    class="text-gray-400 hover:text-gray-500">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          <!-- Modal Content -->
          <div class="mt-6">
            <p class="text-gray-600 whitespace-pre-line">{{ selectedMessage.content }}</p>
          </div>

          <!-- Modal Footer -->
          <div class="mt-6 flex justify-end space-x-3">
            <button @click="selectedMessage = null" 
                    class="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 hover:bg-gray-200 rounded-md">
              Kapat
            </button>
            <button @click="replyToMessage(selectedMessage)" 
                    class="px-4 py-2 text-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 rounded-md">
              Yanıtla
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'

definePageMeta({
  layout: 'custom'
})

// Filtreler
const searchQuery = ref('')
const statusFilter = ref('all')
const selectedMessage = ref(null)

// Örnek mesaj verileri
const messages = ref([
  {
    id: 1,
    sender: {
      name: 'Ahmet Yılmaz',
      email: 'ahmet@example.com'
    },
    subject: 'Yeni Proje Önerisi',
    content: 'Merhaba, yeni bir proje önerisi hakkında görüşmek istiyorum...',
    date: '10 Ocak 2024, 14:30',
    status: 'unread'
  },
  {
    id: 2,
    sender: {
      name: 'Ayşe Kaya',
      email: 'ayse@example.com'
    },
    subject: 'Veri Analizi Raporu',
    content: 'Geçen hafta istediğiniz veri analizi raporunu hazırladım...',
    date: '9 Ocak 2024, 16:45',
    status: 'read'
  },
  {
    id: 3,
    sender: {
      name: 'Mehmet Demir',
      email: 'mehmet@example.com'
    },
    subject: 'API Dokümantasyonu',
    content: 'API dokümantasyonunda bazı güncellemeler yaptım...',
    date: '8 Ocak 2024, 09:15',
    status: 'archived'
  }
])

// Filtrelenmiş mesajlar
const filteredMessages = computed(() => {
  return messages.value
    .filter(message => {
      if (statusFilter.value !== 'all' && message.status !== statusFilter.value) return false
      
      const searchLower = searchQuery.value.toLowerCase()
      return message.sender.name.toLowerCase().includes(searchLower) ||
             message.sender.email.toLowerCase().includes(searchLower) ||
             message.subject.toLowerCase().includes(searchLower) ||
             message.content.toLowerCase().includes(searchLower)
    })
})

// Mesaj işlemleri
const openMessage = (message) => {
  selectedMessage.value = message
  if (message.status === 'unread') {
    message.status = 'read'
  }
}

const archiveMessage = (message) => {
  message.status = 'archived'
}

const deleteMessage = (message) => {
  if (confirm('Bu mesajı silmek istediğinize emin misiniz?')) {
    messages.value = messages.value.filter(m => m.id !== message.id)
  }
}

const replyToMessage = (message) => {
  // Yanıtlama fonksiyonu
  console.log('Yanıtlanacak mesaj:', message)
}
</script> 