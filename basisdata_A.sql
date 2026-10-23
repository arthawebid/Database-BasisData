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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoicedatail` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `invoices` */

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

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
