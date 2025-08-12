<template>
  <div>
    <!-- Hero Section -->
    <div class="relative bg-gradient-to-br from-indigo-50 to-purple-50">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-24">
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
          <!-- Sol Taraf: Metin -->
          <div class="space-y-8">
            <h1 class="text-4xl md:text-5xl font-bold text-gray-900">
              Palinolojik Veri Servisi
            </h1>
            <p class="text-xl text-gray-600">
              Türkiye'nin en kapsamlı polen veri tabanına hoş geldiniz. Binlerce polen örneği, detaylı analizler ve bilimsel araştırmalar tek platformda.
            </p>
            <div class="flex space-x-4">
              <NuxtLink to="/submit-data" 
                class="px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition-colors">
                Veri Ekle
              </NuxtLink>
              <NuxtLink to="search-data/alphabetical" 
                class="px-6 py-3 border-2 border-indigo-600 text-indigo-600 rounded-lg hover:bg-indigo-50 transition-colors">
                Veritabanını Keşfet
              </NuxtLink>
            </div>
          </div>

          <!-- Sağ Taraf: Polen Görseli Slider -->
          <div class="relative">
            <div class="absolute inset-0 bg-gradient-to-br from-indigo-500/10 to-purple-500/10 rounded-3xl transform rotate-3"></div>
            
            <!-- Slider -->
            <div class="relative rounded-3xl shadow-xl overflow-hidden">
              <div class="relative w-full aspect-square">
                <!-- Slider Görselleri -->
                <div 
                  class="absolute inset-0 w-full h-full transition-opacity duration-500"
                >
                  <img 
                    :src="sliderImages[currentSlide].src" 
                    :alt="sliderImages[currentSlide].alt"
                    class="w-full h-full object-cover"
                  />
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
    <div class="bg-white py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8 text-center">
          <div class="p-6 bg-indigo-50 rounded-xl">
            <div class="text-3xl font-bold text-indigo-600">5000+</div>
            <div class="text-gray-600 mt-2">Polen Örneği</div>
          </div>
          <div class="p-6 bg-purple-50 rounded-xl">
            <div class="text-3xl font-bold text-purple-600">100+</div>
            <div class="text-gray-600 mt-2">Bitki Familyası</div>
          </div>
          <div class="p-6 bg-indigo-50 rounded-xl">
            <div class="text-3xl font-bold text-indigo-600">250+</div>
            <div class="text-gray-600 mt-2">Araştırmacı</div>
          </div>
          <div class="p-6 bg-purple-50 rounded-xl">
            <div class="text-3xl font-bold text-purple-600">1000+</div>
            <div class="text-gray-600 mt-2">Bilimsel Yayın</div>
          </div>
        </div>
      </div>
    </div>

    <!-- Öne Çıkan Özellikler -->
    <div class="bg-gray-50 py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-3xl font-bold text-center text-gray-900 mb-12">Platformumuzun Özellikleri</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <!-- Özellik 1 -->
          <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
            <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center mb-4">
              <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2">Detaylı Arama</h3>
            <p class="text-gray-600">Gelişmiş filtreleme seçenekleriyle polen veritabanında hızlı ve kolay arama yapın.</p>
          </div>

          <!-- Özellik 2 -->
          <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
            <div class="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center mb-4">
              <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
            </div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2">Görsel Analiz</h3>
            <p class="text-gray-600">Yüksek çözünürlüklü mikroskop görüntüleri ve detaylı görsel analizler.</p>
          </div>

          <!-- Özellik 3 -->
          <div class="bg-white p-6 rounded-xl shadow-lg hover:shadow-xl transition-shadow">
            <div class="w-12 h-12 bg-indigo-100 rounded-lg flex items-center justify-center mb-4">
              <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
            </div>
            <h3 class="text-xl font-semibold text-gray-900 mb-2">Veri Paylaşımı</h3>
            <p class="text-gray-600">Kendi polen verilerinizi ekleyin ve bilimsel toplulukla paylaşın.</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Son Eklenenler -->
    <div class="bg-white py-16">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <h2 class="text-3xl font-bold text-center text-gray-900 mb-12">Son Eklenen Polen Örnekleri</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <div v-for="i in 3" :key="i" class="bg-gray-50 rounded-xl overflow-hidden shadow-lg hover:shadow-xl transition-shadow">
            <img src="/" alt="Polen Örneği" class="w-full h-48 object-cover"/>
            <div class="p-6">
              <h3 class="text-xl font-semibold text-gray-900 mb-2">Asteraceae Familyası</h3>
              <p class="text-gray-600 mb-4">Helianthus annuus polen örneği ve detaylı analizi.</p>
              <NuxtLink to="/plants/1" class="text-indigo-600 hover:text-indigo-700 font-medium">
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

const sliderImages = [
  {
    id: 1,
    src: '/images/pollen-1.jpg',
    alt: 'Polen Mikroskop Görüntüsü 1'
  },
  {
    id: 2,
    src: '/images/pollen-2.jpg',
    alt: 'Polen Mikroskop Görüntüsü 2'
  },
  {
    id: 3,
    src: '/images/pollen-3.jpg',
    alt: 'Polen Mikroskop Görüntüsü 3'
  },
  {
    id: 4,
    src: '/images/pollen-4.jpg',
    alt: 'Polen Mikroskop Görüntüsü 4'
  }
]

const currentSlide = ref(0)
let intervalId = null

// Otomatik geçiş için
onMounted(() => {
  intervalId = setInterval(() => {
    currentSlide.value = (currentSlide.value + 1) % sliderImages.length
  }, 4000) // Her 4 saniyede bir geçiş
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