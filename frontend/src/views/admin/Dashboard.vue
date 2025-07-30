<template>
  <div class="container-fluid py-4">
    <h1 class="mb-4 fw-bold text-dark">Dashboard Admin</h1>

    <div class="row g-4">
      <div
        class="col-md-4"
        v-for="box in statisticBoxes"
        :key="box.title"
      >
        <div
          class="card text-white shadow-sm h-100"
          :style="{ background: box.gradient }"
        >
          <div class="card-body d-flex flex-column align-items-center justify-content-center">
            <div class="display-5 mb-2">
              <i :class="box.icon"></i>
            </div>
            <h4 class="fw-bold">{{ box.value }}</h4>
            <small>{{ box.title }}</small>
          </div>
        </div>
      </div>
    </div>

    <div class="card mt-5 shadow-sm">
      <div class="card-body">
        <h5 class="card-title fw-bold mb-3 text-primary">Selamat Datang 🎉</h5>
        <p class="card-text">
          Ini adalah halaman dashboard admin. Gunakan menu di sidebar untuk mengelola pengguna,
          event, pemesanan, dan lain-lain.
        </p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
  name: "Dashboard",
  data() {
    return {
      statistik: {
        total_pemesanan: 0,
        total_event: 0,
        total_user: 0,
      },
    };
  },
  computed: {
    statisticBoxes() {
      return [
        {
          title: "Total Pemesanan",
          value: this.statistik.total_pemesanan,
          gradient: "linear-gradient(135deg, #4facfe, #00f2fe)",
          icon: "bi bi-receipt",
        },
        {
          title: "Total Event",
          value: this.statistik.total_event,
          gradient: "linear-gradient(135deg, #43e97b, #38f9d7)",
          icon: "bi bi-calendar-event",
        },
        {
          title: "Total User",
          value: this.statistik.total_user,
          gradient: "linear-gradient(135deg, #f093fb, #f5576c)",
          icon: "bi bi-people-fill",
        },
      ];
    },
  },
  mounted() {
    this.loadStatistik();
  },
  methods: {
    loadStatistik() {
      axios
        .get("http://localhost:8000/api/admin/statistik")
        .then((res) => {
          this.statistik = res.data;
        })
        .catch(() => {
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Gagal memuat statistik dashboard.",
          });
        });
    },
  },
};
</script>

<style scoped>
.card {
  border-radius: 0.75rem;
}
.display-5 {
  font-size: 2.5rem;
}
</style>
