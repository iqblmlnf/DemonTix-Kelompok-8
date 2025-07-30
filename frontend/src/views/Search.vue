<template>
  <div class="container my-5">
    <h3 class="mb-4 fw-bold">Hasil Pencarian: "{{ query }}"</h3>

    <div
      v-if="filteredEvents.length"
      class="d-flex flex-wrap gap-3 justify-content-start"
    >
      <EventCard
        v-for="(event, index) in filteredEvents"
        :key="index"
        :event="event"
        class="flex-grow-1"
        style="min-width: 250px; max-width: 250px"
      />
    </div>

    <p v-else class="text-muted">Tidak ada event yang cocok.</p>
  </div>
</template>

<script>
import EventCard from "@/components/EventCard.vue";

export default {
  name: "Search",
  props: {
    query: String,
  },
  data() {
    return {
      events: [],
    };
  },
  computed: {
    filteredEvents() {
      return this.events.filter((event) =>
        event.title.toLowerCase().includes(this.query.toLowerCase())
      );
    },
  },
  mounted() {
    fetch("http://localhost:8000/api/events")
      .then((res) => res.json())
      .then((data) => {
        this.events = data.map((event) => ({
          ...event,
        }));
      });
  },
  components: {
    EventCard,
  },
};
</script>
