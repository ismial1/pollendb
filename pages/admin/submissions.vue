<template>
  <div>
    <!-- Başlık ve Filtreler -->
    <div class="mb-6 flex justify-between items-center">
      <h1 class="text-2xl font-semibold text-gray-900">Veri Onayları</h1>
      <div class="flex space-x-3">
        <select 
          v-model="statusFilter"
          class="border rounded-lg px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"
        >
          <option value="all">Tüm Durumlar</option>
          <option value="pending">Bekleyen</option>
          <option value="approved">Onaylanan</option>
          <option value="rejected">Reddedilen</option>
        </select>
      </div>
    </div>

    <!-- Onay Kartları -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
      <div v-for="submission in filteredSubmissions" 
           :key="submission.id" 
           class="bg-white rounded-lg shadow-sm overflow-hidden">
        <!-- Kart Başlığı -->
        <div class="px-4 py-3 bg-gray-50 border-b flex justify-between items-center">
          <div class="flex items-center">
            <div class="h-8 w-8 rounded-full bg-gray-200 flex items-center justify-center">
              <span class="text-sm font-medium text-gray-600">{{ submission.user.name.charAt(0) }}</span>
            </div>
            <div class="ml-3">
              <p class="text-sm font-medium text-gray-900">{{ submission.user.name }}</p>
              <p class="text-xs text-gray-500">{{ submission.date }}</p>
            </div>
          </div>
          <span class="px-2 py-1 text-xs font-semibold rounded-full"
                :class="{
                  'bg-yellow-100 text-yellow-800': submission.status === 'pending',
                  'bg-green-100 text-green-800': submission.status === 'approved',
                  'bg-red-100 text-red-800': submission.status === 'rejected'
                }">
            {{ getStatusText(submission.status) }}
          </span>
        </div>

        <!-- Kart İçeriği -->
        <div class="p-4">
          <div class="space-y-3">
            <div v-for="(value, key) in submission.data" :key="key" class="flex justify-between">
              <span class="text-sm text-gray-500">{{ key }}:</span>
              <span class="text-sm font-medium text-gray-900">{{ value }}</span>
            </div>
          </div>

          <!-- Dosya Ekleri -->
          <div v-if="submission.attachments?.length" class="mt-4 pt-4 border-t">
            <p class="text-sm font-medium text-gray-700 mb-2">Ekler:</p>
            <div class="space-y-2">
              <a 
                v-for="attachment in submission.attachments" 
                :key="attachment.id"
                :href="attachment.url"
                class="flex items-center text-sm text-indigo-600 hover:text-indigo-900"
              >
                <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15.172 7l-6.586 6.586a2 2 0 102.828 2.828l6.414-6.586a4 4 0 00-5.656-5.656l-6.415 6.585a6 6 0 108.486 8.486L20.5 13" />
                </svg>
                {{ attachment.name }}
              </a>
            </div>
          </div>

          <!-- Onay/Red Butonları -->
          <div class="mt-4 pt-4 border-t flex space-x-3">
            <button 
              v-if="submission.status === 'pending'"
              @click="approveSubmission(submission)"
              class="flex-1 bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 text-sm font-medium"
            >
              Onayla
            </button>
            <button 
              v-if="submission.status === 'pending'"
              @click="rejectSubmission(submission)"
              class="flex-1 bg-red-600 text-white px-4 py-2 rounded-lg hover:bg-red-700 text-sm font-medium"
            >
              Reddet
            </button>
            <button 
              v-if="submission.status !== 'pending'"
              @click="resetSubmission(submission)"
              class="flex-1 bg-gray-600 text-white px-4 py-2 rounded-lg hover:bg-gray-700 text-sm font-medium"
            >
              Sıfırla
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

// Durum filtresi
const statusFilter = ref('all')


// Filtrelenmiş başvurular
const filteredSubmissions = computed(() => {
  if (statusFilter.value === 'all') return submissions.value
  return submissions.value.filter(s => s.status === statusFilter.value)
})

// Durum metinleri
const getStatusText = (status) => {
  const statusMap = {
    pending: 'Bekliyor',
    approved: 'Onaylandı',
    rejected: 'Reddedildi'
  }
  return statusMap[status] || status
}

// Onay işlemleri
const approveSubmission = (submission) => {
  submission.status = 'approved'
  // API çağrısı yapılacak
  console.log('Başvuru onaylandı:', submission)
}

const rejectSubmission = (submission) => {
  submission.status = 'rejected'
  // API çağrısı yapılacak
  console.log('Başvuru reddedildi:', submission)
}

const resetSubmission = (submission) => {
  submission.status = 'pending'
  // API çağrısı yapılacak
  console.log('Başvuru sıfırlandı:', submission)
}
</script> 