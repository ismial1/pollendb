<template>
  <div class="min-h-screen bg-gray-50">
    <!-- Header -->
    <div class="bg-white shadow">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="py-6">
          <!-- Başlık -->
          <div class="mb-4">
            <h1 class="text-2xl font-bold text-gray-900">Veri Onayları</h1>
            <p class="mt-1 text-sm text-gray-500">
              Kullanıcıların gönderdiği verileri inceleyin ve onaylayın
            </p>
          </div>
          
          <!-- Yenile Butonu -->
          <div class="flex justify-end">
            <button
              @click="refreshSubmissions"
              :disabled="loading"
              class="px-4 py-2 text-sm font-medium text-gray-700 bg-white border border-gray-300 rounded-md hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            >
              <svg class="w-4 h-4 inline mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15" />
              </svg>
              Yenile
            </button>
          </div>
        </div>
      </div>
    </div>

    <!-- Content -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <!-- Stats -->
      <div class="grid grid-cols-2 lg:grid-cols-4 gap-4 lg:gap-6 mb-8">
        <div class="bg-white rounded-lg shadow p-4 lg:p-6">
          <div class="flex items-center">
            <div class="flex-shrink-0">
              <div class="w-8 h-8 bg-yellow-100 rounded-full flex items-center justify-center">
                <svg class="w-5 h-5 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                </svg>
              </div>
            </div>
            <div class="ml-3 lg:ml-4">
              <p class="text-xs lg:text-sm font-medium text-gray-500">Bekleyen</p>
              <p class="text-lg lg:text-2xl font-semibold text-gray-900">{{ stats.pending }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow p-4 lg:p-6">
          <div class="flex items-center">
            <div class="flex-shrink-0">
              <div class="w-8 h-8 bg-green-100 rounded-full flex items-center justify-center">
                <svg class="w-5 h-5 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
              </div>
            </div>
            <div class="ml-3 lg:ml-4">
              <p class="text-xs lg:text-sm font-medium text-gray-500">Onaylanan</p>
              <p class="text-lg lg:text-2xl font-semibold text-gray-900">{{ stats.approved }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow p-4 lg:p-6">
          <div class="flex items-center">
            <div class="flex-shrink-0">
              <div class="w-8 h-8 bg-red-100 rounded-full flex items-center justify-center">
                <svg class="w-5 h-5 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </div>
            </div>
            <div class="ml-3 lg:ml-4">
              <p class="text-xs lg:text-sm font-medium text-gray-500">Reddedilen</p>
              <p class="text-lg lg:text-2xl font-semibold text-gray-900">{{ stats.rejected }}</p>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-lg shadow p-4 lg:p-6">
          <div class="flex items-center">
            <div class="flex-shrink-0">
              <div class="w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center">
                <svg class="w-5 h-5 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                </svg>
              </div>
            </div>
            <div class="ml-3 lg:ml-4">
              <p class="text-xs lg:text-sm font-medium text-gray-500">Toplam</p>
              <p class="text-lg lg:text-2xl font-semibold text-gray-900">{{ stats.total }}</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Filters -->
      <div class="bg-white rounded-lg shadow mb-6">
        <div class="px-4 lg:px-6 py-4 border-b border-gray-200">
          <div class="space-y-4">
            <!-- Durum Filtresi -->
            <div>
              <label for="status-filter" class="block text-sm font-medium text-gray-700 mb-2">Durum</label>
              <select 
                id="status-filter"
                v-model="statusFilter"
                class="block w-full pl-3 pr-10 py-2 text-sm border border-gray-300 rounded-md focus:outline-none focus:ring-indigo-500 focus:border-indigo-500"
              >
                <option value="">Tümü</option>
                <option value="pending">Bekleyen</option>
                <option value="approved">Onaylanan</option>
                <option value="rejected">Reddedilen</option>
              </select>
            </div>
            
            <!-- Arama -->
            <div>
              <label class="block text-sm font-medium text-gray-700 mb-2">Arama</label>
              <div class="relative">
                <input
                  v-model="searchQuery"
                  type="text"
                  placeholder="Bitki adı veya kullanıcı ara..."
                  class="block w-full pl-10 pr-3 py-2 border border-gray-300 rounded-md leading-5 bg-white placeholder-gray-500 focus:outline-none focus:placeholder-gray-400 focus:ring-1 focus:ring-indigo-500 focus:border-indigo-500 text-sm"
                />
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                  <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                  </svg>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Submissions List -->
      <div class="bg-white shadow overflow-hidden sm:rounded-md">
        <div v-if="loading" class="p-8 text-center">
          <svg class="mx-auto h-8 w-8 text-gray-400 animate-spin" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
          </svg>
          <p class="mt-2 text-sm text-gray-500">Yükleniyor...</p>
        </div>

        <div v-else-if="error" class="p-8 text-center">
          <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z" />
          </svg>
          <h3 class="mt-2 text-sm font-medium text-gray-900">Hata oluştu</h3>
          <p class="mt-1 text-sm text-gray-500">{{ error }}</p>
        </div>

        <div v-else-if="filteredSubmissions.length === 0" class="p-8 text-center">
          <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
          </svg>
          <h3 class="mt-2 text-sm font-medium text-gray-900">Veri bulunamadı</h3>
          <p class="mt-1 text-sm text-gray-500">{{ searchQuery || statusFilter ? 'Arama kriterlerinize uygun veri yok.' : 'Henüz veri gönderimi yok.' }}</p>
    </div>

        <ul v-else class="divide-y divide-gray-200">
          <li v-for="submission in filteredSubmissions" :key="submission.id" class="px-6 py-4 hover:bg-gray-50">
            <div class="flex items-center justify-between">
              <div class="flex items-center space-x-4">
                <div class="flex-shrink-0">
                  <img
                    v-if="submission.plant_data.image_url"
                    :src="submission.plant_data.image_url"
                    :alt="submission.plant_data.name"
                    class="h-12 w-12 rounded-lg object-cover"
                  />
                  <div v-else class="h-12 w-12 rounded-lg bg-gray-200 flex items-center justify-center">
                    <svg class="h-6 w-6 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
                    </svg>
                  </div>
            </div>
                <div>
                  <h3 class="text-sm font-medium text-gray-900">{{ submission.plant_data.name }}</h3>
                  <p class="text-sm text-gray-500">{{ submission.plant_data.family }}</p>
                  <p class="text-xs text-gray-400">
                    {{ submission.user_name }} ({{ submission.user_email }}) tarafından {{ formatDate(submission.created_at) }}
                  </p>
            </div>
          </div>
              <div class="flex items-center space-x-3">
                                 <span :class="{
                   'px-2 py-1 text-xs font-semibold rounded-full': true,
                  'bg-yellow-100 text-yellow-800': submission.status === 'pending',
                  'bg-green-100 text-green-800': submission.status === 'approved',
                  'bg-red-100 text-red-800': submission.status === 'rejected'
                }">
            {{ getStatusText(submission.status) }}
          </span>
                <button
                  @click="viewSubmission(submission)"
                  class="text-indigo-600 hover:text-indigo-900 text-sm font-medium"
                >
                  İncele
                </button>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>

    <!-- Submission Detail Modal -->
    <div v-if="selectedSubmission" class="fixed inset-0 bg-gray-600 bg-opacity-50 overflow-y-auto h-full w-full z-50">
      <div class="relative top-4 lg:top-20 mx-auto p-4 lg:p-5 border w-11/12 max-w-4xl shadow-lg rounded-md bg-white">
        <div class="mt-3">
          <!-- Modal Header -->
          <div class="flex flex-col lg:flex-row lg:justify-between lg:items-start mb-6 space-y-3 lg:space-y-0">
            <div>
              <h3 class="text-lg font-medium text-gray-900">{{ selectedSubmission.plant_data.name }}</h3>
              <p class="text-sm text-gray-500">{{ selectedSubmission.plant_data.family }}</p>
              <p class="text-xs text-gray-400">
                {{ selectedSubmission.user_name }} ({{ selectedSubmission.user_email }}) tarafından {{ formatDate(selectedSubmission.created_at) }}
              </p>
            </div>
            <button @click="selectedSubmission = null" class="text-gray-400 hover:text-gray-500 self-end lg:self-auto">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          <!-- Modal Content -->
          <div class="space-y-6">
            <!-- Images -->
            <div v-if="selectedSubmission.plant_data.image_url || selectedSubmission.plant_data.images">
              <h4 class="text-sm font-medium text-gray-900 mb-3">Fotoğraflar</h4>
              <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
                <img
                  v-if="selectedSubmission.plant_data.image_url"
                  :src="selectedSubmission.plant_data.image_url"
                  :alt="selectedSubmission.plant_data.name"
                  class="h-24 w-full object-cover rounded-lg"
                />
                <img
                  v-for="(image, index) in selectedSubmission.plant_data.images"
                  :key="index"
                  :src="image"
                  :alt="`${selectedSubmission.plant_data.name} - ${index + 2}`"
                  class="h-24 w-full object-cover rounded-lg"
                />
              </div>
            </div>

            <!-- Plant Data -->
            <div>
              <h4 class="text-sm font-medium text-gray-900 mb-3">Bitki Verileri</h4>
              <div class="bg-gray-50 rounded-lg p-4">
                <dl class="grid grid-cols-1 lg:grid-cols-2 gap-4 text-sm">
                  <div v-for="(value, key) in selectedSubmission.plant_data" :key="key">
                    <dt class="font-medium text-gray-700">{{ getFieldLabel(key) }}</dt>
                    <dd class="text-gray-900">{{ value || '-' }}</dd>
                  </div>
                </dl>
              </div>
            </div>

            <!-- Admin Notes -->
            <div v-if="selectedSubmission.admin_notes">
              <h4 class="text-sm font-medium text-gray-900 mb-3">Admin Notları</h4>
              <div class="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
                <p class="text-sm text-yellow-800">{{ selectedSubmission.admin_notes }}</p>
            </div>
          </div>

            <!-- Action Buttons -->
            <div v-if="selectedSubmission.status === 'pending'" class="flex justify-end space-x-3 pt-6 border-t">
            <button 
                @click="rejectSubmission(selectedSubmission)"
                class="px-4 py-2 text-sm font-medium text-red-700 bg-red-100 hover:bg-red-200 rounded-md"
              >
                Reddet
              </button>
              <button 
                @click="approveSubmission(selectedSubmission)"
                class="px-4 py-2 text-sm font-medium text-white bg-green-600 hover:bg-green-700 rounded-md"
              >
                Onayla
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useSupabase } from '~/composables/useSupabase'

const router = useRouter()
const { supabase } = useSupabase()

definePageMeta({
  layout: 'custom'
})

// Reactive state
const submissions = ref([])
const loading = ref(true)
const error = ref(null)
const searchQuery = ref('')
const statusFilter = ref('')
const selectedSubmission = ref(null)

// Stats
const stats = computed(() => {
  const pending = submissions.value.filter(s => s.status === 'pending').length
  const approved = submissions.value.filter(s => s.status === 'approved').length
  const rejected = submissions.value.filter(s => s.status === 'rejected').length
  return {
    pending,
    approved,
    rejected,
    total: submissions.value.length
  }
})

// Filtered submissions
const filteredSubmissions = computed(() => {
  let filtered = submissions.value

  if (statusFilter.value) {
    filtered = filtered.filter(s => s.status === statusFilter.value)
  }

  if (searchQuery.value) {
    const query = searchQuery.value.toLowerCase()
    filtered = filtered.filter(s => 
      s.plant_data.name.toLowerCase().includes(query) ||
      s.plant_data.family.toLowerCase().includes(query) ||
      s.user_name.toLowerCase().includes(query) ||
      s.user_email.toLowerCase().includes(query)
    )
  }

  return filtered.sort((a, b) => new Date(b.created_at) - new Date(a.created_at))
})

// Super admin access check
const checkSuperAdminAccess = () => {
  const token = localStorage.getItem('token')
  const userData = localStorage.getItem('user')

  if (!token || !userData) {
    router.push('/auth/login')
    return false
  }

  try {
    const user = JSON.parse(userData)
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

// Load submissions
const loadSubmissions = async () => {
  if (!checkSuperAdminAccess()) return

  try {
    loading.value = true
    error.value = null

    const { data, error: fetchError } = await supabase
      .from('submissions')
      .select('*')
      .order('created_at', { ascending: false })

    if (fetchError) throw fetchError

    submissions.value = data || []
  } catch (err) {
    console.error('Submissions load error:', err)
    error.value = 'Veriler yüklenirken bir hata oluştu: ' + err.message
  } finally {
    loading.value = false
  }
}

// Approve submission
const approveSubmission = async (submission) => {
  try {
    // 1. Plants tablosuna ekle
    const { error: plantError } = await supabase
      .from('plants')
      .insert(submission.plant_data)

    if (plantError) throw plantError

    // 2. Submission'ı onaylandı olarak işaretle
    const currentUser = JSON.parse(localStorage.getItem('user'))
    const { error: updateError } = await supabase
      .from('submissions')
      .update({
        status: 'approved',
        admin_id: currentUser.id,
        updated_at: new Date().toISOString()
      })
      .eq('id', submission.id)

    if (updateError) throw updateError

    // 3. Listeyi yenile
    await loadSubmissions()
    selectedSubmission.value = null

    alert('Veri başarıyla onaylandı ve yayınlandı!')
  } catch (err) {
    console.error('Approve error:', err)
    alert('Onaylama sırasında bir hata oluştu: ' + err.message)
  }
}

// Reject submission
const rejectSubmission = async (submission) => {
  const reason = prompt('Red sebebini yazın (opsiyonel):')
  
  try {
    const currentUser = JSON.parse(localStorage.getItem('user'))
    const { error } = await supabase
      .from('submissions')
      .update({
        status: 'rejected',
        admin_id: currentUser.id,
        admin_notes: reason || null,
        updated_at: new Date().toISOString()
      })
      .eq('id', submission.id)

    if (error) throw error

    await loadSubmissions()
    selectedSubmission.value = null

    alert('Veri reddedildi.')
  } catch (err) {
    console.error('Reject error:', err)
    alert('Reddetme sırasında bir hata oluştu: ' + err.message)
  }
}

// View submission details
const viewSubmission = (submission) => {
  selectedSubmission.value = submission
}

// Refresh submissions
const refreshSubmissions = () => {
  loadSubmissions()
}

// Format date
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

// Get status text
const getStatusText = (status) => {
  switch (status) {
    case 'pending': return 'Bekliyor'
    case 'approved': return 'Onaylandı'
    case 'rejected': return 'Reddedildi'
    default: return status
  }
}

// Get field label
const getFieldLabel = (key) => {
  const labels = {
    name: 'Bitki Adı',
    family: 'Familya',
    description: 'Açıklama',
    image_url: 'Ana Fotoğraf',
    images: 'Diğer Fotoğraflar',
    pollen_unit: 'Polen Birimi',
    dispersal_unit: 'Dağılım Birimi',
    pollen_class: 'Polen Sınıfı',
    size: 'Boyut',
    hydrated_size: 'Hidratlanmış Boyut',
    polarity: 'Polarite',
    shape: 'Şekil',
    outline_polar: 'Polar Görünüm',
    pe_ratio: 'P/E Oranı',
    orientation: 'Oryantasyon',
    aperture_number: 'Apertur Sayısı',
    aperture_type: 'Apertur Tipi',
    aperture_condition: 'Apertur Durumu',
    aperture_peculiarities: 'Apertur Özellikleri',
    ornamentation_lm: 'Ornamentasyon LM',
    nexine: 'Nexine',
    sexine: 'Sexine',
    ornamentation: 'Ornamentasyon',
    suprasculpture: 'Supraskulptür',
    tectum: 'Tektum',
    infratectum: 'İnfratektum',
    foot_layer: 'Foot Layer',
    endexine: 'Endeksin',
    intine: 'İntin',
    supratectal_elements: 'Supratektal Elementler',
    wall_peculiarities: 'Duvar Özellikleri',
    pollen_coatings: 'Polen Kaplamaları',
    reserves: 'Rezervler',
    cell_number: 'Hücre Sayısı',
    ubisch_bodies: 'Ubisch Cisimleri',
    preparation: 'Hazırlama',
    staining: 'Boyama'
  }
  return labels[key] || key
}

// Load on mount
onMounted(() => {
  loadSubmissions()
})
</script> 