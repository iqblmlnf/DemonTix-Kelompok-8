import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/views/Home.vue';
import Jelajah from '@/views/Jelajah.vue';
import HubungiKami from '@/views/HubungiKami.vue'
import SyaratKetentuan from '@/views/Syarat&Ketentuan.vue';
import Faq from '@/views/Faq.vue';
import Login from '@/views/Login.vue';
import TeamProject from '@/views/TeamProject.vue';



const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/jelajah', name: 'Jelajah', component: Jelajah },
    { path: '/hubungi-kami', name: 'HubungiKami', component: HubungiKami },
  { path: '/Detail/:id', name: 'Detail', component: () => import('@/views/Detail.vue'), props: true }, // Route dinamis
  { path: '/beli/:id', name: 'BeliTiket', component: () => import('@/views/BeliTiket.vue'), props: true},
  { path: '/syarat-ketentuan', name: 'SyaratKetentuan', component: SyaratKetentuan },
  { path: '/faq', name: 'Faq', component: Faq},
  { path: '/login', name: 'Login', component: Login },
  { path: '/team-project', name: 'TeamProject', component: TeamProject },

    {
    path: '/search',
    name: 'Search',
    component: () => import('@/views/Search.vue'),
    props: route => ({ query: route.query.q })
  },

  {
    path: '/admin',
    component: () => import('@/views/AdminDashboard.vue'),
    children: [
      {
        path: '',
        name: 'AdminHome',
        component: () => import('@/views/admin/Dashboard.vue'),
        meta: { requiresAdmin: true }
      },
    ]
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
