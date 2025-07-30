<template>
  <div>
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h2>Pesan Hubungi Kami</h2>
    </div>

    <div v-if="contacts.length">
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>Nama</th>
            <th>Email</th>
            <th>Subjek</th>
            <th>Pesan</th>
            <th>Aksi</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="contact in contacts" :key="contact.id">
            <td>{{ contact.name }}</td>
            <td>{{ contact.email }}</td>
            <td>{{ contact.subject }}</td>
            <td>{{ contact.message }}</td>
            <td>
              <button
                class="btn btn-sm btn-danger"
                @click="deleteContact(contact.id)"
              >
                <i class="fas fa-trash"></i> Hapus
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <div v-else class="text-muted">Belum ada pesan masuk.</div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
  name: "ContactList",
  data() {
    return {
      contacts: [],
    };
  },
  mounted() {
    this.fetchContacts();
  },
  methods: {
    fetchContacts() {
      axios
        .get("http://localhost:8000/api/contact")
        .then((response) => {
          this.contacts = response.data;
        })
        .catch((error) => {
          console.error("Gagal mengambil data kontak:", error);
        });
    },
    async deleteContact(id) {
      const result = await Swal.fire({
        title: "Hapus Pesan?",
        text: "Pesan yang dihapus tidak dapat dikembalikan.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#6c757d",
        confirmButtonText: "Ya, hapus!",
        cancelButtonText: "Batal",
      });

      if (result.isConfirmed) {
        try {
          await axios.delete(`http://localhost:8000/api/contact/${id}`);
          this.contacts = this.contacts.filter((c) => c.id !== id);

          Swal.fire({
            icon: "success",
            title: "Berhasil",
            text: "Pesan berhasil dihapus.",
            timer: 1500,
            showConfirmButton: false,
          });
        } catch (error) {
          console.error("Gagal menghapus kontak:", error);
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Terjadi kesalahan saat menghapus pesan.",
          });
        }
      }
    },
  },
};
</script>

<style scoped>
.table th,
.table td {
  vertical-align: middle;
}
</style>
