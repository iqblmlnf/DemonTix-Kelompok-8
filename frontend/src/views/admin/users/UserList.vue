<template>
  <div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
      <h2 class="mb-0">User Management</h2>
      <router-link to="/admin/users/create" class="btn btn-primary">
        <i class="fas fa-user-plus"></i> Tambah User
      </router-link>
    </div>

    <div class="card">
      <div class="card-body table-responsive">
        <table class="table table-bordered table-striped">
          <thead>
            <tr>
              <th>ID</th>
              <th>Username</th>
              <th>Email</th>
              <th>Aksi</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="user in users" :key="user.id">
              <td>{{ user.id }}</td>
              <td>{{ user.username }}</td>
              <td>{{ user.email }}</td>
              <td>
                <router-link
                  :to="`/admin/users/edit/${user.id}`"
                  class="btn btn-sm btn-warning me-2"
                >
                  <i class="fas fa-edit"></i> Edit
                </router-link>
                <button
                  class="btn btn-sm btn-danger"
                  @click="deleteUser(user.id)"
                >
                  <i class="fas fa-trash"></i> Hapus
                </button>
              </td>
            </tr>
            <tr v-if="users.length === 0">
              <td colspan="4" class="text-center">Tidak ada data user.</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import Swal from 'sweetalert2';

export default {
  name: 'UserList',
  data() {
    return {
      users: [],
    };
  },
  created() {
    this.fetchUsers();
  },
  methods: {
    async fetchUsers() {
      try {
        const response = await axios.get('http://127.0.0.1:8000/api/users');
        this.users = response.data.users;
      } catch (error) {
        Swal.fire({
          icon: 'error',
          title: 'Gagal',
          text: 'Gagal mengambil data users.',
        });
      }
    },
    async deleteUser(id) {
      const result = await Swal.fire({
        title: 'Yakin ingin menghapus user ini?',
        text: 'Tindakan ini tidak bisa dibatalkan!',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Ya, hapus',
        cancelButtonText: 'Batal',
      });

      if (result.isConfirmed) {
        try {
          await axios.delete(`http://127.0.0.1:8000/api/users/${id}`);
          this.users = this.users.filter(user => user.id !== id);
          Swal.fire({
            icon: 'success',
            title: 'Berhasil',
            text: 'User berhasil dihapus.',
            timer: 2000,
            showConfirmButton: false,
          });
        } catch (error) {
          Swal.fire({
            icon: 'error',
            title: 'Gagal',
            text: 'Gagal menghapus user.',
          });
        }
      }
    },
  },
};
</script>
