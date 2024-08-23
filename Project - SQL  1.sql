-- Create the library database
CREATE DATABASE library;

-- Use the library database
USE library;

-- Create the Branch table
CREATE TABLE Branch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(255),
  Contact_no VARCHAR(20)
);

-- Create the Employee table
CREATE TABLE Employee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(255),
  Position VARCHAR(100),
  Salary DECIMAL(10, 2),
  Branch_no INT,
  FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Create the Books table
CREATE TABLE Books (
  ISBN VARCHAR(20) PRIMARY KEY,
  Book_title VARCHAR(255),
  Category VARCHAR(100),
  Rental_Price DECIMAL(10, 2),
  Status VARCHAR(10),
  Author VARCHAR(255),
  Publisher VARCHAR(255)
);

-- Create the Customer table
CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(255),
  Customer_address VARCHAR(255),
  Reg_date DATE
);

-- Create the IssueStatus table
CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(255),
  Issue_date DATE,
  Isbn_book VARCHAR(20),
  FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- Create the ReturnStatus table
CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(255),
  Return_date DATE,
  Isbn_book2 VARCHAR(20),
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

