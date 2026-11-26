/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - tokoabc
*********************************************************************
*/

/*!40101 SET NAMES utf8mb4 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`tokoabc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `tokoabc`;

/* =====================================================================
   1. TABEL MEMBER (Dari ERD)
   ===================================================================== */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `kodemember` varchar(5) NOT NULL,
  `nama` varchar(40) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`kodemember`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `member` (`kodemember`, `nama`, `nohp`, `alamat`) VALUES
('M0001', 'Putu Ari Wibawa', '081236001001', 'Jl. Tukad Badung No. 12, Denpasar'),
('M0002', 'Kadek Ayu Lestari', '081236001002', 'Jl. Gunung Agung No. 45, Denpasar'),
('M0003', 'Komang Bagus Pratama', '081236001003', 'Jl. Teuku Umar No. 88, Denpasar'),
('M0004', 'Ketut Sari Dewi', '081236001004', 'Jl. Gatot Subroto Barat No. 19, Denpasar'),
('M0005', 'Made Dwi Saputra', '081236001005', 'Jl. Raya Kuta No. 104, Badung'),
('M0006', 'Nengah Yanti Rahayu', '081236001006', 'Jl. Bypass Ngurah Rai No. 210, Kuta'),
('M0007', 'Wayan Surya Kusuma', '081236001007', 'Jl. Sunset Road No. 57, Seminyak'),
('M0008', 'Gede Hendra Wijaya', '081236001008', 'Jl. Dalung Permai Blok C4, Kuta Utara'),
('M0009', 'Luh Putu Maharani', '081236001009', 'Jl. Cokroaminoto No. 73, Denpasar'),
('M0010', 'I Gusti Agung Bagus', '081236001010', 'Jl. Hayam Wuruk No. 31, Denpasar'),
('M0011', 'Ni Luh Kartika Sari', '081236001011', 'Jl. Diponegoro No. 142, Denpasar'),
('M0012', 'Anak Agung Ngurah Putra', '081236001012', 'Jl. Raya Ubud No. 66, Gianyar'),
('M0013', 'Desak Nyoman Melati', '081236001013', 'Jl. Ciung Wanara No. 25, Gianyar'),
('M0014', 'Ida Bagus Oka Mahendra', '081236001014', 'Jl. Puputan Renon No. 9, Denpasar'),
('M0015', 'Putu Eka Darmawan', '081236001015', 'Jl. Sesetan No. 118, Denpasar Selatan'),
('M0016', 'Kadek Rina Anggraini', '081236001016', 'Jl. Tukad Yeh Aya No. 54, Denpasar'),
('M0017', 'Komang Adi Santosa', '081236001017', 'Jl. Mahendradatta No. 91, Denpasar Barat'),
('M0018', 'Ketut Gita Pertiwi', '081236001018', 'Jl. Ahmad Yani Utara No. 160, Denpasar'),
('M0019', 'Made Bayu Permana', '081236001019', 'Jl. Raya Mengwi No. 28, Badung'),
('M0020', 'Nengah Tari Wulandari', '081236001020', 'Jl. Kapten Agung No. 14, Tabanan'),
('M0021', 'Wayan Yoga Nugraha', '081236001021', 'Jl. Dr. Ir. Soekarno No. 77, Tabanan'),
('M0022', 'Gede Krisna Aditya', '081236001022', 'Jl. Merdeka No. 40, Klungkung'),
('M0023', 'Luh Made Citra Dewi', '081236001023', 'Jl. Untung Surapati No. 63, Semarapura'),
('M0024', 'I Gusti Ngurah Alit', '081236001024', 'Jl. Veteran No. 18, Bangli'),
('M0025', 'Ni Komang Triana Putri', '081236001025', 'Jl. Ngurah Rai No. 82, Amlapura'),
('M0026', 'Anak Agung Rai Kusuma', '081236001026', 'Jl. A. Yani No. 105, Singaraja'),
('M0027', 'Desak Putu Ratna Sari', '081236001027', 'Jl. Udayana No. 49, Singaraja'),
('M0028', 'Ida Bagus Komang Jaya', '081236001028', 'Jl. Sudirman No. 120, Negara'),
('M0029', 'Putu Vera Novitasari', '081236001029', 'Jl. Sanur Kauh No. 37, Denpasar Selatan'),
('M0030', 'Kadek Reza Pahlevi', '081236001030', 'Jl. Pulau Kawe No. 22, Denpasar');

/* =====================================================================
   2. TABEL PRODUK (Data Awal + Tambahan hingga 50 baris)
   ===================================================================== */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `kodeproduk` varchar(5) NOT NULL,
  `namaproduk` varchar(50) NOT NULL,
  `hargajual` float NOT NULL,
  `stok` float NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `beratproduk` float DEFAULT NULL,
  `tgl_exp` date DEFAULT NULL,
  `jenisproduk` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`kodeproduk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `produk` (`kodeproduk`,`namaproduk`,`hargajual`,`stok`,`deskripsi`,`beratproduk`,`tgl_exp`,`jenisproduk`) VALUES
('P0001','Mama Melon',12300,2543,'Minuman segar sepanjang masa',150,'2028-10-15','Minuman'),
('P0002','Mama baeGon',3300,250,'Snack gurih dan renyah',2,'2028-11-17','Snack'),
('P0003','Teh Botol Segar Jasmine',4500,600,'Minuman teh melati siap minum',330,'2027-08-20','Minuman'),
('P0004','Kopi Susu Gula Aren',8500,420,'Kopi susu creamy dengan gula aren asli',250,'2027-06-15','Minuman'),
('P0005','Air Mineral Pegunungan',3500,1500,'Air mineral murni kemasan botol',600,'2028-12-31','Minuman'),
('P0006','Jus Jeruk Valencia',9500,310,'Minuman rasa jeruk segar tanpa pengawet berlebih',240,'2027-07-10','Minuman'),
('P0007','Susu Coklat Malt',7800,520,'Susu cair rasa coklat malt bernutrisi',200,'2027-09-05','Minuman'),
('P0008','Keripik Singkong Pedas Manis',11000,480,'Keripik singkong renyah dengan bumbu balado',120,'2027-10-12','Snack'),
('P0009','Biskuit Kelapa Panggang',13500,360,'Biskuit renyah aroma kelapa panggang',180,'2027-11-25','Snack'),
('P0010','Wafer Coklat Lapis',9000,640,'Wafer renyah dengan krim coklat tebal',110,'2027-08-30','Snack'),
('P0011','Kacang Panggang Bawang',14500,290,'Kacang tanah panggang gurih rasa bawang',150,'2027-07-22','Snack'),
('P0012','Makaroni Pedas Level 5',8000,510,'Makaroni goreng pedas gurih untuk camilan',100,'2027-09-18','Snack'),
('P0013','Beras Ramos Super 5kg',72500,180,'Beras putih pulen kualitas pilihan',5000,'2027-12-20','Sembako'),
('P0014','Minyak Goreng Sawit 1L',18500,340,'Minyak goreng jernih untuk kebutuhan memasak',1000,'2027-11-11','Sembako'),
('P0015','Gula Pasir Kristal Putih 1kg',17000,400,'Gula pasir manis bersih kemasan 1 kilogram',1000,'2028-05-01','Sembako'),
('P0016','Tepung Terigu Serbaguna 1kg',12500,320,'Tepung terigu halus untuk aneka kue dan gorengan',1000,'2027-10-08','Sembako'),
('P0017','Telur Ayam Negeri 1kg',28000,210,'Telur ayam segar pilihan per kilogram',1000,'2026-12-28','Sembako'),
('P0018','Mie Instan Kuah Soto',3500,1200,'Mie instan kuah soto gurih praktis disajikan',85,'2027-06-30','Makanan Instan'),
('P0019','Mie Instan Goreng Spesial',3600,1350,'Mie goreng klasik dengan bumbu lengkap',85,'2027-07-15','Makanan Instan'),
('P0020','Bubur Ayam Instan',6500,410,'Bubur instan hangat dengan topping lengkap',90,'2027-05-20','Makanan Instan'),
('P0021','Sarden Kaleng Saus Tomat',14000,275,'Ikan sarden dalam saus tomat gurih',155,'2028-04-10','Makanan Kaleng'),
('P0022','Kornet Sapi Kaleng',24500,190,'Daging kornet sapi olahan siap masak',200,'2028-03-15','Makanan Kaleng'),
('P0023','Sabun Mandi Cair Susu',21000,260,'Sabun cair lembut dengan ekstrak susu',450,'2028-06-01','Perawatan Diri'),
('P0024','Shampoo Anti Ketombe Mint',23500,230,'Shampoo segar dengan sensasi dingin mint',340,'2028-07-19','Perawatan Diri'),
('P0025','Pasta Gigi Herbal Fresh',12000,450,'Pasta gigi perlindungan napas segar sepanjang hari',160,'2028-08-22','Perawatan Diri'),
('P0026','Sikat Gigi Lembut Dewasa',8500,500,'Sikat gigi bulu halus nyaman di gusi',35,NULL,'Perawatan Diri'),
('P0027','Deodorant Roll On Segar',16500,280,'Perlindungan kesegaran hingga 24 jam',50,'2028-05-14','Perawatan Diri'),
('P0028','Deterjen Cair Konsentrat 800ml',19500,310,'Deterjen cair efektif angkat noda pakaian',800,'2028-09-10','Kebersihan Rumah'),
('P0029','Sabun Cuci Piring Jeruk Nipis',11500,470,'Sabun cuci piring kesat dan wangi jeruk nipis',750,'2028-10-05','Kebersihan Rumah'),
('P0030','Pembersih Lantai Pine',15000,240,'Pembersih lantai aroma pinus menyegarkan',800,'2028-08-30','Kebersihan Rumah'),
('P0031','Tisu Wajah Lembut 250s',14500,390,'Tisu wajah halus dan kuat untuk harian',220,NULL,'Kebersihan Rumah'),
('P0032','Kecap Manis Kedelai Hitam',13000,360,'Kecap manis kental dari kedelai pilihan',275,'2027-11-30','Bumbu Dapur'),
('P0033','Saus Sambal Extra Pedas',10500,430,'Saus sambal pedas mantap untuk pelengkap makan',340,'2027-10-25','Bumbu Dapur'),
('P0034','Saus Tiram Gurih',12500,295,'Saus tiram untuk aneka tumisan lezat',255,'2027-09-28','Bumbu Dapur'),
('P0035','Bumbu Kaldu Ayam Bubuk',6000,650,'Penyedap rasa kaldu ayam gurih',100,'2027-08-14','Bumbu Dapur'),
('P0036','Garam Beryodium Halus 500g',4500,580,'Garam dapur halus beryodium kemasan praktis',500,'2029-01-01','Bumbu Dapur'),
('P0037','Margarin Serbaguna 200g',8500,330,'Margarin lembut untuk menumis dan baking',200,'2027-07-04','Bumbu Dapur'),
('P0038','Roti Tawar Gandum Utuh',15500,160,'Roti tawar lembut tinggi serat untuk sarapan',400,'2026-12-10','Roti & Bakery'),
('P0039','Roti Sisir Mentega Manis',12000,185,'Roti sisir empuk dengan aroma mentega',220,'2026-12-12','Roti & Bakery'),
('P0040','Kue Lapis Coklat Slice',14000,140,'Kue lapis lembut rasa coklat klasik',250,'2026-12-15','Roti & Bakery'),
('P0041','Es Krim Coklat Vanila',16000,195,'Es krim lembut perpaduan coklat dan vanila',300,'2027-04-18','Frozen & Dairy'),
('P0042','Keju Cheddar Olahan 170g',22500,220,'Keju cheddar gurih kaya kalsium',170,'2027-05-27','Frozen & Dairy'),
('P0043','Yogurt Drink Stroberi',8500,370,'Minuman yogurt rasa stroberi segar',250,'2027-02-14','Frozen & Dairy'),
('P0044','Sosis Ayam Siap Makan 6pcs',19000,205,'Sosis ayam gurih cocok untuk camilan dan lauk',240,'2027-03-09','Frozen & Dairy'),
('P0045','Permen Mint Segar Pack',7500,540,'Permen rasa mint menyegarkan mulut',120,'2028-02-20','Snack'),
('P0046','Coklat Batang Kacang Mete',17500,265,'Coklat susu dengan potongan kacang mete gurih',90,'2027-12-05','Snack'),
('P0047','Popcorn Karamel Manis',12500,315,'Popcorn renyah berlapis karamel manis',130,'2027-06-22','Snack'),
('P0048','Kopi Hitam Bubuk Robusta',16000,285,'Kopi bubuk robusta aroma kuat khas Nusantara',200,'2028-01-30','Minuman'),
('P0049','Minuman Isotonik Lemon',7000,490,'Minuman penyegar elektrolit rasa lemon',350,'2027-09-12','Minuman'),
('P0050','Susu Kental Manis Putih',11500,380,'Susu kental manis untuk minuman dan topping',370,'2027-11-02','Frozen & Dairy');

/* =====================================================================
   3. TABEL PHOTOPRODUK (Minimal 2 foto per produk -> 100 baris)
   ===================================================================== */

DROP TABLE IF EXISTS `photoproduk`;

CREATE TABLE `photoproduk` (
  `kodephoto` varchar(5) NOT NULL,
  `namaphoto` varchar(255) NOT NULL,
  `deskripsi` text NOT NULL,
  `iscover` tinyint(1) NOT NULL,
  `kodeproduk` varchar(5) NOT NULL,
  PRIMARY KEY (`kodephoto`),
  KEY `kodeproduk` (`kodeproduk`),
  CONSTRAINT `photoproduk_ibfk_1` FOREIGN KEY (`kodeproduk`) REFERENCES `produk` (`kodeproduk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `photoproduk` (`kodephoto`, `namaphoto`, `deskripsi`, `iscover`, `kodeproduk`) VALUES
('F0001', 'p0001_cover.jpg', 'Foto utama kemasan depan Mama Melon', 1, 'P0001'),
('F0002', 'p0001_detail.jpg', 'Foto komposisi dan tanggal kadaluarsa Mama Melon', 0, 'P0001'),
('F0003', 'p0002_cover.jpg', 'Foto utama kemasan depan Mama baeGon', 1, 'P0002'),
('F0004', 'p0002_detail.jpg', 'Foto tampilan snack Mama baeGon', 0, 'P0002'),
('F0005', 'p0003_cover.jpg', 'Foto utama Teh Botol Segar Jasmine', 1, 'P0003'),
('F0006', 'p0003_detail.jpg', 'Foto informasi nilai gizi Teh Botol Segar Jasmine', 0, 'P0003'),
('F0007', 'p0004_cover.jpg', 'Foto utama Kopi Susu Gula Aren', 1, 'P0004'),
('F0008', 'p0004_detail.jpg', 'Foto kemasan botol Kopi Susu Gula Aren', 0, 'P0004'),
('F0009', 'p0005_cover.jpg', 'Foto utama Air Mineral Pegunungan 600ml', 1, 'P0005'),
('F0010', 'p0005_detail.jpg', 'Foto tutup segel Air Mineral Pegunungan', 0, 'P0005'),
('F0011', 'p0006_cover.jpg', 'Foto utama Jus Jeruk Valencia', 1, 'P0006'),
('F0012', 'p0006_detail.jpg', 'Foto bagian belakang Jus Jeruk Valencia', 0, 'P0006'),
('F0013', 'p0007_cover.jpg', 'Foto utama Susu Coklat Malt', 1, 'P0007'),
('F0014', 'p0007_detail.jpg', 'Foto sedotan dan kemasan Susu Coklat Malt', 0, 'P0007'),
('F0015', 'p0008_cover.jpg', 'Foto utama Keripik Singkong Pedas Manis', 1, 'P0008'),
('F0016', 'p0008_detail.jpg', 'Foto tekstur keripik singkong pedas manis', 0, 'P0008'),
('F0017', 'p0009_cover.jpg', 'Foto utama Biskuit Kelapa Panggang', 1, 'P0009'),
('F0018', 'p0009_detail.jpg', 'Foto isi kemasan Biskuit Kelapa Panggang', 0, 'P0009'),
('F0019', 'p0010_cover.jpg', 'Foto utama Wafer Coklat Lapis', 1, 'P0010'),
('F0020', 'p0010_detail.jpg', 'Foto lapisan krim Wafer Coklat Lapis', 0, 'P0010'),
('F0021', 'p0011_cover.jpg', 'Foto utama Kacang Panggang Bawang', 1, 'P0011'),
('F0022', 'p0011_detail.jpg', 'Foto bagian belakang Kacang Panggang Bawang', 0, 'P0011'),
('F0023', 'p0012_cover.jpg', 'Foto utama Makaroni Pedas Level 5', 1, 'P0012'),
('F0024', 'p0012_detail.jpg', 'Foto label pedas Makaroni Pedas Level 5', 0, 'P0012'),
('F0025', 'p0013_cover.jpg', 'Foto utama karung Beras Ramos Super 5kg', 1, 'P0013'),
('F0026', 'p0013_detail.jpg', 'Foto butiran Beras Ramos Super 5kg', 0, 'P0013'),
('F0027', 'p0014_cover.jpg', 'Foto utama Minyak Goreng Sawit 1L', 1, 'P0014'),
('F0028', 'p0014_detail.jpg', 'Foto label kemasan Minyak Goreng Sawit 1L', 0, 'P0014'),
('F0029', 'p0015_cover.jpg', 'Foto utama Gula Pasir Kristal Putih 1kg', 1, 'P0015'),
('F0030', 'p0015_detail.jpg', 'Foto berat bersih Gula Pasir Kristal Putih 1kg', 0, 'P0015'),
('F0031', 'p0016_cover.jpg', 'Foto utama Tepung Terigu Serbaguna 1kg', 1, 'P0016'),
('F0032', 'p0016_detail.jpg', 'Foto saran penyajian Tepung Terigu Serbaguna', 0, 'P0016'),
('F0033', 'p0017_cover.jpg', 'Foto utama Telur Ayam Negeri 1kg', 1, 'P0017'),
('F0034', 'p0017_detail.jpg', 'Foto kondisi cangkang Telur Ayam Negeri', 0, 'P0017'),
('F0035', 'p0018_cover.jpg', 'Foto utama Mie Instan Kuah Soto', 1, 'P0018'),
('F0036', 'p0018_detail.jpg', 'Foto bumbu Mie Instan Kuah Soto', 0, 'P0018'),
('F0037', 'p0019_cover.jpg', 'Foto utama Mie Instan Goreng Spesial', 1, 'P0019'),
('F0038', 'p0019_detail.jpg', 'Foto cara penyajian Mie Instan Goreng Spesial', 0, 'P0019'),
('F0039', 'p0020_cover.jpg', 'Foto utama Bubur Ayam Instan', 1, 'P0020'),
('F0040', 'p0020_detail.jpg', 'Foto topping Bubur Ayam Instan', 0, 'P0020'),
('F0041', 'p0021_cover.jpg', 'Foto utama Sarden Kaleng Saus Tomat', 1, 'P0021'),
('F0042', 'p0021_detail.jpg', 'Foto bagian atas kaleng Sarden Saus Tomat', 0, 'P0021'),
('F0043', 'p0022_cover.jpg', 'Foto utama Kornet Sapi Kaleng', 1, 'P0022'),
('F0044', 'p0022_detail.jpg', 'Foto informasi komposisi Kornet Sapi Kaleng', 0, 'P0022'),
('F0045', 'p0023_cover.jpg', 'Foto utama Sabun Mandi Cair Susu', 1, 'P0023'),
('F0046', 'p0023_detail.jpg', 'Foto botol Sabun Mandi Cair Susu', 0, 'P0023'),
('F0047', 'p0024_cover.jpg', 'Foto utama Shampoo Anti Ketombe Mint', 1, 'P0024'),
('F0048', 'p0024_detail.jpg', 'Foto bagian belakang Shampoo Anti Ketombe Mint', 0, 'P0024'),
('F0049', 'p0025_cover.jpg', 'Foto utama Pasta Gigi Herbal Fresh', 1, 'P0025'),
('F0050', 'p0025_detail.jpg', 'Foto tube Pasta Gigi Herbal Fresh', 0, 'P0025'),
('F0051', 'p0026_cover.jpg', 'Foto utama Sikat Gigi Lembut Dewasa', 1, 'P0026'),
('F0052', 'p0026_detail.jpg', 'Foto kepala sikat Sikat Gigi Lembut Dewasa', 0, 'P0026'),
('F0053', 'p0027_cover.jpg', 'Foto utama Deodorant Roll On Segar', 1, 'P0027'),
('F0054', 'p0027_detail.jpg', 'Foto aplikator Deodorant Roll On Segar', 0, 'P0027'),
('F0055', 'p0028_cover.jpg', 'Foto utama Deterjen Cair Konsentrat 800ml', 1, 'P0028'),
('F0056', 'p0028_detail.jpg', 'Foto takaran Deterjen Cair Konsentrat', 0, 'P0028'),
('F0057', 'p0029_cover.jpg', 'Foto utama Sabun Cuci Piring Jeruk Nipis', 1, 'P0029'),
('F0058', 'p0029_detail.jpg', 'Foto label Sabun Cuci Piring Jeruk Nipis', 0, 'P0029'),
('F0059', 'p0030_cover.jpg', 'Foto utama Pembersih Lantai Pine', 1, 'P0030'),
('F0060', 'p0030_detail.jpg', 'Foto kemasan Pembersih Lantai Pine', 0, 'P0030'),
('F0061', 'p0031_cover.jpg', 'Foto utama Tisu Wajah Lembut 250s', 1, 'P0031'),
('F0062', 'p0031_detail.jpg', 'Foto lubang dispenser Tisu Wajah Lembut', 0, 'P0031'),
('F0063', 'p0032_cover.jpg', 'Foto utama Kecap Manis Kedelai Hitam', 1, 'P0032'),
('F0064', 'p0032_detail.jpg', 'Foto bagian belakang Kecap Manis Kedelai Hitam', 0, 'P0032'),
('F0065', 'p0033_cover.jpg', 'Foto utama Saus Sambal Extra Pedas', 1, 'P0033'),
('F0066', 'p0033_detail.jpg', 'Foto kemasan botol Saus Sambal Extra Pedas', 0, 'P0033'),
('F0067', 'p0034_cover.jpg', 'Foto utama Saus Tiram Gurih', 1, 'P0034'),
('F0068', 'p0034_detail.jpg', 'Foto saran olahan Saus Tiram Gurih', 0, 'P0034'),
('F0069', 'p0035_cover.jpg', 'Foto utama Bumbu Kaldu Ayam Bubuk', 1, 'P0035'),
('F0070', 'p0035_detail.jpg', 'Foto kemasan sachet/pack Bumbu Kaldu Ayam', 0, 'P0035'),
('F0071', 'p0036_cover.jpg', 'Foto utama Garam Beryodium Halus 500g', 1, 'P0036'),
('F0072', 'p0036_detail.jpg', 'Foto bagian belakang Garam Beryodium Halus', 0, 'P0036'),
('F0073', 'p0037_cover.jpg', 'Foto utama Margarin Serbaguna 200g', 1, 'P0037'),
('F0074', 'p0037_detail.jpg', 'Foto kemasan cup Margarin Serbaguna', 0, 'P0037'),
('F0075', 'p0038_cover.jpg', 'Foto utama Roti Tawar Gandum Utuh', 1, 'P0038'),
('F0076', 'p0038_detail.jpg', 'Foto irisan Roti Tawar Gandum Utuh', 0, 'P0038'),
('F0077', 'p0039_cover.jpg', 'Foto utama Roti Sisir Mentega Manis', 1, 'P0039'),
('F0078', 'p0039_detail.jpg', 'Foto lapisan Roti Sisir Mentega Manis', 0, 'P0039'),
('F0079', 'p0040_cover.jpg', 'Foto utama Kue Lapis Coklat Slice', 1, 'P0040'),
('F0080', 'p0040_detail.jpg', 'Foto potongan Kue Lapis Coklat Slice', 0, 'P0040'),
('F0081', 'p0041_cover.jpg', 'Foto utama Es Krim Coklat Vanila', 1, 'P0041'),
('F0082', 'p0041_detail.jpg', 'Foto kemasan Es Krim Coklat Vanila', 0, 'P0041'),
('F0083', 'p0042_cover.jpg', 'Foto utama Keju Cheddar Olahan 170g', 1, 'P0042'),
('F0084', 'p0042_detail.jpg', 'Foto bagian belakang Keju Cheddar Olahan', 0, 'P0042'),
('F0085', 'p0043_cover.jpg', 'Foto utama Yogurt Drink Stroberi', 1, 'P0043'),
('F0086', 'p0043_detail.jpg', 'Foto botol Yogurt Drink Stroberi', 0, 'P0043'),
('F0087', 'p0044_cover.jpg', 'Foto utama Sosis Ayam Siap Makan 6pcs', 1, 'P0044'),
('F0088', 'p0044_detail.jpg', 'Foto isi kemasan Sosis Ayam Siap Makan', 0, 'P0044'),
('F0089', 'p0045_cover.jpg', 'Foto utama Permen Mint Segar Pack', 1, 'P0045'),
('F0090', 'p0045_detail.jpg', 'Foto bagian belakang Permen Mint Segar', 0, 'P0045'),
('F0091', 'p0046_cover.jpg', 'Foto utama Coklat Batang Kacang Mete', 1, 'P0046'),
('F0092', 'p0046_detail.jpg', 'Foto potongan mete pada Coklat Batang', 0, 'P0046'),
('F0093', 'p0047_cover.jpg', 'Foto utama Popcorn Karamel Manis', 1, 'P0047'),
('F0094', 'p0047_detail.jpg', 'Foto kemasan Popcorn Karamel Manis', 0, 'P0047'),
('F0095', 'p0048_cover.jpg', 'Foto utama Kopi Hitam Bubuk Robusta', 1, 'P0048'),
('F0096', 'p0048_detail.jpg', 'Foto bagian belakang Kopi Hitam Robusta', 0, 'P0048'),
('F0097', 'p0049_cover.jpg', 'Foto utama Minuman Isotonik Lemon', 1, 'P0049'),
('F0098', 'p0049_detail.jpg', 'Foto label Minuman Isotonik Lemon', 0, 'P0049'),
('F0099', 'p0050_cover.jpg', 'Foto utama Susu Kental Manis Putih', 1, 'P0050'),
('F0100', 'p0050_detail.jpg', 'Foto kaleng Susu Kental Manis Putih', 0, 'P0050');

/* =====================================================================
   4. TABEL TRANSJUALS (Data Awal + Tambahan hingga 100 baris)
   ===================================================================== */

DROP TABLE IF EXISTS `transjuals`;

CREATE TABLE `transjuals` (
  `kodepenjualan` varchar(5) NOT NULL,
  `tgl` date NOT NULL,
  `jam` time NOT NULL,
  `kasir` varchar(25) NOT NULL,
  `diskon` float DEFAULT NULL,
  `kodemember` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`kodepenjualan`),
  KEY `kodemember` (`kodemember`),
  CONSTRAINT `transjuals_ibfk_1` FOREIGN KEY (`kodemember`) REFERENCES `member` (`kodemember`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `transjuals` (`kodepenjualan`,`tgl`,`jam`,`kasir`,`diskon`,`kodemember`) VALUES
('00001','2026-09-30','09:30:12','Ketut',0,'M0001'),
('00002','2026-09-30','09:35:31','Komang',0,'M0002');

/* Generate 98 transaksi tambahan (00003 s.d. 00100) dengan kasir & member valid */
DROP PROCEDURE IF EXISTS `seed_transjuals`;
DELIMITER $$
CREATE PROCEDURE `seed_transjuals`()
BEGIN
  DECLARE i INT DEFAULT 3;
  DECLARE v_kode varchar(5);
  DECLARE v_tgl date;
  DECLARE v_jam time;
  DECLARE v_kasir varchar(25);
  DECLARE v_diskon float;
  DECLARE v_member varchar(5);

  WHILE i <= 100 DO
    SET v_kode = LPAD(i, 5, '0');
    SET v_tgl = DATE_ADD('2026-09-30', INTERVAL (i MOD 45) DAY);
    SET v_jam = SEC_TO_TIME(32400 + ((i * 377) MOD 46800));
    SET v_kasir = ELT(1 + (i MOD 4), 'Ketut', 'Komang', 'Made', 'Wayan');
    SET v_diskon = CASE WHEN i MOD 5 = 0 THEN 5 ELSE 0 END;
    SET v_member = CONCAT('M', LPAD(1 + ((i - 1) MOD 30), 4, '0'));

    INSERT INTO `transjuals` (`kodepenjualan`, `tgl`, `jam`, `kasir`, `diskon`, `kodemember`)
    VALUES (v_kode, v_tgl, v_jam, v_kasir, v_diskon, v_member);

    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;

CALL `seed_transjuals`();
DROP PROCEDURE IF EXISTS `seed_transjuals`;

/* =====================================================================
   5. TABEL TRANSJUALDETAILS (Data Awal + 6 Produk per Transaksi)
   ===================================================================== */

DROP TABLE IF EXISTS `transjualdetails`;

CREATE TABLE `transjualdetails` (
  `kodetransjualdetail` bigint(20) NOT NULL AUTO_INCREMENT,
  `kodepenjualan` varchar(5) NOT NULL,
  `kodeproduk` varchar(5) NOT NULL,
  `qty` float NOT NULL,
  `diskon` float DEFAULT NULL,
  PRIMARY KEY (`kodetransjualdetail`),
  KEY `kodepenjualan` (`kodepenjualan`),
  KEY `kodeproduk` (`kodeproduk`),
  CONSTRAINT `transjualdetails_ibfk_1` FOREIGN KEY (`kodepenjualan`) REFERENCES `transjuals` (`kodepenjualan`),
  CONSTRAINT `transjualdetails_ibfk_2` FOREIGN KEY (`kodeproduk`) REFERENCES `produk` (`kodeproduk`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `transjualdetails` (`kodetransjualdetail`,`kodepenjualan`,`kodeproduk`,`qty`,`diskon`) VALUES
(1,'00001','P0001',5,0),
(2,'00001','P0002',3,0),
(3,'00002','P0002',8,0);

/* Tambahan 6 baris detail unik per transaksi (00001 s.d. 00100) */
DROP PROCEDURE IF EXISTS `seed_transjualdetails`;
DELIMITER $$
CREATE PROCEDURE `seed_transjualdetails`()
BEGIN
  DECLARE t INT DEFAULT 1;
  DECLARE item_idx INT;
  DECLARE prod_num INT;
  DECLARE v_kodepenjualan varchar(5);
  DECLARE v_kodeproduk varchar(5);
  DECLARE v_qty float;
  DECLARE v_diskon float;

  WHILE t <= 100 DO
    SET v_kodepenjualan = LPAD(t, 5, '0');
    SET item_idx = 0;

    WHILE item_idx < 6 DO
      SET prod_num = 1 + (((t * 6) + (item_idx * 7)) MOD 50);
      SET v_kodeproduk = CONCAT('P', LPAD(prod_num, 4, '0'));

      /* Hindari duplikat kodeproduk pada transaksi yang sama */
      IF NOT EXISTS (
        SELECT 1 FROM `transjualdetails`
        WHERE `kodepenjualan` = v_kodepenjualan AND `kodeproduk` = v_kodeproduk
      ) THEN
        SET v_qty = 1 + ((t + item_idx) MOD 5);
        SET v_diskon = CASE WHEN (t + item_idx) MOD 7 = 0 THEN 2.5 ELSE 0 END;

        INSERT INTO `transjualdetails` (`kodepenjualan`, `kodeproduk`, `qty`, `diskon`)
        VALUES (v_kodepenjualan, v_kodeproduk, v_qty, v_diskon);
      END IF;

      SET item_idx = item_idx + 1;
    END WHILE;

    SET t = t + 1;
  END WHILE;
END$$
DELIMITER ;

CALL `seed_transjualdetails`();
DROP PROCEDURE IF EXISTS `seed_transjualdetails`;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;