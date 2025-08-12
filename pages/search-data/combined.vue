<template>
  <div class="min-h-screen bg-gray-50 py-12">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <!-- Başlık -->
          <div class="max-w-3xl mx-auto text-center mb-12">
        <h1 class="text-4xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-purple-600 to-indigo-600 mb-4">
          Combined Search
        </h1>
        <p class="text-lg text-gray-600">
          Combined search is a tool for a directed search
        </p>
      </div>

      <div class="flex flex-col lg:flex-row justify-center gap-8">
        
        <!-- Sol Taraf - Filtreler -->
        <div class="lg:w-1/2 max-w-3xl">
          <div class="bg-white rounded-lg shadow-lg overflow-hidden">
            <!-- 1. Pollen Characters -->
            <div>
              <div class="bg-gradient-to-r from-blue-600 to-blue-800 p-3">
                <h1 class="text-xl font-bold text-white text-center">
                  Pollen Characters
                </h1>
              </div>
              <div class="p-6">
                <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                  <div class="space-y-4">
                    <!-- Pollen Unit -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Pollen Unit:</label>
                      <select 
                        v-model="selectedPollenUnit"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="monad">Monad</option>
                        <option value="tetrad">Tetrad</option>
                        <option value="polyad">Polyad</option>
                        <option value="pollinium">Pollinium</option>
                      </select>
                    </div>

                    <!-- Dispersal Unit -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Dispersal Unit:</label>
                      <select 
                        v-model="selectedDispersalUnit"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="single">Single</option>
                        <option value="multiple">Multiple</option>
                      </select>
                    </div>

                    <!-- Pollen Class -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Pollen Class:</label>
                      <select 
                        v-model="selectedPollenClass"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="small">Small</option>
                        <option value="medium">Medium</option>
                        <option value="large">Large</option>
                      </select>
                    </div>

                    <!-- Size -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Size:</label>
                      <select 
                        v-model="selectedSize"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="very_small">Very Small (< 10µm)</option>
                        <option value="small">Small (10-25 µm)</option>
                        <option value="medium">Medium (25-50 µm)</option>
                        <option value="large">Large (50-100 µm)</option>
                        <option value="very_large">Very Large (> 100 µm)</option>
                      </select>
                    </div>

                    <!-- Hydrated Size -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Hydrated Size:</label>
                      <select 
                        v-model="selectedHydratedSize"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="very_small_hydrated">Very Small (< 10 µm)</option>
                        <option value="small_hydrated">Small (10-25 µm)</option>
                        <option value="medium_hydrated">Medium (25-50 µm)</option>
                        <option value="large_hydrated">Large (50-100 µm)</option>
                        <option value="very_large_hydrated">Very Large (> 100 µm)</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 2. Polarity and Shape -->
            <div>
              <div class="bg-gradient-to-r from-green-600 to-green-800 p-3">
                <h1 class="text-xl font-bold text-white text-center">
                  Polarity and Shape
                </h1>
              </div>
              <div class="p-6">
                <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                  <div class="space-y-4">
                    <!-- Polarity -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Polarity:</label>
                      <select 
                        v-model="selectedPolarity"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="isopolar">Isopolar</option>
                        <option value="heteropolar">Heteropolar</option>
                        <option value="apolar">Apolar</option>
                      </select>
                    </div>

                    <!-- Shape -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Shape:</label>
                      <select 
                        v-model="selectedShape"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="spheroidal">Spheroidal</option>
                        <option value="oblate">Oblate</option>
                        <option value="prolate">Prolate</option>
                        <option value="perprolate">Perprolate</option>
                      </select>
                    </div>

                    <!-- Outline in Polar View -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Outline in Polar View:</label>
                      <select 
                        v-model="selectedOutlinePolar"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="circular">Circular</option>
                        <option value="triangular">Triangular</option>
                        <option value="lobate">Lobate</option>
                        <option value="polygonal">Polygonal</option>
                      </select>
                    </div>

                    <!-- P/E-Ratio -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">P/E-Ratio:</label>
                      <select 
                        v-model="selectedPERatio"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="perprolate">Perprolate (> 2.00)</option>
                        <option value="prolate">Prolate (1.33-2.00)</option>
                        <option value="subprolate">Subprolate (1.14-1.33)</option>
                        <option value="spheroidal">Spheroidal (0.88-1.14)</option>
                      </select>
                    </div>

                    <!-- Dominant Orientation -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Dominant Orientation (LM):</label>
                      <select 
                        v-model="selectedOrientation"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="equatorial">Equatorial</option>
                        <option value="polar">Polar</option>
                        <option value="random">Random</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 3. Aperture -->
            <div>
              <div class="bg-gradient-to-r from-orange-600 to-orange-800 p-3">
                <h1 class="text-xl font-bold text-white text-center">
                  Aperture
                </h1>
              </div>
              <div class="p-6">
                <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                  <div class="space-y-4">
                    <!-- Aperture Number -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Aperture Number:</label>
                      <select 
                        v-model="selectedApertureNumber"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="inaperturate">Inaperturate</option>
                        <option value="monoaperturate">Monoaperturate</option>
                        <option value="diaperturate">Diaperturate</option>
                        <option value="triaperturate">Triaperturate</option>
                        <option value="tetraaperturate">Tetraaperturate</option>
                        <option value="pentaaperturate">Pentaaperturate</option>
                        <option value="hexaaperturate">Hexaaperturate</option>
                      </select>
                    </div>

                    <!-- Aperture Type -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Aperture Type:</label>
                      <select 
                        v-model="selectedApertureType"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="pore">Pore</option>
                        <option value="colpus">Colpus</option>
                        <option value="colporus">Colporus</option>
                        <option value="sulcus">Sulcus</option>
                      </select>
                    </div>

                    <!-- Aperture Condition -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Aperture Condition:</label>
                      <select 
                        v-model="selectedApertureCondition"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="simple">Simple</option>
                        <option value="compound">Compound</option>
                        <option value="complex">Complex</option>
                      </select>
                    </div>

                    <!-- Aperture Peculiarities -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Aperture Peculiarities:</label>
                      <select 
                        v-model="selectedAperturePeculiarities"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="operculate">Operculate</option>
                        <option value="aspidote">Aspidote</option>
                        <option value="pontoperculate">Pontoperculate</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 4. LM Box -->
            <div>
              <div class="bg-gradient-to-r from-red-600 to-red-800 p-3">
                <h1 class="text-xl font-bold text-white text-center">
                  LM (Ornamentation and Wall Structure)
                </h1>
              </div>
              <div class="p-6">
                <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                  <div class="space-y-4">
                    <!-- Ornamentation LM -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Ornamentation LM:</label>
                      <select 
                        v-model="selectedOrnamentationLM"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="psilate">Psilate</option>
                        <option value="scabrate">Scabrate</option>
                        <option value="granulate">Granulate</option>
                        <option value="verrucate">Verrucate</option>
                        <option value="gemmate">Gemmate</option>
                      </select>
                    </div>

                    <!-- Nexine -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Nexine:</label>
                      <select 
                        v-model="selectedNexine"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="thin">Thin</option>
                        <option value="thick">Thick</option>
                        <option value="variable">Variable</option>
                      </select>
                    </div>

                    <!-- Sexine -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Sexine:</label>
                      <select 
                        v-model="selectedSexine"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="thinner">Thinner than nexine</option>
                        <option value="equal">Equal to nexine</option>
                        <option value="thicker">Thicker than nexine</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 5. SEM Box -->
            <div>
              <div class="bg-gradient-to-r from-indigo-600 to-indigo-800 p-3">
                <h1 class="text-xl font-bold text-white text-center">
                  SEM (Ornamentation)
                </h1>
              </div>
              <div class="p-6">
                <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                  <div class="space-y-4">
                    <!-- Ornamentation -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Ornamentation:</label>
                      <select 
                        v-model="selectedOrnamentation"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="psilate">Psilate</option>
                        <option value="perforate">Perforate</option>
                        <option value="foveolate">Foveolate</option>
                        <option value="fossulate">Fossulate</option>
                        <option value="scabrate">Scabrate</option>
                      </select>
                    </div>

                    <!-- Suprasculpture -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Suprasculpture:</label>
                      <select 
                        v-model="selectedSuprasculpture"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="present">Present</option>
                        <option value="absent">Absent</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 6. TEM Box -->
            <div>
              <div class="bg-gradient-to-r from-pink-600 to-pink-800 p-3">
                <h1 class="text-xl font-bold text-white text-center">
                  TEM (Pollen Wall Structure)
                </h1>
              </div>
              <div class="p-6">
                <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                  <div class="space-y-4">
                    <!-- Tectum -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Tectum:</label>
                      <select 
                        v-model="selectedTectum"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="tectate">Tectate</option>
                        <option value="semitectate">Semitectate</option>
                        <option value="intectate">Intectate</option>
                      </select>
                    </div>

                    <!-- Infratectum -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Infratectum:</label>
                      <select 
                        v-model="selectedInfratectum"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="columellate">Columellate</option>
                        <option value="granular">Granular</option>
                        <option value="alveolate">Alveolate</option>
                      </select>
                    </div>

                    <!-- Foot Layer -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">FootLayer:</label>
                      <select 
                        v-model="selectedFootLayer"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="continuous">Continuous</option>
                        <option value="discontinuous">Discontinuous</option>
                        <option value="absent">Absent</option>
                      </select>
                    </div>

                    <!-- Endexine -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Endexine:</label>
                      <select 
                        v-model="selectedEndexine"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="present">Present</option>
                        <option value="absent">Absent</option>
                      </select>
                    </div>

                    <!-- Intine -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Intine:</label>
                      <select 
                        v-model="selectedIntine"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="thin">Thin</option>
                        <option value="thick">Thick</option>
                        <option value="variable">Variable</option>
                      </select>
                    </div>

                    <!-- Supratectal Elements -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Supratectal Elements:</label>
                      <select 
                        v-model="selectedSupratectalElements"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="present">Present</option>
                        <option value="absent">Absent</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 7. Peculiarities Box -->
            <div>
              <div class="bg-gradient-to-r from-yellow-600 to-yellow-800 p-3">
                <h1 class="text-xl font-bold text-white text-center">
                  Peculiarities
                </h1>
              </div>
              <div class="p-6">
                <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                  <div class="space-y-4">
                    <!-- Wall Peculiarities -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">WallPeculiarities:</label>
                      <select 
                        v-model="selectedWallPeculiarities"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="oncus">Oncus</option>
                        <option value="costa">Costa</option>
                        <option value="arcus">Arcus</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- 8. Miscellaneous Box -->

            <div>
              <div class="bg-gradient-to-r from-cyan-600 to-cyan-800 p-3">
                <h1 class="text-xl font-bold text-white text-center">
                  Miscellaneous
                </h1>
              </div>
              <div class="p-6">
                <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                  <div class="space-y-4">
                    <!-- Pollen Coatings -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Pollen Coatings:</label>
                      <select 
                        v-model="selectedPollenCoatings"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="pollenkitt">Pollenkitt</option>
                        <option value="tryphine">Tryphine</option>
                      </select>
                    </div>

                    <!-- Reserves in Cytoplasm -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Reserves in Cytoplasm:</label>
                      <select 
                        v-model="selectedReserves"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="starch">Starch</option>
                        <option value="lipids">Lipids</option>
                      </select>
                    </div>

                    

                    <!-- Cell Number -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">CellNumber:</label>
                      <select 
                        v-model="selectedCellNumber"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="2-celled">2-celled</option>
                        <option value="3-celled">3-celled</option>
                      </select>
                    </div>

                    <!-- Ubisch Bodies -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Ubisch Bodies:</label>
                      <select 
                        v-model="selectedUbischBodies"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="present">Present</option>
                        <option value="absent">Absent</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>

              <!--   value degerleri girilecek 9. Pictures -->

              <div>
              <div class="bg-gradient-to-r from-cyan-600 to-cyan-800 p-3">
                <h1 class="text-xl font-bold text-white text-center">
                  Pictures
                </h1>
              </div>
              <div class="p-6">
                <div class="bg-gray-50 p-6 rounded-lg shadow-md">
        <div class="grid grid-cols-2 gap-4">
             <!-- Checkbox 1 -->
              <div class="flex items-center space-x-2">
                <input id="checkbox1" type="checkbox" class="h-5 w-5 text-blue-600 border-gray-300 rounded focus:ring-blue-500 focus:ring-2"/>
                 <label for="checkbox1" class="text-gray-700 text-sm font-medium">
                   Pictures Plant
                   </label>
                    </div>

             <!-- Checkbox 2 -->
               <div class="flex items-center space-x-2">
                 <input id="checkbox2" type="checkbox" class="h-5 w-5 text-blue-600 border-gray-300 rounded focus:ring-blue-500 focus:ring-2" />
                    <label for="checkbox2" class="text-gray-700 text-sm font-medium">
                       Pictures SEM
                        </label>
                           </div>

            <!-- Checkbox 3 -->
              <div class="flex items-center space-x-2">
                <input id="checkbox3" type="checkbox" class="h-5 w-5 text-blue-600 border-gray-300 rounded focus:ring-blue-500 focus:ring-2"/>
                  <label for="checkbox3" class="text-gray-700 text-sm font-medium">
                     Pictures LM
                      </label>
                        </div>

            <!-- Checkbox 4 -->
            <div class="flex items-center space-x-2">
  <input
    id="checkbox1"
    type="checkbox"
   
    value="PicturesPlant"
    class="h-5 w-5 text-blue-600 border-gray-300 rounded focus:ring-blue-500 focus:ring-2"
  />
  <label for="checkbox1" class="text-gray-700 text-sm font-medium">
    Pictures Plant
  </label>
</div>

                          </div>
                            </div>

                   </div>
                  </div>


               <!--  10. Methods Box -->
            <div>
              <div class="bg-gradient-to-r from-indigo-600 to-indigo-800 p-3">
                <h1 class="text-xl font-bold text-white text-center">
                  Methods
                </h1>
              </div>
              <div class="p-6">
                <div class="bg-gray-50 p-6 rounded-lg shadow-md">
                  <div class="space-y-4">
                    <!-- Preparation / Fixation -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Preparation 11/ Fixation:</label>
                      <select 
                        v-model="selectedPreparation"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="psilate">Psilate</option>
                        <option value="perforate">Perforate</option>
                        <option value="foveolate">Foveolate</option>
                        <option value="fossulate">Fossulate</option>
                        <option value="scabrate">Scabrate</option>
                      </select>
                    </div>

                    <!-- Staining -->
                    <div class="grid grid-cols-3 items-center gap-4">
                      <label class="text-sm font-medium text-gray-700">Staining:</label>
                      <select 
                        v-model="selectedStaining"
                        class="col-span-2 block w-full px-4 py-2 border border-gray-300 rounded-md"
                      >
                        <option value="">Seçiniz</option>
                        <option value="present">Present</option>
                        <option value="absent">Absent</option>
                      </select>
                    </div>
                  </div>
                </div>
              </div>
            </div>    

            <!-- Diğer boxlar buraya gelecek -->

          </div>
        </div>

        <!-- Sağ Taraf - Sonuçlar -->
        <div class="lg:w-1/2 max-w-3xl">
          <div class="bg-white rounded-lg shadow-lg overflow-hidden h-full">
            <div class="bg-gradient-to-r from-purple-600 to-purple-800 p-3">
              <h2 class="text-xl font-bold text-white text-center">Sonuçlar</h2>
            </div>

            <div class="p-6">
              <div class="bg-gray-50 p-6 rounded-lg shadow-md h-full">
                <div v-if="isSearchActive">
                  <div class="grid grid-cols-1 gap-6">
                    <PlantCard
                      v-for="plant in filteredPlants"
                      :key="plant.id"
                      :plant="plant"
                      @show-details="showPlantDetails"
                    />
                  </div>

                  <div v-if="filteredPlants.length === 0" class="text-center mt-8">
                    <div class="inline-flex items-center justify-center p-4 bg-yellow-50 rounded-lg">
                      <svg class="w-6 h-6 text-yellow-400 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                      </svg>
                      <p class="text-sm text-yellow-700">Aradığınız kriterlere uygun bitki bulunamadı.</p>
                    </div>
                  </div>
                </div>

                <div v-else class="text-center">
                  <p class="text-gray-500">Lütfen arama yapmak için polen özelliklerini seçin.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Plant Details Modal -->
    <PlantDetails
      v-if="selectedPlant"
      :plant="selectedPlant"
      @close="closePlantDetails"
    />
  </div>
</template>

<script setup lang="ts">
import type { Database } from '@/types/supabase'

type Plant = Database['public']['Tables']['plants']['Row']
import { ref, computed, onMounted } from 'vue'
import PlantCard from '@/components/PlantCard.vue'
import PlantDetails from '@/components/PlantDetails.vue'
import { useSupabaseStore } from '~/store/supabase'

const supabaseStore = useSupabaseStore()

// State
const isLoading = ref(false)
const error = ref('')

// Seçili bitki için ref
const selectedPlant = ref<Plant | null>(null)

// Diğer ref'ler

const selectedPollenUnit = ref('')
const selectedDispersalUnit = ref('')
const selectedPollenClass = ref('')
const selectedSize = ref('')
const selectedHydratedSize = ref('')
const selectedPolarity = ref('')
const selectedShape = ref('')
const selectedOutlinePolar = ref('')
const selectedPERatio = ref('')
const selectedOrientation = ref('')
const selectedApertureNumber = ref('')
const selectedApertureType = ref('')
const selectedApertureCondition = ref('')
const selectedAperturePeculiarities = ref('')
const selectedOrnamentationLM = ref('')
const selectedNexine = ref('')
const selectedSexine = ref('')
const selectedOrnamentation = ref('')
const selectedSuprasculpture = ref('')
const selectedTectum = ref('')
const selectedInfratectum = ref('')
const selectedFootLayer = ref('')
const selectedEndexine = ref('')
const selectedIntine = ref('')
const selectedSupratectalElements = ref('')
const selectedWallPeculiarities = ref('')
const selectedPollenCoatings = ref('')
const selectedReserves = ref('')
const selectedCellNumber = ref('')
const selectedUbischBodies = ref('')
const selectedPreparation = ref('')
const selectedStaining = ref('')

// Arama aktif mi kontrolü
const isSearchActive = computed(() => {
  return [

    selectedPollenUnit.value,
    selectedDispersalUnit.value,
    selectedPollenClass.value,
    selectedSize.value,
    selectedPolarity.value,
    selectedShape.value,
    selectedOutlinePolar.value,
    selectedPERatio.value,
    selectedOrientation.value,
    selectedApertureNumber.value,
    selectedApertureType.value,
    selectedApertureCondition.value,
    selectedAperturePeculiarities.value,
    selectedOrnamentationLM.value,
    selectedNexine.value,
    selectedSexine.value,
    selectedOrnamentation.value,
    selectedSuprasculpture.value,
    selectedTectum.value,
    selectedInfratectum.value,
    selectedFootLayer.value,
    selectedEndexine.value,
    selectedIntine.value,
    selectedSupratectalElements.value,
    selectedWallPeculiarities.value,
    selectedPollenCoatings.value,
    selectedReserves.value,
    selectedCellNumber.value,
    selectedUbischBodies.value,
    selectedPreparation.value,
    selectedStaining.value,



    // ... diğer değerler
  ].some(value => value !== '')
})

// Filtrelenmiş bitkiler
const filteredPlants = computed(() => {
  if (!isSearchActive.value) {
    return supabaseStore.plants
  }

  const filtered = supabaseStore.plants.filter(plant => {
    const conditions = [
      !selectedPollenUnit.value || (plant.pollen_unit && plant.pollen_unit.toLowerCase() === selectedPollenUnit.value.toLowerCase()),
      !selectedDispersalUnit.value || (plant.dispersal_unit && plant.dispersal_unit.toLowerCase() === selectedDispersalUnit.value.toLowerCase()),
      !selectedPollenClass.value || (plant.pollen_class && plant.pollen_class.toLowerCase() === selectedPollenClass.value.toLowerCase()),
      !selectedSize.value || (plant.size && plant.size.toLowerCase() === selectedSize.value.toLowerCase()),
      !selectedPolarity.value || (plant.polarity && plant.polarity.toLowerCase() === selectedPolarity.value.toLowerCase()),
      !selectedShape.value || (plant.shape && plant.shape.toLowerCase() === selectedShape.value.toLowerCase()),
      !selectedOutlinePolar.value || (plant.outline_polar && plant.outline_polar.toLowerCase() === selectedOutlinePolar.value.toLowerCase()),
      !selectedPERatio.value || (plant.pe_ratio && plant.pe_ratio.toLowerCase() === selectedPERatio.value.toLowerCase()),
      !selectedOrientation.value || (plant.orientation && plant.orientation.toLowerCase() === selectedOrientation.value.toLowerCase()),
      !selectedApertureNumber.value || (plant.aperture_number && plant.aperture_number.toLowerCase() === selectedApertureNumber.value.toLowerCase()),
      !selectedApertureType.value || (plant.aperture_type && plant.aperture_type.toLowerCase() === selectedApertureType.value.toLowerCase()),
      !selectedApertureCondition.value || (plant.aperture_condition && plant.aperture_condition.toLowerCase() === selectedApertureCondition.value.toLowerCase()),
      !selectedAperturePeculiarities.value || (plant.aperture_peculiarities && plant.aperture_peculiarities.toLowerCase() === selectedAperturePeculiarities.value.toLowerCase()),
      !selectedOrnamentationLM.value || (plant.ornamentation_lm && plant.ornamentation_lm.toLowerCase() === selectedOrnamentationLM.value.toLowerCase()),
      !selectedNexine.value || (plant.nexine && plant.nexine.toLowerCase() === selectedNexine.value.toLowerCase()),
      !selectedSexine.value || (plant.sexine && plant.sexine.toLowerCase() === selectedSexine.value.toLowerCase()),
      !selectedOrnamentation.value || (plant.ornamentation && plant.ornamentation.toLowerCase() === selectedOrnamentation.value.toLowerCase()),
      !selectedSuprasculpture.value || (plant.suprasculpture && plant.suprasculpture.toLowerCase() === selectedSuprasculpture.value.toLowerCase()),
      !selectedTectum.value || (plant.tectum && plant.tectum.toLowerCase() === selectedTectum.value.toLowerCase()),
      !selectedInfratectum.value || (plant.infratectum && plant.infratectum.toLowerCase() === selectedInfratectum.value.toLowerCase()),
      !selectedFootLayer.value || (plant.foot_layer && plant.foot_layer.toLowerCase() === selectedFootLayer.value.toLowerCase()),
      !selectedEndexine.value || (plant.endexine && plant.endexine.toLowerCase() === selectedEndexine.value.toLowerCase()),
      !selectedIntine.value || (plant.intine && plant.intine.toLowerCase() === selectedIntine.value.toLowerCase()),
      !selectedSupratectalElements.value || (plant.supratectal_elements && plant.supratectal_elements.toLowerCase() === selectedSupratectalElements.value.toLowerCase()),
      !selectedWallPeculiarities.value || (plant.wall_peculiarities && plant.wall_peculiarities.toLowerCase() === selectedWallPeculiarities.value.toLowerCase()),
      !selectedPollenCoatings.value || (plant.pollen_coatings && plant.pollen_coatings.toLowerCase() === selectedPollenCoatings.value.toLowerCase()),
      !selectedReserves.value || (plant.reserves && plant.reserves.toLowerCase() === selectedReserves.value.toLowerCase()),
      !selectedCellNumber.value || (plant.cell_number && plant.cell_number.toLowerCase() === selectedCellNumber.value.toLowerCase()),
      !selectedUbischBodies.value || (plant.ubisch_bodies && plant.ubisch_bodies.toLowerCase() === selectedUbischBodies.value.toLowerCase()),
      !selectedPreparation.value || (plant.preparation && plant.preparation.toLowerCase() === selectedPreparation.value.toLowerCase()),
      !selectedStaining.value || (plant.staining && plant.staining.toLowerCase() === selectedStaining.value.toLowerCase()),
      // ... diğer koşullar
    ]
    
    return conditions.every(condition => condition)
  })
  
  return filtered
})

// Bitki detaylarını göster
const showPlantDetails = (plant: Plant) => {
  selectedPlant.value = plant
}

// Bitki detaylarını kapat
const closePlantDetails = () => {
  selectedPlant.value = null
}

// Supabase'den veri çek
const fetchPlants = async () => {
  try {
    isLoading.value = true
    error.value = ''
    
    const result = await supabaseStore.fetchPlants()
    if (!result.success) {
      throw new Error(result.error || 'Veri çekilemedi')
    }
    
  } catch (err) {
    error.value = (err as Error).message || 'Bir hata oluştu'
    console.error('Plants fetch error:', err)
  } finally {
    isLoading.value = false
  }
}

// Sayfa yüklendiğinde veri çek
onMounted(() => {
  fetchPlants()
})
</script>