import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/views/Home.vue';
import Jelajah from '@/views/Jelajah.vue';
import SyaratKetentuan from '@/views/Syarat&Ketentuan.vue';
import Faq from '@/views/Faq.vue';
import Login from '@/views/Login.vue';



const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/jelajah', name: 'Jelajah', component: Jelajah },
  { path: '/Detail/:id', name: 'Detail', component: () => import('@/views/Detail.vue'), props: true }, // Route dinamis
  { path: '/beli/:id', name: 'BeliTiket', component: () => import('@/views/BeliTiket.vue'), props: true},
  { path: '/syarat-ketentuan', name: 'SyaratKetentuan', component: SyaratKetentuan },
  { path: '/faq', name: 'Faq', component: Faq},
  { path: '/login', name: 'Login', component: Login },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
