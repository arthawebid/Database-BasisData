# Pertemuan 5: Data Definition Language (DDL) — Part 2: Pengelolaan Tabel dan Constraints

## 📋 Informasi Umum
- **Mata Kuliah:** Database
- **Kode MK:** CBDW-220
- **Bobot:** 3 SKS (Teori = 2, Praktikum = 1)[cite: 1]
- **Capaian Pembelajaran (CPMK):** CPMK103 — Mengimplementasikan teknologi digital untuk memvisualisasikan data guna memberikan rekomendasi strategi bisnis yang relevan dan berkelanjutan.[cite: 1]

---

## 🎯 Tujuan Pembelajaran
Setelah mengikuti pembelajaran pada pertemuan ini, mahasiswa diharapkan mampu:
1. Mengimplementasikan perintah `CREATE TABLE` untuk membangun struktur tabel berelasi di MySQL[cite: 1].
2. Menerapkan *constraints* (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`, `DEFAULT`, `CHECK`) guna menjaga integritas data[cite: 1].
3. Menggunakan perintah `ALTER TABLE` untuk memodifikasi struktur tabel yang telah ada[cite: 1].
4. Menggunakan perintah `DROP TABLE` dan `TRUNCATE TABLE` secara aman[cite: 1].

---

## 📚 Landasan Teori

### 1. Integritas Data & Constraint
*Constraint* adalah aturan yang diterapkan pada kolom tabel untuk membatasi jenis data yang dapat dimasukkan, sehingga konsistensi dan integritas data bisnis tetap terjaga[cite: 1].
* **`PRIMARY KEY`:** Mengidentifikasi secara unik setiap baris data dalam tabel (tidak boleh `NULL` dan tidak boleh duplikat)[cite: 1].
* **`FOREIGN KEY`:** Kunci penjelajah yang menghubungkan satu tabel dengan *Primary Key* di tabel lain untuk menegakkan *referential integrity*[cite: 1].
* **`NOT NULL`:** Memastikan kolom wajib diisi data (tidak boleh kosong)[cite: 1].
* **`UNIQUE`:** Memastikan seluruh nilai dalam kolom berbeda satu sama lain[cite: 1].
* **`DEFAULT`:** Memberikan nilai awal secara otomatis jika tidak ada data yang dimasukkan.

### 2. DDL Pengelolaan Tabel
* **`CREATE TABLE`:** Membangun skema tabel baru beserta definisi kolom dan constraint-nya[cite: 1].
* **`ALTER TABLE`:** Mengubah skema tabel yang sudah ada (menambah, mengubah, atau menghapus kolom/constraint)[cite: 1].
* **`DROP TABLE`:** Menghapus tabel beserta seluruh strukturnya dari basis data secara permanen[cite: 1].
* **`TRUNCATE TABLE`:** Menghapus seluruh isi data di dalam tabel tanpa menghapus struktur tabelnya.

---

## 🖥️ Praktikum & Hands-On DDL Tabel

### 1. Membuat Tabel Berelasi (`CREATE TABLE`)
Skenario: Membangun basis data e-commerce/pariwisata `db_bali_explorer`[cite: 1].

```sql
USE db_bali_explorer;
```
-- 1. Membuat Tabel Pelanggan
```sql
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT,
    nama_lengkap VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    no_telepon VARCHAR(15),
    tgl_registrasi DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_pelanggan PRIMARY KEY (id_pelanggan),
    CONSTRAINT uq_email UNIQUE (email)
);
```
-- 2. Membuat Tabel Paket Wisata
```sql
CREATE TABLE paket_wisata (
    kode_paket VARCHAR(10),
    nama_paket VARCHAR(150) NOT NULL,
    harga DECIMAL(12,2) NOT NULL,
    stok_kuota INT DEFAULT 0,
    CONSTRAINT pk_paket PRIMARY KEY (kode_paket)
);
```
-- 3. Membuat Tabel Pemesanan (Relasi One-to-Many dari Pelanggan)
```sql
CREATE TABLE pemesanan (
    no_pemesanan VARCHAR(20),
    id_pelanggan INT NOT NULL,
    kode_paket VARCHAR(10) NOT NULL,
    tgl_pemesanan DATETIME DEFAULT CURRENT_TIMESTAMP,
    jumlah_tiket INT NOT NULL DEFAULT 1,
    total_bayar DECIMAL(12,2) NOT NULL,
    CONSTRAINT pk_pemesanan PRIMARY KEY (no_pemesanan),
    CONSTRAINT fk_pemesanan_pelanggan FOREIGN KEY (id_pelanggan) 
        REFERENCES pelanggan(id_pelanggan) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_pemesanan_paket FOREIGN KEY (kode_paket) 
        REFERENCES paket_wisata(kode_paket) 
        ON DELETE RESTRICT ON UPDATE CASCADE
);
```

### 2. Memodifikasi Struktur Tabel (`ALTER TABLE`)

-- Menambahkan kolom baru 'alamat' pada tabel pelanggan
```sql
ALTER TABLE pelanggan 
ADD COLUMN alamat TEXT AFTER no_telepon;
```
-- Mengubah tipe data kolom no_telepon
```sql
ALTER TABLE pelanggan 
MODIFY COLUMN no_telepon VARCHAR(20);
```
-- Menghapus kolom stok_kuota dari tabel paket_wisata
```sql
ALTER TABLE paket_wisata 
DROP COLUMN stok_kuota;
```

### 3. Menghapus Tabel (`DROP TABLE`)
-- Menghapus tabel pemesanan jika ada
```sql
DROP TABLE IF EXISTS pemesanan;
```

---

## 📝 BUKTI EVALUASI II: LEMBAR TUGAS MANDIRI (RTM-2)

### Deskripsi Tugas

Mahasiswa diwajibkan menyelesaikan perancangan dan pembentukan database menggunakan kueri SQL DDL berdasarkan studi kasus dunia nyata (Tugas Mandiri RTM-2).

#### Ketentuan Pengerjaan:

1. Gunakan studi kasus bisnis digital yang telah dianalisis pada Tugas RTM-1.

2. Tuliskan seluruh kueri DDL SQL untuk membuat database, tabel-tabel berelasi, serta penentuan tipe data dan *constraint* yang tepat (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`).

3. Lakukan minimal 2 operasi modifikasi tabel menggunakan `ALTER TABLE`.

4. Kumpulkan laporan tertulis beserta *script file* `.sql` yang siap dieksekusi.



#### Rubrik Penilaian Evaluasi (Sesuai Dokumen RTM-2)

:

| No | Indikator Penilaian | Kriteria | Bobot (%) |
| --- | --- | --- | --- |
| 1 | Kerumitan Kasus | Kompleksitas kasus dunia nyata yang diangkat | 10% |
| 2 | Entitas, Atribut & Relasi | Ketepatan identifikasi entitas, atribut, dan relasi | 30% |
| 3 | Ketepatan Tipe Data | Kesesuaian pemilihan tipe data untuk tiap kolom  | 10% |
| 4 | Ketepatan Penggunaan DDL | Kerapihan, kebenaran sintaks, dan keberhasilan eksekusi kueri DDL | 50% |
| **Total** |  |  | **100%** |

---

## 📖 Daftar Pustaka & Referensi

### Buku Teks Utama
1. Fatansyah. (2012). *Basis Data*. Bandung: Informatika Bandung.
2. Ramakrishnan, Raghu & Gehrke, Johannes. (2004). *Sistem Manajemen Basis Data*. Yogyakarta: Andi Ofset.


### Jurnal & Prosiding Konferensi (Nasional & Internasional)

1. Desamsetti, H. (2020). Relational Database Management Systems in Business and Organization Strategies. *Global Disclosure of Economics and Business*, 9(2), 121–132. https://doi.org/10.18034/gdeb.v9i2.700
2. Hellerstein, J. M., Stonebraker, M., & Hamilton, J. (2007). Architecture of a Database System. *Foundations and Trends® in Databases*, 1(2), 141–259. https://doi.org/10.1561/1900000002
