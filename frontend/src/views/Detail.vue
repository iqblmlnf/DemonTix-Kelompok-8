<template>
  <div class="container py-2">
      <section class="event-info mt-4">
        <div class="row">
          <div class="event_headline">
            <div class="event_category">
              <div class="category">{{ event.category }}</div>
            </div>
            <div class="event_name">
              <h1>{{ event.title }}</h1>
            </div>
          </div>

          <div class="col-md-12 col-lg-8">
            <div class="detail-event">
              <div class="event-banner">
                <img :src="event.image" :alt="event.title" loading="lazy" />
              </div>

              <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-3">
                <div class="creator_profile">
                  <div class="creator_img">
                    <img :src="event.image1" :alt="event.title" loading="lazy"/>
                  </div>
                  <div class="creator_name">
                    <label>Penyelenggara</label>
                    <p class="mb-0 fw-semibold">{{ event.organizer }}</p>
                  </div>
                </div>
                <div class="creator_instagram">
                  <div class="instagram_logo">
                    <i class="bi bi-instagram text-danger"></i>
                    <label for>Instagram</label>
                  </div>
                  <div class="instagram_profile">
                    <a :href="event.socialLink" target="_blank">
                      {{ "@" + event.socialLink.split("/").pop() }}
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-md-12 col-lg-4" id="card-info">
            <div class="card_info">
              <div class="detail_info">
                <h5>Detail Event</h5>
                <div class="cal">
                  <div class="icon">
                    <i class="bi bi-calendar-event-fill text-danger"></i>
                  </div>
                  <div class="text">
                    <label for="">Tanggal</label>
                    <span>{{ formatDate(event.date) }}</span>
                  </div>
                </div>
                <div class="cal">
                  <div class="icon">
                    <i class="bi bi-clock-fill text-danger"></i>
                  </div>
                  <div class="text">
                    <label for="">Waktu</label>
                    <span>15:00 - 21:00</span>
                  </div>
                </div>
                <div class="cal">
                  <div class="icon">
                    <i class="bi bi-geo-alt-fill text-danger"></i>
                  </div>
                  <div class="text">
                    <label for="">Lokasi</label>
                    <span>{{ event.location }}</span>
                  </div>
                </div>

                <div v-if="selectedTickets.length > 0" class="alert alert-warning bg-warning-subtle border-0">
                  <strong class="text-dark d-block mb-2">Tiket Terpilih:</strong>
                  <div
                    v-for="(item, idx) in selectedTickets"
                    :key="idx"
                    class="d-flex justify-content-between"
                  >
                    <span class="text-dark">{{ item.nama }} ({{ item.qty }}x)</span>
                    <span class="text-dark">
                      Rp {{ (item.harga * item.qty).toLocaleString("id-ID") }}
                    </span>
                  </div>
                </div>

                <router-link
                  :to="{
                    name: 'BeliTiket',
                    params: { id: event.id },
                    query: { tiket: JSON.stringify(selectedTickets) },
                  }"
                  class="btn w-100 fw-semibold py-2 mt-2"
                  :class="selectedTickets.length === 0 ? 'btn-secondary disabled' : 'btn-danger'"
                  :aria-disabled="selectedTickets.length === 0"
                >
                  Beli Tiket
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- TABS -->
      <div class="col-md-8">
        <div class="d-flex gap-2 mb-4 flex-wrap">
          <button
            @click="showTab('deskripsi')"
            class="btn rounded-pill fw-semibold px-4 py-2"
            :class="activeTab === 'deskripsi' ? 'btn-danger text-white' : 'btn-outline-danger'"
          >
            <i class="bi bi-journal-text me-2"></i>Deskripsi
          </button>
          <button
            @click="showTab('tiket')"
            class="btn rounded-pill fw-semibold px-4 py-2"
            :class="activeTab === 'tiket' ? 'btn-danger text-white' : 'btn-outline-danger'"
          >
            <i class="bi bi-ticket-perforated-fill me-2"></i>Tiket
          </button>
        </div>

          <div v-show="activeTab === 'deskripsi'" class="p-4 rounded-4">

          
            <h5 class="text-danger mb-3">Deskripsi Event</h5>
            <p>
              {{ event.title }} adalah event spektakuler di {{ event.location }} yang menghadirkan suasana tak terlupakan!
            </p>
            <h5 class="text-danger mt-4 mb-2">Syarat dan Ketentuan</h5>
            <ol class="ps-3">
              <li>Entry Pass yang valid adalah yang dibeli melalui situs resmi kami.</li>
              <li>Satu Entry Pass berlaku untuk satu orang.</li>
              <li>Tiket tidak dapat dikembalikan kecuali event dibatalkan.</li>
            </ol>
          </div>

        <div v-show="activeTab === 'tiket'" class="tab-content">
            <div v-for="(item, index) in tiketOptions" :key="index">
              <div class="card-tiket">
                <div class="info">
                  <div class="col-8 p-0 ticket-name">
                    <span>{{ item.nama }}</span>
                  </div>
                </div>
                <hr style="border: 1px dashed #b0b0b0" />
                <div class="ticket-order">
                  <div class="ticket-price">
                    <p class="text-danger small mb-0">Tersisa: {{ item.stock }}</p>
                    <label>Harga</label>
                    <span style="color: #f26419">Rp {{ item.harga.toLocaleString("id-ID") }}</span>
                  </div>
                  <div class="col-4 p-0 ticket-status" v-if="item.stock <= 0 && getTicketQty(item.nama) === 0">
                    <span class="sold-out">Sold Out</span>
                  </div>
                  <div v-else>
                    <div v-if="getTicketQty(item.nama) > 0" class="d-flex align-items-center gap-2 justify-content-end">
                      <button @click="kurangiTiket(item)" class="btn btn-sm btn-outline-danger">-</button>
                      <span>{{ getTicketQty(item.nama) }}</span>
                      <button @click="pilihTiket(item)" :disabled="item.stock <= 0" class="btn btn-sm btn-outline-danger">+</button>
                    </div>
                    <button
                      v-else
                      @click="pilihTiket(item)"
                      class="btn btn-sm px-4 fw-semibold text-white"
                      style="background-color: #922323; border-radius: 0.375rem"
                    >
                      Pilih
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
      </div>
  </div>
</template>

<script>

import { allEvents } from "@/data/events";

export default {
  name: "Detail",
  data() {
  return {
    activeTab: "deskripsi",
    event: null,
    tiketOptions: [],
    selectedTickets: [],
  };
},
created() {
  const eventId = parseInt(this.$route.params.id);
  this.event = allEvents.find((e) => e.id === eventId);
  if (this.event && this.event.price) {
    this.tiketOptions = this.event.price.map(t => ({ ...t }));
  }
},
  methods: {
    showTab(tab) {
      this.activeTab = tab;
    },
    formatDate(date) {
      return new Date(date).toLocaleDateString("id-ID", {
        day: "numeric",
        month: "long",
        year: "numeric",
      });
    },
    pilihTiket(tiket) {
      if (tiket.stock > 0) {
        const existing = this.selectedTickets.find((t) => t.nama === tiket.nama);
        if (existing) {
          if (existing.qty < 5) {
            tiket.stock--;
            existing.qty++;
          }
        } else {
          tiket.stock--;
          this.selectedTickets.push({ ...tiket, qty: 1 });
        }
      }
    },
    kurangiTiket(tiket) {
      const existing = this.selectedTickets.find((t) => t.nama === tiket.nama);
      if (existing && existing.qty > 0) {
        existing.qty--;
        tiket.stock++;
        if (existing.qty === 0) {
          this.selectedTickets = this.selectedTickets.filter((t) => t.nama !== tiket.nama);
        }
      }
    },
    getTicketQty(nama) {
      const ticket = this.selectedTickets.find((t) => t.nama === nama);
      return ticket ? ticket.qty : 0;
    },
  },
};
</script>


<style scoped>
.event_category {
  display: flex;
  flex-direction: row;
  flex-wrap: nowrap;
  gap: 12px;
}
.category {
  display: flex;
  flex-direction: row;
  align-items: center;
  padding: 6px 12px;
  background-color: #fff0cc;
  color: #241ce6;
  font-size: 12px;
  font-weight: 500;
  width: fit-content;
  gap: 8px;
  border-radius: 8px;
}
.text {
  display: flex;
  flex-direction: column;
  padding: 0 12px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.icon {
  display: flex;
  background-color: #ebc5c5;
  border-radius: 8px;
  width: 28px;
  height: 28px;
  justify-content: center;
}
.cal {
  display: flex;
  flex-direction: row;
}
.card_info {
  display: flex;
  flex-direction: column;
  height: 100%;
  justify-content: space-between;
  padding: 12px;
}
.detail_info {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
.detail-event {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
.card-tiket {
  padding: 24px;
  margin: 20px 0;
  border-radius: 14px;
  border: solid 1px #ebf1ff;
}
.info {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.ticket-name {
  font-size: 13px;
}

.ticket-status {
  text-align: right;
}
.sold-out {
  background-color: #fae7e7;
  color: #fa3e3e;
  font-weight: 400;
  font-size: 13px;
  padding: 6px 10px;
  border-radius: 8px;
}
.price {
  color: #922323;
  font-weight: bold;
}
.ticket-order {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  align-items: left;
}
.event-banner img {
  border-radius: 12px 12px 12px 12px;
   width: 100%;
  height: 300px;
  object-fit: cover;
  display: block;
}
.ticket-price {
  display: flex;
  flex-direction: column;
}
.tab-content {
  border: 1px solid #ffffff;
  padding: 16px;
  border-radius: 8px;
}
.text-danger {
  color: #922323 !important;
}
.btn-danger {
  background-color: #922323;
  border: none;
}
.btn-danger:hover {
  background-color: #751c1c;
}
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}
.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
.card {
  transition: box-shadow 0.3s ease;
}
.event_name h1 {
  font-size: 24px;
  margin-bottom: 16px;
}
.card:hover {
  box-shadow: 0 0 12px rgba(0, 0, 0, 0.08);
}
.detail-margin-top {
  margin-top: 155px;
}
@media (max-width: 768px) {
  h1.display-6 {
    font-size: 1.75rem;
  }
  .btn {
    font-size: 0.9rem;
  }
}
.creator_name {
  display: flex;
  flex-direction: column;
}
.creator_instagram {
  display: flex;
  flex-direction: column;
  gap: 4px;
}
.instagram_profile a {
  font-size: 14px;
  font-weight: 500;
  color: #241ce6;
}
.instagram_logo {
  display: flex;
  flex-direction: row;
  gap: 8px;
  align-items: center;
}
.creator_img img {
  background-color: #ffffff;
  width: 48px;
  height: 48px;
  border-radius: 50px;
}
.instagram_logo {
  display: flex;
  flex-direction: row;
  gap: 8px;
  align-items: center;
}
.creator_profile {
  display: flex;
  flex-direction: row;
  gap: 12px;
  align-items: center;
}
.row {
  display: -ms-flexbox;
  display: flex;
  -ms-flex-wrap: wrap;
  flex-wrap: wrap;
  margin-right: -15px;
  margin-left: -15px;
}
a {
  text-decoration: none;
}
h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: "Poppins", sans-serif;
  color: #222222;
  line-height: 1.2em !important;
  margin-bottom: 0;
  margin-top: 0;
  font-weight: 600;
}
span {
  font-size: 17px;
  font-weight: 600;
  color: #151515;
  padding: 2px 0;
}
.cal span {
  font-size: 14px;
  font-weight: 600;
  color: #181818;
  padding: 2px 0;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
label {
  font-size: 13px;
  font-weight: 400;
  color: #b0b0b0;
  margin-bottom: 0px;
}
.event_headline {
  display: flex;
  flex-direction: column;
  gap: 16px;
}
</style>
