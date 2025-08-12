import { createRouter, createWebHistory } from 'vue-router'
import type { RouteRecordRaw } from 'vue-router'
import DefaultLayout from '../layouts/default.vue'

// Meta tipini tanımlayalım
declare module 'vue-router' {
  interface RouteMeta {
    requiresAuth?: boolean
    title?: string
  }
}

const routes: Array<RouteRecordRaw> = [
  {
    path: '/',
    component: DefaultLayout,
    children: [
      {
        path: '',
        name: 'Home',
        component: () => import('../pages/index.vue'),
        meta: {
          title: 'Ana Sayfa'
        }
      },
      {
        path: 'profil',
        name: 'Profil',
        component: () => import('../pages/profil.vue'),
        meta: {
          requiresAuth: true,
          title: 'Profil'
        }
      },
      {
        path: 'about',
        name: 'About',
        component: () => import('../pages/about.vue'),
        meta: {
          title: 'Hakkımızda'
        }
      },
      {
        path: 'services',
        name: 'Services',
        component: () => import('../pages/services.vue'),
        meta: {
          title: 'Hizmetlerimiz'
        }
      },
    
    ]
  },
  {
    path: '/auth',
    children: [
      {
        path: 'login',
        name: 'Login',
        component: () => import('../pages/auth/login.vue'),
        meta: {
          title: 'Giriş'
        }
      },
      {
        path: 'forgot-password',
        name: 'ForgotPassword',
        component: () => import('../pages/auth/forgot-password.vue'),
        meta: {
          title: 'Şifre Sıfırlama'
        }
      }
    ]
  },
  {
    path: '/:pathMatch(.*)*',
    name: 'NotFound',
    component: () => import('../pages/404.vue'),
    meta: {
      title: 'Sayfa Bulunamadı'
    }
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// Navigation Guards
router.beforeEach((to, from, next) => {
  // Sayfa başlığını güncelle
  if (to.meta?.title) {
    document.title = `${to.meta.title} | Uludağ Üniversitesi`
  }

  // Auth kontrolü
  if (to.meta?.requiresAuth) {
    const isAuthenticated = true // Geçici olarak true
    if (!isAuthenticated) {
      next({ name: 'Login', query: { redirect: to.fullPath } })
      return
    }
  }
  next()
})

// Navigation sonrası
router.afterEach(() => {
  window.scrollTo(0, 0)
})

// Hata yakalama
router.onError((error: Error) => {
  console.error('Router error:', error)
})

export default router 