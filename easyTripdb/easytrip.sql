/*
SQLyog Trial v12.3.1 (64 bit)
MySQL - 5.7.15-log : Database - easytrip
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`easytrip` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `easytrip`;

/*Table structure for table `accessory` */

DROP TABLE IF EXISTS `accessory`;

CREATE TABLE `accessory` (
  `acc_id` varchar(40) DEFAULT NULL,
  `acc_name` varchar(40) DEFAULT NULL,
  `total_number` int(11) DEFAULT NULL,
  `available_number` int(11) DEFAULT NULL,
  `hour_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `accessory` */

/*Table structure for table `booking_accessories` */

DROP TABLE IF EXISTS `booking_accessories`;

CREATE TABLE `booking_accessories` (
  `booking_id` varchar(45) NOT NULL,
  `accessory_id` varchar(45) DEFAULT NULL,
  `accessory_count` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `booking_accessories` */

/*Table structure for table `booking_detail` */

DROP TABLE IF EXISTS `booking_detail`;

CREATE TABLE `booking_detail` (
  `booking_id` varchar(45) NOT NULL,
  `customer_name` varchar(45) DEFAULT NULL,
  `customer_id` varchar(45) DEFAULT NULL,
  `customer_age` int(11) DEFAULT NULL,
  `customer_phone` varchar(45) DEFAULT NULL,
  `location_id` varchar(45) DEFAULT NULL,
  `insurance_id` varchar(45) DEFAULT NULL,
  `rental_price` varchar(45) DEFAULT NULL,
  `driver_license` varchar(45) DEFAULT NULL,
  `booking_time` varchar(45) DEFAULT NULL,
  `booking_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `booking_detail` */

/*Table structure for table `booking_time` */

DROP TABLE IF EXISTS `booking_time`;

CREATE TABLE `booking_time` (
  `booking_id` varchar(45) NOT NULL,
  `vehicle_vin` varchar(45) DEFAULT NULL,
  `vehicle_id` varchar(45) DEFAULT NULL,
  `vehicle_type` varchar(45) DEFAULT NULL,
  `start_time` time(6) DEFAULT NULL,
  `end_time` time(6) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `booking_time` */

/*Table structure for table `booking_transaction` */

DROP TABLE IF EXISTS `booking_transaction`;

CREATE TABLE `booking_transaction` (
  `Booking_id` varchar(45) NOT NULL,
  `name_on_card` varchar(45) DEFAULT NULL,
  `card_number` varchar(45) DEFAULT NULL,
  `card_expiry_date` date DEFAULT NULL,
  `card_cvv` int(11) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `card_type` varchar(45) DEFAULT NULL,
  `address1` varchar(45) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `booking_transaction` */

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `password` varchar(40) NOT NULL,
  `email_id` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `license_no` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customer` */

/*Table structure for table `insurance` */

DROP TABLE IF EXISTS `insurance`;

CREATE TABLE `insurance` (
  `policy_number` varchar(40) DEFAULT NULL,
  `insurance_name` varchar(40) DEFAULT NULL,
  `insurance_type` varchar(40) DEFAULT NULL,
  `cost_covered` int(11) DEFAULT NULL,
  `insurance_company` varchar(45) DEFAULT NULL,
  `insurance_price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `insurance` */

/*Table structure for table `location` */

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `location_id` varchar(40) NOT NULL,
  `location_name` varchar(40) DEFAULT NULL,
  `location_pin` varchar(40) DEFAULT NULL,
  `location_city` varchar(4) DEFAULT NULL,
  `location_state` varchar(40) DEFAULT NULL,
  `location_country` varchar(40) DEFAULT NULL,
  `location_phone` varchar(45) DEFAULT NULL,
  `operation_hour` varchar(45) DEFAULT NULL,
  `location_address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `location` */

/*Table structure for table `vehicle_info` */

DROP TABLE IF EXISTS `vehicle_info`;

CREATE TABLE `vehicle_info` (
  `vehicle_id` varchar(45) NOT NULL,
  `vehicle_price` varchar(45) DEFAULT NULL,
  `vehicle_milage` varchar(45) DEFAULT NULL,
  `vehicle_passenger` int(11) DEFAULT NULL,
  `vehicle_sluggage` int(11) DEFAULT NULL,
  `vehicle_lluggage` int(11) DEFAULT NULL,
  `vehicle_transmission` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vehicle_info` */

/*Table structure for table `vehicles` */

DROP TABLE IF EXISTS `vehicles`;

CREATE TABLE `vehicles` (
  `vehicle_vin` varchar(40) NOT NULL,
  `vehicle_id` varchar(40) NOT NULL,
  `vehicle_type` varchar(45) DEFAULT NULL,
  `vehicle_make` varchar(45) DEFAULT NULL,
  `vehicle_model` varchar(40) DEFAULT NULL,
  `location_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vehicle_vin`,`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vehicles` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
