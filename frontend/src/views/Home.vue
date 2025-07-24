<template> 
  <div class="bg-white text-dark font-sans">
    <Carousel />

    <!-- Rekomendasi Event -->
    <section class="container-fluid my-4">
      <div class="d-flex justify-content-between align-items-center mb-3 border-bottom pb-2">
        <h2 class="fs-5 fw-bold m-0">Rekomendasi Event</h2>
      </div>
      <div class="d-flex overflow-auto gap-4 pb-2">
        <EventCard
          v-for="event in recommendedEvents"
          :key="event.id"
          :event="event"
        />
      </div>
    </section>

    <!-- Event Terlaris (Marquee Style) -->
    <Marquee :events="topEvents" aria-live="polite" />

    <!-- Event Terdekat -->
    <section class="event-terdekat-section my-4" role="region" aria-labelledby="event-terdekat-heading">
  <div class="container-fluid my-4">
    <div class="d-flex justify-content-between align-items-center mb-3 border-bottom pb-2">
      <h2 id="event-terdekat-heading" class="fs-5 fw-bold m-0">Event Terdekat</h2>
    </div>
    <div class="d-flex flex-wrap gap-4">
      <EventCard
        v-for="event in visibleEvents"
        :key="event.id"
        :event="event"
        class="flex-grow-1"
        style="min-width: 277px; max-width: 277px;"
      />
    </div>
    <div class="text-center mt-4">
      <button
        class="btn px-4 py-2 rounded-3 shadow-sm fw-semibold text-white"
        @click="loadMoreEvents"
        aria-label="Tampilkan lebih banyak event"
      >
        Lihat Lainnya
      </button>
    </div>
  </div>
</section>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import Carousel from '@/components/Carousel.vue'
import EventCard from '@/components/EventCard.vue'
import Marquee from '@/components/Marquee.vue'
import { allEvents } from '@/data/events.js'

const visibleCount = ref(5)
const visibleEvents = ref([])
const recommendedEvents = ref([])
const topEvents = ref([])

const loadMoreEvents = () => {
  visibleCount.value = Math.min(visibleCount.value + 4, allEvents.length)
  visibleEvents.value = allEvents.slice(0, visibleCount.value)
}

onMounted(() => {
  visibleEvents.value = allEvents.slice(0, visibleCount.value)
  recommendedEvents.value = allEvents.slice(0, 8)
  topEvents.value = [...allEvents].sort((a, b) => b.price - a.price).slice(0, 8)
})
</script>

<style scoped>
.d-flex.overflow-auto::-webkit-scrollbar {
  height: 8px;
}
.d-flex.overflow-auto::-webkit-scrollbar-thumb {
  background-color: #ccc;
  border-radius: 4px;
}
.d-flex.overflow-auto::-webkit-scrollbar-track {
  background-color: #f8f9fa;
}
.event-terdekat-section {
  width: 100%;
  padding-left: 0;
  padding-right: 0;
}
.event-terdekat-section .container-inner {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
}
.btn {
  background-color: #A43434;
  color: white; 
  transition: background-color 0.3s ease;
  padding: 12px 20px;
  min-width: 44px;
  min-height: 44px;
}


.btn:hover {
  background-color: #902E2E;
}

.btn:active {
  background-color: #7A2626; 
}
</style>
