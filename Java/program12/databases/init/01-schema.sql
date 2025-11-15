CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;

CREATE TABLE IF NOT EXISTS students (
    roll_number VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    percentage INT CHECK (percentage >= 0 AND percentage <= 100)
);