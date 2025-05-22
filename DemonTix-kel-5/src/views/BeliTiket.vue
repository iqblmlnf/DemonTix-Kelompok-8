<template>
  <div class="bg-light text-dark min-vh-100">
    <main class="container py-5">
      <div class="row g-5">
        <!-- Form Pemesanan -->
        <div class="col-lg-8">
          <!-- Data Pemesan -->
          <section class="card border-0 shadow-sm mb-4 rounded-4 p-4 bg-white">
            <h3 class="fw-bold mb-4">Data Pemesan</h3>
            <form class="row g-3">
              <div class="col-12">
                <label for="nama" class="form-label fw-semibold"
                  >Nama Lengkap</label
                >
                <input
                  id="nama"
                  v-model="dataPemesan.nama"
                  type="text"
                  class="form-control"
                  placeholder="Marcus Holloway"
                  :aria-invalid="!dataPemesan.nama ? 'true' : 'false'"
                  aria-describedby="namaError"
                />
              </div>

              <div class="col-md-6">
                <label for="jenisIdentitas" class="form-label fw-semibold"
                  >Jenis Identitas</label
                >
                <select
                  id="jenisIdentitas"
                  v-model="dataPemesan.jenisIdentitas"
                  class="form-select"
                >
                  <option value="">Pilih</option>
                  <option>KTP</option>
                  <option>SIM</option>
                </select>
              </div>
              
              <div class="col-md-6">
                <label for="nomorIdentitas" class="form-label fw-semibold"
                  >Nomor Identitas</label
                >
                <input
                  id="nomorIdentitas"
                  v-model="dataPemesan.nomorIdentitas"
                  type="text"
                  class="form-control"
                  placeholder="1234567890"
                />
              </div>
              <div class="col-12 d-flex gap-3">
                <div class="form-check">
                  <input
                    id="genderLaki"
                    class="form-check-input"
                    type="radio"
                    name="gender"
                    value="Laki-laki"
                    v-model="dataPemesan.gender"
                  />
                  <label for="genderLaki" class="form-check-label"
                    >Laki-laki</label
                  >
                </div>
                <div class="form-check">
                  <input
                    id="genderPerempuan"
                    class="form-check-input"
                    type="radio"
                    name="gender"
                    value="Perempuan"
                    v-model="dataPemesan.gender"
                  />
                  <label for="genderPerempuan" class="form-check-label"
                    >Perempuan</label
                  >
                </div>
              </div>
              <div class="col-md-6">
                <label class="form-label fw-semibold">Usia</label>
                <input
                  v-model="dataPemesan.usia"
                  type="number"
                  class="form-control"
                />
              </div>
              <div class="col-md-6">
                <label class="form-label fw-semibold">Email</label>
                <input
                  v-model="dataPemesan.email"
                  type="email"
                  class="form-control"
                  placeholder="nama@email.com"
                />
              </div>
              <div class="col-12">
                <label class="form-label fw-semibold">No WhatsApp</label>
                <input
                  v-model="dataPemesan.whatsapp"
                  type="text"
                  class="form-control"
                  placeholder="08xxxxxxxxxx"
                />
              </div>
            </form>
          </section>

          <!-- Data Pemilik Tiket -->
          <section class="mb-4">
            <h3 class="fw-bold mb-3">Data Pemilik Tiket</h3>

            <div
              class="card border-0 shadow-sm rounded-4 p-4 bg-white mb-4"
              v-for="(pemilik, index) in pemilikTiketList"
              :key="index"
            >
              <div
                class="d-flex justify-content-between align-items-center mb-3"
              >
                <h5 class="fw-semibold mb-0">Pemilik Tiket {{ index + 1 }}</h5>
                <span
                  class="text-primary small cursor-pointer fw-semibold"
                  @click="samakanSatuPemilik(index)"
                >
                  Samakan dengan data pemesan
                </span>
              </div>
              <form class="row g-3">
                <div class="col-12">
                  <label class="form-label fw-semibold">Nama Lengkap</label>
                  <input
                    v-model="pemilik.nama"
                    type="text"
                    class="form-control"
                    placeholder="Marcus Holloway"
                  />
                </div>
                <div class="col-md-6">
                  <label class="form-label fw-semibold">Jenis Identitas</label>
                  <select v-model="pemilik.jenisIdentitas" class="form-select">
                    <option value="">Pilih</option>
                    <option>KTP</option>
                    <option>SIM</option>
                  </select>
                </div>
                <div class="col-md-6">
                  <label class="form-label fw-semibold">Nomor Identitas</label>
                  <input
                    v-model="pemilik.nomorIdentitas"
                    type="text"
                    class="form-control"
                    placeholder="1234567890"
                  />
                </div>
                <div class="col-12 d-flex gap-3">
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="radio"
                      :name="'gender-' + index"
                      value="Laki-laki"
                      v-model="pemilik.gender"
                    />
                    <label class="form-check-label">Laki-laki</label>
                  </div>
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="radio"
                      :name="'gender-' + index"
                      value="Perempuan"
                      v-model="pemilik.gender"
                    />
                    <label class="form-check-label">Perempuan</label>
                  </div>
                </div>
                <div class="col-md-6">
                  <label class="form-label fw-semibold">Usia</label>
                  <input
                    v-model="pemilik.usia"
                    type="number"
                    class="form-control"
                  />
                </div>
                <div class="col-md-6">
                  <label class="form-label fw-semibold">Email</label>
                  <input
                    v-model="pemilik.email"
                    type="email"
                    class="form-control"
                  />
                </div>
                <div class="col-12">
                  <label class="form-label fw-semibold">No WhatsApp</label>
                  <input
                    v-model="pemilik.whatsapp"
                    type="text"
                    class="form-control"
                  />
                </div>
              </form>
            </div>
          </section>
        </div>

        <!-- Rincian Pesanan -->
        <div class="col-lg-4">
          <div
            class="card shadow-sm rounded-4 p-4 bg-white sticky-top"
            style="top: 100px"
          >
            <h4 class="fw-bold mb-4">
              <i class="fa-solid fa-circle-info me-2 text-danger"></i> Rincian
              Pesanan
            </h4>
            <div v-if="event" class="mb-3">
              <img
                :src="event.image"
                alt="banner"
                class="img-fluid rounded-3 mb-3"
                style="height: 140px; object-fit: cover"
              />
              <h6 class="fw-semibold mb-0">{{ event.title }}</h6>
              <small class="text-muted"
                >{{ new Date(event.date).toLocaleDateString("id-ID") }} -
                {{ event.location }}</small
              >
            </div>
            <div
              v-for="(item, idx) in selectedTickets"
              :key="idx"
              class="d-flex justify-content-between small border-bottom pb-2 mb-2"
            >
              <div>
                <p class="mb-0 fw-semibold">{{ item.nama }}</p>
                <p class="mb-0 text-muted">
                  Rp {{ item.harga.toLocaleString("id-ID") }}
                </p>
              </div>
              <p class="mb-0 fw-semibold">x{{ item.qty }}</p>
            </div>
            <div class="small mb-3">
              <div class="d-flex justify-content-between">
                <span>Subtotal</span>
                <span class="fw-medium"
                  >Rp {{ subtotal.toLocaleString("id-ID") }}</span
                >
              </div>
              <div class="d-flex justify-content-between">
                <span>Biaya Layanan</span>
                <span class="fw-medium"
                  >Rp {{ layanan.toLocaleString("id-ID") }}</span
                >
              </div>
              <div
                class="border-top pt-2 mt-2 d-flex justify-content-between fw-bold text-danger"
              >
                <span>Total</span>
                <span>Rp {{ total.toLocaleString("id-ID") }}</span>
              </div>
            </div>
            <div v-if="!formValid" class="text-danger small mb-2">
              ⚠ Harap lengkapi data terlebih dahulu.
            </div>
            <button
              class="btn btn-danger w-100 fw-semibold"
              :disabled="!formValid"
              :class="{ 'opacity-50': !formValid }"
            >
              Lanjutkan Pembayaran
            </button>
          </div>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import { allEvents } from "@/data/events";

export default {
  name: "BeliTiket",
  props: ["id"],
  data() {
    return {
      event: null,
      selectedTickets: [],
      pemilikTiketList: [],
      dataPemesan: {
        nama: "",
        jenisIdentitas: "",
        nomorIdentitas: "",
        gender: "Laki-laki",
        usia: "",
        email: "",
        whatsapp: "",
      },
    };
  },
  computed: {
    subtotal() {
      return this.selectedTickets.reduce(
        (sum, item) => sum + item.harga * item.qty,
        0
      );
    },
    layanan() {
      return 11000;
    },
    total() {
      return this.subtotal + this.layanan;
    },
    formValid() {
      const isPemesanLengkap = Object.values(this.dataPemesan).every(
        (val) => val !== ""
      );
      const semuaPemilikLengkap = this.pemilikTiketList.every((pemilik) =>
        Object.values(pemilik).every((val) => val !== "")
      );
      return isPemesanLengkap && semuaPemilikLengkap;
    },
  },
  methods: {
    generatePemilikTiketForm() {
      const totalQty = this.selectedTickets.reduce(
        (sum, item) => sum + item.qty,
        0
      );
      this.pemilikTiketList = Array.from({ length: totalQty }, () => ({
        nama: "",
        jenisIdentitas: "",
        nomorIdentitas: "",
        gender: "Laki-laki",
        usia: "",
        email: "",
        whatsapp: "",
      }));
    },
    samakanSatuPemilik(index) {
      const pemesan = this.dataPemesan;
      const pemilik = this.pemilikTiketList[index];
      Object.assign(pemilik, { ...pemesan });
    },
  },
  mounted() {
    const eventId = parseInt(this.id);
    this.event = allEvents.find((e) => e.id === eventId);

    const queryTiket = this.$route.query.tiket;
    if (queryTiket) {
      try {
        this.selectedTickets = JSON.parse(queryTiket);
        this.generatePemilikTiketForm();
      } catch (err) {
        console.error("Gagal parsing tiket:", err);
      }
    }
  },
};
</script>

<style scoped>
.cursor-pointer {
  cursor: pointer;
}
.opacity-50 {
  opacity: 0.5;
  pointer-events: none;
}
</style>
