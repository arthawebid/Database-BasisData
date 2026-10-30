/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - tokoabc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tokoabc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `tokoabc`;

/*Table structure for table `produk` */

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

/*Data for the table `produk` */

insert  into `produk`(`kodeproduk`,`namaproduk`,`hargajual`,`stok`,`deskripsi`,`beratproduk`,`tgl_exp`,`jenisproduk`) values 
('P0001','Mama Melon',12300,2543,'Minuman segar sepanjang masa',150,'2028-10-15','Minuman'),
('P0002','Mama baeGon',3300,250,'Snack gurih dan renyah',2,'2028-11-17','Snack');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
