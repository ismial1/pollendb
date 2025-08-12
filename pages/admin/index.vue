<template>
  <div>
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

      <!-- Hızlı İşlemler -->
      <div class="bg-white rounded-lg shadow">
        <div class="p-4 border-b">
          <h2 class="text-lg font-semibold">Hızlı İşlemler</h2>
        </div>
        <div class="p-4 grid grid-cols-2 gap-4">
          <button v-for="action in quickActions" :key="action.title"
                  @click="action.onClick"
                  class="flex items-center p-3 rounded-lg border hover:bg-gray-50">
            <component :is="action.icon" class="w-5 h-5 text-gray-500"/>
            <span class="ml-2 text-sm">{{ action.title }}</span>
          </button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
definePageMeta({
  layout: 'custom'
})

const stats = [
  {
    title: 'Toplam Kullanıcı',
    value: '1,234',
    bgColor: 'bg-blue-100',
    textColor: 'text-blue-600',
    icon: 'UserIcon'
  },
  {
    title: 'Aktif Oturumlar',
    value: '42',
    bgColor: 'bg-green-100',
    textColor: 'text-green-600',
    icon: 'UsersIcon'
  },
  {
    title: 'Bekleyen İşlemler',
    value: '15',
    bgColor: 'bg-yellow-100',
    textColor: 'text-yellow-600',
    icon: 'ClockIcon'
  },
  {
    title: 'Toplam İşlem',
    value: '5,678',
    bgColor: 'bg-purple-100',
    textColor: 'text-purple-600',
    icon: 'ChartBarIcon'
  }
]

const recentActions = [
  {
    id: 1,
    title: 'Yeni kullanıcı kaydı',
    time: '5 dakika önce',
    bgColor: 'bg-green-100',
    textColor: 'text-green-600',
    icon: 'UserPlusIcon'
  },
  {
    id: 2,
    title: 'Sistem güncellemesi',
    time: '1 saat önce',
    bgColor: 'bg-blue-100',
    textColor: 'text-blue-600',
    icon: 'RefreshIcon'
  }
]

const quickActions = [
  {
    title: 'Yeni Kullanıcı',
    icon: 'UserPlusIcon',
    onClick: () => navigateTo('/admin/users')
  },
  {
    title: 'Rapor Oluştur',
    icon: 'DocumentIcon',
    onClick: () => console.log('Rapor oluştur')
  },
  {
    title: 'Ayarlar',
    icon: 'CogIcon',
    onClick: () => navigateTo('/admin/settings')
  },
  {
    title: 'Yedekleme',
    icon: 'DatabaseIcon',
    onClick: () => console.log('Yedekleme başlat')
  }
]
</script> 