<template>
  <section class="text-white px-4 px-md-6 py-10 marquee-section">
    <div class="container-fluid h-100">
      <div class="d-flex flex-column flex-md-row align-items-center justify-content-between h-100 gap-4">
        <!-- Kiri: Teks -->
        <div class="text-center text-md-start w-0 w-md-25">
          <h2 class="fs-4 fw-bold mb-2">Terlaris!</h2>
          <p class="small">
            Kumpulan event-event terlaris di DemonTix yang mungkin kamu sukai.
          </p>
        </div>

        <!-- Kanan: Marquee -->
        <div class="w-100 w-md-75 marquee-wrapper">
          <div class="marquee-content">
            <EventCard
              v-for="(event, index) in events"
              :key="index"
              :event="event"
              class="marquee-card flex-shrink-0"
            />
          </div>
        </div>

      </div>
    </div>
  </section>
</template>

<script setup>
import EventCard from '@/components/EventCard.vue'

defineProps({
  events: Array
})
</script>

<style scoped>
.marquee-section {
  background-color: #A43434;
  min-height: 300px;
  display: flex;
  align-items: center;
}

.marquee-wrapper {
  overflow: hidden;
  width: 100%;
  position: relative;
}

.marquee-content {
  display: flex;
  gap: 1rem;
  width: max-content;
  animation: marquee 20s linear infinite;
}

.marquee-card {
  width: 11rem;
  min-width: 11rem;
}

.marquee-card img {
  height: 6rem;
  object-fit: cover;
  border-top-left-radius: 0.375rem;
  border-top-right-radius: 0.375rem;
}

.marquee-card-body {
  height: 9rem;
}

.buy-btn {
  position: absolute;
  bottom: 0.5rem;
  left: 0.5rem;
  background-color: #A43434;
}

@media (max-width: 768px) {
  .marquee-section {
    text-align: center;
    padding-top: 2rem;
    padding-bottom: 2rem;
  }

  .marquee-card {
    width: 10rem;
    min-width: 10rem;
  }

  .marquee-card-body {
    height: auto;
    padding-bottom: 2.5rem; 
  }

  .buy-btn {
    position: static;
    display: block;
    margin-top: 0.5rem;
    width: 100%;
  }
}

@keyframes marquee {
  0% {
    transform: translateX(100%);
  }
  100% {
    transform: translateX(-100%);
  }
}
</style>
