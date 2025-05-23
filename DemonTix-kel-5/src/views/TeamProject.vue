<template>
  <div class="bg-white text-dark min-vh-100 d-flex flex-column">
    <main class="container py-5 flex-grow-1">
      <h2 class="fw-bold text-center mb-5">Tim Project DemonTix</h2>

      <div class="row justify-content-center g-4">
        <div
          v-for="member in teamMembers"
          :key="member.nim"
          class="col-6 col-md-3 d-flex flex-column align-items-center"
        >
          <div class="profile-img mb-2">
            <img
              :src="member.image || 'https://via.placeholder.com/150'"
              alt="Profile"
            />
          </div>
          <p class="fw-bold text-center mb-1">{{ member.name }}</p>
          <p class="text-secondary small mb-0 text-center">{{ member.nim }}</p>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import imgRofik from '@/assets/images/Rofik.webp'
import imgIqbal from '@/assets/images/Iqbal.webp'
import imgRizal from '@/assets/images/Rizal.webp'
import imgAndre from '@/assets/images/Andre.webp'
import imgTegar from '@/assets/images/Tegar.webp'
import imgLingga from '@/assets/images/Lingga.webp'
import imgFata from '@/assets/images/Fata.webp'

export default {
  name: 'TeamProject',
  data() {
    return {
      teamMembers: [
        { name: 'Ahmad Nur Rofik', nim: '23.11.5475', image: imgRofik },
        { name: 'Iqbal Maulana Fajar', nim: '23.11.5467', image: imgIqbal },
        { name: 'Rizal Anggoro', nim: '23.11.5498', image: imgRizal },
        { name: 'Andre Aditia', nim: '23.11.5756', image: imgAndre },
        { name: 'Muhamad Dwi Tegar Saputra', nim: '23.11.5458', image: imgTegar },
        { name: 'Lingga Firmansyah', nim: '23.11.5447', image: imgLingga },
        { name: 'Fata Salma Putra Pureka', nim: '23.11.5470', image: imgFata },
      ]
    }
  }
}
</script>

<style scoped>
.profile-img {
  width: 180px;
  height: 180px;
  border-radius: 50%;
  overflow: hidden;
  border: 4px solid #A43434; 
  transition: transform 0.3s ease;
}
.profile-img img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
.profile-img:hover {
  transform: scale(1.05);
}
</style>
