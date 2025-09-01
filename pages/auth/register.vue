<template>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50 py-12 px-4 sm:px-6 lg:px-8 flex items-center justify-center">
    <div class="max-w-md w-full bg-white rounded-2xl shadow-xl overflow-hidden">
      <!-- Logo ve Başlık -->
      <div class="bg-gradient-to-r from-indigo-600 to-purple-600 px-10 py-8 text-center">
        <svg 
          class="mx-auto h-12 w-12 text-white mb-4" 
          fill="none" 
          stroke="currentColor" 
          viewBox="0 0 24 24"
        >
          <path 
            stroke-linecap="round" 
            stroke-linejoin="round" 
            stroke-width="2" 
            d="M5.121 17.804A13.937 13.937 0 0112 16c2.5 0 4.847.655 6.879 1.804M15 10a3 3 0 11-6 0 3 3 0 016 0zm6 2a9 9 0 11-18 0 9 9 0 0118 0z"
          />
        </svg>
        <h2 class="text-2xl font-bold text-white">
          Hesap Oluştur
        </h2>
        <p class="mt-2 text-sm text-indigo-100">
          Hemen üye olun ve sistemi kullanmaya başlayın
        </p>
      </div>

      <!-- Form -->
      <div class="p-10">
        <form class="space-y-6" @submit.prevent="handleRegister">
          <!-- Ad Soyad -->
          <div>
            <label for="fullName" class="block text-sm font-medium text-gray-700">
              Ad Soyad <span class="text-red-500">*</span>
            </label>
            <div class="mt-1 relative">
              <input
                id="fullName"
                v-model="form.fullName"
                type="text"
                required
                :class="[
                  'appearance-none block w-full px-3 py-2.5 border-2 rounded-lg transition-colors duration-200',
                  errors.fullName 
                    ? 'border-red-300 focus:ring-red-500 focus:border-red-500' 
                    : 'border-gray-200 focus:ring-indigo-500 focus:border-indigo-500'
                ]"
                placeholder="Ad Soyad"
                @blur="validateFullName"
              >
              <div v-if="errors.fullName" class="absolute inset-y-0 right-0 pr-3 flex items-center">
                <svg class="h-5 w-5 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
                </svg>
              </div>
            </div>
            <p v-if="errors.fullName" class="mt-1 text-sm text-red-600">{{ errors.fullName }}</p>
          </div>

          <!-- Email -->
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700">
              E-posta <span class="text-red-500">*</span>
            </label>
            <div class="mt-1 relative">
              <input
                id="email"
                v-model="form.email"
                type="email"
                required
                :class="[
                  'appearance-none block w-full px-3 py-2.5 border-2 rounded-lg transition-colors duration-200',
                  errors.email 
                    ? 'border-red-300 focus:ring-red-500 focus:border-red-500' 
                    : 'border-gray-200 focus:ring-indigo-500 focus:border-indigo-500'
                ]"
                placeholder="ornek@email.com"
                @blur="validateEmail"
              >
              <div v-if="errors.email" class="absolute inset-y-0 right-0 pr-3 flex items-center">
                <svg class="h-5 w-5 text-red-500" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
                </svg>
              </div>
            </div>
            <p v-if="errors.email" class="mt-1 text-sm text-red-600">{{ errors.email }}</p>
          </div>

          <!-- Ünvan -->
          <div>
            <label for="title" class="block text-sm font-medium text-gray-700">
              Ünvan <span class="text-red-500">*</span>
            </label>
            <div class="mt-1 relative">
              <select
                id="title"
                v-model="form.title"
                required
                :class="[
                  'appearance-none block w-full px-3 py-2.5 border-2 rounded-lg transition-colors duration-200',
                  errors.title 
                    ? 'border-red-300 focus:ring-red-500 focus:border-red-500' 
                    : 'border-gray-200 focus:ring-indigo-500 focus:border-indigo-500'
                ]"
                @blur="validateTitle"
              >
                <option value="">Ünvan seçiniz</option>
                <option value="öğrenci">Öğrenci</option>
                <option value="akademisyen">Akademisyen</option>
                <option value="araştırmacı">Araştırmacı</option>
                <option value="doktor">Doktor</option>
                <option value="profesör">Profesör</option>
                <option value="doçent">Doçent</option>
                <option value="yardımcı_doçent">Yardımcı Doçent</option>
                <option value="öğretim_görevlisi">Öğretim Görevlisi</option>
                <option value="diğer">Diğer</option>
              </select>
              <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                <svg class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                </svg>
              </div>
            </div>
            <p v-if="errors.title" class="mt-1 text-sm text-red-600">{{ errors.title }}</p>
          </div>

          <!-- Ülke -->
          <div>
            <label for="country" class="block text-sm font-medium text-gray-700">
              Ülke <span class="text-red-500">*</span>
            </label>
            <div class="mt-1 relative">
              <select
                id="country"
                v-model="form.country"
                required
                :class="[
                  'appearance-none block w-full px-3 py-2.5 border-2 rounded-lg transition-colors duration-200',
                  errors.country 
                    ? 'border-red-300 focus:ring-red-500 focus:border-red-500' 
                    : 'border-gray-200 focus:ring-indigo-500 focus:border-indigo-500'
                ]"
                @blur="validateCountry"
              >
                <option value="">Ülke seçiniz</option>
                <option value="Türkiye">Türkiye</option>
                <option value="ABD">ABD</option>
                <option value="Almanya">Almanya</option>
                <option value="Fransa">Fransa</option>
                <option value="İngiltere">İngiltere</option>
                <option value="İtalya">İtalya</option>
                <option value="İspanya">İspanya</option>
                <option value="Hollanda">Hollanda</option>
                <option value="Belçika">Belçika</option>
                <option value="Avusturya">Avusturya</option>
                <option value="İsviçre">İsviçre</option>
                <option value="İsveç">İsveç</option>
                <option value="Norveç">Norveç</option>
                <option value="Danimarka">Danimarka</option>
                <option value="Finlandiya">Finlandiya</option>
                <option value="Polonya">Polonya</option>
                <option value="Çekya">Çekya</option>
                <option value="Slovakya">Slovakya</option>
                <option value="Macaristan">Macaristan</option>
                <option value="Romanya">Romanya</option>
                <option value="Bulgaristan">Bulgaristan</option>
                <option value="Yunanistan">Yunanistan</option>
                <option value="Portekiz">Portekiz</option>
                <option value="Rusya">Rusya</option>
                <option value="Ukrayna">Ukrayna</option>
                <option value="Belarus">Belarus</option>
                <option value="Moldova">Moldova</option>
                <option value="Letonya">Letonya</option>
                <option value="Litvanya">Litvanya</option>
                <option value="Estonya">Estonya</option>
                <option value="Slovenya">Slovenya</option>
                <option value="Hırvatistan">Hırvatistan</option>
                <option value="Bosna Hersek">Bosna Hersek</option>
                <option value="Sırbistan">Sırbistan</option>
                <option value="Karadağ">Karadağ</option>
                <option value="Kosova">Kosova</option>
                <option value="Makedonya">Makedonya</option>
                <option value="Arnavutluk">Arnavutluk</option>
                <option value="Japonya">Japonya</option>
                <option value="Güney Kore">Güney Kore</option>
                <option value="Çin">Çin</option>
                <option value="Hindistan">Hindistan</option>
                <option value="Pakistan">Pakistan</option>
                <option value="Bangladeş">Bangladeş</option>
                <option value="Sri Lanka">Sri Lanka</option>
                <option value="Nepal">Nepal</option>
                <option value="Bhutan">Bhutan</option>
                <option value="Maldives">Maldives</option>
                <option value="Afganistan">Afganistan</option>
                <option value="İran">İran</option>
                <option value="Irak">Irak</option>
                <option value="Suriye">Suriye</option>
                <option value="Lübnan">Lübnan</option>
                <option value="İsrail">İsrail</option>
                <option value="Filistin">Filistin</option>
                <option value="Ürdün">Ürdün</option>
                <option value="Suudi Arabistan">Suudi Arabistan</option>
                <option value="Katar">Katar</option>
                <option value="Bahreyn">Bahreyn</option>
                <option value="Kuveyt">Kuveyt</option>
                <option value="Umman">Umman</option>
                <option value="Yemen">Yemen</option>
                <option value="Birleşik Arap Emirlikleri">Birleşik Arap Emirlikleri</option>
                <option value="Mısır">Mısır</option>
                <option value="Sudan">Sudan</option>
                <option value="Libya">Libya</option>
                <option value="Tunus">Tunus</option>
                <option value="Cezayir">Cezayir</option>
                <option value="Fas">Fas</option>
                <option value="Mauritania">Mauritania</option>
                <option value="Mali">Mali</option>
                <option value="Nijer">Nijer</option>
                <option value="Çad">Çad</option>
                <option value="Orta Afrika Cumhuriyeti">Orta Afrika Cumhuriyeti</option>
                <option value="Kamerun">Kamerun</option>
                <option value="Nijerya">Nijerya</option>
                <option value="Gana">Gana</option>
                <option value="Fildişi Sahili">Fildişi Sahili</option>
                <option value="Burkina Faso">Burkina Faso</option>
                <option value="Togo">Togo</option>
                <option value="Benin">Benin</option>
                <option value="Gine">Gine</option>
                <option value="Gine Bissau">Gine Bissau</option>
                <option value="Senegal">Senegal</option>
                <option value="Gambiya">Gambiya</option>
                <option value="Sierra Leone">Sierra Leone</option>
                <option value="Liberya">Liberya</option>
                <option value="Kongo">Kongo</option>
                <option value="Kongo Demokratik Cumhuriyeti">Kongo Demokratik Cumhuriyeti</option>
                <option value="Gabon">Gabon</option>
                <option value="Ekvator Ginesi">Ekvator Ginesi</option>
                <option value="São Tomé ve Príncipe">São Tomé ve Príncipe</option>
                <option value="Angola">Angola</option>
                <option value="Zambiya">Zambiya</option>
                <option value="Zimbabve">Zimbabve</option>
                <option value="Botsvana">Botsvana</option>
                <option value="Namibya">Namibya</option>
                <option value="Güney Afrika">Güney Afrika</option>
                <option value="Lesotho">Lesotho</option>
                <option value="Esvatini">Esvatini</option>
                <option value="Mozambik">Mozambik</option>
                <option value="Malavi">Malavi</option>
                <option value="Tanzanya">Tanzanya</option>
                <option value="Kenya">Kenya</option>
                <option value="Uganda">Uganda</option>
                <option value="Ruanda">Ruanda</option>
                <option value="Burundi">Burundi</option>
                <option value="Etiyopya">Etiyopya</option>
                <option value="Eritre">Eritre</option>
                <option value="Cibuti">Cibuti</option>
                <option value="Somali">Somali</option>
                <option value="Madagaskar">Madagaskar</option>
                <option value="Mauritius">Mauritius</option>
                <option value="Seyşeller">Seyşeller</option>
                <option value="Komorlar">Komorlar</option>
                <option value="Kanada">Kanada</option>
                <option value="Meksika">Meksika</option>
                <option value="Guatemala">Guatemala</option>
                <option value="Belize">Belize</option>
                <option value="El Salvador">El Salvador</option>
                <option value="Honduras">Honduras</option>
                <option value="Nikaragua">Nikaragua</option>
                <option value="Kosta Rika">Kosta Rika</option>
                <option value="Panama">Panama</option>
                <option value="Kolombiya">Kolombiya</option>
                <option value="Venezuela">Venezuela</option>
                <option value="Guyana">Guyana</option>
                <option value="Surinam">Surinam</option>
                <option value="Fransız Guyanası">Fransız Guyanası</option>
                <option value="Brezilya">Brezilya</option>
                <option value="Ekvador">Ekvador</option>
                <option value="Peru">Peru</option>
                <option value="Bolivya">Bolivya</option>
                <option value="Paraguay">Paraguay</option>
                <option value="Uruguay">Uruguay</option>
                <option value="Arjantin">Arjantin</option>
                <option value="Şili">Şili</option>
                <option value="Avustralya">Avustralya</option>
                <option value="Yeni Zelanda">Yeni Zelanda</option>
                <option value="Papua Yeni Gine">Papua Yeni Gine</option>
                <option value="Fiji">Fiji</option>
                <option value="Vanuatu">Vanuatu</option>
                <option value="Solomon Adaları">Solomon Adaları</option>
                <option value="Yeni Kaledonya">Yeni Kaledonya</option>
                <option value="Samoa">Samoa</option>
                <option value="Tonga">Tonga</option>
                <option value="Tuvalu">Tuvalu</option>
                <option value="Kiribati">Kiribati</option>
                <option value="Marshall Adaları">Marshall Adaları</option>
                <option value="Mikronezya">Mikronezya</option>
                <option value="Palau">Palau</option>
                <option value="Nauru">Nauru</option>
                <option value="diğer">Diğer</option>
              </select>
              <div class="absolute inset-y-0 right-0 pr-3 flex items-center pointer-events-none">
                <svg class="h-5 w-5 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
                </svg>
              </div>
            </div>
            <p v-if="errors.country" class="mt-1 text-sm text-red-600">{{ errors.country }}</p>
          </div>

          <!-- Şifre -->
          <div>
            <label for="password" class="block text-sm font-medium text-gray-700">
              Şifre <span class="text-red-500">*</span>
            </label>
            <div class="mt-1 relative">
              <input
                id="password"
                v-model="form.password"
                :type="showPassword ? 'text' : 'password'"
                required
                autocomplete="new-password"
                :class="[
                  'appearance-none block w-full px-3 py-2.5 border-2 rounded-lg transition-colors duration-200',
                  errors.password 
                    ? 'border-red-300 focus:ring-red-500 focus:border-red-500' 
                    : 'border-gray-200 focus:ring-indigo-500 focus:border-indigo-500'
                ]"
                placeholder="••••••••"
                @blur="validatePassword"
              >
              <button
                type="button"
                @click="showPassword = !showPassword"
                class="absolute inset-y-0 right-0 pr-3 flex items-center"
              >
                <svg v-if="!showPassword" class="h-5 w-5 text-gray-400 hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                </svg>
                <svg v-else class="h-5 w-5 text-gray-400 hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                </svg>
              </button>
            </div>
            <p v-if="errors.password" class="mt-1 text-sm text-red-600">{{ errors.password }}</p>
          </div>

          <!-- Şifre Tekrar -->
          <div>
            <label for="passwordConfirm" class="block text-sm font-medium text-gray-700">
              Şifre Tekrar <span class="text-red-500">*</span>
            </label>
            <div class="mt-1 relative">
              <input
                id="passwordConfirm"
                v-model="form.passwordConfirm"
                :type="showPasswordConfirm ? 'text' : 'password'"
                required
                autocomplete="new-password"
                :class="[
                  'appearance-none block w-full px-3 py-2.5 border-2 rounded-lg transition-colors duration-200',
                  errors.passwordConfirm 
                    ? 'border-red-300 focus:ring-red-500 focus:border-red-500' 
                    : 'border-gray-200 focus:ring-indigo-500 focus:border-indigo-500'
                ]"
                placeholder="••••••••"
                @blur="validatePasswordConfirm"
              >
              <button
                type="button"
                @click="showPasswordConfirm = !showPasswordConfirm"
                class="absolute inset-y-0 right-0 pr-3 flex items-center"
              >
                <svg v-if="!showPasswordConfirm" class="h-5 w-5 text-gray-400 hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                </svg>
                <svg v-else class="h-5 w-5 text-gray-400 hover:text-gray-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                </svg>
              </button>
            </div>
            <p v-if="errors.passwordConfirm" class="mt-1 text-sm text-red-600">{{ errors.passwordConfirm }}</p>
          </div>

          <!-- Kayıt Ol Butonu -->
          <div>
            <button
              type="submit"
              :disabled="isLoading || hasErrors || !isFormValid"
              class="w-full flex justify-center py-2.5 px-4 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white 
                     bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 
                     focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500
                     disabled:opacity-50 disabled:cursor-not-allowed
                     transition duration-200"
            >
              <svg v-if="isLoading" class="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              {{ isLoading ? 'Kaydediliyor...' : 'Kayıt Ol' }}
            </button>
          </div>
        </form>

        <!-- API Hata Mesajı -->
        <div 
          v-if="apiError" 
          class="mt-4 p-4 rounded-lg bg-red-50 border border-red-200 flex items-center space-x-2"
        >
          <svg class="h-5 w-5 text-red-400" fill="currentColor" viewBox="0 0 20 20">
            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd" />
          </svg>
          <span class="text-sm text-red-800">{{ apiError }}</span>
        </div>

        <!-- Giriş Yap Linki -->
        <div class="mt-6 text-center">
          <div class="relative">
            <div class="absolute inset-0 flex items-center">
              <div class="w-full border-t border-gray-200"></div>
            </div>
            <div class="relative flex justify-center text-sm">
              <span class="px-2 bg-white text-gray-500">veya</span>
            </div>
          </div>

          <p class="mt-4 text-sm text-gray-600">
            Zaten hesabınız var mı?
          </p>
          <router-link 
            to="/auth/login" 
            class="mt-3 w-full inline-flex justify-center items-center px-4 py-2.5 border border-transparent text-sm font-medium rounded-lg
                   text-indigo-600 bg-indigo-50 hover:bg-indigo-100
                   focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500
                   transition-colors duration-200"
          >
            <svg 
              class="mr-2 h-5 w-5" 
              fill="none" 
              stroke="currentColor" 
              viewBox="0 0 24 24"
            >
              <path 
                stroke-linecap="round" 
                stroke-linejoin="round" 
                stroke-width="2" 
                d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1"
              />
            </svg>
            Giriş Yap
          </router-link>
        </div>

        <!-- Alt bilgi -->
        <p class="mt-4 text-xs text-center text-gray-500">
          Kayıt olarak, 
          <a href="#" class="text-indigo-600 hover:text-indigo-500">Kullanım Koşulları</a> ve 
          <a href="#" class="text-indigo-600 hover:text-indigo-500">Gizlilik Politikası</a>'nı 
          kabul etmiş olursunuz.
        </p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()
const showPassword = ref(false)
const showPasswordConfirm = ref(false)
const isLoading = ref(false)
const apiError = ref('')

// Form state
const form = ref({
  fullName: '', // Ad Soyad alanı
  email: '',
  title: '',
  country: '',
  password: '',
  passwordConfirm: ''
})

// Validation errors
const errors = ref({
  fullName: '', // Ad Soyad validasyonu
  email: '',
  title: '',
  country: '',
  password: '',
  passwordConfirm: ''
})

// Ad Soyad validasyonu
const validateFullName = () => {
  if (!form.value.fullName) {
    errors.value.fullName = 'Ad Soyad gereklidir'
  } else if (form.value.fullName.length < 3) {
    errors.value.fullName = 'Ad Soyad en az 3 karakter olmalıdır'
  } else {
    errors.value.fullName = ''
  }
}

// Email validasyonu
const validateEmail = () => {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/
  if (!form.value.email) {
    errors.value.email = 'E-posta adresi gereklidir'
  } else if (!emailRegex.test(form.value.email)) {
    errors.value.email = 'Geçerli bir e-posta adresi giriniz'
  } else {
    errors.value.email = ''
  }
}

// Ünvan validasyonu
const validateTitle = () => {
  if (!form.value.title) {
    errors.value.title = 'Ünvan seçimi gereklidir'
  } else {
    errors.value.title = ''
  }
}

// Ülke validasyonu
const validateCountry = () => {
  if (!form.value.country) {
    errors.value.country = 'Ülke seçimi gereklidir'
  } else {
    errors.value.country = ''
  }
}

// Şifre validasyonu
const validatePassword = () => {
  if (!form.value.password) {
    errors.value.password = 'Şifre gereklidir'
  } else if (form.value.password.length < 6) {
    errors.value.password = 'Şifre en az 6 karakter olmalıdır'
  } else {
    errors.value.password = ''
  }
  // Şifre değiştiğinde şifre tekrarını da kontrol et
  if (form.value.passwordConfirm) {
    validatePasswordConfirm()
  }
}

// Şifre tekrar validasyonu
const validatePasswordConfirm = () => {
  if (!form.value.passwordConfirm) {
    errors.value.passwordConfirm = 'Şifre tekrarı gereklidir'
  } else if (form.value.password !== form.value.passwordConfirm) {
    errors.value.passwordConfirm = 'Şifreler eşleşmiyor'
  } else {
    errors.value.passwordConfirm = ''
  }
}

// Form geçerlilik kontrolü
const isFormValid = computed(() => {
  return form.value.fullName && 
         form.value.email && 
         form.value.title &&
         form.value.country &&
         form.value.password &&
         form.value.passwordConfirm &&
         !errors.value.fullName &&
         !errors.value.email && 
         !errors.value.title &&
         !errors.value.country &&
         !errors.value.password &&
         !errors.value.passwordConfirm
})

// Hata durumu kontrolü
const hasErrors = computed(() => {
  return Object.values(errors.value).some(error => error !== '')
})

// Kayıt işlemi
const handleRegister = async () => {
  try {
    // Form validasyonu
    validateFullName()
    validateEmail()
    validateTitle()
    validateCountry()
    validatePassword()
    validatePasswordConfirm()
    
    if (!isFormValid.value) {
      return
    }

    isLoading.value = true
    apiError.value = ''

    // API isteği - Sadece fullName gönder
    const response = await fetch('/api/register', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        fullName: form.value.fullName, // Sadece fullName gönder
        email: form.value.email,
        title: form.value.title,
        country: form.value.country,
        password: form.value.password
      })
    })

    if (!response.ok) {
      const error = await response.json()
      throw new Error(error.message || 'Kayıt başarısız')
    }

    const data = await response.json()
    
    // Kayıt başarılı - Otomatik giriş yap
    if (data.data && data.data.session) {
      localStorage.setItem('token', data.data.session.access_token)
      localStorage.setItem('user', JSON.stringify({
        id: data.data.user.id,
        email: data.data.user.email,
        full_name: form.value.fullName,
        role: 'user'
      }))
      
      // Header'ı güncellemek için custom event gönder
      document.dispatchEvent(new CustomEvent('auth-update'))
      
      router.push('/')
    } else {
      // Email onayı gerekiyorsa
      router.push('/auth/login?registered=true')
    }

  } catch (error) {
    apiError.value = error.message || 'Bir hata oluştu. Lütfen tekrar deneyin.'
  } finally {
    isLoading.value = false
  }
}
</script>
<style scoped>
/* Input focus ring stilini özelleştirme */
input:focus {
  box-shadow: 0 0 0 2px rgba(99, 102, 241, 0.2);
}

/* Gradient animasyonu */
.bg-gradient-to-r {
  background-size: 200% 200%;
  animation: gradient 15s ease infinite;
}

@keyframes gradient {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

/* Router link stilleri */
.router-link-active {
  @apply bg-indigo-100;
}

.router-link-exact-active:hover {
  transform: translateY(-1px);
  transition: transform 0.2s;
}
</style>

