/*
Dalam Bahasa SQLinstruksi query di kelompokan menjadi beberapa sub berdasarkan 
fungsinya
*/

/*
DDL (Data Define Language): 
untuk membuat (mendefinisikan), mengubah definisi (struktur), 
menghapus definisi (struktur)  
*/
CREATE DATABASE PenjualanProduk;
DROP DATABASE PenjualanProduk;

DROP TABLE stokbarang;

USE PenjualanProduk;

-- membuat tabel stokbarang
CREATE TABLE stokbarang(
    kodebarang VARCHAR(5) PRIMARY KEY,
    namabarang VARCHAR(50) NOT NULL,
    stok FLOAT,
    hargabeli FLOAT,
    hargajual FLOAT,
    deskripsi TEXT   		
);

-- Tabel photoproduk
CREATE TABLE photoproduk(
   kodephoto INT PRIMARY KEY AUTO_INCREMENT,
   filephoto VARCHAR(50) NOT NULL,
   iscover BOOLEAN DEFAULT FALSE,
   kodebarang VARCHAR(5)
);

-- Tabel reviewproduk

