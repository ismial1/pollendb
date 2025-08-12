import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    component: () => import('../layouts/default.vue'),
    children: [
      {
        path: '',
        name: 'Home',
        component: () => import('../pages/index.vue')
      },
      {
        path: 'profil',
        name: 'profil',
        component: () => import('../pages/profil.vue')
      },
      {
        path: 'about',
        name: 'About',
        component: () => import('../pages/about.vue')
      },
      {
        path: 'contact',
        name: 'Contact',
        component: () => import('../pages/contact.vue')
      }
    ]
  },
  {
    path: '/auth',
    children: [
      {
        path: 'login',
        name: 'Login',
        component: () => import('../pages/auth/login.vue')
      },
      {
        path: 'forgot-password',
        name: 'ForgotPassword',
        component: () => import('../pages/auth/forgot-password.vue')
      }
    ]
  },
  {
    path: '/:pathMatch(.*)*',
    name: 'NotFound',
    component: () => import('../pages/NotFound.vue')
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to, from, next) => {
  console.log('Route değişiyor:', {
    from: from.path,
    to: to.path,
    name: to.name
  })
  next()
})

router.afterEach((to) => {
  console.log('Route değişti:', to.path)
})

export default router
