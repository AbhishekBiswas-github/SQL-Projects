-- Section 5
CREATE DATABASE IF NOT EXISTS sales;

USE sales;

--  Section 6
-- Primary Key
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

DROP TABLE items;

DROP TABLE companies;


CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
PRIMARY KEY (customer_id)
);

ALTER TABLE customers
ADD COLUMN gender ENUM('M', 'F') AFTER last_name;

INSERT INTO customers (first_name, last_name, gender, email_address, number_of_complaints)
VALUES ('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

CREATE TABLE companies
(
	company_id VARCHAR(255),
    company_name VARCHAR(255),
    headquarters_phone_number  VARCHAR(255)
);

ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR (255) DEFAULT "x";

DROP TABLE companies;

-- Lecture Not Null
ALTER TABLE companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR (255) DEFAULT NULL;

INSERT INTO companies(company_id, company_name) VALUES ("1","asd");
SELECT 
    *
FROM
    companies;

DELETE FROM companies;

ALTER TABLE companies CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR (255) NOT NULL;

DROP DATABASE retail_store;
