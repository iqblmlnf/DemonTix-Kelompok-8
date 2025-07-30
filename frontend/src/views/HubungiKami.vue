<template>
  <div class="bg-white text-dark">
    <main class="container py-5">
      <div class="row g-5 align-items-start">
        <!-- Kontak Info -->
        <div class="col-lg-5 col-12">
          <h1 class="fw-bold mb-5 fs-2">Hubungi Kami</h1>

          <div class="d-flex gap-3 mb-4">
            <!-- Alamat -->
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 16 16">
              <path d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5H6v-4h4v4h2.5a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-11A1.5 1.5 0 0 1 2 13.5z"/>
              <path d="M7.293 1.5a1 1 0 0 1 1.414 0l6 6-1.414 1.414L8 3.414 2.707 8.914 1.293 7.5l6-6z"/>
            </svg>
            <div>
              <a
                href="https://www.google.com/maps/place/KONTRAKAN+DEMON/@-7.7405308,110.4272647,17z"
                class="fw-bold text-dark text-decoration-none"
                target="_blank"
                rel="noopener"
              >
                DemonTix Office
              </a>
              <p class="mb-0 small text-muted">
                Jl. Niten No.64, RW 9 Kenayan,<br />
                Wedomartani, Ngemplak, Sleman,<br />
                Yogyakarta 55581
              </p>
            </div>
          </div>

          <!-- WhatsApp -->
          <div class="d-flex gap-3 mb-4">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 16 16">
              <path d="M3.654 1.328a.678.678 0 0 1 .737-.061l2.261 1.13a.678.678 0 0 1 .293.293l1.13 2.26a.678.678 0 0 1-.061.738l-1.512 1.51a11.55 11.55 0 0 0 4.516 4.516l1.51-1.511a.678.678 0 0 1 .738-.061l2.26 1.13a.678.678 0 0 1 .293.293l1.13 2.261a.678.678 0 0 1-.061.737l-1.147 1.147c-.252.252-.607.339-.923.258-4.774-1.233-8.724-5.183-9.957-9.957a.678.678 0 0 1 .258-.923l1.147-1.147z"/>
            </svg>
            <div>
              <a
                href="https://api.whatsapp.com/send/?phone=6281228356763"
                class="fw-bold text-dark text-decoration-none"
                target="_blank"
                rel="noopener"
              >
                +62 812 2835 6763
              </a>
              <p class="mb-0 small text-muted">Senin - Jumat, 08.00 - 16.00</p>
            </div>
          </div>

          <!-- Email -->
          <div class="d-flex gap-3">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" viewBox="0 0 16 16">
              <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm13.5 0h-11L8 8.059 13.5 4zM1 4.803v6.394l4.769-3.197L1 4.803zM6.361 8.83l-5.25 3.52A1 1 0 0 0 2 14h12a1 1 0 0 0 .889-.65l-5.25-3.52L8 9.941l-1.639-1.11zM10.231 8l4.769 3.197V4.803L10.231 8z"/>
            </svg>
            <div>
              <a
                href="mailto:anggororizal09@gmail.com"
                class="fw-bold text-dark text-decoration-none"
              >
                anggororizal09@gmail.com
              </a>
              <p class="mb-0 small text-muted">Kirimkan pertanyaan kapan saja!</p>
            </div>
          </div>
        </div>

        <!-- Form Kontak -->
        <div class="col-lg-7 col-12">
          <div class="p-4 p-md-5 border rounded-4 shadow-sm bg-light">
            <h5 class="fw-bold mb-4">Kirim Pesan</h5>
            <form class="row g-3" @submit.prevent="kirimPesan">
              <div class="col-12">
                <input type="text" class="form-control rounded-3" placeholder="Nama Lengkap" v-model="form.name" required />
              </div>
              <div class="col-12">
                <input type="email" class="form-control rounded-3" placeholder="Email Aktif" v-model="form.email" required />
              </div>
              <div class="col-12">
                <input type="text" class="form-control rounded-3" placeholder="Subjek Pesan" v-model="form.subject" />
              </div>
              <div class="col-12">
                <textarea class="form-control rounded-3" rows="5" placeholder="Tulis pesan Anda di sini..." v-model="form.message" required></textarea>
              </div>
              <div class="col-12 text-end">
                <button type="submit" class="btn fw-semibold px-4 text-white">Kirim Pesan</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import axios from "axios";
import Swal from "sweetalert2";

export default {
  name: "HubungiKami",
  data() {
    return {
      form: {
        name: "",
        email: "",
        subject: "",
        message: "",
      },
    };
  },
  methods: {
    async kirimPesan() {
      try {
        const response = await axios.post("http://localhost:8000/api/contact", this.form);
        Swal.fire({
          icon: "success",
          title: "Pesan Terkirim",
          text: response.data.message || "Pesan berhasil dikirim!",
        });
        this.form = { name: "", email: "", subject: "", message: "" };
      } catch (error) {
        Swal.fire({
          icon: "error",
          title: "Gagal",
          text: "Gagal mengirim pesan. Silakan coba lagi.",
        });
        console.error(error);
      }
    },
  },
};
</script>

<style scoped>
a.text-decoration-none:hover {
  text-decoration: underline;
  color: #a43434;
}
form input,
form textarea {
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
}
form input:focus,
form textarea:focus {
  border-color: #a43434;
  box-shadow: 0 0 0 0.2rem rgba(146, 35, 35, 0.2);
}
.btn {
  background-color: #a43434;
}
.btn:hover {
  background-color: #872c2c;
  transition: background-color 0.3s ease;
}
h5 {
  color: #a43434;
}
@media (max-width: 992px) {
  .fs-2 {
    font-size: 1.75rem;
  }
  .col-lg-5 {
    margin-bottom: 20px;
  }
}
@media (max-width: 576px) {
  .col-12 {
    margin-bottom: 20px;
  }
  .p-md-5 {
    padding: 2rem;
  }
  .mb-5 {
    margin-bottom: 3rem;
  }
  .fw-bold {
    font-weight: bold;
  }
}
</style>
