<template>
  <div class="bg-white py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <!-- Ana Başlık -->
      <div class="text-center">
        <h2 class="text-3xl font-extrabold text-gray-900 sm:text-4xl">
          Polen Veritabanı Hizmetlerimiz
        </h2>
        <p class="mt-4 text-lg text-gray-500">
          Palinoloji alanında sunduğumuz kapsamlı hizmetler
        </p>
      </div>

      <!-- Ana Hizmetler -->
      <div class="mt-16">
        <div class="grid grid-cols-1 gap-8 md:grid-cols-3">
          <!-- Veri Erişimi -->
          <div class="bg-gray-50 rounded-lg p-8 hover:shadow-lg transition-shadow">
            <div class="flex items-center justify-center h-12 w-12 rounded-md bg-indigo-600 text-white mb-4">
              <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-gray-900 mb-4">Polen Veritabanı Erişimi</h3>
            <ul class="space-y-3 text-gray-600">
              <li>• Detaylı polen morfolojisi bilgileri</li>
              <li>• Yüksek çözünürlüklü mikroskop görüntüleri</li>
              <li>• Mevsimsel dağılım verileri</li>
              <li>• Coğrafi yayılım haritaları</li>
              <li>• Literatür referansları</li>
            </ul>
          </div>

          <!-- Analiz Hizmetleri -->
          <div class="bg-gray-50 rounded-lg p-8 hover:shadow-lg transition-shadow">
            <div class="flex items-center justify-center h-12 w-12 rounded-md bg-indigo-600 text-white mb-4">
              <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-gray-900 mb-4">Polen Analiz Hizmetleri</h3>
            <ul class="space-y-3 text-gray-600">
              <li>• Polen türü tanımlama</li>
              <li>• Morfolojik analiz</li>
              <li>• Polen yoğunluğu ölçümü</li>
              <li>• Alerjen polen tespiti</li>
              <li>• Bal poleni analizi</li>
            </ul>
          </div>

          <!-- Eğitim ve Danışmanlık -->
          <div class="bg-gray-50 rounded-lg p-8 hover:shadow-lg transition-shadow">
            <div class="flex items-center justify-center h-12 w-12 rounded-md bg-indigo-600 text-white mb-4">
              <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
              </svg>
            </div>
            <h3 class="text-xl font-bold text-gray-900 mb-4">Eğitim ve Danışmanlık</h3>
            <ul class="space-y-3 text-gray-600">
              <li>• Polen analiz eğitimleri</li>
              <li>• Araştırma metodolojisi</li>
              <li>• Laboratuvar teknikleri</li>
              <li>• Proje danışmanlığı</li>
              <li>• Akademik işbirliği</li>
            </ul>
          </div>
        </div>
      </div>

      <!-- Özel Hizmetler -->
      <div class="mt-16">
        <h3 class="text-2xl font-bold text-gray-900 text-center mb-8">
          Özel Araştırma Hizmetleri
        </h3>
        <div class="grid grid-cols-1 gap-8 md:grid-cols-2">
          <!-- Araştırma Desteği -->
          <div class="bg-white p-6 rounded-lg border border-gray-200">
            <h4 class="text-lg font-semibold text-indigo-600 mb-4">Araştırma Projeleri</h4>
            <ul class="space-y-2 text-gray-600">
              <li>• TÜBİTAK ve BAP projelerinde işbirliği</li>
              <li>• Uluslararası araştırma ağına erişim</li>
              <li>• Özel sektör AR-GE desteği</li>
              <li>• Bilimsel yayın hazırlama desteği</li>
            </ul>
          </div>
          
          <!-- Endüstriyel Hizmetler -->
          <div class="bg-white p-6 rounded-lg border border-gray-200">
            <h4 class="text-lg font-semibold text-indigo-600 mb-4">Endüstriyel Uygulamalar</h4>
            <ul class="space-y-2 text-gray-600">
              <li>• Bal kalite analizi</li>
              <li>• Alerjen polen takibi</li>
              <li>• Tarımsal polen analizi</li>
              <li>• Çevresel etki değerlendirmesi</li>
            </ul>
          </div>
        </div>
      </div>

      <!-- İletişim CTA -->
      <div class="mt-16 text-center">
        <h3 class="text-2xl font-bold text-gray-900">
          Hizmetlerimizden Yararlanın
        </h3>
        <p class="mt-4 text-lg text-gray-500">
          Projeleriniz için özel çözümler sunuyoruz. Detaylı bilgi için bizimle iletişime geçin.
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
// Component logic here if needed
</script>

<style scoped>
.transition-shadow {
  transition: box-shadow 0.3s ease-in-out;
}
</style> 