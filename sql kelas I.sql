/*
Dalam Bahasa SQLinstruksi query di kelompokan menjadi beberapa sub berdasarkan 
fungsinya
*/

/*
DDL (Data Definition Language): 
untuk membuat (mendefinisikan), mengubah definisi (struktur), 
menghapus definisi (struktur)  
Download: https://tinyurl.com/DB-dbase-I
*/
CREATE DATABASE PenjualanProduk;
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

insert  into `photoproduk`(`kodephoto`,`filephoto`,`iscover`,`kodebarang`) values 
(1,'Kemeja Flano01.jpg',1,'B001'),
(2,'sneaker02.jpg',1,'B003'),
(3,'sneaker01.jpg',0,'B003'),
(4,'Celana Jeans01.jpg',1,'B002'),
(5,'Celana Jeans02.jpg',0,'B002'),
(6,'Celana Jeans03.jpg',0,'B002');


CREATE DATABASE IF NOT EXISTS PenjualanProduk;
USE PenjualanProduk;

-- urut DROP dibalik (anak dulu) agar tidak melanggar FK
DROP TABLE IF EXISTS detailpenjualan, penjualan, reviewproduk,
                     photoproduk, member, kasir, stokbarang;

-- Tabel induk barang
CREATE TABLE stokbarang(
    kodebarang  VARCHAR(5) PRIMARY KEY,
    namabarang  VARCHAR(50) NOT NULL,
    stok        FLOAT,
    hargabeli   FLOAT,
    hargajual   FLOAT,
    deskripsi   TEXT
);

-- Tabel kasir
CREATE TABLE kasir(
    idkasir    INT PRIMARY KEY AUTO_INCREMENT,
    namakasir  VARCHAR(50) NOT NULL,
    telepon    VARCHAR(15)
);

-- Tabel member
CREATE TABLE member(
    idmember      INT PRIMARY KEY AUTO_INCREMENT,
    nama          VARCHAR(50) NOT NULL,
    alamat        VARCHAR(100),
    telepon       VARCHAR(15),
    email         VARCHAR(50),
    tanggalmember DATE
);

-- Tabel photo produk (1 barang : m photo)
CREATE TABLE photoproduk(
    kodephoto  INT PRIMARY KEY AUTO_INCREMENT,
    filephoto  VARCHAR(50) NOT NULL,
    iscover    BOOLEAN DEFAULT FALSE,
    kodebarang VARCHAR(5),
    CONSTRAINT fk_photo_barang FOREIGN KEY (kodebarang)
        REFERENCES stokbarang(kodebarang)
        ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabel review (1 barang : m review, 1 member : m review)
CREATE TABLE reviewproduk(
    kordereview   INT PRIMARY KEY AUTO_INCREMENT,
    kodebarang    VARCHAR(5) NOT NULL,
    idmember      INT NOT NULL,
    rating        TINYINT,
    isireview     TEXT,
    tanggalreview DATETIME,
    CONSTRAINT fk_review_barang FOREIGN KEY (kodebarang)
        REFERENCES stokbarang(kodebarang)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_review_member FOREIGN KEY (idmember)
        REFERENCES member(idmember)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT chk_rating CHECK (rating BETWEEN 1 AND 5)
);

-- Tabel header penjualan (1 member : m transaksi, 1 kasir : m transaksi)
CREATE TABLE penjualan(
    kodepenjualan    CHAR(5) PRIMARY KEY,
    tanggalpenjualan DATETIME,
    idmember         INT,
    idkasir          INT,
    CONSTRAINT fk_jual_member FOREIGN KEY (idmember)
        REFERENCES member(idmember)
        ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_jual_kasir FOREIGN KEY (idkasir)
        REFERENCES kasir(idkasir)
        ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabel detail penjualan (m : 1 ke penjualan, m : 1 ke stokbarang)
CREATE TABLE detailpenjualan(
    kodepenjualan CHAR(5),
    kodebarang    VARCHAR(5),
    jumlahbeli    INT,
    hargajual     FLOAT,
    PRIMARY KEY (kodepenjualan, kodebarang),
    CONSTRAINT fk_detail_jual FOREIGN KEY (kodepenjualan)
        REFERENCES penjualan(kodepenjualan)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_detail_barang FOREIGN KEY (kodebarang)
        REFERENCES stokbarang(kodebarang)
        ON DELETE CASCADE ON UPDATE CASCADE
);

