-- Show all the customers 
SELECT * FROM customers;


-- Fill Emply Values
UPDATE customers
SET `Email` = ''
WHERE `Email` = 'NA';

UPDATE customers
SET `Phone Number` = '+00 000-000-0000'
WHERE `Phone Number` = '';


-- total customers based on city
SELECT 
    `City`, COUNT(`Customer ID`) AS `Total Customers`
FROM
    customers
GROUP BY `City`
ORDER BY `Total Customers` DESC
LIMIT 10;

-- total customers based on Country
SELECT 
    `Country`, COUNT(`Customer ID`) AS `Total Customers`
FROM
    customers
GROUP BY `Country`
ORDER BY `Total Customers` DESC;


-- Total customers with email id and phone number missing
SELECT 
	COUNT(`Customer ID`) AS `Total Customers`
FROM 
	customers
WHERE `Email` = 'NA';

SELECT 
	COUNT(`Customer ID`) AS `Total Customers`
FROM 
	customers
WHERE `Phone Number` = '+00 000-000-0000';


-- Total stock of every coffee type
SELECT 
	`Coffee Type`,
    CONCAT(SUM(`Size`),' Kg') AS `Total Stock`
FROM 
	products
GROUP BY `Coffee Type`;


-- Coffee price breakdown by type with percentage contribution
SELECT 
	`Product ID`,
	`Coffee Type`,
    CONCAT('Rs ',`Unit Price`) AS `Unit Price`,
    CONCAT('Rs ',ROUND(SUM(`Unit Price`) OVER(PARTITION BY `Coffee Type`),2)) AS `Type Wise Total Price`,
    ROUND((`Unit Price` / SUM(`Unit Price`) OVER(PARTITION BY `Coffee Type`))*100,2) AS `Percent of Total Price`
FROM 
	products
ORDER BY `Coffee Type`, `Percent of Total Price` DESC;


-- yearly order distribution with total orders and contribution percentage
SELECT 
	DISTINCT(YEAR(`Order Date`)) AS `Year`,
    COUNT(`Order ID`) OVER() AS `Total Orders`,
    COUNT(`Order ID`) OVER (PARTITION BY YEAR(`Order Date`)) AS `Yearly Orders`,
    ROUND(COUNT(`Order ID`) OVER (PARTITION BY YEAR(`Order Date`)) / COUNT(`Order ID`) OVER(),2)*100 AS `Contribution Percentage`
FROM
    orders
ORDER BY `Contribution Percentage` DESC;


-- Top 5 most active customers with contact details
SELECT 
	c.`Customer ID`,
    `Customer Name`,
    CONCAT(`Address Line 1`, ', ', `City`, ', ', `Country`) AS `Address`,
    `Loyalty Card`,
    `Total Orders`
FROM 
	customers c
INNER JOIN 
(SELECT 
	`Customer ID`,
	COUNT(`Order ID`) AS `Total Orders`
FROM 
	orders 
GROUP BY `Customer ID`
ORDER  BY COUNT(`Order ID`) DESC
LIMIT 5) temp
ON c.`Customer ID` = temp.`Customer ID`;
    

-- Top 5 frequently ordered products with details and size
SELECT 
	p.`Product ID`,
    `Coffee Type`,
    `Roast Type`,
    `Unit Price`,
    `Size` AS `Size in Kilograms`
FROM 
	products p
INNER JOIN 
(SELECT 
	`Product ID`,
	COUNT(`Order ID`) AS `Total Orders`
FROM 
	orders 
GROUP BY `Product ID`
ORDER  BY COUNT(`Order ID`) DESC
LIMIT 5) temp
ON p.`Product ID` = temp.`Product ID`
ORDER  BY `Total Orders` DESC





