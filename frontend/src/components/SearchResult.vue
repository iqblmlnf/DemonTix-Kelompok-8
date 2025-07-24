<template>
  <div class="container my-5">
    <h3 class="mb-4 fw-bold">Hasil Pencarian: "{{ searchQuery }}"</h3>
    <div v-if="events.length" class="d-flex flex-wrap gap-3">
      <EventCard
        v-for="(event, index) in events"
        :key="index"
        :event="event"
        class="flex-grow-1"
        style="min-width: 250px; max-width: 250px;"
      />
    </div>
    <p v-else class="text-muted">Tidak ada event yang cocok.</p>
  </div>
</template>

<script>
import EventCard from './EventCard.vue';

export default {
  name: 'SearchResult',
  props: {
    searchQuery: String,
    events: Array
  },
  components: {
    EventCard
  }
};
</script>