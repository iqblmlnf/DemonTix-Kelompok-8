<template>
  <div class="card event-card text-dark">
    <router-link
      :to="`/Detail/${event.id}`"
      class="text-decoration-none"
      aria-label="'Lihat detail untuk event ' + event.title"
    >
      <img
        :src="getImageUrl(event.image)"
        class="card-img-top rounded-top-3 event-image"
      />
    </router-link>

    <div class="card-body d-flex flex-column event-body">
      <!-- Judul satu baris -->
      <div class="mb-1 lh-sm event-title text-truncate" :title="event.title">
        <strong>{{ event.title }}</strong>
      </div>

      <!-- Tanggal dan lokasi -->
      <div class="text-muted small mb-1">
        <div>
          <i class="bi bi-calendar-range mx-2 text-danger"></i>{{ formatDate(event.date) }}
        </div>
        <div class="lokasi-text" :title="event.location">
          <i class="bi bi-geo-alt-fill mx-2 text-danger"></i>{{ event.location }}
        </div>
      </div>

      <!-- Harga tiket -->
      <p class="text-danger mb-2 mt-auto text-end">
        <strong>
          Rp {{ getLowestTicketPrice(event.tickets) }}
        </strong>
      </p>

      <!-- Tombol Beli Tiket -->
      <router-link
        v-if="!isExpired"
        :to="`/Detail/${event.id}`"
        class="btn btn-sm text-white fw-semibold rounded-2 w-100 beli-tiket-btn text-center"
        :class="{ hovered: hover }"
        @mouseover="hover = true"
        @mouseleave="hover = false"
      >
        Beli Tiket
      </router-link>

      <!-- Tombol Nonaktif jika event lewat -->
      <button
        v-else
        class="btn btn-sm text-white fw-semibold rounded-2 w-100 expired-btn text-center"
        disabled
      >
        Event Selesai
      </button>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from "vue";

const props = defineProps({ event: Object });

const hover = ref(false);

// Mengecek apakah tanggal event sudah lewat
const isExpired = computed(() => {
  const eventDate = new Date(props.event.date);
  const today = new Date();
  eventDate.setHours(0, 0, 0, 0);
  today.setHours(0, 0, 0, 0);
  return eventDate < today;
});

const getLowestTicketPrice = (tickets) => {
  if (!tickets || tickets.length === 0) return "-";

  const prices = tickets.map((t) => parseInt(t.harga));
  const minPrice = Math.min(...prices);

  return minPrice.toLocaleString("id-ID");
};

const getImageUrl = (image) => {
  if (!image) return "";
  return image.startsWith("http")
    ? image
    : `http://127.0.0.1:8000/storage/${image}`;
};

const formatDate = (dateStr) => {
  const options = { day: "numeric", month: "long", year: "numeric" };
  return new Date(dateStr).toLocaleDateString("id-ID", options);
};
</script>

<style scoped>
.event-card {
  height: 100%;
  box-shadow: var(--bs-box-shadow-sm);
  border: none;
  border-radius: 0.75rem;
  min-width: 277px;
  max-width: 277px;
}

.event-image {
  height: 7rem;
  object-fit: cover;
}

.event-body {
  height: 10rem;
  padding: 0.5rem 0.75rem;
  position: relative;
}

/* Judul dan lokasi satu baris */
.event-title {
  font-size: 17px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.lokasi-text {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  display: block;
  height: 1.25em;
}

/* Tombol aktif */
.beli-tiket-btn {
  background-color: #922323;
  transition: background-color 0.3s ease;
}

.beli-tiket-btn.hovered {
  background-color: #7a1d1d;
}

/* Tombol nonaktif */
.expired-btn {
  background-color: #6c757d !important; /* abu-abu */
  cursor: not-allowed;
}
</style>
