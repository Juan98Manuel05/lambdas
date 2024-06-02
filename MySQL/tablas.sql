/*
SQLyog Community v13.1.0 (64 bit)
MySQL - 10.4.22-MariaDB : Database - agregacion
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`agregacion` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert  into `product`(`id`,`name`,`category`) values 
(1,'xbox','console'),
(2,'ps3','console'),
(3,'nintendo','console'),
(4,'rocket league','game'),
(5,'horizon zero down','game'),
(6,'auriculares','widget'),
(7,'camara','widget'),
(8,'microfono','widget'),
(9,'backrooms','game');

DROP TABLE IF EXISTS `sale`;

CREATE TABLE `sale` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `sale_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

insert  into `sale`(`id`,`product_id`,`date`,`quantity`,`price`) values 
(1,1,'2024-05-30',3,120.99),
(2,2,'2024-05-27',15,139.99),
(3,3,'2024-05-29',10,159.99),
(4,4,'2024-05-28',14,5.99),
(5,5,'2024-05-30',16,8.99),
(6,6,'2024-05-26',12,33.99),
(7,7,'2024-05-30',15,49.99),
(8,8,'2024-05-25',20,59.99),
(9,9,'2024-05-30',11,9.99),
(10,2,'2024-04-17',3,139.99),
(11,4,'2024-04-23',3,5.99),
(12,9,'2024-04-16',10,9.99),
(13,5,'2024-04-23',1,8.99),
(14,8,'2024-04-14',1,59.99),
(15,7,'2024-04-23',2,49.99);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
