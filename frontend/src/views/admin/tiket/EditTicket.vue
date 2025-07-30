<template>
  <div class="card">
    <div class="card-header">
      <h3 class="card-title">Edit Tiket</h3>
    </div>
    <div class="card-body">
      <form v-if="form.event_id" @submit.prevent="submitForm">
        <div class="form-group">
          <label for="event_id">Event</label>
          <select v-model="form.event_id" class="form-control" required>
            <option disabled value="">-- Pilih Event --</option>
            <option v-for="event in events" :key="event.id" :value="event.id">
              {{ event.title }}
            </option>
          </select>
        </div>

        <div class="form-group">
          <label for="nama">Nama Tiket</label>
          <input
            type="text"
            v-model="form.nama"
            class="form-control"
            required
          />
        </div>

        <div class="form-group">
          <label for="harga">Harga</label>
          <input
            type="number"
            v-model="form.harga"
            class="form-control"
            required
          />
        </div>

        <div class="form-group">
          <label for="stock">Stok</label>
          <input
            type="number"
            v-model="form.stock"
            class="form-control"
            required
          />
        </div>

        <button type="submit" class="btn btn-primary">Update</button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
  name: "EditTicket",
  data() {
    return {
      form: {
        event_id: "",
        nama: "",
        harga: "",
        stock: "",
      },
      events: [],
    };
  },
  computed: {
    isEdit() {
      return !!this.$route.params.id;
    }
  },
  created() {
    this.fetchEvents();
    this.fetchTiket();
  },
  methods: {
    fetchEvents() {
      axios
        .get("http://localhost:8000/api/events")
        .then((res) => {
          this.events = res.data;
        })
        .catch(() => {
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Gagal memuat data event.",
          });
        });
    },
    fetchTiket() {
      const id = this.$route.params.id;
      axios
        .get(`http://localhost:8000/api/tickets/${id}`)
        .then((res) => {
          const data = res.data;
          this.form = {
            event_id: data.event_id,
            nama: data.nama,
            harga: data.harga,
            stock: data.stock,
          };
        })
        .catch(() => {
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Tiket tidak ditemukan atau terjadi kesalahan.",
          });
        });
    },
    submitForm() {
      axios
        .put(`http://localhost:8000/api/tickets/${this.$route.params.id}`, this.form)
        .then(() => {
          Swal.fire({
            icon: "success",
            title: "Berhasil!",
            text: "Tiket berhasil diperbarui.",
          }).then(() => {
            this.$router.push("/admin/tiket");
          });
        })
        .catch(() => {
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Gagal memperbarui tiket.",
          });
        });
    },
  },
};
</script>
