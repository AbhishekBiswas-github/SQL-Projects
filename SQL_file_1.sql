CREATE DATABASE IF NOT EXISTS sales;

USE sales;

CREATE TABLE sales 
(
	purchase_number INT AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(20) NOT NULL,
PRIMARY KEY (purchase_number)
);

CREATE TABLE customers
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

SELECT * FROM customers;

SELECT * FROM sales.customers;

DROP TABLE sales;

DROP TABLE customers;

-- creating items table 
CREATE TABLE items
(
	item_code  VARCHAR(255),
    item  VARCHAR(255),
    unit_price NUMERIC(10,2),
    company­_id VARCHAR(255),
PRIMARY KEY (item_code)
);

--  creating companies table
CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name  VARCHAR(255),
    headquarters_phone_number INT(12),
PRIMARY KEY (company_id)
);

ALTER TABLE sales
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE;

ALTER TABLE sales
DROP FOREIGN KEY sales_ibfk_1;
