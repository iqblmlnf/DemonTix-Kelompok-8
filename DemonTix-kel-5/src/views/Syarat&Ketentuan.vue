<template>
  <div class="bg-light text-dark min-vh-100 d-flex flex-column">
    <main class="container py-5 flex-grow-1">
      <h2 class="fw-bold mb-5 text-center">Syarat dan Ketentuan</h2>

      <!-- Kotak Tabs -->
      <div class="tab-box bg-white shadow-sm rounded p-3 mb-4">
        <ul class="nav nav-pills justify-content-center flex-wrap" role="tablist">
          <li
            v-for="(section, index) in sections"
            :key="index"
            class="nav-item mx-2 my-1"
            role="presentation"
          >
            <button
              class="nav-link px-3"
              :class="{ active: activeSection === index }"
              @click="activeSection = index"
              type="button"
              role="tab"
            >
              {{ section.title }}
            </button>
          </li>
        </ul>
      </div>

      <!-- Kotak Konten -->
      <div class="content-box bg-white shadow-sm rounded p-4">
        <h5 class="fw-bold mb-4">{{ sections[activeSection].title }}</h5>
        <div v-html="sections[activeSection].content"></div>
      </div>
    </main>
  </div>
</template>

<script>
export default {
  name: 'SyaratKetentuan',
  data() {
    return {
      activeSection: 0,
      sections: [
        {
          title: 'Definisi & Interpretasi',
          content: `
            <ol>
              <li>Seluruh persetujuan “Konsumen”, “Kamu”, dan “Anda” menggantikan kamu...</li>
              <li>Menyetujui syarat dan ketentuan perusahaan “ARTATIX”...</li>
              <li>“Member”, “Event Creator”, “Panitia”, dan “Mereka” menggantikan klien kami...</li>
              <li>“Pembeli” berarti setiap individu dan/atau badan hukum...</li>
              <li>“Situs” berarti artatix.co.id...</li>
              <li>“Event” berarti sesuatu kegiatan yang bersifat komersial...</li>
              <li>“Artatix.com” berarti adalah layanan...</li>
              <li>“Biaya Jasa” berarti biaya jasa sebagai imbalan...</li>
            </ol>
          `
        },
        {
          title: 'Ketentuan Umum',
          content: `
            <ol>
              <li>Jika terjadi konflik atau inkonsistensi antara dua atau lebih ketentuan...</li>
              <li>Kesepakatan ini berlaku ketika kamu dan event creator menggunakan sistem kami...</li>
              <li>Selain ketentuan penggunaan ini dan tergantung pada layanan yang dipilih oleh kamu...</li>
              <li>ARTATIX akan mengumumkan setiap perubahan melalui Platform...</li>
              <li>Seluruh pemesanan tiket oleh pembeli pada cara yang dibuat oleh event manager...</li>
            </ol>
          `
        },
        {
          title: 'Cookies & Hak Cipta',
          content: `
            <p>Kami menggunakan penggunaan cookie untuk meningkatkan pengalaman pengguna.</p>
            <h6 class="fw-bold mt-4 text-danger">Hak Cipta</h6>
            <ol>
              <li>Event creator sebagai penyelenggara acara dilarang mengeksploitasi data pengguna...</li>
              <li>Pengguna dilarang untuk menyalin, modifikasi atau membuat karya turunan...</li>
              <li>Pengguna dilarang untuk menyalin, memodifikasi, atau mengirim e-Tiket...</li>
              <li>Event creator tidak diizinkan untuk meminta data lebih dari customer...</li>
              <li>Pengguna tidak diizinkan menggunakan phishing, robot, spider...</li>
            </ol>
          `
        },
        {
          title: 'Kebijakan Pengembalian Uang',
          content: `
            <p>Berikut adalah kebijakan pengembalian dana kami:</p>
            <ol>
              <li>Seluruh tiket pembeli yang telah dibeli tidak bias diuangkan kembali.</li>
              <li>Pengembalian dana hanya untuk pembeli yang memiliki kendala dalam proses pembayaran...</li>
              <li>Kami menghimbau kamu untuk tidak menjual tiketmu ke orang lain...</li>
              <li>Jika kamu ingin menjual tiketmu, sebaiknya mengkonfirmasikan terlebih dahulu...</li>
              <li>Kami dapat mengembalikan danamu jika ada bukti transaksi...</li>
              <li>Bukti transaksi dapat berupa struk transfer atau mutasi rekening.</li>
              <li>Setiap pengembalian dana yang disebabkan oleh Force Majeure...</li>
            </ol>
          `
        }
      ]
    }
  }
}
</script>

<style scoped>
.tab-box,
.content-box {
  max-width: 100%;
}

.nav-pills .nav-link {
  color: #333;
  background-color: #f8f9fa;
  font-weight: 500;
  border-radius: 0.375rem;
  transition: all 0.3s ease;
}

.nav-pills .nav-link.active {
  background-color: #A43434;
  color: white;
}

ol {
  padding-left: 1rem;
}

ol li {
  margin-bottom: 0.75rem;
  line-height: 1.6;
}

p {
  line-height: 1.6;
  margin-bottom: 1rem;
}

h5 {
  color: #A43434;
}

/* Responsif untuk tampilan mobile */
@media (max-width: 576px) {
  .nav-pills .nav-link {
    font-size: 0.9rem;
    padding: 0.5rem;
  }

  .tab-box {
    padding: 1rem;
  }

  .content-box {
    padding: 1rem;
  }

  h5 {
    font-size: 1.25rem;
  }

  .nav-pills {
    flex-direction: column;
    align-items: flex-start;
  }
}

/* Responsif untuk tampilan tablet */
@media (min-width: 576px) and (max-width: 768px) {
  .nav-pills .nav-link {
    font-size: 1rem;
    padding: 0.75rem;
  }

  .tab-box {
    padding: 1.5rem;
  }

  .content-box {
    padding: 1.5rem;
  }

  h5 {
    font-size: 1.5rem;
  }
}

/* Responsif untuk tampilan desktop */
@media (min-width: 992px) {
  .nav-pills .nav-link {
    font-size: 1rem;
    padding: 1rem;
  }

  .tab-box {
    padding: 2rem;
  }

  .content-box {
    padding: 2rem;
  }

  h5 {
    font-size: 1.75rem;
  }

  .nav-pills {
    justify-content: center;
  }
}
</style>