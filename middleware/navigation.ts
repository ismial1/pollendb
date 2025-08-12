export default defineNuxtRouteMiddleware((to, from) => {
  if (to.path === '/search-data/alphabetical') {
    return navigateTo('/search-data/alphabetical')
  }
}) 