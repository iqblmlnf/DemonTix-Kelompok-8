<template>
  <div class="card">
    <div class="card-header">
      <h3 class="card-title">{{ isEdit ? "Edit Tiket" : "Tambah Tiket" }}</h3>
    </div>
    <div class="card-body">
      <form @submit.prevent="submitForm">
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

        <button type="submit" class="btn btn-primary">
          {{ isEdit ? "Update" : "Simpan" }}
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
  name: "TicketForm",
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
    },
  },
  created() {
    this.fetchEvents();
    if (this.isEdit) {
      this.fetchTiket();
    }
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
            text: "Tidak dapat memuat daftar event.",
          });
        });
    },
    fetchTiket() {
      axios
        .get(`http://localhost:8000/api/tickets/${this.$route.params.id}`)
        .then((res) => {
          this.form = res.data;
        })
        .catch(() => {
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: "Tidak dapat memuat data tiket.",
          });
        });
    },
    submitForm() {
      const request = this.isEdit
        ? axios.put(`http://localhost:8000/api/tickets/${this.$route.params.id}`, this.form)
        : axios.post("http://localhost:8000/api/tickets", this.form);

      request
        .then(() => {
          Swal.fire({
            icon: "success",
            title: this.isEdit ? "Berhasil Diupdate!" : "Berhasil Disimpan!",
            text: `Tiket ${this.isEdit ? "berhasil diupdate" : "berhasil ditambahkan"}.`,
          }).then(() => {
            this.$router.push("/admin/tiket");
          });
        })
        .catch(() => {
          Swal.fire({
            icon: "error",
            title: "Gagal",
            text: `Tiket gagal ${this.isEdit ? "diupdate" : "ditambahkan"}.`,
          });
        });
    },
  },
};
</script>
