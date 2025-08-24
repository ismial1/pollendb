<template>
  <div>
    <!-- Loading State -->
    <div v-if="loading" class="flex justify-center items-center py-8">
      <div class="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-600"></div>
      <span class="ml-2 text-gray-600">Dashboard verileri yükleniyor...</span>
    </div>

    <!-- Dashboard Content -->
    <div v-else>
      <!-- İstatistik Kartları -->
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-6">
        <div v-for="stat in stats" :key="stat.title" 
             class="bg-white rounded-lg shadow p-4">
          <div class="flex items-center">
            <div :class="`p-3 rounded-full ${stat.bgColor} ${stat.textColor}`">
              <component :is="stat.icon" class="w-6 h-6"/>
            </div>
            <div class="ml-4">
              <h3 class="text-gray-500 text-sm">{{ stat.title }}</h3>
              <p class="text-2xl font-semibold">{{ stat.value }}</p>
            </div>
          </div>
        </div>
      </div>

    <!-- Son İşlemler ve Grafikler -->
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
      <!-- Son İşlemler -->
      <div class="bg-white rounded-lg shadow">
        <div class="p-4 border-b">
          <h2 class="text-lg font-semibold">Son İşlemler</h2>
        </div>
        <div class="p-4">
          <div v-for="action in recentActions" :key="action.id" 
               class="flex items-center py-3 border-b last:border-0">
            <div :class="`p-2 rounded-full ${action.bgColor} ${action.textColor}`">
              <component :is="action.icon" class="w-4 h-4"/>
            </div>
            <div class="ml-3">
              <p class="text-sm font-medium">{{ action.title }}</p>
              <p class="text-xs text-gray-500">{{ action.time }}</p>
            </div>
          </div>
        </div>
      </div>

      
    </div>
  </div>
  </div>
</template>

<script setup>
import { onMounted, ref, computed } from 'vue'
import { useRouter } from 'vue-router'
import { useSupabase } from '~/composables/useSupabase'

definePageMeta({
  layout: 'custom'
})

const router = useRouter()
const { supabase } = useSupabase()

// Reactive state
const loading = ref(true)
const totalUsers = ref(0)
const activeSessions = ref(0)
const pendingTasks = ref(0)
const totalTransactions = ref(0)
const totalMessages = ref(0)
const totalSubmissions = ref(0)
const recentUsers = ref([])

// Admin yetki kontrolü ve veri yükleme
onMounted(async () => {
  const token = localStorage.getItem('token')
  const userData = localStorage.getItem('user')
  
  if (!token || !userData) {
    router.push('/auth/login')
    return
  }
  
  try {
    const user = JSON.parse(userData)
    
    // Sadece admin rolü olan kullanıcılar erişebilir
    if (user.role !== 'admin') {
      router.push('/404')
      return
    }
    
    // Dashboard verilerini yükle
    await loadDashboardData()
  } catch (error) {
    console.error('User data parse error:', error)
    localStorage.removeItem('token')
    localStorage.removeItem('user')
    router.push('/auth/login')
  }
})

// Dashboard verilerini yükle
const loadDashboardData = async () => {
  try {
    loading.value = true
    
    // Toplam kullanıcı sayısı
    const { count: userCount, error: userError } = await supabase
      .from('users')
      .select('*', { count: 'exact', head: true })
    
    if (userError) throw userError
    totalUsers.value = userCount || 0
    
    // Son 7 günde kayıt olan kullanıcılar (aktif oturumlar için proxy)
    const sevenDaysAgo = new Date()
    sevenDaysAgo.setDate(sevenDaysAgo.getDate() - 7)
    
    const { count: recentCount, error: recentError } = await supabase
      .from('users')
      .select('*', { count: 'exact', head: true })
      .gte('created_at', sevenDaysAgo.toISOString())
    
    if (recentError) throw recentError
    activeSessions.value = recentCount || 0
    
    // Son 5 kullanıcı
    const { data: recentUsersData, error: recentUsersError } = await supabase
      .from('users')
      .select('*')
      .order('created_at', { ascending: false })
      .limit(5)
    
    if (recentUsersError) throw recentUsersError
    recentUsers.value = recentUsersData || []
    
    // Bekleyen işlemler (moderator rolündeki kullanıcılar)
    const { count: moderatorCount, error: moderatorError } = await supabase
      .from('users')
      .select('*', { count: 'exact', head: true })
      .eq('role', 'moderator')
    
    if (moderatorError) throw moderatorError
    pendingTasks.value = moderatorCount || 0
    
    // Toplam işlem (tüm kullanıcıların toplamı)
    totalTransactions.value = totalUsers.value
    
    // Toplam mesaj sayısı
    const { count: messageCount, error: messageError } = await supabase
      .from('messages')
      .select('*', { count: 'exact', head: true })
    
    if (messageError) throw messageError
    totalMessages.value = messageCount || 0
    
    // Toplam submission sayısı
    const { count: submissionCount, error: submissionError } = await supabase
      .from('submissions')
      .select('*', { count: 'exact', head: true })
    
    if (submissionError) throw submissionError
    totalSubmissions.value = submissionCount || 0
    
  } catch (error) {
    console.error('Dashboard verileri yüklenirken hata:', error)
  } finally {
    loading.value = false
  }
}

const stats = computed(() => {
  const baseStats = [
    {
      title: 'Toplam Kullanıcı',
      value: totalUsers.value.toLocaleString(),
      bgColor: 'bg-blue-100',
      textColor: 'text-blue-600',
      icon: 'UserIcon'
    },
    {
      title: 'Son 7 Gün Kayıt',
      value: activeSessions.value.toLocaleString(),
      bgColor: 'bg-green-100',
      textColor: 'text-green-600',
      icon: 'UsersIcon'
    },
    {
      title: 'Toplam Mesaj',
      value: totalMessages.value.toLocaleString(),
      bgColor: 'bg-red-100',
      textColor: 'text-red-600',
      icon: 'MailIcon'
    },
    {
      title: 'Moderatörler',
      value: pendingTasks.value.toLocaleString(),
      bgColor: 'bg-yellow-100',
      textColor: 'text-yellow-600',
      icon: 'ClockIcon'
    }
  ]

  // Sadece süper adminler submission sayısını görebilir
  const userData = localStorage.getItem('user')
  if (userData) {
    try {
      const user = JSON.parse(userData)
      if (user.role === 'admin') {
        baseStats.splice(3, 0, {
          title: 'Veri Onayları',
          value: totalSubmissions.value.toLocaleString(),
          bgColor: 'bg-yellow-100',
          textColor: 'text-yellow-600',
          icon: 'DocumentIcon'
        })
      }
    } catch (error) {
      console.error('User data parse error:', error)
    }
  }

  return baseStats
})

const recentActions = computed(() => {
  return recentUsers.value.map((user, index) => ({
    id: user.id,
    title: `${user.full_name || user.email} kayıt oldu`,
    time: formatTimeAgo(user.created_at),
    bgColor: 'bg-green-100',
    textColor: 'text-green-600',
    icon: 'UserPlusIcon'
  }))
})

// Zaman formatı fonksiyonu
const formatTimeAgo = (dateString) => {
  const date = new Date(dateString)
  const now = new Date()
  const diffInMinutes = Math.floor((now - date) / (1000 * 60))
  
  if (diffInMinutes < 60) {
    return `${diffInMinutes} dakika önce`
  } else if (diffInMinutes < 1440) {
    const hours = Math.floor(diffInMinutes / 60)
    return `${hours} saat önce`
  } else {
    const days = Math.floor(diffInMinutes / 1440)
    return `${days} gün önce`
  }
}


</script> 