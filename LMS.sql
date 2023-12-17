show databases;
drop database library;
drop database information_schema;
CREATE DATABASE LMS;
USE LMS;
CREATE TABLE Books (
  Book_ID INT PRIMARY KEY NOT NULL,
  Title VARCHAR(50) NOT NULL,
  Number_of_copies INT NOT NULL,
  Genre VARCHAR(10) NOT NULL,
  Type VARCHAR(15),
  Publication_Year YEAR NOT NULL
  );
  CREATE TABLE Authors (
  Book_ID INT NOT NULL PRIMARY KEY,
  Author_Name VARCHAR(20) NOT NULL,
  Author_Email VARCHAR(20) NOT NULL,
  FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);
CREATE TABLE Publishers (
  Publisher_ID INT PRIMARY KEY NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Address VARCHAR(30) NOT NULL,
  Phone_Number VARCHAR(15) NOT NULL
);
CREATE TABLE Book_Publishers (
  Book_ID INT NOT NULL,
  Publisher_ID INT NOT NULL,
  PRIMARY KEY (Book_ID, Publisher_ID),
  FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
  FOREIGN KEY (Publisher_ID) REFERENCES Publishers(Publisher_ID)
);
CREATE TABLE Employees (
  Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
  Employee_Name VARCHAR(50) NOT NULL,
  Employee_Number INT NOT NULL UNIQUE,
  Designation VARCHAR(20) NOT NULL,
  Joining_Date DATE NOT NULL
);
CREATE TABLE Salary (
  Designation VARCHAR(20) NOT NULL PRIMARY KEY,
  Salary DECIMAL(10,2) NOT NULL
);
CREATE TABLE Borrowers (
  Borrower_ID INT PRIMARY KEY AUTO_INCREMENT,
  Card_Number INT NOT NULL UNIQUE,
  Borrower_Name VARCHAR(50) NOT NULL,
  Borrower_Phone_Number VARCHAR(15) NOT NULL,
  Occupation VARCHAR(20) NOT NULL,
  Borrower_DOB DATE NOT NULL,
  Registration_Date DATE NOT NULL,
  Borrower_Address VARCHAR(30) NOT NULL
);
CREATE TABLE Loans (
  Loan_ID INT PRIMARY KEY AUTO_INCREMENT,
  Card_Number INT NOT NULL,
  Book_ID INT NOT NULL,
  Employee_ID INT NOT NULL,
  Transaction_Date DATETIME NOT NULL,
  Is_Issue BOOLEAN NOT NULL DEFAULT TRUE,
  Due_Date DATETIME,
  FOREIGN KEY (Card_Number) REFERENCES Borrowers(Card_Number),
  FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
);
CREATE TABLE Genres(
Title VARCHAR(50) NOT NULL,
Genre VARCHAR(10) NOT NULL,
PRIMARY KEY (Title)
);

CREATE TABLE TYPES(
Genre VARCHAR(10) NOT NULL,
Type VARCHAR(15) not null,
PRIMARY KEY (Genre)
);


