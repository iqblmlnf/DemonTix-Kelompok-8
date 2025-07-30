<template>
  <div>
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h2>Daftar Event</h2>
      <router-link to="/admin/events/create" class="btn btn-primary">
        <i class="nav-icon fas fa-calendar-plus"></i> Tambah Event
      </router-link>
    </div>

    <div v-if="events.length">
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>Judul</th>
            <th>Tanggal</th>
            <th>Waktu</th>
            <th>Lokasi</th>
            <th>Kategori</th>
            <th>Penyelenggara</th>
            <th>Link Sosial</th>
            <th>Deskripsi</th>
            <th>Syarat & Ketentuan</th>
            <th>Aksi</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="event in events" :key="event.id">
            <td>{{ event.title }}</td>
            <td>{{ event.date }}</td>
            <td>{{ event.time }}</td>
            <td>{{ event.location }}</td>
            <td>{{ event.category }}</td>
            <td>{{ event.organizer }}</td>
            <td>
              <a v-if="event.socialLink" :href="event.socialLink" target="_blank">Lihat</a>
              <span v-else class="text-muted">-</span>
            </td>
            <td style="width: 150px;">
              <button
                v-if="event.deskripsi"
                class="btn btn-sm btn-info"
                @click="showDetail('deskripsi', event.deskripsi)"
              >
                Lihat
              </button>
              <span v-else class="text-muted">-</span>
            </td>
            <td style="width: 150px;">
              <button
                v-if="event.syaratKetentuan"
                class="btn btn-sm btn-info"
                @click="showDetail('syaratKetentuan', event.syaratKetentuan)"
              >
                Lihat
              </button>
              <span v-else class="text-muted">-</span>
            </td>
            <td>
              <router-link :to="`/admin/events/edit/${event.id}`" class="btn btn-sm btn-warning me-2">Edit</router-link>
              <button class="btn btn-sm btn-danger" @click="deleteEvent(event.id)">Hapus</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>

    <div v-else class="text-muted">Tidak ada event tersedia.</div>

    <!-- Modal -->
    <div class="modal fade" tabindex="-1" :class="{ show: modalVisible }" style="display: block;" v-if="modalVisible">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Isi {{ modalType === 'deskripsi' ? 'Deskripsi' : 'Syarat & Ketentuan' }}</h5>
            <button type="button" class="btn-close" @click="modalVisible = false"></button>
          </div>
          <div class="modal-body">
            <p v-html="modalContent"></p>
          </div>
          <div class="modal-footer">
            <button class="btn btn-secondary" @click="modalVisible = false">Tutup</button>
          </div>
        </div>
      </div>
    </div>
    <div v-if="modalVisible" class="modal-backdrop fade show"></div>
  </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2';

export default {
  name: 'EventList',
  data() {
    return {
      events: [],
      modalVisible: false,
      modalContent: '',
      modalType: '',
    };
  },
  mounted() {
    this.fetchEvents();
  },
  methods: {
    fetchEvents() {
      axios.get('http://localhost:8000/api/events')
        .then(response => {
          this.events = response.data;
        })
        .catch(() => {
          Swal.fire({
            icon: 'error',
            title: 'Gagal',
            text: 'Tidak dapat mengambil data event.',
          });
        });
    },
    async deleteEvent(id) {
      const result = await Swal.fire({
        title: 'Yakin ingin menghapus event ini?',
        text: 'Data yang dihapus tidak dapat dikembalikan!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Ya, hapus!',
        cancelButtonText: 'Batal'
      });

      if (result.isConfirmed) {
        try {
          await axios.delete(`http://localhost:8000/api/events/${id}`);
          this.events = this.events.filter(e => e.id !== id);
          Swal.fire({
            icon: 'success',
            title: 'Berhasil',
            text: 'Event berhasil dihapus.',
          });
        } catch (error) {
          Swal.fire({
            icon: 'error',
            title: 'Gagal',
            text: 'Terjadi kesalahan saat menghapus event.',
          });
        }
      }
    },
    showDetail(type, content) {
      this.modalType = type;
      this.modalContent = content || '(Kosong)';
      this.modalVisible = true;
    },
  },
};
</script>

<style scoped>
.table th,
.table td {
  vertical-align: middle;
}
.text-muted {
  color: #6c757d;
}
</style>
