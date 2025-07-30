<template>
  <div class="container py-5">
    <h2 class="text-center mb-4 fw-bold text-danger">Pembayaran Tiket</h2>

    <div class="row g-4">
      <!-- Detail Pemesanan -->
      <div class="col-md-6">
        <div class="card shadow-sm border-0">
          <div class="card-header bg-danger text-white fw-semibold">
            Detail Pemesanan
          </div>
          <div class="card-body">
            <p><strong>ID Pemesanan:</strong> {{ pemesanan.id }}</p>
            <p><strong>Nama:</strong> {{ pemesanan.nama }}</p>
            <p><strong>Email:</strong> {{ pemesanan.email }}</p>
            <p><strong>WhatsApp:</strong> {{ pemesanan.whatsapp }}</p>
            <hr />
            <p class="fs-5">
              <strong>Total Pembayaran: </strong>
              <span class="text-success fw-bold">Rp {{ formatRupiah(pemesanan.total) }}</span>
            </p>
            <p class="mt-3">
              <strong>Batas Waktu Pembayaran:</strong><br />
              <span class="text-danger fw-semibold fs-5">{{ countdown }}</span>
            </p>
          </div>
        </div>
      </div>

      <!-- Metode Pembayaran -->
      <div class="col-md-6">
        <div class="card shadow-sm border-0">
          <div class="card-header bg-dark text-white fw-semibold">
            Pilih Metode Pembayaran
          </div>
          <div class="card-body">
            <!-- Pilihan Metode -->
            <div class="form-check mb-2">
              <input class="form-check-input" type="radio" v-model="metode" value="Transfer Bank" />
              <label class="form-check-label">Transfer Bank (BNI, BCA, Mandiri)</label>
            </div>
            <div class="form-check mb-2">
              <input class="form-check-input" type="radio" v-model="metode" value="E-Wallet" />
              <label class="form-check-label">E-Wallet (OVO, Dana, GoPay)</label>
            </div>
            <div class="form-check mb-3">
              <input class="form-check-input" type="radio" v-model="metode" value="QRIS" />
              <label class="form-check-label">QRIS (Scan QR Code)</label>
            </div>

            <!-- Info Tambahan -->
            <div v-if="metode === 'Transfer Bank'" class="alert alert-info">
              <strong>Silakan transfer ke salah satu rekening berikut:</strong>
              <ul class="mb-0 ps-3">
                <li>BCA: 1234567890 a.n. DemonTix</li>
                <li>Mandiri: 9876543210 a.n. DemonTix</li>
                <li>BNI: 1122334455 a.n. DemonTix</li>
              </ul>
            </div>

            <div v-if="metode === 'E-Wallet'" class="alert alert-warning">
              <strong>Silakan kirim ke salah satu akun E-Wallet berikut:</strong>
              <ul class="mb-0 ps-3">
                <li>OVO: 0812-3456-7890</li>
                <li>Dana: 0813-4567-8901</li>
                <li>GoPay: 0819-8765-4321</li>
              </ul>
            </div>

            <div v-if="metode === 'QRIS'" class="text-center mt-3">
              <strong>Silakan scan kode QR berikut:</strong><br />
              <img src="../assets/images/QrCode.png" alt="QRIS Code" class="img-fluid mt-2" style="max-width: 200px; border: 1px solid #ccc; border-radius: 8px;" />
            </div>
          </div>
        </div>

        <!-- Tombol Aksi -->
        <div class="mt-4">
          <div class="mb-3">
            <label class="form-label fw-semibold">Upload Bukti Pembayaran</label>
            <input type="file" class="form-control" accept="image/*" @change="handleFileUpload" />

            <div v-if="buktiPreview" class="mt-3">
              <strong>Preview:</strong><br />
              <img :src="buktiPreview" class="img-fluid mt-2" style="max-height: 200px; border: 1px solid #ddd; border-radius: 6px;" />
            </div>
          </div>

          <div class="d-flex justify-content-between">
            <button @click="goBack" class="btn btn-secondary px-4">Kembali</button>
            <button
              @click="bayar"
              class="btn btn-success px-5 fw-bold"
              :disabled="countdown === 'Waktu pembayaran telah habis!'"
            >
              Bayar Sekarang
            </button>
          </div>
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
      pemesanan: {},
      metode: "Transfer Bank",
      bukti: null,
      buktiPreview: null,
      countdown: "Memuat waktu...",
      timerInterval: null,
    };
  },
  mounted() {
    this.fetchPemesanan();
  },
  beforeUnmount() {
    clearInterval(this.timerInterval);
  },
  methods: {
    fetchPemesanan() {
      const id = this.$route.params.id;
      axios
        .get(`http://127.0.0.1:8000/api/pemesanan/${id}`)
        .then((response) => {
          this.pemesanan = response.data;
          this.startCountdown();
        })
        .catch(() => {
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Gagal mengambil data pemesanan.",
          });
        });
    },
    startCountdown() {
  if (!this.pemesanan.created_at) return;

  const deadline = new Date(this.pemesanan.created_at);
  deadline.setHours(deadline.getHours() + 1);

  let sudahDibatalkan = false; 

  const updateCountdown = () => {
    const now = new Date();
    const diff = deadline - now;

    if (diff <= 0) {
      this.countdown = "Waktu pembayaran telah habis!";
      clearInterval(this.timerInterval);

      if (!sudahDibatalkan && this.pemesanan.status !== "failed") {
        sudahDibatalkan = true;

        axios
          .post("http://localhost:8000/api/pemesanan/batalkan", {
            pemesanan_id: this.pemesanan.id,
          })
          .then(() => {
            Swal.fire({
              icon: "info",
              title: "Waktu Habis",
              text: "Pemesanan dibatalkan secara otomatis.",
            });
            this.fetchPemesanan();
          })
          .catch((error) => {
            console.error("Gagal membatalkan otomatis:", error);
          });
      }

      return;
    }

    const hours = String(Math.floor(diff / (1000 * 60 * 60))).padStart(2, "0");
    const minutes = String(Math.floor((diff / (1000 * 60)) % 60)).padStart(2, "0");
    const seconds = String(Math.floor((diff / 1000) % 60)).padStart(2, "0");

    this.countdown = `${hours}:${minutes}:${seconds}`;
  };

  updateCountdown();
  this.timerInterval = setInterval(updateCountdown, 1000);
},
    handleFileUpload(event) {
      const file = event.target.files[0];
      this.bukti = file;
      if (file) {
        this.buktiPreview = URL.createObjectURL(file);
      }
    },
    bayar() {
      if (!this.metode) {
        Swal.fire({
          icon: "warning",
          title: "Metode Belum Dipilih",
          text: "Pilih metode pembayaran terlebih dahulu.",
        });
        return;
      }
      if (!this.bukti) {
        Swal.fire({
          icon: "warning",
          title: "Bukti Belum Diupload",
          text: "Upload bukti pembayaran terlebih dahulu.",
        });
        return;
      }

      const formData = new FormData();
      formData.append("pemesanan_id", this.pemesanan.id);
      formData.append("metode", this.metode);
      formData.append("bukti", this.bukti);

      axios
        .post("http://127.0.0.1:8000/api/pembayaran", formData, {
          headers: { "Content-Type": "multipart/form-data" },
        })
        .then(() => {
          Swal.fire({
            icon: "success",
            title: "Berhasil",
            text: "Pembayaran berhasil! Mengarahkan ke halaman invoice...",
            timer: 2000,
            showConfirmButton: false,
          });
          setTimeout(() => {
            this.$router.push(`/invoice/${this.pemesanan.id}`);
          }, 2000);
        })
        .catch(() => {
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Gagal memproses pembayaran. Silakan coba lagi.",
          });
        });
    },
    goBack() {
      this.$router.go(-1);
    },
    formatRupiah(value) {
      if (!value) return "0";
      return new Intl.NumberFormat("id-ID").format(value);
    },
  },
};
</script>


<style scoped>
.container {
  max-width: 960px;
}
.card-header {
  font-size: 1.1rem;
}
</style>
