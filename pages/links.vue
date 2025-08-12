<template>
  <div class="min-h-screen bg-gradient-to-br from-indigo-50 via-white to-purple-50 py-12 px-4 sm:px-6 lg:px-8">
    <div class="max-w-4xl mx-auto">
      <!-- Ana Başlık -->
      <div class="text-center mb-12">
        <h1 class="text-3xl font-bold text-gray-900 mb-4">
          Palinoloji ve ilgili konularla ilgili favori sitelerimizi keşfedin
        </h1>
      </div>

      <!-- Pollen Databases Bölümü -->
      <Disclosure v-slot="{ open }" :defaultOpen="true" as="div" class="mb-6">
        <DisclosureButton class="flex w-full justify-between rounded-lg bg-indigo-100 px-4 py-3 text-left text-lg font-medium text-indigo-900 hover:bg-indigo-200 focus:outline-none focus-visible:ring focus-visible:ring-indigo-500 focus-visible:ring-opacity-75">
          <span>Pollen Databases</span>
          <ChevronUpIcon
            :class="open ? 'rotate-180 transform' : ''"
            class="h-5 w-5 text-indigo-500 transition-transform duration-200"
          />
        </DisclosureButton>
        <transition
          enter-active-class="transition duration-200 ease-out"
          enter-from-class="transform scale-95 opacity-0"
          enter-to-class="transform scale-100 opacity-100"
          leave-active-class="transition duration-200 ease-out"
          leave-from-class="transform scale-100 opacity-100"
          leave-to-class="transform scale-95 opacity-0"
        >
          <DisclosurePanel class="px-4 pt-4 pb-2">
            <div class="grid gap-4">
              <a href="https://apsa.anu.edu.au/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Australien Pollen and Spore Atlas</h3>
                    <p class="text-gray-600 text-sm">Avustralya polen ve spor atlası veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.lpc.uottawa.ca/resources/pollen/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Canadian Pollen Database</h3>
                    <p class="text-gray-600 text-sm">Kanada polen veritabanı ve araştırma kaynakları</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.ncdc.noaa.gov/paleo-search/pollen" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Global Pollen Database</h3>
                    <p class="text-gray-600 text-sm">Küresel polen veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.ncdc.noaa.gov/paleo-search/study/19160" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Human Impacts Pollen Database</h3>
                    <p class="text-gray-600 text-sm">İnsan etkisi polen veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.ncei.noaa.gov/products/paleoclimatology/pollen" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Modern and Fossil Pollen Data (NCDC)</h3>
                    <p class="text-gray-600 text-sm">Ashville, North Carolina'daki Ulusal İklim Veri Merkezi polen verileri</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.flmnh.ufl.edu/paleobotany-databases/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Neotropical Pollen Database</h3>
                    <p class="text-gray-600 text-sm">Neotropical Paleoecology Araştırma Grubu polen veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.gns.cri.nz/pollen-database" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">New Zealand Fossil Spores and Pollen</h3>
                    <p class="text-gray-600 text-sm">Yeni Zelanda fosil spor ve polen kataloğu</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.ncdc.noaa.gov/paleo-search/study/19785" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">North American Pollen Database</h3>
                    <p class="text-gray-600 text-sm">Kuzey Amerika polen veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.uni-goettingen.de/en/pollen+image+database/185261.html" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Pollen and Spores Image Database</h3>
                    <p class="text-gray-600 text-sm">Göttingen Üniversitesi polen ve spor görüntü veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.neotomadb.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Neotoma Palaeoecology Database</h3>
                    <p class="text-gray-600 text-sm">Paleoekoloji veritabanı ve araştırma platformu</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="http://www.europeanpollendatabase.net/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">The European Pollen Database</h3>
                    <p class="text-gray-600 text-sm">Avrupa polen veritabanı ve araştırma kaynakları</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>
            </div>
          </DisclosurePanel>
        </transition>
      </Disclosure>

      <!-- The Palynological World Bölümü -->
      <Disclosure v-slot="{ open }" as="div" class="mb-6">
        <DisclosureButton class="flex w-full justify-between rounded-lg bg-indigo-100 px-4 py-3 text-left text-lg font-medium text-indigo-900 hover:bg-indigo-200 focus:outline-none focus-visible:ring focus-visible:ring-indigo-500 focus-visible:ring-opacity-75">
          <span>The Palynological World</span>
          <ChevronUpIcon
            :class="open ? 'rotate-180 transform' : ''"
            class="h-5 w-5 text-indigo-500 transition-transform duration-200"
          />
        </DisclosureButton>
        <transition
          enter-active-class="transition duration-200 ease-out"
          enter-from-class="transform scale-95 opacity-0"
          enter-to-class="transform scale-100 opacity-100"
          leave-active-class="transition duration-200 ease-out"
          leave-from-class="transform scale-100 opacity-100"
          leave-to-class="transform scale-95 opacity-0"
        >
          <DisclosurePanel class="px-4 pt-4 pb-2">
            <div class="grid gap-4">
              <a href="https://palynology.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">AASP - The Palynological Society</h3>
                    <p class="text-gray-600 text-sm">American Association of Stratigraphic Palynologists</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.uni-goettingen.de/de/einfuehrung+in+die+pollenanalyse/185856.html" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Einführung in die Pollenanalyse</h3>
                    <p class="text-gray-600 text-sm">Polen analizine giriş kaynakları</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://glossary.palynology.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Glossary of Pollen and Spore Terminology</h3>
                    <p class="text-gray-600 text-sm">Polen ve spor terminolojisi sözlüğü</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.gns.cri.nz/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">GNS Science</h3>
                    <p class="text-gray-600 text-sm">Yeni Zelanda Jeoloji ve Nükleer Bilimler Enstitüsü</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="http://www.palaeobotany.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Links for Palaeobotanists</h3>
                    <p class="text-gray-600 text-sm">Paleobotanikçiler için kaynak linkleri</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.worcester.ac.uk/about/academic-schools/school-of-science-and-the-environment/science-and-the-environment-research/national-pollen-and-aerobiology-research-unit/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">NPARU</h3>
                    <p class="text-gray-600 text-sm">National Pollen and Aerobiology Research Unit</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://palaeontologie.univie.ac.at/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Palaeobotany Group, University of Vienna</h3>
                    <p class="text-gray-600 text-sm">Viyana Üniversitesi Paleontoloji Bölümü</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.geo.arizona.edu/palynology/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">University of Arizona Palynology</h3>
                    <p class="text-gray-600 text-sm">Arizona Üniversitesi Jeobilimler Bölümü Palinoloji Birimi</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://pollen.tstebler.ch/MediaWiki/index.php" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Pollen-Wiki</h3>
                    <p class="text-gray-600 text-sm">Polen bilgi ve araştırma wiki platformu</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://cap-palynology.ca/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">CAP</h3>
                    <p class="text-gray-600 text-sm">Canadian Association of Palynologists</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.petrostrat.com/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">PetroStrat</h3>
                    <p class="text-gray-600 text-sm">Stratigrafik Danışmanlık Hizmetleri</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>
            </div>
          </DisclosurePanel>
        </transition>
      </Disclosure>

      <!-- The World of Allergy Bölümü -->
      <Disclosure v-slot="{ open }" as="div" class="mb-6">
        <DisclosureButton class="flex w-full justify-between rounded-lg bg-indigo-100 px-4 py-3 text-left text-lg font-medium text-indigo-900 hover:bg-indigo-200 focus:outline-none focus-visible:ring focus-visible:ring-indigo-500 focus-visible:ring-opacity-75">
          <span>The World of Allergy</span>
          <ChevronUpIcon
            :class="open ? 'rotate-180 transform' : ''"
            class="h-5 w-5 text-indigo-500 transition-transform duration-200"
          />
        </DisclosureButton>
        <transition
          enter-active-class="transition duration-200 ease-out"
          enter-from-class="transform scale-95 opacity-0"
          enter-to-class="transform scale-100 opacity-100"
          leave-active-class="transition duration-200 ease-out"
          leave-from-class="transform scale-100 opacity-100"
          leave-to-class="transform scale-95 opacity-0"
        >
          <DisclosurePanel class="px-4 pt-4 pb-2">
            <div class="grid gap-4">
              <a href="https://www.polleninfo.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">European Pollen Information</h3>
                    <p class="text-gray-600 text-sm">Avrupa polen bilgi sistemi ve alerji takibi</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.lorano.de/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Lorano</h3>
                    <p class="text-gray-600 text-sm">Polen alerjisi bilgi ve takip platformu</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.pollenwarndienst.at/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Pollen Information for Austria</h3>
                    <p class="text-gray-600 text-sm">Avusturya polen uyarı servisi</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.pollenwarndienst.at/kaernten/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Pollenwarndienst Kärnten</h3>
                    <p class="text-gray-600 text-sm">Kärnten bölgesi polen uyarı servisi</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.pollenwarndienst.at/tirol/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Pollenwarndienst Tirol</h3>
                    <p class="text-gray-600 text-sm">Tirol bölgesi polen uyarı servisi</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.pollenprognose.ch/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Schweizer Pollenprognose</h3>
                    <p class="text-gray-600 text-sm">İsviçre polen tahmin servisi</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.zamg.ac.at/cms/de/wetter/wetter-und-klima/pollenvorhersage" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">ZAMG</h3>
                    <p class="text-gray-600 text-sm">Avusturya Meteoroloji ve Jeodinamik Merkezi polen tahmini</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>
            </div>
          </DisclosurePanel>
        </transition>
      </Disclosure>

      <!-- The World of Botany Bölümü -->
      <Disclosure v-slot="{ open }" as="div" class="mb-6">
        <DisclosureButton class="flex w-full justify-between rounded-lg bg-indigo-100 px-4 py-3 text-left text-lg font-medium text-indigo-900 hover:bg-indigo-200 focus:outline-none focus-visible:ring focus-visible:ring-indigo-500 focus-visible:ring-opacity-75">
          <span>The World of Botany</span>
          <ChevronUpIcon
            :class="open ? 'rotate-180 transform' : ''"
            class="h-5 w-5 text-indigo-500 transition-transform duration-200"
          />
        </DisclosureButton>
        <transition
          enter-active-class="transition duration-200 ease-out"
          enter-from-class="transform scale-95 opacity-0"
          enter-to-class="transform scale-100 opacity-100"
          leave-active-class="transition duration-200 ease-out"
          leave-from-class="transform scale-100 opacity-100"
          leave-to-class="transform scale-95 opacity-0"
        >
          <DisclosurePanel class="px-4 pt-4 pb-2">
            <div class="grid gap-4">
              <a href="http://www.mobot.org/MOBOT/research/APweb/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Angiosperm Phylogeny Website</h3>
                    <p class="text-gray-600 text-sm">Stevens PF, 2001 onwards - Kapalı tohumlu bitkilerin filogenetik sınıflandırması</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="http://www.mobot.org/MOBOT/research/APweb/welcome.html" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">APG3</h3>
                    <p class="text-gray-600 text-sm">The Angiosperm Phylogeny Group, 2009</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.bilderdatenbank.at/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Bilddatenbank der Wildpflanzen Österreichs</h3>
                    <p class="text-gray-600 text-sm">Avusturya yabani bitkileri görsel veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="http://www.eflower.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">eFLOWER</h3>
                    <p class="text-gray-600 text-sm">Çiçekli bitkilerin evrimsel veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="http://www.efloras.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">eFloras</h3>
                    <p class="text-gray-600 text-sm">Çevrimiçi flora veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.flora-austria.at/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Flora von Österreich</h3>
                    <p class="text-gray-600 text-sm">Avusturya florası veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.floraweb.de/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">FloraWeb</h3>
                    <p class="text-gray-600 text-sm">Almanya bitki türleri veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.gbif.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">GBIF</h3>
                    <p class="text-gray-600 text-sm">Global Biodiversity Information Facility</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="http://www.botany.net/IDB/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Internet Directory for Botany</h3>
                    <p class="text-gray-600 text-sm">Botanik kaynakları dizini</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.tropicos.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Tropicos</h3>
                    <p class="text-gray-600 text-sm">Missouri Botanik Bahçesi bitki veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.ipni.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">IPNI</h3>
                    <p class="text-gray-600 text-sm">International Plant Names Index</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.kew.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Royal Botanic Gardens, KEW</h3>
                    <p class="text-gray-600 text-sm">Kraliyet Botanik Bahçeleri</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="http://www.botanicallinks.com/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Scott's Botanical Links</h3>
                    <p class="text-gray-600 text-sm">Kapsamlı botanik kaynakları koleksiyonu</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="http://www.theplantlist.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">The Plant List</h3>
                    <p class="text-gray-600 text-sm">Çalışan bitki türlerinin kapsamlı veritabanı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.geo.arizona.edu/palynology/pid00025.html" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">UA Pollen and Spore Images</h3>
                    <p class="text-gray-600 text-sm">Arizona Üniversitesi polen ve spor görüntü kataloğu</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>
            </div>
          </DisclosurePanel>
        </transition>
      </Disclosure>

      <!-- Pollen Art Bölümü -->
      <Disclosure v-slot="{ open }" as="div" class="mb-6">
        <DisclosureButton class="flex w-full justify-between rounded-lg bg-indigo-100 px-4 py-3 text-left text-lg font-medium text-indigo-900 hover:bg-indigo-200 focus:outline-none focus-visible:ring focus-visible:ring-indigo-500 focus-visible:ring-opacity-75">
          <span>Pollen Art</span>
          <ChevronUpIcon
            :class="open ? 'rotate-180 transform' : ''"
            class="h-5 w-5 text-indigo-500 transition-transform duration-200"
          />
        </DisclosureButton>
        <transition
          enter-active-class="transition duration-200 ease-out"
          enter-from-class="transform scale-95 opacity-0"
          enter-to-class="transform scale-100 opacity-100"
          leave-active-class="transition duration-200 ease-out"
          leave-from-class="transform scale-100 opacity-100"
          leave-to-class="transform scale-95 opacity-0"
        >
          <DisclosurePanel class="px-4 pt-4 pb-2">
            <div class="grid gap-4">
              <a href="https://palart.org/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">PalArt</h3>
                    <p class="text-gray-600 text-sm">Polen sanatı ve görsel koleksiyonu</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.micronaut.ch/" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">Micronaut</h3>
                    <p class="text-gray-600 text-sm">Mikroskobik görüntüleme sanatı</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>

              <a href="https://www.nih.gov/3d-pollen-library" 
                 target="_blank"
                 class="p-3 bg-white rounded-lg shadow-md hover:shadow-lg transition-shadow duration-200">
                <div class="flex items-center">
                  <div class="flex-1">
                    <h3 class="text-lg font-medium text-gray-900 leading-tight">NIH 3D Pollen Library</h3>
                    <p class="text-gray-600 text-sm">Üç boyutlu polen görüntü kütüphanesi</p>
                  </div>
                  <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14" />
                  </svg>
                </div>
              </a>
            </div>
          </DisclosurePanel>
        </transition>
      </Disclosure>
    </div>
  </div>
</template>

<script setup>
import { Disclosure, DisclosureButton, DisclosurePanel } from '@headlessui/vue'
import { ChevronUpIcon } from '@heroicons/vue/20/solid'

definePageMeta({
  title: 'Faydalı Linkler'
})
</script> 