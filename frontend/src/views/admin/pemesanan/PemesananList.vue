<template>
  <div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="mb-0">Pemesanan Masuk</h2>
    </div>

    <div class="card">
      <div class="card-body table-responsive">
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>Nama</th>
              <th>Email</th>
              <th>WhatsApp</th>
              <th>Event</th>
              <th>Subtotal</th>
              <th>Total</th>
              <th>Status</th>
              <th>Bukti Pembayaran</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="item in pemesanans" :key="item.id">
              <td>{{ item.nama }}</td>
              <td>{{ item.email }}</td>
              <td>{{ item.whatsapp }}</td>
              <td>{{ item.event_id }}</td>
              <td>{{ formatRupiah(item.subtotal) }}</td>
              <td>{{ formatRupiah(item.total) }}</td>
              <td>{{ item.status }}</td>
              <td>
                <span v-if="item.bukti_pembayaran">
                  <button class="btn btn-sm btn-info" @click="lihatBukti(item.bukti_pembayaran)">
                    Lihat Bukti
                  </button>
                </span>
                <span v-else class="text-muted">Belum Ada</span>
              </td>
              <td>
                <router-link :to="`/admin/pemesanan/edit/${item.id}`" class="btn btn-sm btn-warning me-2">
                  Edit
                </router-link>
                <button class="btn btn-sm btn-danger" @click="hapusPemesanan(item.id)">
                  Hapus
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Modal Bukti Pembayaran -->
    <div class="modal fade" id="modalBukti" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Bukti Pembayaran</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body text-center">
            <img
              :src="buktiUrl"
              alt="Bukti Pembayaran"
              class="img-fluid"
              style="max-height: 400px; border-radius: 6px"
            />
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { Modal } from "bootstrap";
import Swal from "sweetalert2";

export default {
  data() {
    return {
      pemesanans: [],
      buktiUrl: "",
    };
  },
  mounted() {
    this.loadData();
  },
  methods: {
    loadData() {
      axios
        .get("http://localhost:8000/api/admin/pemesanan")
        .then((res) => (this.pemesanans = res.data));
    },
    async hapusPemesanan(id) {
      const result = await Swal.fire({
        title: "Hapus Pemesanan?",
        text: "Data yang dihapus tidak dapat dikembalikan.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#6c757d",
        confirmButtonText: "Ya, hapus!",
        cancelButtonText: "Batal",
      });

      if (result.isConfirmed) {
        try {
          await axios.delete(`http://localhost:8000/api/admin/pemesanan/${id}`);
          Swal.fire({
            icon: "success",
            title: "Berhasil",
            text: "Pemesanan telah dihapus.",
            timer: 1500,
            showConfirmButton: false,
          });
          this.loadData();
        } catch (error) {
          console.error("Gagal menghapus pemesanan:", error);
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Terjadi kesalahan saat menghapus.",
          });
        }
      }
    },
    lihatBukti(filename) {
      this.buktiUrl = `http://localhost:8000/storage/${filename}`;
      const modal = new Modal(document.getElementById("modalBukti"));
      modal.show();
    },
    formatRupiah(value) {
      if (!value) return "Rp 0";
      return "Rp " + new Intl.NumberFormat("id-ID").format(value);
    },
  },
};
</script>

<style scoped>
.table td {
  vertical-align: middle;
}
</style>
