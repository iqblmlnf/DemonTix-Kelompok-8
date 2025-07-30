<template>
  <div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" data-widget="pushmenu" href="#" role="button">
            <i class="fas fa-bars"></i>
          </a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
          <a href="#" class="nav-link">Dashboard</a>
        </li>
      </ul>
    </nav>

    <!-- Sidebar -->
    <aside
      class="main-sidebar sidebar-dark-primary elevation-4 d-flex flex-column"
    >
      <a href="#" class="brand-link">
        <span class="brand-text font-weight-light ms-2">DemonTix Admin</span>
      </a>

      <!-- Sidebar content -->
      <div class="flex-grow-1 d-flex flex-column justify-content-between">
        <nav class="mt-2">
          <ul
            class="nav nav-pills nav-sidebar flex-column"
            data-widget="treeview"
            role="menu"
          >
            <li class="nav-item">
              <router-link to="/admin" class="nav-link">
                <i class="nav-icon fas fa-tachometer-alt"></i>
                <p>Dashboard</p>
              </router-link>
            </li>
            <li class="nav-item">
              <router-link to="/admin/users" class="nav-link">
                <i class="nav-icon fas fa-users"></i>
                <p>User Management</p>
              </router-link>
            </li>
            <li class="nav-item">
              <router-link to="/admin/events" class="nav-link">
                <i class="nav-icon fas fa-calendar-alt"></i>
                <p>Event Management</p>
              </router-link>
            </li>
            <li class="nav-item">
              <router-link to="/admin/tiket" class="nav-link">
                <i class="fa-solid fa-ticket-alt"></i>
                Manajemen Tiket</router-link
              >
            </li>
            <li class="nav-item">
              <router-link to="/admin/pemesanan" class="nav-link">
                <i class="nav-icon fas fa-receipt"></i>
                <p>Pemesanan Masuk</p>
              </router-link>
            </li>
            <li class="nav-item">
              <router-link to="/admin/contact" class="nav-link">
                <i class="fa-solid fa-message"></i> Pesan Hubungi Kami
              </router-link>
            </li>
          </ul>
        </nav>

        <!-- Logout Button at bottom -->
        <div class="p-3 mt-auto">
          <button class="btn btn-danger btn-block" @click="logout">
            <i class="fas fa-sign-out-alt me-2"></i> Logout
          </button>
        </div>
      </div>
    </aside>

    <!-- Content Wrapper -->
    <div class="content-wrapper">
      <section class="content pt-3 px-3">
        <router-view />
      </section>
    </div>

    <!-- Footer -->
    <footer class="main-footer">
      <div class="float-right d-none d-sm-block"><b>Version</b> 1.0</div>
      <strong>&copy; 2025 <a href="#">DemonTix</a>.</strong> All rights
      reserved.
    </footer>
  </div>
</template>

<script>
export default {
  name: "AdminDashboard",
  methods: {
    logout() {
      localStorage.removeItem("user");
      localStorage.removeItem("role");
      this.$router.push("/login");
    },
  },
};
</script>

<style>
@import "https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css";
@import "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css";

.main-sidebar {
  height: 100vh;
}
</style>
