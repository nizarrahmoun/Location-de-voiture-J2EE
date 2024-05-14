create database carrental_db;

CREATE TABLE carrental_db.`admin` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
)