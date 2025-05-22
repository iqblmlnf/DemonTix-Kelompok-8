import { createRouter, createWebHistory } from 'vue-router';
import Home from '@/pages/Home.vue';
import Jelajah from '@/pages/Jelajah.vue';
import HubungiKami from '@/pages/HubungiKami.vue'; // Tambahkan ini
import TeamProject from '@/pages/TeamProject.vue';
import SyaratKetentuan from '@/pages/Syarat&Ketentuan.vue';
import Faq from '@/pages/Faq.vue';



const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/jelajah', name: 'Jelajah', component: Jelajah },
  { path: '/Detail/:id', name: 'Detail', component: () => import('@/pages/Detail.vue'), props: true }, // Route dinamis
  { path: '/beli/:id', name: 'BeliTiket', component: () => import('@/pages/BeliTiket.vue'), props: true},
  { path: '/hubungi-kami', name: 'HubungiKami', component: HubungiKami }, // ✅ Tambahkan ini
  { path: '/team-project', name: 'TeamProject', component: TeamProject },
  { path: '/syarat-ketentuan', name: 'SyaratKetentuan', component: SyaratKetentuan },
  { path: '/faq', name: 'Faq', component: Faq},
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
