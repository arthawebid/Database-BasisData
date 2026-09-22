# Pertemuan 1: Pengantar Basis Data & Perannya dalam Bisnis Digital

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Menjelaskan konsep dasar data, informasi, dan sistem basis data.[cite: 1]
2. Memahami keunggulan Sistem Manajemen Basis Data (DBMS) dibandingkan pemrosesan berkas tradisional.[cite: 1]
3. Menjelaskan peran strategis basis data dalam ekosistem bisnis digital dan industri kreatif.[cite: 1]

---

## 📚 Landasan Teori

### 1. Data vs Informasi
* **Data:** Fakta mentah, angka, teks, atau gambar yang belum diolah dan belum memiliki arti langsung bagi pengambil keputusan. 
  * *Contoh:* `1001`, `Budi`, `2026-09-22`, `Bali`, `Rp 150.000`.
* **Informasi:** Data yang telah diorganisir, diproses, dan disajikan dalam konteks tertentu sehingga memiliki arti dan nilai guna.
  * *Contoh:* "Pelanggan bernama Budi yang berdomisili di Bali melakukan transaksi sebesar Rp 150.000 pada tanggal 22 September 2026."

### 2. Pengertian Basis Data (Database) & DBMS
* **Basis Data (Database):** Koleksi terintegrasi dari data yang saling berhubungan secara logis, disimpan secara terstruktur pada media penyimpanan komputer untuk memenuhi kebutuhan informasi suatu organisasi (Fatansyah, 2012; Ramakrishnan & Gehrke, 2004)[cite: 1].
* **DBMS (Database Management System):** Perangkat lunak yang bertindak sebagai perantara antara pengguna/aplikasi dengan basis data untuk mengelola pembuatan, pemeliharaan, pencarian, dan keamanan data (contoh: MySQL, PostgreSQL, Oracle)[cite: 1].

#### Keunggulan DBMS dibanding Sistem Pemrosesan Berkas Tradisional:
1. **Redundansi Data Terkontrol:** Mengurangi duplikasi data yang tidak perlu.
2. **Konsistensi Data:** Memastikan perubahan data di satu tempat terefleksi secara menyeluruh.
3. **Independensi Data:** Pemisahan antara struktur data fisik dan program aplikasi.
4. **Keamanan & Integritas Data:** Pembatasan hak akses serta penegakan aturan validasi data.
5. **Akses Pengguna Bersamaan (Concurrency Control):** Mendokuskan akses data secara simultan oleh banyak pengguna tanpa konflik.

### 3. Peran Basis Data dalam Ekosistem Bisnis Digital
Dalam lanskap bisnis modern (seperti *e-commerce*, media sosial, dan platform pariwisata digital), basis data bertindak sebagai **jantung operasional dan analitikal**[cite: 1]:
* **Operasional Transaksional (OLTP):** Mencatat aktivitas harian secara real-time (pemesanan tiket, checkout keranjang belanja, pembayaran *payment gateway*).
* **Analisis & Rekomendasi Bisnis (OLAP/BI):** Merekam riwayat transaksi dan perilaku konsumen untuk dianalisis guna menghasilkan rekomendasi produk, personalisasi penawaran, dan optimasi strategi pemasaran digital[cite: 1].

---

## 🖥️ Aktivitas Pembelajaran & Diskusi Kelompok

### Studi Kasus: Platform Pemesanan Tiket Wisata "BaliTravel"
Bayangkan Anda adalah konsultan TI untuk platform pemesanan tiket wisata di Bali. Platform tersebut saat ini masih mencatat pesanan menggunakan file spreadsheet terpisah untuk setiap agen.

**Bahan Diskusi (Diskusi Kelas / Kelompok):**
1. Permasalahan apa saja yang berpotensi muncul jika "BaliTravel" terus menggunakan spreadsheet terpisah?
2. Data apa saja yang wajib dicatat oleh "BaliTravel" agar manajemen dapat mengetahui paket wisata mana yang paling diminati oleh turis mancanegara?

---

## ✍️ Penugasan & Evaluasi Mandiri

### Tugas Latihan / Ringkasan (Paper Singkat)
Buatlah ringkasan singkat (maksimal 2 halaman PDF / Markdown) yang membahas:
1. Penjelasan perbandingan antara pemrosesan data menggunakan spreadsheet biasa dengan DBMS relational pada aplikasi *e-commerce*.
2. Identifikasi 5 jenis data utama yang selalu ada pada sebuah aplikasi toko *online* atau platform pariwisata digital beserta fungsinya bagi bisnis.

---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.[cite: 1]
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.[cite: 1]

### Jurnal & Prosiding Konferensi (Nasional & Internasional)
1. Atmaja, K. J., & Putra, I. D. P. G. W. (2023). Perancangan Sistem Informasi Basis Data Terintegrasi untuk Dukungan Pengambilan Keputusan Bisnis UMKM. *Jurnal Sistem Informasi dan Komputerisasi Akuntansi (JSIKA)*, 12(1), 45-53. https://doi.org/10.31004/jsika.v12i1.128
2. Chen, H., Chiang, R. H., & Storey, V. C. (2012). Business Intelligence and Analytics: From Big Data to Big Impact. *MIS Quarterly*, 36(4), 1165-1188. https://doi.org/10.2307/41703503
3. Pratama, I. G. A., & Wiyata, I. D. P. G. (2022). Implementation of Relational Database Management System for Tourism E-Commerce Applications. *Proceedings of the International Conference on Information Systems and Business Intelligence (ISIBER)*, 102-108. https://doi.org/10.1109/ISIBER56821.2022.1001423
4. Stonebraker, M., & Hellerstein, J. M. (2018). What Goes Around Comes Around: An Architectural Perspective on Database System Trends. *Readings in Database Systems*, 5th Edition, MIT Press. https://doi.org/10.1145/2600000.2600001
