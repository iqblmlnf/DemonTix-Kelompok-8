<template>
  <div class="bg-white text-dark">
    <main class="container my-4">
      <!-- Header Filter -->
      <div class="header-filter mb-4 d-flex flex-wrap gap-2 align-items-center">
        <h1 class="title fs-3 mb-2 me-auto">Jelajah Event</h1>
        <select
          v-model="selectedCategory"
          class="form-select"
          aria-label="Pilih kategori acara"
        >
          <option value="">Kategori</option>
          <option>Musik</option>
          <option>Olahraga</option>
          <option>Wisata</option>
        </select>
        <select
          v-model="selectedTime"
          class="form-select"
          aria-label="Pilih waktu acara"
        >
          <option value="">Waktu</option>
          <option>Minggu Ini</option>
          <option>Bulan Ini</option>
        </select>
        <select
          v-model="selectedSort"
          class="form-select"
          aria-label="Pilih urutan acara"
        >
          <option value="">Urutkan</option>
          <option value="asc">Harga Terendah</option>
          <option value="desc">Harga Tertinggi</option>
        </select>
      </div>

      <!-- Event Cards -->
      <div class="row">
        <div
          v-for="event in paginatedEvents"
          :key="event.id"
          class="col-12 col-sm-6 col-md-4 col-lg-3 mb-3"
        >
          <EventCard :event="event" v-memo="[event.id]" />
        </div>
      </div>

      <!-- Pagination -->
      <nav
        v-if="pageCount > 1"
        class="pagination-nav mt-4 d-flex justify-content-center"
      >
        <ul class="pagination">
          <li class="page-item" :class="{ disabled: currentPage === 1 }">
            <button class="page-link" @click="changePage(currentPage - 1)">
              «
            </button>
          </li>
          <li
            v-for="page in pageCount"
            :key="page"
            class="page-item"
            :class="{ active: page === currentPage }"
          >
            <button class="page-link" @click="changePage(page)">
              {{ page }}
            </button>
          </li>
          <li
            class="page-item"
            :class="{ disabled: currentPage === pageCount }"
          >
            <button class="page-link" @click="changePage(currentPage + 1)">
              »
            </button>
          </li>
        </ul>
      </nav>
    </main>
  </div>
</template>

<script>
import EventCard from "@/components/EventCard.vue";
import axios from "axios";

export default {
  name: "Jelajah",
  components: { EventCard },
  data() {
    return {
      selectedCategory: "",
      selectedTime: "",
      selectedSort: "",
      events: [],
      currentPage: 1,
      itemsPerPage: 4,
    };
  },
  computed: {
    filteredEvents() {
      const now = new Date();
      let result = this.events;

      // Filter kategori (case insensitive)
      if (this.selectedCategory) {
        result = result.filter(
          (e) =>
            (e.category || "").toLowerCase() ===
            this.selectedCategory.toLowerCase()
        );
      }

      // Filter waktu
      if (this.selectedTime) {
        result = result.filter((e) => {
          const eventDate = new Date(e.date);
          if (this.selectedTime === "Minggu Ini") {
            const end = new Date();
            end.setDate(now.getDate() + 7);
            return eventDate >= now && eventDate <= end;
          } else if (this.selectedTime === "Bulan Ini") {
            return (
              eventDate.getMonth() === now.getMonth() &&
              eventDate.getFullYear() === now.getFullYear()
            );
          }
          return true;
        });
      }

      // Urutkan harga
      if (this.selectedSort === "asc") {
        result = [...result].sort(
          (a, b) => getMinPrice(a.tickets) - getMinPrice(b.tickets)
        );
      } else if (this.selectedSort === "desc") {
        result = [...result].sort(
          (a, b) => getMinPrice(b.tickets) - getMinPrice(a.tickets)
        );
      }

      return result;
    },
    paginatedEvents() {
      const start = (this.currentPage - 1) * this.itemsPerPage;
      return this.filteredEvents.slice(start, start + this.itemsPerPage);
    },
    pageCount() {
      return Math.ceil(this.filteredEvents.length / this.itemsPerPage);
    },
  },
  watch: {
    "$route.query.kategori"(newKategori) {
      this.selectedCategory = newKategori || "";
    },
    selectedCategory() {
      this.currentPage = 1;
    },
    selectedTime() {
      this.currentPage = 1;
    },
    selectedSort() {
      this.currentPage = 1;
    },
  },
  methods: {
    changePage(page) {
      if (page >= 1 && page <= this.pageCount) {
        this.currentPage = page;
        window.scrollTo({ top: 0, behavior: "smooth" });
      }
    },
    fetchEvents() {
      axios
        .get("http://127.0.0.1:8000/api/events")
        .then((res) => {
          if (Array.isArray(res.data)) {
            this.events = res.data;
          } else if (Array.isArray(res.data.data)) {
            this.events = res.data.data;
          } else {
            console.error("Format data dari API tidak sesuai:", res.data);
            this.events = [];
          }
        })
        .catch((err) => {
          console.error("Gagal memuat event:", err);
          this.events = [];
        });
    },
  },
  mounted() {
    this.fetchEvents();

    // Set kategori awal dari query
    const kategoriFromQuery = this.$route.query.kategori;
    if (kategoriFromQuery) {
      this.selectedCategory = kategoriFromQuery;
    }
  },
};

// Helper: ambil harga minimum dari tiket
function getMinPrice(tickets) {
  if (!Array.isArray(tickets)) return Infinity;
  const available = tickets.filter(
    (t) => t.stock > 0 && typeof t.harga === "number"
  );
  if (available.length === 0) return Infinity;
  return Math.min(...available.map((t) => t.harga));
}
</script>

<style scoped>
.form-select {
  width: auto;
  min-width: 140px;
  font-size: 0.9rem;
}

@media (max-width: 576px) {
  .d-flex {
    flex-direction: column;
  }
  .form-select {
    width: 100%;
    margin-bottom: 0.5rem;
  }
}

@media (min-width: 576px) {
  .form-select {
    min-width: 160px;
    margin-right: 1rem;
  }
}
</style>
