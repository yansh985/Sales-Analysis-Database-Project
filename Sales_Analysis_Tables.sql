CREATE DATABASE SalesAnalysis;
USE SalesAnalysis;


-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    contact_email VARCHAR(100),
    country VARCHAR(50)
);
-- drop table Customers;


-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10, 2),
    category VARCHAR(50)
);
-- drop table Products;


-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
-- drop table Orders;


-- Order Details Table
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    discount DECIMAL(5, 2),
    shipping_fee DECIMAL(5, 2),
    status VARCHAR(20),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
-- drop table Order_Details;