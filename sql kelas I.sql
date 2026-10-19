/*
Dalam Bahasa SQLinstruksi query di kelompokan menjadi beberapa sub berdasarkan 
fungsinya
*/

/*
DDL (Data Definition Language): 
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
   kodebarang VARCHAR(5),
   CONSTRAINT `fk_photo_barang` 
    FOREIGN KEY (`kodebarang`) 
    REFERENCES `stokbarang` (`kodebarang`) 
    ON DELETE CASCADE 
    ON UPDATE CASCADE
);

insert  into `stokbarang`(`kodebarang`,`namabarang`,`stok`,`hargabeli`,`hargajual`,`deskripsi`) values 
('B001','Kemeja Flanel',56,73000,85000,'Kemeja flanel bahan katun'),
('B002','Celena Jeans',43,112500,120000,'Celana Jeans demin'),
('B003','Sepatu Sneaker',34,154000,175000,'Sepatu Sneaker casual');
-- Tabel reviewproduk

