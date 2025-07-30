import { createApp } from 'vue';
import App from './App.vue';
import router from './router';

// ✅ CSS Libraries
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap-icons/font/bootstrap-icons.css';
import 'admin-lte/dist/css/adminlte.min.css';

// ✅ JS Libraries (harus urut)
import 'jquery';
import 'bootstrap/dist/js/bootstrap.bundle.min.js';
import 'admin-lte/dist/js/adminlte.min.js';

createApp(App).use(router).mount('#app');
