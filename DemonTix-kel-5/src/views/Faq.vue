<template>
  <section class="faq-section py-5">
    <div class="container">
      <div class="faq-box p-4 rounded-4 shadow-sm">
        <h2 class="fw-bold mb-4">Frequently Asked Question</h2>
        <div class="accordion" id="faqAccordion">
          <div class="accordion-item border-0 mb-3">
            <h2 class="accordion-header">
              <button class="accordion-button fw-semibold" type="button" data-bs-toggle="collapse" data-bs-target="#faq1" aria-expanded="true">
                Cara Pembelian Tiket di Artatix
              </button>
            </h2>
            <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
              <div class="accordion-body">
                <ul class="ps-3">
                  <li>Pembeli memilih tiket event yang diinginkan, silahkan mengunjungi website artatix.co.id</li>
                  <li>Pilih event atau klik searching box dan tulis event yang ingin dibeli</li>
                  <li>Kemudian pilih tiket yang ingin dibeli</li>
                  <li>Selanjutnya mengisi data diri dan pastikan benar</li>
                  <li>Klik "lanjutkan" dan akan langsung di arahkan ke whatsapp untuk melakukan pembayaran</li>
                  <li>Silahkan melakukan pembayaran sebelum batas waktu pembayaran selesai</li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
export default {
  name: 'Faq'
}
</script>

<style scoped>
.faq-section {
  background-color: #f8f9fa;
}

.faq-box {
  background-color: #ffeaea;
  max-width: 900px;
  margin: auto;
}

.accordion-button {
  background-color: #ffffff;
  color: #000;
  border-radius: 0.5rem;
  box-shadow: none;
  font-size: 1.1rem;
}

.accordion-button:focus {
  box-shadow: none;
}

.accordion-body li {
  margin-bottom: 0.6rem;
  font-size: 16px;
}
</style>