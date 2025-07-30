<template>
  <header class="text-white py-3 shadow-sm">
    <div class="container-fluid px-4">
      <div class="row align-items-center">
        <!-- Logo -->
        <div class="col-6 col-md-3 d-flex align-items-center">
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

        <!-- Burger Button -->
        <div class="col-6 d-md-none text-end">
          <button
            @click="toggleMenu"
            class="btn btn-outline-light btn-sm"
            aria-label="Toggle menu navigasi"
          >
            ☰
          </button>
        </div>

        <!-- Nav Desktop -->
        <nav
          class="col-12 col-md-5 mt-3 mt-md-0 d-none d-md-flex justify-content-center"
          role="navigation"
          aria-label="Menu utama"
        >
          <ul class="nav gap-3">
            <li class="nav-item" v-for="item in menu" :key="item.label">
              <router-link
                :to="item.to"
                :aria-label="item.label"
                class="nav-link text-white fw-semibold px-2 hover-underline"
              >
                {{ item.label }}
              </router-link>
            </li>
          </ul>
        </nav>

        <!-- Search + Auth (Desktop) -->
        <div class="col-md-4 d-none d-md-flex justify-content-end align-items-center gap-2">
          <input
            type="text"
            v-model="searchTerm"
            @keyup.enter="emitSearch"
            placeholder="Cari event..."
            class="form-control form-control-sm rounded-pill w-50"
            aria-label="Cari event"
          />
          <div v-if="user" class="d-flex align-items-center gap-2">
            <span class="text-white fw-semibold">{{ user.name }}</span>
            <button
              @click="logout"
              class="btn btn-outline-light btn-sm rounded-pill fw-semibold"
            >
              Logout
            </button>
          </div>
          <router-link
            v-else
            to="/login"
            class="btn btn-light btn-sm rounded-pill fw-semibold px-3"
            aria-label="Masuk ke akun Anda"
          >
            Login
          </router-link>
        </div>
      </div>

      <!-- Mobile Menu -->
      <div v-if="menuOpen" class="d-md-none mt-3">
        <ul class="nav flex-column gap-2">
          <li v-for="item in menu" :key="item.label" class="nav-item">
            <router-link
              :to="item.to"
              class="nav-link text-white fw-semibold"
              @click="toggleMenu"
            >
              {{ item.label }}
            </router-link>
          </li>
        </ul>
        <div class="mt-3">
          <input
            type="text"
            v-model="searchTerm"
            @keyup.enter="emitSearch"
            placeholder="Cari event..."
            class="form-control form-control-sm rounded-pill"
            aria-label="Cari event"
          />
          <div v-if="user" class="d-flex align-items-center justify-content-between mt-2">
            <span class="text-white fw-semibold">{{ user.name }}</span>
            <button
              @click="logout"
              class="btn btn-outline-light btn-sm rounded-pill fw-semibold"
            >
              Logout
            </button>
          </div>
          <router-link
            v-else
            to="/login"
            class="btn btn-light btn-sm rounded-pill fw-semibold mt-2"
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
      user: null,
      menuOpen: false,
      menu: [
        { label: "Home", to: { name: "Home" } },
        { label: "Jelajah", to: "/jelajah" },
        { label: "Team Project", to: "/team-project" },
        { label: "Hubungi Kami", to: "/hubungi-kami" },
      ],
    };
  },
  created() {
    const savedUser = localStorage.getItem("user");
    if (savedUser) {
      this.user = JSON.parse(savedUser);
    }
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
        this.$router.push({ name: "Search", query: { q: trimmed } });
        this.menuOpen = false;
      }
    },
    logout() {
      localStorage.removeItem("user");
      this.user = null;
      this.$router.push("/login");
      this.menuOpen = false;
    },
    toggleMenu() {
      this.menuOpen = !this.menuOpen;
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
  outline: 3px solid #f0ad4e;
}
</style>
