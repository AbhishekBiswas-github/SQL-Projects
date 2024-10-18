-- Creating database
CREATE DATABASE coffee_db;

-- use the database
USE coffee_db;

-- Adding Primary Keys to the tables
ALTER TABLE customers
CHANGE `Customer ID` `Customer ID` VARCHAR(100) NOT NULL,
ADD PRIMARY KEY(`Customer ID`);

ALTER TABLE products
CHANGE `Product ID` `Product ID` VARCHAR(100) NOT NULL,
ADD PRIMARY KEY(`Product ID`);

-- Changing Order Date from text datatype to date datatype
ALTER TABLE orders ADD `New Order Date` DATE;
UPDATE orders SET `New Order Date` = STR_TO_DATE(`Order Date`, '%d-%m-%Y');
ALTER TABLE orders DROP COLUMN `Order Date`;
ALTER TABLE orders RENAME COLUMN `New Order Date` TO `Order Date`;

-- Adding Foreign Key
ALTER TABLE orders
CHANGE `Customer ID` `Customer ID` VARCHAR(100) NOT NULL,
ADD FOREIGN KEY(`Customer ID`) REFERENCES customers(`Customer ID`);

ALTER TABLE orders
CHANGE `Product ID` `Product ID` VARCHAR(100) NOT NULL,
ADD FOREIGN KEY(`Product ID`) REFERENCES products(`Product ID`);

-- Describe the tables
DESC customers;
DESC products;
DESC orders;