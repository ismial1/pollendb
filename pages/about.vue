<template>
  <div class="bg-white py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Ana Başlık -->
      <div class="text-center">
        <h2 class="text-3xl font-extrabold text-gray-900 sm:text-4xl">
          Polen Veritabanı Projesi
        </h2>
        <p class="mt-4 text-lg text-gray-500">
          Uludağ Üniversitesi Biyoloji Bölümü Polen Araştırma ve Veri Merkezi
        </p>
      </div>

      <!-- Proje Hakkında -->
      <div class="mt-16">
        <div class="grid grid-cols-1 gap-8 md:grid-cols-2">
          <div class="bg-gray-50 p-6 rounded-lg">
            <h3 class="text-xl font-bold text-indigo-600 mb-4">Projemiz</h3>
            <p class="text-gray-600">
              Bu veritabanı, Türkiye'deki polen çeşitliliğini dijital ortamda kataloglamak ve araştırmacılara sunmak amacıyla Uludağ Üniversitesi Biyoloji Bölümü tarafından geliştirilmiştir. Polenler hakkında detaylı bilgi, mikroskobik görüntüler ve sınıflandırma verileri içermektedir.
            </p>
          </div>
          <div class="bg-gray-50 p-6 rounded-lg">
            <h3 class="text-xl font-bold text-indigo-600 mb-4">Amacımız</h3>
            <p class="text-gray-600">
              Palinoloji alanında çalışan araştırmacılara, öğrencilere ve ilgili sektör profesyonellerine kapsamlı bir polen veritabanı sunarak bilimsel araştırmalara katkı sağlamak.
            </p>
          </div>
        </div>
      </div>

      <!-- İstatistikler -->
      <div class="mt-16">
        <dl class="grid grid-cols-2 gap-8 md:grid-cols-4">
          <div class="text-center">
            <dt class="text-2xl font-bold text-indigo-600">{{ plantCount }}+</dt>
            <dd class="mt-2 text-gray-600">Polen Türü</dd>
          </div>
          <div class="text-center">
            <dt class="text-2xl font-bold text-indigo-600">5000+</dt>
            <dd class="mt-2 text-gray-600">Mikroskop Görüntüsü</dd>
          </div>
          <div class="text-center">
            <dt class="text-2xl font-bold text-indigo-600">{{ familyCount }}+</dt>
            <dd class="mt-2 text-gray-600">Bitki Familyası</dd>
          </div>
          <div class="text-center">
            <dt class="text-2xl font-bold text-indigo-600">{{ researcherCount }}+</dt>
            <dd class="mt-2 text-gray-600">Araştırmacı</dd>
          </div>
        </dl>
      </div>

      <!-- Özellikler -->
      <div class="mt-16">
        <div class="grid grid-cols-1 gap-8 md:grid-cols-3">
          <div class="flex flex-col items-center">
            <div class="flex items-center justify-center h-12 w-12 rounded-md bg-indigo-600 text-white mb-4">
              <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </div>
            <h3 class="text-lg font-medium text-gray-900">Detaylı Arama</h3>
            <p class="mt-2 text-gray-500 text-center">
              Polen türü, familya, morfolojik özellikler ve coğrafi dağılım bazında arama yapabilme
            </p>
          </div>
          <div class="flex flex-col items-center">
            <div class="flex items-center justify-center h-12 w-12 rounded-md bg-indigo-600 text-white mb-4">
              <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
            </div>
            <h3 class="text-lg font-medium text-gray-900">Yüksek Çözünürlüklü Görüntüler</h3>
            <p class="mt-2 text-gray-500 text-center">
              Her polen türü için detaylı mikroskop görüntüleri ve 3D modellemeler
            </p>
          </div>
          <div class="flex flex-col items-center">
            <div class="flex items-center justify-center h-12 w-12 rounded-md bg-indigo-600 text-white mb-4">
              <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
            </div>
            <h3 class="text-lg font-medium text-gray-900">Detaylı Dokümantasyon</h3>
            <p class="mt-2 text-gray-500 text-center">
              Morfolojik özellikler, mevsimsel dağılım ve ekolojik veriler
            </p>
          </div>
        </div>
      </div>

      <!-- İletişim -->
      <div class="mt-16 text-center">
        <h3 class="text-2xl font-bold text-gray-900">
          Araştırma ve İşbirliği
        </h3>
        <p class="mt-4 text-lg text-gray-500">
          Projemize katkıda bulunmak veya verilerimizden yararlanmak için bizimle iletişime geçin.
        </p>
        <div class="mt-6">
          <router-link
            to="/contact"
            class="inline-flex items-center px-6 py-3 border border-transparent text-base font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700"
          >
            İletişime Geçin
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useSupabase } from '~/composables/useSupabase'

const { supabase } = useSupabase()
const plantCount = ref(0)
const familyCount = ref(0)
const researcherCount = ref(0)

// Plant sayısını Supabase'den çek
const loadPlantCount = async () => {
  try {
    const { count, error } = await supabase
      .from('plants')
      .select('*', { count: 'exact', head: true })
    
    if (error) {
      console.error('Plant count error:', error)
      return
    }
    
    plantCount.value = count || 0
  } catch (error) {
    console.error('Plant count fetch error:', error)
  }
}

// Familya sayısını Supabase'den çek
const loadFamilyCount = async () => {
  try {
    const { data, error } = await supabase
      .from('plants')
      .select('family')
    
    if (error) {
      console.error('Family count error:', error)
      return
    }
    
    // Benzersiz familyaları say
    const uniqueFamilies = [...new Set(data.map(plant => plant.family).filter(Boolean))]
    familyCount.value = uniqueFamilies.length
  } catch (error) {
    console.error('Family count fetch error:', error)
  }
}

// Araştırmacı sayısını Supabase'den çek (admin ve moderatör)
const loadResearcherCount = async () => {
  try {
    const { count, error } = await supabase
      .from('users')
      .select('*', { count: 'exact', head: true })
      .in('role', ['admin', 'moderator'])
    
    if (error) {
      console.error('Researcher count error:', error)
      return
    }
    
    researcherCount.value = count || 0
  } catch (error) {
    console.error('Researcher count fetch error:', error)
  }
}

// Sayfa yüklendiğinde verileri çek
onMounted(() => {
  loadPlantCount()
  loadFamilyCount()
  loadResearcherCount()
})
</script> 