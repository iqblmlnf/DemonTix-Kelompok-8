<template>
  <div class="container mt-5">
    <h2>Edit User</h2>
    <form @submit.prevent="updateUser">
      <div class="form-group mb-3">
        <label>Username</label>
        <input v-model="form.username" type="text" class="form-control" required />
      </div>

      <div class="form-group mb-3">
        <label>Email</label>
        <input v-model="form.email" type="email" class="form-control" required />
      </div>

      <div class="form-group mb-3">
        <label>Password (kosongkan jika tidak diganti)</label>
        <input v-model="form.password" type="password" class="form-control" />
      </div>

      <button type="submit" class="btn btn-primary">Update</button>
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
  mounted() {
    axios.get(`http://localhost:8000/api/users/${this.$route.params.id}`)
      .then(res => {
        this.form.username = res.data.user.username;
        this.form.email = res.data.user.email;
      })
      .catch(err => {
        console.error('Gagal mengambil data user:', err);
        Swal.fire({
          icon: 'error',
          title: 'Error',
          text: 'Gagal mengambil data user.'
        });
      });
  },
  methods: {
    updateUser() {
      axios.put(`http://localhost:8000/api/users/${this.$route.params.id}`, this.form)
        .then(res => {
          Swal.fire({
            icon: 'success',
            title: 'Berhasil',
            text: res.data.message || 'User berhasil diupdate!',
            timer: 2000,
            showConfirmButton: false
          });
          this.$router.push('/admin/users');
        })
        .catch(err => {
          console.error('Gagal update user:', err);
          Swal.fire({
            icon: 'error',
            title: 'Gagal',
            text: 'Gagal update user. Cek input!',
          });
        });
    }
  }
};
</script>
