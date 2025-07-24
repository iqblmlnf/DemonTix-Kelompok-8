<template>
  <footer class="text-white py-4 mt-6" role="contentinfo">
    <div class="container-fluid px-4">
      <div class="row gy-4">
        <!-- Logo dan Deskripsi -->
        <div class="col-lg-5">
          <div class="d-flex align-items-center gap-2 mb-3">
            <img src="@/assets/images/logo.png" alt="Logo DemonTix, platform penjualan tiket terpercaya" height="32" />
            <p class="judul m-0 fw-bold">DemonTix</p>
          </div>
          <p class="text-white-50 mb-3" style="max-width: 400px;">
            DemonTix merupakan salah satu platform penjualan tiket terpercaya di Indonesia,
            menjamin keaslian dan keamanan setiap transaksi.
          </p>
          <div class="d-flex gap-3 fs-5">
              <a
                href="https://www.instagram.com/rzalnggr_"
                target="_blank"
                class="text-white-50 hover-white"
                aria-label="Instagram"
              >
                <i class="bi bi-instagram"></i>
              </a>
              <a
                href="https://www.facebook.com/rizal.anggoro.7731"
                target="_blank"
                class="text-white-50 hover-white"
                aria-label="Facebook"
              >
                <i class="bi bi-facebook"></i>
              </a>
              <a
                href="https://twitter.com/rizal_anggoro"
                target="_blank"
                class="text-white-50 hover-white"
                aria-label="Twitter"
              >
                <i class="bi bi-twitter"></i>
              </a>
              <a
                href="https://www.tiktok.com/@rzalnggr_"
                target="_blank"
                class="text-white-50 hover-white"
                aria-label="TikTok"
              >
                <i class="bi bi-tiktok"></i>
              </a>
          </div>
        </div>

        <!-- Kategori -->
        <div class="col-6 col-md-3 col-lg-2" aria-labelledby="kategori-heading">
          <h6 class="fw-semibold mb-3">Kategori</h6>
          <ul class="list-unstyled text-white-50 small">
            <li class="mb-2"><router-link to="/jelajah" class="text-decoration-none text-white-50 hover-white">
                Musik
              </router-link></li>
            <li class="mb-2"><router-link to="/jelajah" class="text-decoration-none text-white-50 hover-white">
                Olahraga
              </router-link></li>
            <li><router-link to="/jelajah" class="text-decoration-none text-white-50 hover-white">
                wisata
              </router-link></li>
          </ul>
        </div>

        <!-- Info -->
        <div class="col-6 col-md-4 col-lg-3" aria-labelledby="info-heading">
          <h6 class="fw-semibold mb-3">DemonTix</h6>
          <ul class="list-unstyled text-white-50 small">
            <li class="mb-2">
              <router-link to="/hubungi-kami" aria-label="Tentang DemonTix" class="text-decoration-none text-white-50 hover-white">
                Tentang Kami
              </router-link>
            </li>
            <li class="mb-2">
              <router-link to="/syarat-ketentuan" aria-label="Syarat dan Ketentuan DemonTix" class="text-decoration-none text-white-50 hover-white">
                Syarat & Ketentuan
              </router-link>
            </li>
            <li class="mb-2">
              <router-link to="/faq" aria-label="FAQ DemonTix" class="text-decoration-none text-white-50 hover-white">
                FAQ
              </router-link>
            </li>
          </ul>

        </div>
      </div>

      <!-- Copyright -->
      <div class="text-center text-white-50 small mt-5 pt-4 border-top border-white-25" aria-label="Hak Cipta DemonTix">
        © 2025 UNIVERSITAS AMIKOM YOGYAKARTA
      </div>
    </div>
  </footer>
</template>

<script>
export default {
  name: "Footer",
};
</script>

<style scoped>
footer {
  background: linear-gradient(135deg, #A43434, #3E1414);
}

.judul {
  font-size: 150%;
}

.hover-white:hover {
  color: white !important;
}

.border-white-25 {
  border-color: rgba(255, 255, 255, 0.25) !important;
}
</style>