create database carrental_db;

CREATE TABLE carrental_db.admin (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
)

CREATE TABLE carrental_db.carstbl (
  `num_reg` varchar(20) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`num_reg`)
)

CREATE TABLE carrental_db.clientstbl (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
)

CREATE TABLE carrental_db.locationtbl (
  `num_reg` varchar(45) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `customerName` varchar(45) NOT NULL,
  `returnFee` double NOT NULL,
  PRIMARY KEY (`num_reg`)
)

CREATE TABLE carrental_db.returntbl (
  `num_reg` VARCHAR(45) NOT NULL,
  `returnDate` VARCHAR(45) NOT NULL,
  `retard` INT NOT NULL,
  `amende` DOUBLE NOT NULL,
  PRIMARY KEY (`num_reg`));