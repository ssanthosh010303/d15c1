/*
 * Author: Sakthi Santhosh
 * Created on: 30/04/2024
 *
 * Day-15 Challenge-1: Database Schema for an Inventory Management System
 */
CREATE TABLE product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE supplier (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(255) NOT NULL,
    contact VARCHAR(255)
);

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    _address VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE purchase (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    purchase_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


CREATE TABLE product_supplier (
    product_id INT,
    supplier_id INT,
    PRIMARY KEY (product_id, supplier_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE purchase_detail (
    purchase_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (purchase_id) REFERENCES purchases(purchase_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
