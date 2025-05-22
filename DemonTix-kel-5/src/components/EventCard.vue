<template>
<router-link
  :to="'/Detail/' + event.id"
  class="card event-card text-decoration-none text-dark"
  :aria-label="'Lihat detail untuk event ' + event.title"
>
     <img
    loading="lazy"
    decoding="async"
    :src="event.image"
    :alt="'Poster event ' + event.title"
    class="card-img-top rounded-top-3 event-image"
    width="224"
    height="112"
  />

    <div class="card-body d-flex flex-column event-body">
      <div class="fw-semibold small mb-1 lh-sm event-title">
        {{ event.title }}
      </div>

      <div class="text-muted small mb-1">
        <div>{{ event.date }}</div>
        <div>{{ event.location }}</div>
      </div>

      <p class="text-danger fw-semibold mb-2 mt-auto small">
         Rp {{ getMinAvailablePrice(event.price) }}
      </p>

      <div
        class="btn btn-sm text-white fw-semibold rounded-2 w-100 beli-tiket-btn text-center"
        :class="{ 'hovered': hover }"
        @mouseover="hover = true"
        @mouseleave="hover = false"
      >
        Beli Tiket
      </div>
    </div>
  </router-link>
</template>

<script setup>
import { ref } from 'vue'

const props = defineProps({
  event: Object
})

const hover = ref(false)

const getMinAvailablePrice = (prices) => {
  if (!Array.isArray(prices)) return '-'
  const available = prices.filter(p => p.stock > 0)
  if (available.length === 0) return 'Sold Out'
  const minHarga = Math.min(...available.map(p => p.harga))
  return minHarga.toLocaleString('id-ID')
}
</script>

<style scoped>
.event-card {
  width: 14rem;
  min-width: 14rem;
  height: 100%;
  box-shadow: var(--bs-box-shadow-sm);
  border: none;
  border-radius: 0.75rem; /* rounded-3 */
}

.event-image {
  height: 7rem;
  object-fit: cover;
}

.event-body {
  height: 10rem;
  padding-left: 0.75rem;  /* px-3 */
  padding-right: 0.75rem;
  padding-top: 0.5rem;    /* py-2 */
  padding-bottom: 0.5rem;
  position: relative;
}

.event-title {
  font-size: 0.875rem;
}

.beli-tiket-btn {
  background-color: #922323;
  transition: background-color 0.3s ease;
}

.beli-tiket-btn.hovered {
  background-color: #7a1d1d;
}
</style>