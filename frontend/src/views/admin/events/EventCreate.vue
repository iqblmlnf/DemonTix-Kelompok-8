<template>
  <div class="card">
    <div class="card-header">
      <h3 class="card-title">Tambah Event</h3>
    </div>
    <div class="card-body">
      <form @submit.prevent="submitForm">
        <div class="form-group">
          <label>Judul</label>
          <input v-model="event.title" class="form-control" required />
        </div>
        <div class="form-group">
          <label>Tanggal</label>
          <input type="date" v-model="event.date" class="form-control" required />
        </div>
        <div class="form-group">
          <label>Waktu</label>
          <input v-model="event.time" class="form-control" required />
        </div>
        <div class="form-group">
          <label>Lokasi</label>
          <input v-model="event.location" class="form-control" required />
        </div>
        <div class="form-group mb-3">
          <label>Kategori</label>
          <select v-model="event.category" class="form-control" required>
            <option disabled value="">-- Pilih Kategori --</option>
            <option value="musik">Musik</option>
            <option value="olahraga">Olahraga</option>
            <option value="wisata">Wisata</option>
          </select>
        </div>

        <div class="form-group mb-3">
          <label>Deskripsi Event</label>
          <textarea
            v-model="event.deskripsi"
            class="form-control"
            rows="4"
            placeholder="Tuliskan deskripsi lengkap event"
            required
          ></textarea>
        </div>
        <div class="form-group mb-3">
          <label>Syarat & Ketentuan</label>
          <textarea
            v-model="event.syaratKetentuan"
            class="form-control"
            rows="4"
            placeholder="Tuliskan syarat & ketentuan event"
            required
          ></textarea>
        </div>
        <div class="form-group">
          <label>Gambar</label>
          <input type="file" @change="handleFileUpload($event, 'image')" class="form-control" />
        </div>
        <div class="form-group">
          <label>Gambar 1 (Opsional)</label>
          <input type="file" @change="handleFileUpload($event, 'image1')" class="form-control" />
        </div>
        <div class="form-group">
          <label>Penyelenggara</label>
          <input v-model="event.organizer" class="form-control" required />
        </div>
        <div class="form-group">
          <label>Social Link</label>
          <input v-model="event.socialLink" class="form-control" />
        </div>
        <button class="btn btn-primary">Simpan</button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
  data() {
    return {
      event: {
        title: "",
        date: "",
        time: "",
        location: "",
        category: "",
        deskripsi: "",
        syaratKetentuan: "",
        image: null,
        image1: null,
        organizer: "",
        socialLink: "",
      },
    };
  },
  methods: {
    handleFileUpload(e, field) {
      this.event[field] = e.target.files[0];
    },
    async submitForm() {
      const formData = new FormData();
      for (const key in this.event) {
        if (this.event[key] !== null) {
          formData.append(key, this.event[key]);
        }
      }

      try {
        await axios.post("http://localhost:8000/api/events", formData, {
          headers: { "Content-Type": "multipart/form-data" },
        });
        Swal.fire({
          icon: "success",
          title: "Berhasil",
          text: "Event berhasil ditambahkan!",
        });
        this.$router.push("/admin/events");
      } catch (err) {
        console.error(err);
        Swal.fire({
          icon: "error",
          title: "Gagal",
          text: "Gagal menyimpan event. Silakan periksa kembali input data.",
        });
      }
    },
  },
};
</script>
