<template>
  <div class="container py-5">
    <h2 class="text-center mb-4 fw-bold invoice-heading">Invoice Pembayaran</h2>

    <div class="card shadow border-0 mx-auto" style="max-width: 600px">
      <div class="card-body">
        <p><strong>No. Pemesanan:</strong> {{ invoice.id }}</p>
        <p><strong>Nama Pemesan:</strong> {{ invoice.nama }}</p>
        <p><strong>Email:</strong> {{ invoice.email }}</p>
        <p><strong>Metode Pembayaran:</strong> {{ invoice.metode_pembayaran }}</p>
        <p><strong>Nama Event:</strong> {{ invoice.event?.title }}</p>
        <p>
          <strong>Tanggal Event:</strong>
          {{ formatTanggal(invoice.event?.date) }}
        </p>
        <p><strong>Total:</strong> Rp {{ formatRupiah(invoice.total) }}</p>
        <p>
          <strong>Status: </strong>
          <span :class="statusClass(invoice.status)" class="fw-semibold text-capitalize">
            {{ displayStatus(invoice.status) }}
          </span>
        </p>

        <!-- Tombol Kembali dan Unduh PDF -->
        <div class="d-flex justify-content-between align-items-center mt-4">
          <router-link to="/" class="btn btn-custom">
            Kembali ke Beranda
          </router-link>

          <!-- Tombol Unduh PDF hanya jika status 'success' -->
          <a
            v-if="invoice.status === 'success'"
            :href="`http://127.0.0.1:8000/invoice/pdf/${invoice.id}`"
            target="_blank"
            class="btn btn-outline-danger"
          >
            Unduh PDF
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
  data() {
    return {
      invoice: {},
    };
  },
  mounted() {
    this.fetchInvoice();
  },
  methods: {
    fetchInvoice() {
      const id = this.$route.params.id;
      axios
        .get(`http://127.0.0.1:8000/api/pemesanan/${id}`)
        .then((res) => {
          this.invoice = res.data;
        })
        .catch(() => {
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Gagal mengambil data invoice.",
          });
        });
    },
    formatTanggal(tanggal) {
      if (!tanggal) return "-";
      const options = { day: "numeric", month: "long", year: "numeric" };
      return new Date(tanggal).toLocaleDateString("id-ID", options);
    },
    formatRupiah(value) {
      if (!value) return "0";
      return new Intl.NumberFormat("id-ID").format(value);
    },
    statusClass(status) {
      switch (status) {
        case "pending":
          return "text-secondary";
        case "waiting":
          return "text-warning";
        case "success":
          return "text-success";
        case "failed":
          return "text-danger";
        default:
          return "text-muted";
      }
    },
    displayStatus(status) {
      switch (status) {
        case "pending":
          return "Menunggu Pembayaran";
        case "waiting":
          return "Menunggu Konfirmasi";
        case "success":
          return "Berhasil";
        case "failed":
          return "Gagal";
        default:
          return status;
      }
    },
  },
};
</script>

<style scoped>
.container {
  max-width: 800px;
  color: #a43434;
}
.invoice-heading {
  color: #a43434;
}
.btn-custom {
  background-color: #a43434;
  color: white;
  border: none;
  transition: background-color 0.3s ease;
}
.btn-custom:hover {
  background-color: #902e2e;
  color: white;
}
</style>
