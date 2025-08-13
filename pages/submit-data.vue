<template>
  <main>
    <div class="page-wrapper min-h-screen">
      <!-- Başlık Bölümü -->
      <div class="bg-gray-900 py-8 mb-8">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="text-center">
            <h1 class="text-3xl font-bold text-white mb-3">
              Polen Veri Girişi
            </h1>
            <p class="text-gray-300 text-lg max-w-2xl mx-auto">
              Veritabanımıza katkıda bulunun. Lütfen tüm adımları dikkatlice doldurunuz.
              Her bir alan, polen verilerinizin doğru sınıflandırılması için önemlidir.
            </p>
          </div>
        </div>
      </div>

      <div class="max-w-5xl mx-auto px-4">
        <div class="bg-white rounded-2xl shadow-xl overflow-hidden">
          <!-- Progress bar -->
          <div class="bg-gradient-to-r from-indigo-600 to-purple-600 p-4">
            <div class="flex justify-between text-white text-sm">
              <span>Adım {{ currentStep }}/{{ totalSteps }}</span>
              <span>{{ stepProgress }}%</span>
            </div>
            <div class="w-full bg-white/20 rounded-full h-2 mt-2">
              <div 
                class="bg-white rounded-full h-2 transition-all duration-300"
                :style="{ width: `${stepProgress}%` }"
              ></div>
            </div>
          </div>

          <!-- Adım Göstergesi -->
          <div class="mb-8">
            <div class="flex justify-end px-3 py-2">
              <span class="text-sm text-red-500">* işaretli alanlar zorunludur</span>
            </div>
          </div>

          <form @submit.prevent="handleSubmit" class="p-6">
            <!-- Her adımda hata mesajları için alan -->
            <div v-if="stepErrors.length > 0" class="mb-4 p-4 bg-red-50 rounded-md">
              <div class="flex">
                <div class="flex-shrink-0">
                  <svg class="h-5 w-5 text-red-400" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
                  </svg>
                </div>
                <div class="ml-3">
                  <h3 class="text-sm font-medium text-red-800">
                    Lütfen aşağıdaki alanları doldurun:
                  </h3>
                  <div class="mt-2 text-sm text-red-700">
                    <ul class="list-disc pl-5 space-y-1">
                      <li v-for="(error, index) in stepErrors" :key="index">
                        {{ error }}
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>

            <!-- Step 1: Temel Bilgiler -->
            <div v-show="currentStep === 1" class="space-y-6">
              <h2 class="text-xl font-semibold text-gray-800 mb-6">Temel Bilgiler</h2>
              <div class="grid grid-cols-1 gap-6">
                <!-- Bitki Adı -->
                <div class="space-y-2">
                  <label for="name" class="block text-sm font-medium text-gray-700">
                    Bitki Adı <span class="text-red-500">*</span>
                  </label>
                  <div class="relative">
                    <input
                      id="name"
                      v-model="formData.name"
                      type="text"
                      maxlength="250"
                      required
                      class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                             hover:border-gray-300 
                             focus:border-gray-400 focus:ring-1 focus:ring-gray-400 
                             transition-colors duration-200"
                      :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': formData.name.length >= 240 }"
                    />
                    <span 
                      class="absolute right-2 bottom-2 text-sm text-gray-500"
                    >
                      {{ formData.name.length }}/250
                    </span>
                  </div>
                </div>

                <!-- Familya Seçimi -->
                <div class="space-y-2">
                  <label for="family" class="block text-sm font-medium text-gray-700">
                    Familya <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="family"
                    v-model="formData.family"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Familya Seçiniz</option>
                    <option v-for="family in taxonomyOptions.families" :key="family" :value="family">
                      {{ family }}
                    </option>
                  </select>
                </div>

                <!-- Açıklama -->
                <div class="space-y-2">
                  <label for="description" class="block text-sm font-medium text-gray-700">
                    Açıklama <span class="text-red-500">*</span>
                  </label>
                  <div class="relative">
                    <textarea
                      id="description"
                      v-model="formData.description"
                      rows="4"
                      maxlength="250"
                      required
                      class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                             hover:border-gray-300 
                             focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                             transition-colors duration-200"
                      :class="{ 'border-red-300 focus:border-red-500 focus:ring-red-500': formData.description.length >= 240 }"
                    ></textarea>
                    <span 
                      class="absolute right-2 bottom-2 text-sm text-gray-500"
                    >
                      {{ formData.description.length }}/250
                    </span>
                  </div>
                </div>
              </div>
            </div>

            <!-- Step 2: Polen Özellikleri -->
            <div v-show="currentStep === 2" class="space-y-6">
              <h2 class="text-xl font-semibold text-gray-800 mb-6">Polen Özellikleri</h2>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Polen Birimi -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Polen Birimi <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.pollenUnit"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="unit in pollenOptions.units" :key="unit" :value="unit">
                      {{ unit }}
                    </option>
                  </select>
                </div>

                <!-- Dağılım Birimi -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Dağılım Birimi <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.dispersalUnit"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="unit in pollenOptions.dispersalUnits" :key="unit" :value="unit">
                      {{ unit }}
                    </option>
                  </select>
                </div>

                <!-- Polen Sınıfı -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Polen Sınıfı <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.pollenClass"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="pClass in pollenOptions.classes" :key="pClass" :value="pClass">
                      {{ pClass }}
                    </option>
                  </select>
                </div>

                <!-- Boyut -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Boyut <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.size"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="size in pollenOptions.sizes" :key="size" :value="size">
                      {{ size }}
                    </option>
                  </select>
                </div>

                <!-- Hidrate Boyut -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Hidrate Boyut <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.hydratedSize"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="size in pollenOptions.hydratedSizes" :key="size" :value="size">
                      {{ size }}
                    </option>
                  </select>
                </div>
              </div>
            </div>

            <!-- Step 3: Polen Şekil ve Yapı -->
            <div v-show="currentStep === 3" class="space-y-6">
              <h2 class="text-xl font-semibold text-gray-800 mb-6">Polen Şekil ve Yapı</h2>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Polarite -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Polarite <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.polarity"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="polarity in shapeOptions.polarities" :key="polarity" :value="polarity">
                      {{ polarity }}
                    </option>
                  </select>
                </div>

                <!-- Şekil -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Şekil <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.shape"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="shape in shapeOptions.shapes" :key="shape" :value="shape">
                      {{ shape }}
                    </option>
                  </select>
                </div>

                <!-- Polar Görünüm -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Polar Görünüm <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.outlinePolar"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="outline in shapeOptions.outlines" :key="outline" :value="outline">
                      {{ outline }}
                    </option>
                  </select>
                </div>

                <!-- P/E Oranı -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    P/E Oranı <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.peRatio"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="ratio in shapeOptions.peRatios" :key="ratio" :value="ratio">
                      {{ ratio }}
                    </option>
                  </select>
                </div>

                <!-- Oryantasyon -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Oryantasyon <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.orientation"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="orientation in shapeOptions.orientations" :key="orientation" :value="orientation">
                      {{ orientation }}
                    </option>
                  </select>
                </div>
              </div>
            </div>

            <!-- Step 4: Apertur Özellikleri -->
            <div v-show="currentStep === 4" class="space-y-6">
              <h2 class="text-xl font-semibold text-gray-800 mb-6">Apertur Özellikleri</h2>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Apertur Sayısı -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Apertur Sayısı <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.apertureNumber"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="option in apertureOptions.numbers" :key="option.value" :value="option.value">
                      {{ option.label }}
                    </option>
                  </select>
                </div>

                <!-- Apertur Tipi -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Apertur Tipi <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.apertureType"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="option in apertureOptions.types" :key="option.value" :value="option.value">
                      {{ option.label }}
                    </option>
                  </select>
                </div>

                <!-- Apertur Durumu -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Apertur Durumu <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.apertureCondition"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="option in apertureOptions.conditions" :key="option.value" :value="option.value">
                      {{ option.label }}
                    </option>
                  </select>
                </div>

                <!-- Apertur Özellikleri -->
                <div class="space-y-2">
                  <label class="block text-sm font-medium text-gray-700">
                    Apertur Özellikleri <span class="text-red-500">*</span>
                  </label>
                  <select
                    v-model="formData.aperturePeculiarities"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="option in apertureOptions.peculiarities" :key="option.value" :value="option.value">
                      {{ option.label }}
                    </option>
                  </select>
                </div>
              </div>
            </div>

            <!-- Step 5: Ornamentasyon Bilgileri -->
            <div v-show="currentStep === 5" class="space-y-6">
              <h2 class="text-xl font-semibold text-gray-800 mb-6">Ornamentasyon Bilgileri</h2>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Ornamentasyon LM -->
                <div class="space-y-2">
                  <label for="ornamentationLM" class="block text-sm font-medium text-gray-700">
                    Ornamentasyon LM <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="ornamentationLM"
                    v-model="formData.ornamentationLM"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="type in ornamentationOptions.lmTypes" :key="type" :value="type">
                      {{ type }}
                    </option>
                  </select>
                </div>

                <!-- Ornamentasyon -->
                <div class="space-y-2">
                  <label for="ornamentation" class="block text-sm font-medium text-gray-700">
                    Ornamentasyon <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="ornamentation"
                    v-model="formData.ornamentation"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="type in ornamentationOptions.types" :key="type" :value="type">
                      {{ type }}
                    </option>
                  </select>
                </div>

                <!-- Nexine -->
                <div class="space-y-2">
                  <label for="nexine" class="block text-sm font-medium text-gray-700">
                    Nexine <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="nexine"
                    v-model="formData.nexine"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="type in wallOptions.nexineTypes" :key="type" :value="type">
                      {{ type }}
                    </option>
                  </select>
                </div>

                <!-- Sexine -->
                <div class="space-y-2">
                  <label for="sexine" class="block text-sm font-medium text-gray-700">
                    Sexine <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="sexine"
                    v-model="formData.sexine"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="type in wallOptions.sexineTypes" :key="type" :value="type">
                      {{ type }}
                    </option>
                  </select>
                </div>
              </div>
            </div>

            <!-- Step 6: Duvar Yapısı -->
            <div v-show="currentStep === 6" class="space-y-6">
              <h2 class="text-xl font-semibold text-gray-800 mb-6">Duvar Yapısı</h2>
              <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Suprasculpture -->
                <div class="space-y-2">
                  <label for="suprasculpture" class="block text-sm font-medium text-gray-700">
                    Suprasculpture <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="suprasculpture"
                    v-model="formData.suprasculpture"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="type in wallStructureOptions.suprasculpture" :key="type" :value="type">
                      {{ type }}
                    </option>
                  </select>
                </div>

                <!-- Tectum -->
                <div class="space-y-2">
                  <label for="tectum" class="block text-sm font-medium text-gray-700">
                    Tectum <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="tectum"
                    v-model="formData.tectum"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="type in wallStructureOptions.tectum" :key="type" :value="type">
                      {{ type }}
                    </option>
                  </select>
                </div>

                <!-- Infratectum -->
                <div class="space-y-2">
                  <label for="infratectum" class="block text-sm font-medium text-gray-700">
                    Infratectum <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="infratectum"
                    v-model="formData.infratectum"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="type in wallStructureOptions.infratectum" :key="type" :value="type">
                      {{ type }}
                    </option>
                  </select>
                </div>

                <!-- Foot Layer -->
                <div class="space-y-2">
                  <label for="footLayer" class="block text-sm font-medium text-gray-700">
                    Foot Layer <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="footLayer"
                    v-model="formData.footLayer"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="type in wallStructureOptions.footLayer" :key="type" :value="type">
                      {{ type }}
                    </option>
                  </select>
                </div>

                <!-- Endexine -->
                <div class="space-y-2">
                  <label for="endexine" class="block text-sm font-medium text-gray-700">
                    Endexine <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="endexine"
                    v-model="formData.endexine"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="type in wallStructureOptions.endexine" :key="type" :value="type">
                      {{ type }}
                    </option>
                  </select>
                </div>

                <!-- Intine -->
                <div class="space-y-2">
                  <label for="intine" class="block text-sm font-medium text-gray-700">
                    Intine <span class="text-red-500">*</span>
                  </label>
                  <select
                    id="intine"
                    v-model="formData.intine"
                    required
                    class="block w-full px-3 py-2 border-2 border-gray-200 rounded-md shadow-sm 
                           hover:border-gray-300 
                           focus:border-gray-400 focus:ring-1 focus:ring-gray-400
                           transition-colors duration-200"
                  >
                    <option value="">Seçiniz</option>
                    <option v-for="type in wallStructureOptions.intine" :key="type" :value="type">
                      {{ type }}
                    </option>
                  </select>
                </div>
              </div>
            </div>

            <!-- Step 7: Görsel Yükleme -->
            <div v-show="currentStep === 7" class="space-y-6">
              <h2 class="text-xl font-semibold text-gray-800 mb-6">Görsel Yükleme</h2>
              
              <!-- Yüklenen Görseller Grid -->
              <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4 mb-6">
                <div
                  v-for="(image, index) in uploadedImages"
                  :key="index"
                  class="relative aspect-square rounded-lg overflow-hidden border border-gray-200"
                >
                  <img
                    :src="image.preview"
                    class="w-full h-full object-cover"
                    alt="Uploaded image"
                  />
                  <button
                    @click="removeImage(index)"
                    class="absolute top-2 right-2 p-1.5 bg-red-500 text-white rounded-full hover:bg-red-600 transition-colors"
                  >
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                  </button>
                </div>
              </div>

              <!-- Yükleme Alanı -->
              <div
                v-if="uploadedImages.length < 12"
                class="w-full h-64 border-2 border-dashed rounded-lg p-4"
                :class="[
                  dragActive ? 'border-indigo-500 bg-indigo-50' : 'border-gray-300',
                  'hover:border-indigo-500 transition-colors duration-200'
                ]"
                @dragenter.prevent="dragActive = true"
                @dragleave.prevent="dragActive = false"
                @dragover.prevent
                @drop.prevent="handleFileDrop"
              >
                <div class="h-full flex flex-col items-center justify-center">
                  <svg
                    class="mx-auto h-12 w-12 text-gray-400"
                    stroke="currentColor"
                    fill="none"
                    viewBox="0 0 48 48"
                  >
                    <path
                      d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"
                    />
                  </svg>
                  <div class="mt-4 flex text-sm text-gray-600">
                    <label
                      for="file-upload"
                      class="relative cursor-pointer rounded-md font-medium text-indigo-600 hover:text-indigo-500"
                    >
                      <span>Dosya Seç</span>
                      <input
                        id="file-upload"
                        name="file-upload"
                        type="file"
                        multiple
                        class="sr-only"
                        accept="image/*"
                        @change="handleFileUpload"
                      />
                    </label>
                    <p class="pl-1">veya sürükleyip bırakın</p>
                  </div>
                  <p class="text-xs text-gray-500 mt-2">
                    PNG, JPG, GIF - En az 1, en fazla 12 görsel - Her biri max 10MB
                  </p>
                  <p class="text-sm text-indigo-600 mt-2">
                    {{ uploadedImages.length }}/12 görsel yüklendi
                  </p>
                </div>
              </div>

              <!-- Hata Mesajı -->
              <p v-if="imageError" class="text-red-500 text-sm mt-2">
                {{ imageError }}
              </p>

              <!-- Minimum Görsel Uyarısı -->
              <p v-if="uploadedImages.length === 0" class="text-amber-500 text-sm mt-2">
                En az 1 görsel yüklemeniz gerekmektedir.
              </p>
            </div>

            <!-- Navigation Buttons -->
            <div class="flex justify-between mt-8">
              <button
                type="button"
                @click="previousStep"
                class="px-4 py-2 text-sm font-medium text-gray-700 bg-gray-100 rounded-md hover:bg-gray-200"
                :disabled="currentStep === 1"
              >
                Geri
              </button>
              <button
                v-if="currentStep < totalSteps"
                type="button"
                @click="validateAndNextStep"
                class="px-4 py-2 text-sm font-medium text-white bg-indigo-600 rounded-md hover:bg-indigo-700"
              >
                İleri
              </button>
              <button
                v-else
                type="submit"
                class="px-4 py-2 text-sm font-medium text-white bg-indigo-600 rounded-md hover:bg-indigo-700"
                :disabled="isSubmitting"
              >
                {{ isSubmitting ? 'Kaydediliyor...' : 'Kaydet' }}
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </main>

  <!-- Bildirim komponenti -->
  <div v-if="notification.show" 
       :class="[
         'fixed top-4 right-4 p-4 rounded-lg shadow-lg z-50 transition-all duration-300',
         notification.type === 'success' ? 'bg-green-500' : 'bg-red-500'
       ]"
  >
    <div class="flex items-center text-white">
      <span v-if="notification.type === 'success'" class="mr-2">
        <!-- Başarı ikonu -->
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
        </svg>
      </span>
      <span v-else class="mr-2">
        <!-- Hata ikonu -->
        <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </span>
      {{ notification.message }}
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onUnmounted, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { useSupabaseStore } from '~/store/supabase';
const router = useRouter()
const currentStep = ref(1)
const totalSteps = 7 // Toplam adım sayısı
const isSubmitting = ref(false)
const stepErrors = ref([])
const supabaseStore = useSupabaseStore();

// Kullanıcı girişi kontrolü

// Sayfa yüklendiğinde giriş kontrolü
onMounted(async () => {
  // localStorage'dan token kontrolü yap
  const token = localStorage.getItem('token')
  const userData = localStorage.getItem('user')
  
  if (!token || !userData) {
    showNotification('Bu sayfayı kullanmak için giriş yapmanız gerekiyor.', 'error')
    router.push('/auth/login')
    return
  }
  
  try {
    // User data'yı parse et
    const user = JSON.parse(userData)
    
  } catch (error) {
    console.error('User data parse error:', error)
    // Token veya user data bozuksa temizle ve login'e yönlendir
    localStorage.removeItem('token')
    localStorage.removeItem('user')
    showNotification('Oturum bilgileriniz geçersiz. Lütfen tekrar giriş yapın.', 'error')
    router.push('/auth/login')
  }
})

// Bildirim state'i
const notification = ref({
  show: false,
  message: '',
  type: 'success'
})

// Bildirim gösterme fonksiyonu
const showNotification = (message, type = 'success') => {
  notification.value = {
    show: true,
    message,
    type
  }
  
  // 3 saniye sonra bildirimi kapat
  setTimeout(() => {
    notification.value.show = false
  }, 3000)
}

// Adım validasyon kuralları
const stepValidations = {
  1: {
    fields: [
      { name: 'name', label: 'Bitki Adı' },
      { name: 'description', label: 'Açıklama' },
      { name: 'family', label: 'Familya' }
    ]
  },
  2: {
    fields: [
      { name: 'pollenUnit', label: 'Polen Birimi' },
      { name: 'dispersalUnit', label: 'Dağılım Birimi' },
      { name: 'pollenClass', label: 'Polen Sınıfı' },
      { name: 'size', label: 'Boyut' },
      { name: 'hydratedSize', label: 'Hidratlanmış Boyut' }
    ]
  },
  3: {
    fields: [
      { name: 'polarity', label: 'Polarite' },
      { name: 'shape', label: 'Şekil' },
      { name: 'outlinePolar', label: 'Polar Görünüm' },
      { name: 'peRatio', label: 'P/E Oranı' },
      { name: 'orientation', label: 'Oryantasyon' }
    ]
  },
  4: {
    fields: [
      { name: 'apertureNumber', label: 'Apertur Sayısı' },
      { name: 'apertureType', label: 'Apertur Tipi' },
      { name: 'apertureCondition', label: 'Apertur Durumu' },
      { name: 'aperturePeculiarities', label: 'Apertur Özellikleri' }
    ]
  },
  5: {
    fields: [
      { name: 'ornamentationLM', label: 'Ornamentasyon LM' },
      { name: 'nexine', label: 'Nexine' },
      { name: 'sexine', label: 'Sexine' },
      { name: 'ornamentation', label: 'Ornamentasyon' }
    ]
  },
  6: {
    fields: [
      { name: 'suprasculpture', label: 'Suprasculpture' },
      { name: 'tectum', label: 'Tectum' },
      { name: 'infratectum', label: 'Infratectum' },
      { name: 'footLayer', label: 'Foot Layer' },
      { name: 'endexine', label: 'Endexine' },
      { name: 'intine', label: 'Intine' }
    ]
  },
  7: {
    fields: [], // Görsel yükleme adımı özel kontrol gerektirir
    customValidation: () => {
      if (uploadedImages.value.length === 0) {
        return 'En az bir görsel yüklemelisiniz'
      }
      return null
    }
  }
}

// Adım validasyonu
const validateStep = (step) => {
  stepErrors.value = []
  const validation = stepValidations[step]
  
  if (!validation) return true

  // Alan validasyonları
  if (validation.fields) {
    validation.fields.forEach(field => {
      const value = formData.value[field.name]
      if (!value || (typeof value === 'string' && !value.trim())) {
        stepErrors.value.push(`${field.label} alanı zorunludur`)
      }
    })
  }

  // Özel validasyonlar
  if (validation.customValidation) {
    const customError = validation.customValidation()
    if (customError) {
      stepErrors.value.push(customError)
    }
  }

  return stepErrors.value.length === 0
}

// İleri gitme ve validasyon
const validateAndNextStep = () => {
  if (validateStep(currentStep.value)) {
    currentStep.value++
  } else {
    showNotification('Lütfen tüm zorunlu alanları doldurun', 'error')
    // Sayfayı yukarı kaydır
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    })
  }
}

// Geri gitme
const previousStep = () => {
  if (currentStep.value > 1) {
    currentStep.value--
    stepErrors.value = [] // Hataları temizle
  }
}

// Form gönderimi
const handleSubmit = async () => {
  // Tüm adımları kontrol et
  for (let step = 1; step <= totalSteps; step++) {
    if (!validateStep(step)) {
      currentStep.value = step
      showNotification('Lütfen tüm zorunlu alanları doldurun', 'error')
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      })
      return
    }
  }

  try {
    isSubmitting.value = true
    
    // Kullanıcı girişi kontrolü - localStorage'dan kontrol et
    const token = localStorage.getItem('token')
    const userData = localStorage.getItem('user')
    
    if (!token || !userData) {
      showNotification('Veri göndermek için giriş yapmanız gerekiyor.', 'error')
      router.push('/auth/login')
      return
    }
    
    // Resimleri Supabase Storage'a yükle
    let imageUrls = []
    if (uploadedImages.value && uploadedImages.value.length > 0) {
      try {

        
        // Tüm fotoğrafları yükle
        for (let i = 0; i < uploadedImages.value.length; i++) {
          const file = uploadedImages.value[i].file
          const fileName = `plants/${Date.now()}_${i}_${file.name}`
          
          // Resmi Storage'a yükle
          const uploadResult = await supabaseStore.uploadImage(file, fileName)
          if (uploadResult.success) {
            imageUrls.push(uploadResult.url)
          } else {
            console.warn(`Image ${i + 1} upload failed`)
          }
        }
        

      } catch (error) {
        console.error('Image upload error:', error)
      }
    }
    
    // İlk fotoğrafı ana image_url olarak kullan, diğerlerini images array'inde sakla
    const imageUrl = imageUrls.length > 0 ? imageUrls[0] : (formData.value.image_url || '')
    const images = imageUrls.length > 1 ? imageUrls.slice(1) : []
    
    // ID'den isim bulma fonksiyonu (artık gerekli değil, direkt değer kullanıyoruz)
    const getPolenPropertyName = (propertyType, value) => {
      return value || ''
    }

    // Form verilerini Supabase formatına dönüştür
    const plantData = {
      user_id: JSON.parse(localStorage.getItem('user')).id, // Kullanıcı ID'si ekle
      name: formData.value.name,
      family: formData.value.family,
      description: formData.value.description,
      image_url: imageUrl,
      images: images, // Diğer fotoğrafları da ekle
      pollen_unit: formData.value.pollenUnit,
      dispersal_unit: formData.value.dispersalUnit,
      pollen_class: formData.value.pollenClass,
      size: formData.value.size,
      hydrated_size: formData.value.hydratedSize,
      polarity: formData.value.polarity,
      shape: formData.value.shape,
      outline_polar: formData.value.outlinePolar,
      pe_ratio: formData.value.peRatio,
      orientation: formData.value.orientation,
      aperture_number: formData.value.apertureNumber,
      aperture_type: formData.value.apertureType,
      aperture_condition: formData.value.apertureCondition,
      aperture_peculiarities: formData.value.aperturePeculiarities,
      ornamentation_lm: formData.value.ornamentationLM,
      nexine: formData.value.nexine,
      sexine: formData.value.sexine,
      ornamentation: formData.value.ornamentation,
      suprasculpture: formData.value.suprasculpture,
      tectum: formData.value.tectum,
      infratectum: formData.value.infratectum,
      foot_layer: formData.value.footLayer,
      endexine: formData.value.endexine,
      intine: formData.value.intine,
      supratectal_elements: formData.value.supratectalElements,
      wall_peculiarities: formData.value.wallPeculiarities,
      pollen_coatings: formData.value.pollenCoatings,
      reserves: formData.value.reserves,
      cell_number: formData.value.cellNumber,
      ubisch_bodies: formData.value.ubischBodies,
      preparation: formData.value.Preparation,
      staining: formData.value.Staining
    }

    // Supabase'e gönder
    const result = await supabaseStore.createPlant(plantData)

    if (result.success) {
    showNotification('Veriler başarıyla kaydedildi!')
    setTimeout(() => {
      router.push('/')
    }, 2000)
    } else {
      throw new Error(result.error || 'Veri gönderimi başarısız oldu')
    }

  } catch (error) {
    console.error('Submit error:', error)
    showNotification('Bir hata oluştu. Lütfen tekrar deneyiniz.', 'error')
  } finally {
    isSubmitting.value = false
  }
}

// Form verilerini tutacak ref
const formData = ref({
  name: '',
  family: '',
  description: '',
  image_url: '',
  pollenUnit: '',
  dispersalUnit: '',
  pollenClass: '',
  size: '',
  hydratedSize: '',
  polarity: '',
  shape: '',
  outlinePolar: '',
  peRatio: '',
  orientation: '',
  apertureNumber: '',
  apertureType: '',
  apertureCondition: '',
  aperturePeculiarities: '',
  ornamentationLM: '',
  nexine: '',
  sexine: '',
  ornamentation: '',
  suprasculpture: '',
  tectum: '',
  infratectum: '',
  footLayer: '',
  endexine: '',
  intine: '',
  supratectalElements: '',
  wallPeculiarities: '',
  pollenCoatings: '',
  reserves: '',
  cellNumber: '',
  ubischBodies: '',
  Preparation: '',
  Staining: ''
})

const uploadedImages = ref([])
const dragActive = ref(false)
const imageError = ref('')

// Dosya yükleme işleyicisi
const handleFileUpload = (event) => {
  const files = Array.from(event.target.files)
  processMultipleFiles(files)
}

// Sürükle-bırak işleyicisi
const handleFileDrop = (event) => {
  dragActive.value = false
  const files = Array.from(event.dataTransfer.files)
  processMultipleFiles(files)
}

// Çoklu dosya işleme
const processMultipleFiles = (files) => {
  imageError.value = ''

  // Maksimum dosya sayısı kontrolü
  if (uploadedImages.value.length + files.length > 12) {
    imageError.value = 'En fazla 12 görsel yükleyebilirsiniz.'
    return
  }

  files.forEach(file => {
    // Dosya tipi kontrolü
    if (!file.type.startsWith('image/')) {
      imageError.value = 'Lütfen sadece görsel dosyaları yükleyin.'
      return
    }

    // Dosya boyutu kontrolü (10MB)
    if (file.size > 10 * 1024 * 1024) {
      imageError.value = 'Her dosya 10MB\'dan küçük olmalıdır.'
      return
    }

    // Görsel önizleme oluştur ve listeye ekle
    uploadedImages.value.push({
      file: file,
      preview: URL.createObjectURL(file)
    })
  })

  // Form verisini güncelle
  formData.value.images = uploadedImages.value.map(img => img.file)
}

// Görsel kaldır
const removeImage = (index) => {
  if (uploadedImages.value && uploadedImages.value[index] && uploadedImages.value[index].preview) {
    URL.revokeObjectURL(uploadedImages.value[index].preview)
  }
  uploadedImages.value.splice(index, 1)
  formData.value.images = uploadedImages.value.map(img => img.file)
}

// Form gönderme kontrolü
const validateImages = () => {
  if (uploadedImages.value.length === 0) {
    imageError.value = 'Lütfen en az 1 görsel yükleyin.'
    return false
  }
  return true
}

// Karakter sayısı kontrolü için computed properties
const isNameLengthCritical = computed(() => formData.value.name.length >= 240)
const isDescriptionLengthCritical = computed(() => formData.value.description.length >= 240)

// Form validasyonu güncelleme
const validateForm = () => {
  if (!formData.value.name.trim()) {
    showNotification('Lütfen bitki adını giriniz.', 'error')
    return false
  }

  if (!formData.value.description.trim()) {
    showNotification('Lütfen açıklama giriniz.', 'error')
    return false
  }

  if (formData.value.name.length > 250) {
    showNotification('Bitki adı 250 karakterden uzun olamaz.', 'error')
    return false
  }

  if (formData.value.description.length > 250) {
    showNotification('Açıklama 250 karakterden uzun olamaz.', 'error')
    return false
  }

  return true
}

// İlerleme yüzdesi
const stepProgress = computed(() => {
  return Math.round((currentStep.value / totalSteps) * 100)
})

// Component unmount olduğunda önizleme URL'lerini temizle
onUnmounted(() => {
  if (uploadedImages.value && uploadedImages.value.length > 0) {
    uploadedImages.value.forEach(img => {
      if (img && img.preview) {
        URL.revokeObjectURL(img.preview)
      }
    })
  }
})

// Fetch options on component mount
onMounted(async () => {
  await supabaseStore.fetchOptions()
})

// Computed properties for options
const taxonomyOptions = computed(() => ({
  families: supabaseStore.getOptionsByCategory('families', 'all').map(opt => opt.name)
}))

const pollenOptions = computed(() => ({
  units: supabaseStore.getOptionsByCategory('pollen_units', 'all').map(opt => opt.name),
  dispersalUnits: supabaseStore.getOptionsByCategory('dispersal_units', 'all').map(opt => opt.name),
  classes: supabaseStore.getOptionsByCategory('pollen_classes', 'all').map(opt => opt.name),
  sizes: supabaseStore.getOptionsByCategory('pollen_sizes', 'all').map(opt => opt.name),
  hydratedSizes: supabaseStore.getOptionsByCategory('hydrated_sizes', 'all').map(opt => opt.name)
}))

const shapeOptions = computed(() => ({
  polarities: supabaseStore.getOptionsByCategory('polarities', 'all').map(opt => opt.name),
  shapes: supabaseStore.getOptionsByCategory('shapes', 'all').map(opt => opt.name),
  outlines: supabaseStore.getOptionsByCategory('outlines', 'all').map(opt => opt.name),
  peRatios: supabaseStore.getOptionsByCategory('pe_ratios', 'all').map(opt => opt.name),
  orientations: supabaseStore.getOptionsByCategory('orientations', 'all').map(opt => opt.name)
}))

const apertureOptions = computed(() => ({
  numbers: supabaseStore.getOptionsByCategory('aperture_numbers', 'all').map(opt => ({ value: opt.value, label: opt.label })),
  types: supabaseStore.getOptionsByCategory('aperture_types', 'all').map(opt => ({ value: opt.name, label: opt.name })),
  conditions: supabaseStore.getOptionsByCategory('aperture_conditions', 'all').map(opt => ({ value: opt.name, label: opt.name })),
  peculiarities: supabaseStore.getOptionsByCategory('aperture_peculiarities', 'all').map(opt => ({ value: opt.name, label: opt.name }))
}))

const wallOptions = computed(() => ({
  thicknesses: supabaseStore.getOptionsByCategory('wall_thicknesses', 'all').map(opt => opt.name),
  tectumTypes: supabaseStore.getOptionsByCategory('tectum_types', 'all').map(opt => opt.name),
  infratectumTypes: supabaseStore.getOptionsByCategory('infratectum_types', 'all').map(opt => opt.name),
  footLayerTypes: supabaseStore.getOptionsByCategory('foot_layer_types', 'all').map(opt => opt.name),
  nexineTypes: supabaseStore.getOptionsByCategory('nexine_types', 'all').map(opt => opt.name),
  sexineTypes: supabaseStore.getOptionsByCategory('sexine_types', 'all').map(opt => opt.name)
}))

const surfaceOptions = computed(() => ({
  ornamentationTypes: supabaseStore.getOptionsByCategory('ornamentation_types', 'all').map(opt => opt.name),
  coatingTypes: supabaseStore.getOptionsByCategory('coating_types', 'all').map(opt => opt.name)
}))

const ornamentationOptions = computed(() => ({
  lmTypes: supabaseStore.getOptionsByCategory('lm_types', 'all').map(opt => opt.name),
  types: supabaseStore.getOptionsByCategory('ornamentation_types', 'all').map(opt => opt.name)
}))

const wallStructureOptions = computed(() => ({
  suprasculpture: supabaseStore.getOptionsByCategory('wall_structure_types', 'all').map(opt => opt.name),
  tectum: supabaseStore.getOptionsByCategory('tectum_types', 'all').map(opt => opt.name),
  infratectum: supabaseStore.getOptionsByCategory('infratectum_types', 'all').map(opt => opt.name),
  footLayer: supabaseStore.getOptionsByCategory('foot_layer_types', 'all').map(opt => opt.name),
  endexine: supabaseStore.getOptionsByCategory('wall_structure_types', 'all').map(opt => opt.name),
  intine: supabaseStore.getOptionsByCategory('wall_structure_types', 'all').map(opt => opt.name)
}))

definePageMeta({
  pageTransition: false,
  keepalive: true,
  middleware: 'auth'
})

</script>

<style scoped>
/* Geçiş animasyonları için */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* Bildirim animasyonları */
.notification-enter-active,
.notification-leave-active {
  transition: all 0.3s ease;
}

.notification-enter-from,
.notification-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}

/* Sürükle-bırak animasyonları */
.drag-active {
  transform: scale(1.02);
  transition: transform 0.2s ease;
}

/* Karakter sayacı için stil */
.character-count {
  position: absolute;
  right: 0.5rem;
  bottom: 0.5rem;
  font-size: 0.875rem;
  color: #6b7280;
}

.character-count.critical {
  color: #ef4444;
}

.error-shake {
  animation: shake 0.5s cubic-bezier(.36,.07,.19,.97) both;
}

@keyframes shake {
  10%, 90% { transform: translate3d(-1px, 0, 0); }
  20%, 80% { transform: translate3d(2px, 0, 0); }
  30%, 50%, 70% { transform: translate3d(-4px, 0, 0); }
  40%, 60% { transform: translate3d(4px, 0, 0); }
}

/* Hover durumu için ek stil */
input:hover, 
select:hover, 
textarea:hover {
  border-color: #a5b4fc; /* indigo-300 */
}

/* Invalid durumu için stil */
input:invalid,
select:invalid,
textarea:invalid {
  border-color: #ef4444; /* red-500 */
}

/* Disabled durumu için stil */
input:disabled,
select:disabled,
textarea:disabled {
  background-color: #f3f4f6; /* gray-100 */
  cursor: not-allowed;
}

/* Base styles */
input,
select,
textarea {
  background-color: white;
  transition: all 0.2s ease;
}

/* Hover state */
input:hover, 
select:hover, 
textarea:hover {
  border-color: #e5e7eb; /* gray-200 */
}

/* Focus state */
input:focus,
select:focus,
textarea:focus {
  outline: none;
  border-color: #d1d5db; /* gray-300 */
  box-shadow: 0 0 0 1px #d1d5db; /* gray-300 */
}

/* Invalid state */
input:invalid,
select:invalid,
textarea:invalid {
  border-color: #e5e7eb; /* gray-200 */
}

/* Disabled state */
input:disabled,
select:disabled,
textarea:disabled {
  background-color: #f9fafb; /* gray-50 */
  cursor: not-allowed;
}

/* Placeholder style */
::placeholder {
  color: #9ca3af; /* gray-400 */
}

/* Character counter */
.char-counter {
  color: #6b7280; /* gray-500 */
}

.page-wrapper {
  display: block;
}
</style>

