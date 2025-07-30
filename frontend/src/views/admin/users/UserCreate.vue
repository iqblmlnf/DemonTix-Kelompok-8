<template>
  <div class="container mt-5">
    <h2>Tambah User Baru</h2>
    <form @submit.prevent="submitForm">
      <div class="form-group mb-3">
        <label>Username</label>
        <input v-model="form.username" type="text" class="form-control" required />
      </div>

      <div class="form-group mb-3">
        <label>Email</label>
        <input v-model="form.email" type="email" class="form-control" required />
      </div>

      <div class="form-group mb-3">
        <label>Password</label>
        <input v-model="form.password" type="password" class="form-control" required />
      </div>

      <button type="submit" class="btn btn-primary">Simpan</button>
      <router-link to="/admin/users" class="btn btn-secondary ms-2">Batal</router-link>
    </form>
  </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2';

export default {
  data() {
    return {
      form: {
        username: '',
        email: '',
        password: ''
      }
    };
  },
  methods: {
    async submitForm() {
      try {
        const response = await axios.post('http://localhost:8000/api/users', this.form);
        Swal.fire({
          icon: 'success',
          title: 'Berhasil',
          text: response.data.message || 'User berhasil ditambahkan!',
          timer: 2000,
          showConfirmButton: false
        });
        this.$router.push('/admin/users');
      } catch (error) {
        Swal.fire({
          icon: 'error',
          title: 'Gagal',
          text: 'Gagal menambahkan user. Pastikan email belum terpakai.',
        });
        console.error('Gagal menambahkan user:', error);
      }
    }
  }
};
</script>
