<template>
  <div>
    <!-- Hero Section -->
    <div class="relative bg-gradient-to-br from-indigo-50 to-purple-50">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 lg:py-24">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-12 items-center">
          <!-- Sol Taraf: Metin -->
          <div class="space-y-6 lg:space-y-8 text-center lg:text-left">
            <h1 class="text-3xl sm:text-4xl lg:text-5xl font-bold text-gray-900 leading-tight">
              Palinolojik Veri Servisi
            </h1>
            <p class="text-lg sm:text-xl text-gray-600 leading-relaxed">
              Türkiye'nin en kapsamlı polen veri tabanına hoş geldiniz. Binlerce polen örneği, detaylı analizler ve bilimsel araştırmalar tek platformda.
            </p>
            <div class="flex justify-center lg:justify-start">
              <NuxtLink to="search-data/alphabetical" 
                class="px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition-colors text-center">
                Veritabanını Keşfet
              </NuxtLink>
            </div>
          </div>

          <!-- Sağ Taraf: Polen Görseli Slider -->
          <div class="relative order-first lg:order-last">
            <div class="absolute inset-0 bg-gradient-to-br from-indigo-500/10 to-purple-500/10 rounded-2xl lg:rounded-3xl transform rotate-2 lg:rotate-3"></div>
            
            <!-- Slider -->
            <div class="relative rounded-2xl lg:rounded-3xl shadow-xl overflow-hidden">
              <div class="relative w-full aspect-square">
                <!-- Slider Görselleri -->
                <div 
                  class="absolute inset-0 w-full h-full transition-opacity duration-500"
                >
                 
                  <video
                    v-if="sliderImages[currentSlide].type === 'video'"
                    :src="sliderImages[currentSlide].src"
                    :alt="sliderImages[currentSlide].alt"
                    class="w-full h-full object-cover"
                    autoplay
                    muted
                    loop
                   
                  ></video>
                </div>

                <!-- Slider Kontrolleri -->
                <div class="absolute bottom-4 left-1/2 transform -translate-x-1/2 flex space-x-2">
                  <button 
                    v-for="(_, index) in sliderImages" 
                    :key="index"
                    @click="currentSlide = index"
                    class="w-2 h-2 rounded-full transition-all duration-300"
                    :class="currentSlide === index ? 'bg-white w-4' : 'bg-white/50'"
                  ></button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- İstatistikler -->
    <div class="bg-white py-12 lg:py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-2 lg:grid-cols-4 gap-4 lg:gap-8 text-center">
          <div class="p-4 lg:p-6 bg-indigo-50 rounded-xl">
            <div class="text-2xl lg:text-3xl font-bold text-indigo-600">{{ plantCount }}+</div>
            <div class="text-sm lg:text-base text-gray-600 mt-2">Polen Örneği</div>
          </div>
          <div class="p-4 lg:p-6 bg-purple-50 rounded-xl">
            <div class="text-2xl lg:text-3xl font-bold text-purple-600">{{ familyCount }}+</div>
            <div class="text-sm lg:text-base text-gray-600 mt-2">Bitki Familyası</div>
          </div>
          <div class="p-4 lg:p-6 bg-indigo-50 rounded-xl">
            <div class="text-2xl lg:text-3xl font-bold text-indigo-600">{{ researcherCount }}+</div>
            <div class="text-sm lg:text-base text-gray-600 mt-2">Araştırmacı</div>
          </div>
          <div class="p-4 lg:p-6 bg-purple-50 rounded-xl">
            <div class="text-2xl lg:text-3xl font-bold text-purple-600">1000+</div>
            <div class="text-sm lg:text-base text-gray-600 mt-2">Bilimsel Yayın</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Öne Çıkan Özellikler -->
    <div class="bg-gray-50 py-12 lg:py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-2xl lg:text-3xl font-bold text-center text-gray-900 mb-8 lg:mb-12">Platformumuzun Özellikleri</h2>
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 lg:gap-8">
          <!-- Özellik 1 -->
          <div class="bg-white p-4 lg:p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
            <div class="w-10 h-10 lg:w-12 lg:h-12 bg-indigo-100 rounded-lg flex items-center justify-center mb-3 lg:mb-4">
              <svg class="w-5 h-5 lg:w-6 lg:h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </div>
            <h3 class="text-lg lg:text-xl font-semibold text-gray-900 mb-2">Detaylı Arama</h3>
            <p class="text-sm lg:text-base text-gray-600">Gelişmiş filtreleme seçenekleriyle polen veritabanında hızlı ve kolay arama yapın.</p>
          </div>

          <!-- Özellik 2 -->
          <div class="bg-white p-4 lg:p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
            <div class="w-10 h-10 lg:w-12 lg:h-12 bg-purple-100 rounded-lg flex items-center justify-center mb-3 lg:mb-4">
              <svg class="w-5 h-5 lg:w-6 lg:h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
            </div>
            <h3 class="text-lg lg:text-xl font-semibold text-gray-900 mb-2">Görsel Analiz</h3>
            <p class="text-sm lg:text-base text-gray-600">Yüksek çözünürlüklü mikroskop görüntüleri ve detaylı görsel analizler.</p>
          </div>

          <!-- Özellik 3 -->
          <div class="bg-white p-4 lg:p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
            <div class="w-10 h-10 lg:w-12 lg:h-12 bg-indigo-100 rounded-lg flex items-center justify-center mb-3 lg:mb-4">
              <svg class="w-5 h-5 lg:w-6 lg:h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
            </div>
            <h3 class="text-lg lg:text-xl font-semibold text-gray-900 mb-2">Veri Paylaşımı</h3>
            <p class="text-sm lg:text-base text-gray-600">Kendi polen verilerinizi ekleyin ve bilimsel toplulukla paylaşın.</p>
          </div>
        </div>
      </div>
    </div>

         <!-- Son Eklenenler -->
     <div class="bg-white py-12 lg:py-16">
       <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
         <h2 class="text-2xl lg:text-3xl font-bold text-center text-gray-900 mb-8 lg:mb-12">Son Eklenen Polen Örnekleri</h2>
         <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 lg:gap-8">
           <div v-for="plant in latestPlants" :key="plant.id" class="bg-gray-50 rounded-xl overflow-hidden shadow-lg hover:shadow-xl transition-shadow">
             <img :src="plant.image_url || '/images/pollen-1.jpg'" :alt="plant.name" class="w-full h-40 lg:h-48 object-cover"/>
             <div class="p-4 lg:p-6">
               <h3 class="text-lg lg:text-xl font-semibold text-gray-900 mb-2">{{ plant.family }}</h3>
               <p class="text-sm lg:text-base text-gray-600 mb-3 lg:mb-4">{{ plant.name }} polen örneği ve detaylı analizi.</p>
               <NuxtLink :to="`/search-data/alphabetical?plant=${plant.id}`" class="text-indigo-600 hover:text-indigo-700 font-medium text-sm lg:text-base">
                  Detayları İncele →
                </NuxtLink>
             </div>
           </div>
         </div>
       </div>
     </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { useSupabase } from '~/composables/useSupabase'

const { supabase } = useSupabase()
const plantCount = ref(0)
const familyCount = ref(0)
const researcherCount = ref(0)
const latestPlants = ref([])

const sliderImages = [
  {
    id: 1,
    src: '/images/video-1.mp4',
    alt: 'Polen Analiz Videosu',
    type: 'video'
  }
]

const currentSlide = ref(0)
let intervalId = null
let isSliderPaused = false

// Slider'ı duraklat (video oynatılırken)
const pauseSlider = () => {
  isSliderPaused = true
  if (intervalId) {
    clearInterval(intervalId)
    intervalId = null
  }
}

// Slider'ı devam ettir (video durduğunda)
const resumeSlider = () => {
  isSliderPaused = false
  startSlider()
}

// Slider'ı başlat
const startSlider = () => {
  if (isSliderPaused) return
  
  intervalId = setInterval(() => {
    currentSlide.value = (currentSlide.value + 1) % sliderImages.length
  }, 4000) // Her 4 saniyede bir geçiş
}

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

// Son eklenen 3 polen verisini çek
const loadLatestPlants = async () => {
  try {
    const { data, error } = await supabase
      .from('plants')
      .select('id, name, family, image_url, created_at')
      .order('created_at', { ascending: false })
      .limit(3)
    
    if (error) {
      console.error('Latest plants error:', error)
      return
    }
    
    latestPlants.value = data || []
  } catch (error) {
    console.error('Latest plants fetch error:', error)
  }
}

// Otomatik geçiş için
onMounted(() => {
  // Plant sayısını yükle
  loadPlantCount()
  
  // Familya sayısını yükle
  loadFamilyCount()
  
  // Araştırmacı sayısını yükle
  loadResearcherCount()
  
  // Son eklenen polenleri yükle
  loadLatestPlants()
  
  // Slider interval'i başlat
  startSlider()
})

// Component unmount olduğunda interval'i temizle
onUnmounted(() => {
  if (intervalId) {
    clearInterval(intervalId)
    intervalId = null
  }
})
</script>

<style scoped>
/* Fade efekti için */
.transition-opacity {
  transition: opacity 0.5s ease-in-out;
}

/* Slider için ek stiller */
.absolute {
  opacity: 1;
}

/* Hover efektleri */
button:hover {
  transform: scale(1.1);
}
</style>