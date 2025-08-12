<template>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50 py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto">
      <!-- Başlık Bölümü -->
      <div class="text-center mb-12">
        <h1 class="text-3xl font-bold text-gray-900 mb-4">Sıkça Sorulan Sorular</h1>
        <p class="text-lg text-gray-600">Aradığınız sorunun cevabını bulamadıysanız iletişime geçebilirsiniz.</p>
      </div>

      <!-- Arama Bölümü -->
      <div class="mb-8">
        <div class="relative">
          <input
            v-model="searchQuery"
            type="text"
            class="w-full px-4 py-3 pl-12 border-2 border-gray-200 rounded-xl focus:border-indigo-500 focus:ring-2 focus:ring-indigo-200 transition-colors duration-200"
            placeholder="Soru ara..."
          >
          <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
            <svg class="h-6 w-6 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
            </svg>
          </div>
        </div>
      </div>

      <!-- FAQ Kategorileri -->
      <div class="flex flex-wrap gap-2 mb-8">
        <button
          v-for="category in categories"
          :key="category"
          @click="selectedCategory = category"
          class="px-4 py-2 rounded-full text-sm font-medium transition-colors duration-200"
          :class="selectedCategory === category 
            ? 'bg-indigo-600 text-white' 
            : 'bg-white text-gray-600 hover:bg-gray-100'"
        >
          {{ category }}
        </button>
      </div>

      <!-- FAQ Listesi -->
      <div class="space-y-4">
        <div
          v-for="(faq, index) in filteredFaqs"
          :key="index"
          class="bg-white rounded-xl overflow-hidden shadow-sm hover:shadow-md transition-shadow duration-200"
        >
          <button
            @click="toggleFaq(index)"
            class="w-full px-6 py-4 text-left flex justify-between items-center focus:outline-none"
            :class="{'bg-gray-50': openFaq === index}"
          >
            <span class="text-gray-900 font-medium">{{ faq.question }}</span>
            <svg
              class="h-5 w-5 text-gray-500 transform transition-transform duration-200"
              :class="{'rotate-180': openFaq === index}"
              fill="none"
              stroke="currentColor"
              viewBox="0 0 24 24"
            >
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
          </button>
          <div
            v-show="openFaq === index"
            class="px-6 py-4 bg-gray-50"
          >
            <p class="text-gray-600">{{ faq.answer }}</p>
            <div v-if="faq.links && faq.links.length" class="mt-4 pt-4 border-t border-gray-200">
              <p class="text-sm font-medium text-gray-900 mb-2">Faydalı Linkler:</p>
              <ul class="space-y-1">
                <li v-for="(link, linkIndex) in faq.links" :key="linkIndex">
                  <a
                    :href="link.url"
                    target="_blank"
                    rel="noopener noreferrer"
                    class="text-sm text-indigo-600 hover:text-indigo-500 flex items-center"
                  >
                    <span>{{ link.text }}</span>
                    <svg class="h-4 w-4 ml-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                    </svg>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <!-- Sonuç Bulunamadı -->
      <div v-if="filteredFaqs.length === 0" class="text-center py-12">
        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
        </svg>
        <h3 class="mt-2 text-sm font-medium text-gray-900">Sonuç bulunamadı</h3>
        <p class="mt-1 text-sm text-gray-500">Aramanızla eşleşen soru bulunamadı.</p>
      </div>

      <!-- İletişim Yönlendirme -->
      <div class="mt-12 bg-indigo-50 rounded-xl p-6 text-center">
        <h3 class="text-lg font-medium text-indigo-900 mb-2">
          Aradığınız cevabı bulamadınız mı?
        </h3>
        <p class="text-indigo-700 mb-4">
          Bizimle iletişime geçin, size yardımcı olalım.
        </p>
        <button
          @click.stop="navigateToContact"
          class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        >
          İletişime Geç
          <svg class="ml-2 -mr-1 h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3" />
          </svg>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

// Kategoriler
const categories = ['Tümü', 'Genel', 'Teknik', 'Ödeme', 'Güvenlik']
const selectedCategory = ref('Tümü')

// Arama
const searchQuery = ref('')

// Açık olan FAQ
const openFaq = ref(null)

// FAQ verileri
const faqs = [
  {
    question: 'Nasıl üye olabilirim?',
    answer: 'Sağ üst köşedeki "Üye Ol" butonuna tıklayarak üyelik formunu doldurabilirsiniz.',
    category: 'Genel',
    links: [
      { text: 'Üyelik Koşulları', url: '/terms' }
    ]
  },
  {
    question: 'Şifremi unuttum, ne yapmalıyım?',
    answer: 'Giriş sayfasındaki "Şifremi Unuttum" linkine tıklayarak şifre sıfırlama talimatlarını takip edebilirsiniz.',
    category: 'Güvenlik'
  },
  {
    question: 'Ödeme yöntemleri nelerdir?',
    answer: 'Kredi kartı, banka kartı, havale/EFT ve kapıda ödeme seçeneklerimiz mevcuttur. Tüm ödemeleriniz 256-bit SSL ile güvence altındadır.',
    category: 'Ödeme',
    links: [
      { text: 'Ödeme Seçenekleri', url: '/payment-options' }
    ]
  },
  {
    question: 'İade ve değişim politikanız nedir?',
    answer: 'Satın aldığınız ürünleri 14 gün içinde iade edebilir veya değiştirebilirsiniz. İade sürecini başlatmak için hesabınızdan sipariş detaylarına giderek iade talebinde bulunabilirsiniz.',
    category: 'Genel',
    links: [
      { text: 'İade Politikası', url: '/return-policy' }
    ]
  },
  {
    question: 'Kargo takibini nasıl yapabilirim?',
    answer: 'Siparişinizin kargo takibini hesabınızdaki "Siparişlerim" bölümünden yapabilirsiniz. Ayrıca size SMS ve e-posta ile kargo takip numarası gönderilecektir.',
    category: 'Genel'
  },
  {
    question: 'İki faktörlü doğrulamayı nasıl etkinleştirebilirim?',
    answer: 'Hesap güvenliğinizi artırmak için hesap ayarlarınızdan iki faktörlü doğrulamayı etkinleştirebilirsiniz. SMS veya authenticator uygulaması seçeneklerinden birini tercih edebilirsiniz.',
    category: 'Güvenlik',
    links: [
      { text: 'Güvenlik Ayarları', url: '/security-settings' }
    ]
  },
  {
    question: 'Teknik destek için nasıl iletişime geçebilirim?',
    answer: 'Teknik destek ekibimize 7/24 canlı destek üzerinden ulaşabilir veya support@example.com adresine e-posta gönderebilirsiniz.',
    category: 'Teknik',
    links: [
      { text: 'Canlı Destek', url: '/live-support' }
    ]
  },
  {
    question: 'Site SSL sertifikası kullanıyor mu?',
    answer: 'Evet, sitemiz en güncel SSL sertifikası kullanmaktadır. Tüm verileriniz şifrelenerek korunmaktadır.',
    category: 'Teknik'
  },
  {
    question: 'Faturamı nasıl görüntüleyebilirim?',
    answer: 'Faturalarınızı hesabınızdaki "Faturalarım" bölümünden görüntüleyebilir ve indirebilirsiniz. E-faturalarınız ayrıca kayıtlı e-posta adresinize de gönderilmektedir.',
    category: 'Ödeme'
  },
  {
    question: 'Taksit seçenekleri mevcut mu?',
    answer: 'Evet, anlaşmalı bankaların kredi kartlarına 2-12 taksit seçenekleri sunuyoruz. Taksit seçeneklerini ödeme sayfasında görebilirsiniz.',
    category: 'Ödeme',
    links: [
      { text: 'Taksit Tablosu', url: '/installment-options' }
    ]
  }
]

// Filtreleme
const filteredFaqs = computed(() => {
  return faqs.filter(faq => {
    const matchesCategory = selectedCategory.value === 'Tümü' || faq.category === selectedCategory.value
    const matchesSearch = faq.question.toLowerCase().includes(searchQuery.value.toLowerCase()) ||
                         faq.answer.toLowerCase().includes(searchQuery.value.toLowerCase())
    return matchesCategory && matchesSearch
  })
})

// FAQ Toggle
const toggleFaq = (index) => {
  openFaq.value = openFaq.value === index ? null : index
}

// İletişim sayfasına yönlendirme fonksiyonu
const navigateToContact = () => {
  router.push('/contact')
}
</script>

<style scoped>
/* Smooth transitions */
.rotate-180 {
  transform: rotate(180deg);
}

/* Gradient animation */
.bg-gradient-to-br {
  background-size: 100% 100%;
}

@keyframes gradient {
  0% { background-position: 0% 50%; }
  100% { background-position: 0% 50%; }
}

/* Hover animations */
.hover\:shadow-md:hover {
  transition: all 0.1s ease-in-out;
}
</style>
