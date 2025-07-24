import img1 from '@/assets/images/eventmusik1.jpg'
import img2 from '@/assets/images/eventmusik2.webp'
import img3 from '@/assets/images/eventmusik3.webp'
import img4 from '@/assets/images/eventolahraga1.webp'
import img5 from '@/assets/images/eventmusik5.png'
import img6 from '@/assets/images/eventmusik6.png'
import img7 from '@/assets/images/eventmusik7.png'
import img8 from '@/assets/images/eventolahraga2.jpeg'
import img31 from '@/assets/images/img3.png'
import img41 from '@/assets/images/img4.png'
import img51 from '@/assets/images/img5.png'
import img21 from '@/assets/images/img2.jpeg'
import img81 from '@/assets/images/img8.jpeg'
import img61 from '@/assets/images/img6.jpeg'
import img71 from '@/assets/images/img7.jpeg'
import img11 from '@/assets/images/img11.jpg'



export const allEvents = [
  {
    id: 1,
    title: "YK waterfest",
    date: "2025-05-30",
    location: "JEC",
     price: [
      { nama: "SPECIAL TICKET YKWF", harga: 175000, stock: 15 },
      { nama: "TICKET YKWF", harga: 350000, stock: 0 },
      { nama: "PRESALE 2 YKWF", harga: 300000, stock: 12 },
    ],
    category: "Musik",
    image1: img11,
    image: img1,
    organizer: "RW.ID",
    socialLink: "https://www.instagram.com/yk_waterfest"
  },
  {
    id: 2,
    title: "Kenduri Musik Festival",
    date: "2025-06-05",
    location: "Candi Prambanan",
    price: [
      { nama: "FESTIVAL", harga: 25000, stock: 15 },
    ],
    category: "Musik",
    image1: img21,
    image: img2,
    organizer: "Pelopor Cb Musik Festival",
    socialLink: "https://www.instagram.com/kendurimusikfest"
  },
  {
    id: 3,
    title: "Groovy Melody 2025",
    date: "2025-06-15",
    location: "Puncak Sosok",
    price: [
      { nama: "Regular", harga: 37000, stock: 20 },
    ],
    category: "Musik",
    image1: img31,
    image: img3,
    organizer: "Groove Project",
    socialLink: "https://instagram.com/grooveproject"
  },
  {
    id: 4,
    title: "LAW SOEDIRMAN FUN RUN 2025",
    date: "2025-06-20",
    location: "FH UNSOED",
    price: [
      { nama: "Early bird", harga: 149000, stock: 0 },
      { nama: "Presale 1", harga: 179000, stock: 0 },
      { nama: "Presale 2", harga: 185000, stock: 20 },
      { nama: "Bundling Couple", harga: 328000, stock: 20 },

    ],
    category: "Olahraga",
    image1: img41,
    image: img4,
    organizer: "Hukum Sport Club",
    socialLink: "https://www.instagram.com/lawsoed.funrun"
  },
  {
    id: 5,
    title: "Gala Mystica 2025",
    date: "2025-06-25",
    location: "Yogyakarta, Indonesia",
     price: [
      { nama: "Early bird", harga: 35000, stock: 0 },
      { nama: "Presale 1", harga: 50000, stock: 0 },
      { nama: "Presale 2", harga: 75000, stock: 20 },
      { nama: "Bundling Couple", harga: 280000, stock: 20 },

    ],
    category: "Musik",
    image1: img51,
    image: img5,
    organizer: "Mustika Maya",
    socialLink: "https://www.instagram.com/mustikamaya.uajy"
  },
  {
    id: 6,
    title: "REWARD",
    date: "2025-07-01",
    location: "Lapangan Sawo Sidomulyo",
     price: [
      {nama: "SPECIAL PRICE", harga: 35000, stock: 20},
      { nama: "Early bird", harga: 35000, stock: 0 },
      { nama: "Presale 1", harga: 55000, stock: 0 },
      { nama: "Presale 2 - Regular", harga: 65000, stock: 20 },
      { nama: "Presale 2 - Couple", harga: 125000, stock: 20 },

    ],
    category: "Musik",
    image1: img61,
    image: img6,
    organizer: "REWARD Community",
    socialLink: "https://instagram.com/reward.community"
  },
  {
    id: 7,
    title: "Farmasi Cup",
    date: "2026-02-15",
    location: "Asram Edupark, Yogyakarta",
   price: [
      {nama: "Presale Ticket", harga: 150000, stock: 10},
      { nama: "Regular Ticket", harga: 185000, stock: 0 },
      { nama: "Bundle Couple (2 tiket)", harga: 345000, stock: 0 },
    ],
    category: "Olahraga",
    image1: img71,
    image: img7,
    organizer: "BEM Farmasi UGM",
    socialLink: "https://www.instagram.com/farmasicup"
  },
  {
    id: 8,
    title: "COLOR AND BUBBLE RUN",
    date: "2025-06-29",
    location: "Tip Tap Toe",
    price: [
      { nama: "Olahraga & Musik", harga: 225000, stock: 15 },
    ],
    category: "Olahraga",
        image1: img81,
    image: img8,
    organizer: "ColorRun.ID",
    socialLink: "https://www.instagram.com/Colorandbubblerun"
  }
];
