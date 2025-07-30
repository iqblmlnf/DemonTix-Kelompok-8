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

    <!-- Event Terlaris -->
    <Marquee :events="topEvents" aria-live="polite" />

    <!-- Event Terdekat -->
    <section class="event-terdekat-section my-4" role="region" aria-labelledby="event-terdekat-heading">
      <div class="container-fluid my-4">
        <div class="d-flex justify-content-between align-items-center mb-3 border-bottom pb-2">
          <h2 id="event-terdekat-heading" class="fs-5 fw-bold m-0">
            Event Terdekat
          </h2>
        </div>
        <div class="d-flex flex-wrap gap-4">
          <EventCard
            v-for="event in visibleEvents"
            :key="event.id"
            :event="event"
            class="flex-grow-1"
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
import { ref, onMounted } from "vue";
import Carousel from "@/components/Carousel.vue";
import EventCard from "@/components/EventCard.vue";
import Marquee from "@/components/Marquee.vue";

const visibleCount = ref(5);
const visibleEvents = ref([]);
const recommendedEvents = ref([]);
const topEvents = ref([]);
const allEvents = ref([]);

const loadMoreEvents = () => {
  visibleCount.value = Math.min(visibleCount.value + 4, allEvents.value.length);

  // Filter ulang untuk event dalam 14 hari ke depan
  const now = new Date();
  const twoWeeksLater = new Date();
  twoWeeksLater.setDate(now.getDate() + 14);

  const upcomingEvents = allEvents.value.filter(event => {
    const eventDate = new Date(event.date);
    return eventDate >= now && eventDate <= twoWeeksLater;
  });

  visibleEvents.value = upcomingEvents.slice(0, visibleCount.value);
};

onMounted(async () => {
  try {
    const response = await fetch("http://127.0.0.1:8000/api/events");
    const data = await response.json();

    console.log("✅ DATA YANG DITERIMA:", data);
    allEvents.value = data;

    // Filter event yang akan berlangsung dalam 14 hari ke depan
    const now = new Date();
    const twoWeeksLater = new Date();
    twoWeeksLater.setDate(now.getDate() + 14);

    const upcomingEvents = data.filter(event => {
      const eventDate = new Date(event.date);
      return eventDate >= now && eventDate <= twoWeeksLater;
    });

    visibleEvents.value = upcomingEvents.slice(0, visibleCount.value);
    recommendedEvents.value = data.slice(0, 8);
    topEvents.value = [...data]
      .sort((a, b) => new Date(a.date) - new Date(b.date))
      .slice(0, 8);
  } catch (error) {
    console.error("Gagal memuat data event:", error);
  }
});
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
  background-color: #a43434;
  color: white;
  transition: background-color 0.3s ease;
  padding: 12px 20px;
  min-width: 44px;
  min-height: 44px;
}
.btn:hover {
  background-color: #902e2e;
}
.btn:active {
  background-color: #7a2626;
}
</style>
