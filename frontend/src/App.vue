<template>
  <div>
    <Navbar
      v-if="!isMinimalPage"
    />
    <router-view />
    <Footer v-if="!isMinimalPage" />
  </div>
</template>

<script>
import Navbar from "@/components/Navbar.vue";
import Footer from "@/components/Footer.vue";

export default {
  name: "App",
  components: {
    Navbar,
    Footer,
  },
  computed: {
    isMinimalPage() {
      const path = this.$route.path;
      return path === "/login" || path.startsWith("/admin");
    },
  },
};
</script>

