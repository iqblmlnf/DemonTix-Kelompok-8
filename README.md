# DemonTix-Kel 8

DemonTix adalah aplikasi berbasis web untuk penjualan tiket konser, olahraga, dan wisata, dikembangkan menggunakan **Laravel (backend)** dan **Vue.js (frontend)**.

---

## 🚀 Cara Menjalankan Proyek Ini

### 📁 Struktur Direktori

```
project-root/
├── backend/        # Laravel API
└── frontend/       # Vue.js frontend
```

---

## 📦 Backend (Laravel)

### 1. Masuk ke direktori backend
```bash
cd backend
```

### 2. Install dependency Laravel
```bash
composer install
```

### 3. Copy file environment
```bash
cp .env.example .env
```

### 4. Generate application key
```bash
php artisan key:generate
```

### 5. Buat database dan atur `.env`
- Buat database (misalnya: `demontix1`)
- Edit `.env`:
  ```env
  DB_DATABASE=demontix1
  DB_USERNAME=root
  DB_PASSWORD= (isi jika ada password)
  ```

### 6. Jalankan migrasi
```bash
php artisan migrate
```

### 7. Buat symbolic link untuk akses file upload
```bash
php artisan storage:link
```

### 8. Jalankan server Laravel
```bash
php artisan serve
```

Akses API di: [http://localhost:8000](http://localhost:8000)

---

## 🌐 Frontend (Vue.js)

### 1. Masuk ke direktori frontend
```bash
cd frontend
```

### 2. Install dependency
```bash
npm install
```

### 3. Jalankan server frontend
```bash
npm run dev
```

Frontend akan berjalan di: [http://localhost:5173](http://localhost:5173)

> Pastikan URL backend Laravel (`http://localhost:8000`) sudah diatur dengan benar di file `.env` atau konfigurasi frontend (`axios`, `vite.config.js`, dsb)

---

## 📁 Upload Folder

Pastikan folder berikut tersedia untuk menyimpan file gambar:

```
storage/app/public/bukti_pembayaran/
storage/app/public/events/
```

## 🛠️ Tools & Teknologi

- Laravel
- Vue js
- Axios
- SweetAlert2
- MySQL / MariaDB

---

## 👨‍💻 Developer

Kelompok 8 - Mata Kuliah Pemrograman Web  
Fakultas Ilmu Komputer, Universitas Amikom Yogyakarta

---

## 📷 Preview

> Tambahkan screenshot di sini jika perlu.

## 📂 Akses Folder Gambar

Folder `storage/app/public/bukti_pembayaran/` dan `storage/app/public/events/` *tidak* dimasukkan ke repository karena masuk dalam `.gitignore`.

Jika Anda memerlukan gambar-gambar tersebut (misalnya untuk kebutuhan development atau testing), silakan akses melalui Google Drive berikut:

🔗 [Download Folder Gambar dari Google Drive](https://drive.google.com/drive/folders/1JqxZiiLckcAlzWUC5HIQSFOCCgGevMTZ?usp=drive_link)

Setelah diunduh, pindahkan:
- Folder `bukti_pembayaran/` ke `backend/storage/app/public/`
- Folder `events/` ke `backend/storage/app/public/`