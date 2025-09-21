-- Select section
USE employees;

SELECT first_name, last_name
FROM employees;
    
SELECT * FROM employees;

SELECT dept_no FROM departments;

SELECT * FROM departments;

-- Where section
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
-- AND Section
SELECT * FROM employees
WHERE gender = "F" AND first_name = "Kellie";

-- OR Section
SELECT * FROM employees 
WHERE first_name = "Kellie" OR first_name = "Aruna"; 

-- Operator Presendence
SELECT * FROM employees 
WHERE gender = "F" AND (first_name = "Kellie" OR first_name = "Aruna");

-- IN and NOT IN section
SELECT * FROM employees
WHERE first_name IN ("Cathie", "Mark", "Nathan");

SELECT * FROM employees 
WHERE first_name IN ("Denis", "Elvis");

SELECT * FROM employees 
WHERE first_name NOT IN ("John", "Mark", "Jacob");

-- LIKE section

    

