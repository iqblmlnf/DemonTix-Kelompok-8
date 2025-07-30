<template>
  <div class="container">
    <h2 class="mb-4">Edit Pemesanan</h2>

    <div v-if="isPending" class="alert alert-warning">
      Pemesanan dengan status <strong>pending</strong> tidak dapat diedit.
    </div>

    <form @submit.prevent="updatePemesanan">
      <div class="mb-3">
        <label>Nama</label>
        <input v-model="form.nama" class="form-control" type="text" :disabled="isPending" />
      </div>
      <div class="mb-3">
        <label>Email</label>
        <input v-model="form.email" class="form-control" type="email" :disabled="isPending" />
      </div>
      <div class="mb-3">
        <label>WhatsApp</label>
        <input v-model="form.whatsapp" class="form-control" type="text" :disabled="isPending" />
      </div>
      <div class="mb-3">
        <label>Status</label>
        <select v-model="form.status" class="form-control" :disabled="isPending">
          <option value="pending">Pending</option>
          <option value="waiting">Waiting</option>
          <option value="success">Success</option>
          <option value="failed">Failed</option>
        </select>
      </div>
      <input type="hidden" v-model="form.event_id" />
      <input type="hidden" v-model="form.subtotal" />
      <input type="hidden" v-model="form.total" />
      <button type="submit" class="btn btn-primary" :disabled="isPending">
        Update
      </button>
    </form>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
  data() {
    return {
      form: {
        nama: "",
        email: "",
        whatsapp: "",
        event_id: null,
        subtotal: 0,
        total: 0,
        status: "",
      },
      originalStatus: "",
      isPending: false,
    };
  },

  mounted() {
    axios
      .get(`http://localhost:8000/api/admin/pemesanan/${this.$route.params.id}`)
      .then((res) => {
        this.form = {
          nama: res.data.nama,
          email: res.data.email,
          whatsapp: res.data.whatsapp,
          status: res.data.status,
          event_id: res.data.event_id,
          subtotal: res.data.subtotal,
          total: res.data.total,
        };
        this.originalStatus = res.data.status;
        this.isPending = res.data.status === "pending";
      })
      .catch((error) => {
        console.error("Gagal mengambil data:", error);
        Swal.fire({
          icon: "error",
          title: "Gagal",
          text: "Tidak dapat memuat data pemesanan.",
        });
      });
  },

  methods: {
    async updatePemesanan() {
      if (this.isPending) {
        Swal.fire({
          icon: "warning",
          title: "Tidak Diizinkan",
          text: "Pemesanan dengan status pending tidak dapat diedit.",
        });
        return;
      }

      let payload = { ...this.form };

      // Konfirmasi jika status berubah menjadi 'failed'
      if (this.form.status === "failed" && this.originalStatus !== "failed") {
        const confirm = await Swal.fire({
          title: "Kembalikan Stok Tiket?",
          text: "Apakah Anda ingin mengembalikan stok tiket untuk pemesanan ini?",
          icon: "question",
          showCancelButton: true,
          confirmButtonText: "Ya",
          cancelButtonText: "Tidak",
        });

        payload.kembalikan_stok = confirm.isConfirmed;
      }

      // Konfirmasi jika status berubah menjadi 'success'
      if (this.form.status === "success" && this.originalStatus !== "success") {
        const confirm = await Swal.fire({
          title: "Kurangi Stok Tiket?",
          text: "Apakah Anda ingin mengurangi stok tiket untuk pemesanan ini?",
          icon: "question",
          showCancelButton: true,
          confirmButtonText: "Ya",
          cancelButtonText: "Tidak",
        });

        payload.kurangi_stok = confirm.isConfirmed;
      }

      try {
        await axios.put(
          `http://localhost:8000/api/admin/pemesanan/${this.$route.params.id}`,
          payload
        );
        Swal.fire({
          icon: "success",
          title: "Berhasil",
          text: "Pemesanan berhasil diperbarui.",
          timer: 2000,
          showConfirmButton: false,
        });
        this.$router.push("/admin/pemesanan");
      } catch (error) {
        console.error("Gagal memperbarui data:", error);
        Swal.fire({
          icon: "error",
          title: "Gagal",
          text: error.response?.data?.message || "Terjadi kesalahan saat update pemesanan.",
        });
      }
    },
  },
};
</script>
