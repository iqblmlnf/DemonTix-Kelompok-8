<template>
  <header class="text-white py-3 shadow-sm">
    <div class="container-fluid px-4">
      <div class="row align-items-center">
        <!-- Logo -->
        <div class="col-4 col-md-3 d-flex align-items-center">
          <router-link
            to="/"
            class="d-flex align-items-center gap-2 text-white text-decoration-none"
            aria-label="Kembali ke halaman utama DemonTix"
          >
            <img
              src="@/assets/images/logo.png"
              alt="Logo DemonTix"
              height="36"
            />
            <span class="fw-bold h5 mb-0 d-none d-md-inline">DemonTix</span>
          </router-link>
        </div>

        <!-- Nav -->
        <nav
          class="col-4 d-none d-md-flex justify-content-center"
          role="navigation"
          aria-label="Menu utama"
        >
          <ul class="nav gap-3">
            <li class="nav-item">
              <router-link
                :to="{ name: 'Home' }"
                aria-label="Beranda kami"
                class="nav-link text-white fw-semibold px-2 hover-underline"
              >
                Home
              </router-link>
            </li>
            <li class="nav-item">
              <router-link
                to="/jelajah"
                aria-label="Jelajahi event atau kategori"
                class="nav-link text-white fw-semibold px-2 hover-underline"
              >
                Jelajah
              </router-link>
            </li>
            <li class="nav-item">
              <router-link
                to="/team-project"
                aria-label="Tim proyek kami"
                class="nav-link text-white fw-semibold px-2 hover-underline"
              >
                Team Project
              </router-link>
            </li>
            <li class="nav-item">
              <router-link
                to="/hubungi-kami"
                aria-label="Hubungi kami untuk informasi lebih lanjut"
                class="nav-link text-white fw-semibold px-2 hover-underline"
              >
                Hubungi Kami
              </router-link>
            </li>
          </ul>
        </nav>

        <!-- Search -->
        <div
          class="col-8 col-md-5 d-flex justify-content-end align-items-center gap-2"
        >
          <input
            type="text"
            v-model="searchTerm"
            @keyup.enter="emitSearch"
            placeholder="Cari event..."
            class="form-control form-control-sm rounded-pill w-50"
            aria-label="Cari event"
            id="search-input"
          />
          <router-link
            to="/login"
            class="btn btn-light btn-sm rounded-pill fw-semibold px-3"
            aria-label="Masuk ke akun Anda"
          >
            Login
          </router-link>
        </div>
      </div>
    </div>
  </header>
</template>

<script>
export default {
  name: "Navbar",
  data() {
    return {
      searchTerm: "",
    };
  },
  watch: {
    searchTerm(newVal) {
      if (newVal.trim() === "") {
        this.$emit("clear-search");
      }
    },
  },
  methods: {
    emitSearch() {
      const trimmed = this.searchTerm.trim();
      if (trimmed !== "") {
        this.$emit("search", trimmed);
      } else {
        this.$emit("clear-search");
      }
    },
  },
};
</script>

<style scoped>
.hover-underline:hover {
  text-decoration: underline;
}

header {
  background-color: #a43434;
}

button:focus,
input:focus {
  outline: 3px solid #f0ad4e; /* Fokus dengan border oranye */
}
</style>
