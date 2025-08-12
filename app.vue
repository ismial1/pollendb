<template>
  <NuxtLayout>
    <NuxtPage />
    <ClientOnly>
      <div class="absolute top-0 left-0 right-0 bottom-0 bg-black/60 flex justify-center items-center"
        v-if="polenStore.loading">
        <Icon name="eos-icons:loading" class="text-green-400 text-4xl" />
      </div>
    </ClientOnly>
  </NuxtLayout>
</template>

<script setup>

import { usePolenStore } from '~/store/Polen';

const polenStore = usePolenStore();
polenStore.findAllProperties();

</script>

<style>
#app {
  min-height: 100vh;
}

.page-enter-active,
.page-leave-active {
  transition: opacity 0.2s ease;
}

.page-enter-from,
.page-leave-to {
  opacity: 0;
}
</style>
