/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - mentari
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mentari` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `mentari`;

/*Table structure for table `invoicedatail` */

DROP TABLE IF EXISTS `invoicedatail`;

CREATE TABLE `invoicedatail` (
  `iddetail` int(11) NOT NULL AUTO_INCREMENT,
  `idinvoice` int(11) NOT NULL,
  `idbarang` varchar(5) NOT NULL,
  `qty` int(11) NOT NULL,
  `diskon` float DEFAULT NULL,
  PRIMARY KEY (`iddetail`),
  KEY `fk_detail_invoice` (`idinvoice`),
  KEY `fk_detail_stok` (`idbarang`),
  CONSTRAINT `fk_detail_invoice` FOREIGN KEY (`idinvoice`) REFERENCES `invoices` (`idinvoice`) ON UPDATE CASCADE,
  CONSTRAINT `fk_detail_stok` FOREIGN KEY (`idbarang`) REFERENCES `stokbarang` (`idbarang`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoicedatail` */

insert  into `invoicedatail`(`iddetail`,`idinvoice`,`idbarang`,`qty`,`diskon`) values 
(1,1,'B0001',1,30000),
(2,1,'B0003',1,0),
(3,2,'B0001',1,30000),
(4,2,'B0003',1,0),
(5,2,'B0002',3,0),
(6,3,'B0001',1,0),
(7,3,'B0002',1,0),
(8,4,'B0002',5,0);

/*Table structure for table `invoices` */

DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `invoices` (
  `idinvoice` int(11) NOT NULL AUTO_INCREMENT,
  `tgl` date NOT NULL,
  `jam` time NOT NULL,
  `penerima` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tbayar` float DEFAULT NULL,
  `kasir` varchar(25) DEFAULT NULL,
  `diskon` float DEFAULT NULL,
  PRIMARY KEY (`idinvoice`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoices` */

insert  into `invoices`(`idinvoice`,`tgl`,`jam`,`penerima`,`alamat`,`tbayar`,`kasir`,`diskon`) values 
(1,'2026-10-02','09:15:00','Yuandi','Denpasar Selatan',453000,'yulia',11000),
(2,'2026-10-02','09:30:00','Yuruf','Denpasar barat',43000,'yulia',3000),
(3,'2026-10-02','09:45:00','Rufiana','Denpasar Selatan',433000,'sandy',10000),
(4,'2026-10-02','12:15:00','Wahyuari','Gianyar',35000,'yulia',5000);

/*Table structure for table `stokbarang` */

DROP TABLE IF EXISTS `stokbarang`;

CREATE TABLE `stokbarang` (
  `idbarang` varchar(5) NOT NULL,
  `namabarang` varchar(50) NOT NULL,
  `hargabarang` float NOT NULL,
  `stok` int(11) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `jenis` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idbarang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `stokbarang` */

insert  into `stokbarang`(`idbarang`,`namabarang`,`hargabarang`,`stok`,`deskripsi`,`jenis`) values 
('B0001','Sepatu Bot',125000,50,'Sepatu bot berkualitas super','sepatu'),
('B0002','Baju Renang',25475,45,NULL,'baju'),
('B0003','Celana Renang',20400,48,NULL,'celana');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
