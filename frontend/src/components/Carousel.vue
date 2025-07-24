<template>
  <section class="mt-4 px-3" aria-labelledby="carousel-heading">
    <div id="eventCarousel" class="carousel slide" data-bs-ride="carousel">
      <!-- Indicators (bulat) -->
      <div class="carousel-indicators">
      <button
        type="button"
        data-bs-target="#eventCarousel"
        data-bs-slide-to="0"
        class="active"
        aria-current="true"
        aria-label="Slide 1: Banner 1"
      ></button>
      <button
        type="button"
        data-bs-target="#eventCarousel"
        data-bs-slide-to="1"
        aria-label="Slide 2: Banner 2"
      ></button>
      <button
        type="button"
        data-bs-target="#eventCarousel"
        data-bs-slide-to="2"
        aria-label="Slide 3: Banner 3"
      ></button>
    </div>

      <!-- Slides -->
      <div class="carousel-inner rounded shadow">
        <div class="carousel-item active" data-bs-interval="3000">
          <img
            src="@/assets/images/eventmusik4.webp"
            class="d-block w-100"
            alt="Event musik, banner promosi untuk acara musik"
            height="300"
            style="object-fit: cover"
            loading="eager"
          />
        </div>
        <div class="carousel-item" data-bs-interval="3000">
          <img
            loading="lazy"
            src="@/assets/images/eventmusik8.webp"
            class="d-block w-100"
            alt="Event musik, banner promosi untuk acara musik"
            height="300"
            style="object-fit: cover"
          />
        </div>
        <div class="carousel-item" data-bs-interval="3000">
          <img
            loading="lazy"
            src="@/assets/images/eventmusik9.webp"
            class="d-block w-100"
            alt="Event musik, banner promosi untuk acara musik"
            height="300"
            style="object-fit: cover"
          />
        </div>
      </div>

      <!-- Controls -->
      <!-- Tombol untuk kontrol sebelumnya -->
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#eventCarousel"
          data-bs-slide="prev"
          aria-label="Previous slide"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>

        <!-- Tombol untuk kontrol berikutnya -->
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#eventCarousel"
          data-bs-slide="next"
          aria-label="Next slide"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
    </div>
  </section>
</template>

<script>
export default {
  name: "Carousel",
};
</script>

<style scoped>
.carousel-indicators [data-bs-target] {
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background-color: #6c757d; /* abu-abu default */
  margin: 0 5px;
  transition: background-color 0.3s;
}

.carousel-indicators .active {
  background-color: #922323; /* Merah tua untuk indikator aktif */
}

.carousel-indicators button {
  border: none;
  outline: none;
}

</style>