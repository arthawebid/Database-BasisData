# Pertemuan 2: Konsep Dasar Pemodelan Data Terkonsep (Conceptual Data Model / CDM)

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Menjelaskan konsep dasar dan pentingnya pemodelan data terkonsep (*Conceptual Data Model / CDM*)[cite: 1].
2. Mengidentifikasi komponen utama CDM: Entitas (*Entity*), Atribut (*Attribute*), Identifikator Utama (*Primary Key*), dan Relasi (*Relationship*)[cite: 1].
3. Menentukan derajat relasi/kardinalitas (*One-to-One*, *One-to-Many*, *Many-to-Many*) dalam suatu studi kasus bisnis digital[cite: 1].
4. Merancang diagram CDM sederhana menggunakan perangkat lunak *modeling* (misal: PowerDesigner/Draw.io)[cite: 1].

---

## 📚 Landasan Teori

### 1. Pengertian Conceptual Data Model (CDM)
* **CDM (Conceptual Data Model):** Pemodelan tingkat tinggi (*high-level*) yang merepresentasikan struktur basis data berdasarkan konsep bisnis nyata tanpa terikat pada perangkat lunak DBMS tertentu[cite: 1].
* **Fungsi CDM:** Membantu perancang basis data dan pemangku kepentingan bisnis (*stakeholder*) memahami organisasi data, aturan bisnis (*business rules*), serta entitas yang saling berhubungan dalam sistem.

### 2. Komponen Utama CDM

#### a. Entitas (Entity)
Objek, tempat, konsep, atau peristiwa di dunia nyata yang informasinya perlu dicatat oleh sistem[cite: 1].
* *Contoh:* `PELANGGAN`, `PRODUK`, `WISATA`, `TRANSAKSI`[cite: 1].

#### b. Atribut (Attribute)
Karakteristik atau properti yang menjelaskan entitas[cite: 1].
* **Atribut Identifikator (Primary Key):** Atribut unik yang membedakan satu baris data dengan baris data lainnya (contoh: `id_pelanggan`, `kode_produk`)[cite: 1].
* **Atribut Deskriptif:** Atribut pendukung yang menyimpan detail informasi (contoh: `nama_pelanggan`, `harga`, `email`)[cite: 1].

#### c. Relasi & Kardinalitas (Relationship & Cardinality)
Hubungan logis antar dua atau lebih entitas beserta batasan kuantitas hubungannya[cite: 1]:
* **One-to-One (1:1):** Satu baris data pada Entitas A terhubung dengan maksimal satu baris data pada Entitas B.
  * *Contoh:* `PELANGGAN` (1) ── (1) `PROFIL_PENGGUNA`
* **One-to-Many (1:N):** Satu baris data pada Entitas A terhubung dengan banyak baris data pada Entitas B, tetapi tidak sebaliknya.
  * *Contoh:* `KATEGORI` (1) ── (N) `PRODUK`
* **Many-to-Many (N:M):** Banyak baris data pada Entitas A dapat terhubung dengan banyak baris data pada Entitas B.
  * *Contoh:* `PELANGGAN` (N) ── (M) `PAKET_WISATA` *(Memerlukan entitas perantara/transaksi saat ditransformasikan ke PDM)*.

---

## 🖥️ Praktikum & Studi Kasus

### Skenario Kasus: Platform Pariwisata "Bali Explorer"
Platform "Bali Explorer" ingin mencatat data wisatawan yang memesan tiket paket wisata. Aturan bisnis yang berlaku:
1. Seorang **Pelanggan** dapat membuat banyak **Pemesanan**, namun setiap pemesanan hanya dimiliki oleh satu pelanggan.
2. Setiap **Pemesanan** dapat memuat beberapa **Paket Wisata**, dan satu paket wisata dapat dipesan oleh banyak pemesanan.

### Langkah Kerja Praktikum (PowerDesigner / Tools Diagram):
1. Buat Entitas `PELANGGAN` dengan atribut: `id_pelanggan` (PK), `nama`, `email`, `no_telp`.
2. Buat Entitas `PAKET_WISATA` dengan atribut: `kode_paket` (PK), `nama_paket`, `harga`.
3. Buat Entitas `PEMESANAN` dengan atribut: `no_pemesanan` (PK), `tgl_pemesanan`, `total_bayar`.
4. Hubungkan relasi dan tentukan kardinalitas antar entitas sesuai aturan bisnis di atas.

---

## ✍️ Penugasan & Evaluasi Mandiri

### Tugas Individu (Latihan Mandiri RTM-1)
Rancanglah diagram **Conceptual Data Model (CDM)** untuk kasus platform *digital marketing/e-commerce* dengan ketentuan berikut[cite: 1]:
* Identifikasi minimal 3 Entitas[cite: 1].
* Tentukan Primary Key dan Atribut wajib untuk tiap entitas[cite: 1].
* Tentukan kardinalitas relasi antar entitas[cite: 1].
* Sertakan narasi aturan bisnis yang menjelaskan diagram CDM Anda.

---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.[cite: 1]
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.[cite: 1]

### Jurnal & Prosiding Konferensi (Nasional & Internasional)
1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
