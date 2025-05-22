<template>
  <div>
    <Navbar v-if="!isLoginPage" @search="handleSearch" @clear-search="clearResults" />

    <SearchResult v-if="searchQuery" :searchQuery="searchQuery" :events="filteredEvents" />
    <router-view v-else />
    
    <Footer v-if="!isLoginPage" />
  </div>
</template>

<script>
import Navbar from "@/components/Navbar.vue";
import Footer from "@/components/Footer.vue";
import SearchResult from "@/components/SearchResult.vue";
import { allEvents } from "@/data/events.js";

export default {
  name: "App",
  components: {
    Navbar,
    Footer,
    SearchResult
  },
  data() {
    return {
      searchQuery: "",
      events: allEvents
    };
  },
  computed: {
  filteredEvents() {
    if (!this.searchQuery) return [];
    return this.events.filter(event =>
      event.title.toLowerCase().includes(this.searchQuery.toLowerCase())
    );
  },
  isLoginPage() {
    return this.$route.path === "/login";
  }
},
  methods: {
    handleSearch(query) {
      this.searchQuery = query;
    },
    clearResults() {
      this.searchQuery = "";
    }
  }
};
</script>