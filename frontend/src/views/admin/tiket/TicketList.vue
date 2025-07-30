<template>
  <div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h2 class="mb-0">Manajemen Tiket</h2>
      <router-link to="/admin/tiket/tambah" class="btn btn-primary">
        <i class="fas fa-ticket-alt mr-1"></i><i class="fas fa-plus"></i> Tambah Tiket
      </router-link>
    </div>

    <div class="card">
      <div class="card-body table-responsive">
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>ID</th>
              <th>Event</th>
              <th>Nama Tiket</th>
              <th>Harga</th>
              <th>Stok</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="ticket in tickets" :key="ticket.id">
              <td>{{ ticket.id }}</td>
              <td>{{ ticket.event.title }}</td>
              <td>{{ ticket.nama }}</td>
              <td>{{ ticket.harga }}</td>
              <td>{{ ticket.stock }}</td>
              <td>
                <router-link
                  :to="`/admin/tiket/edit/${ticket.id}`"
                  class="btn btn-sm btn-warning me-2"
                >
                  <i class="fas fa-edit"></i> Edit
                </router-link>
                <button
                  class="btn btn-sm btn-danger"
                  @click="hapusTiket(ticket.id)"
                >
                  <i class="fas fa-trash"></i> Hapus
                </button>
              </td>
            </tr>
            <tr v-if="tickets.length === 0">
              <td colspan="6" class="text-center">Tidak ada data tiket.</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
  name: "TicketList",
  data() {
    return {
      tickets: [],
    };
  },
  created() {
    this.fetchTickets();
  },
  methods: {
    async fetchTickets() {
      try {
        const response = await axios.get("http://localhost:8000/api/tickets");
        this.tickets = response.data.tickets;
      } catch (error) {
        Swal.fire({
          icon: "error",
          title: "Gagal",
          text: "Gagal mengambil data tiket.",
        });
      }
    },
    async hapusTiket(id) {
      const result = await Swal.fire({
        title: "Yakin ingin menghapus tiket ini?",
        text: "Data yang dihapus tidak dapat dikembalikan.",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#d33",
        cancelButtonColor: "#aaa",
        confirmButtonText: "Ya, hapus!",
        cancelButtonText: "Batal",
      });

      if (result.isConfirmed) {
        try {
          await axios.delete(`http://localhost:8000/api/tickets/${id}`);
          this.tickets = this.tickets.filter((t) => t.id !== id);
          Swal.fire({
            icon: "success",
            title: "Berhasil",
            text: "Tiket berhasil dihapus.",
            timer: 2000,
            showConfirmButton: false,
          });
        } catch (error) {
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Gagal menghapus tiket.",
          });
        }
      }
    },
  },
};
</script>
