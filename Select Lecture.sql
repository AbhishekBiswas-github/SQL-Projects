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
SELECT * FROM employees
WHERE first_name LIKE "Mark%";

SELECT * FROM employees
WHERE hire_date LIKE "2000%";

SELECT * FROM employees
WHERE emp_no LIKE "1000_";

-- Wildcard Characters Section
SELECT * FROM employees
WHERE first_name LIKE "%Jack%";

SELECT * FROM employees
WHERE first_name NOT LIKE "%Jack%";

-- Between Section
SELECT * FROM salaries
WHERE salary BETWEEN 66000 AND 70000;

SELECT * FROM salaries
WHERE emp_no NOT BETWEEN 10004 AND 10012;

SELECT dept_name FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

-- Is Not Null Section
SELECT dept_name FROM departments
WHERE dept_no IS NOT NULL;

-- Other comparison section
SELECT * FROM employees
WHERE YEAR(hire_date) >= '2000' AND gender = "F";

SELECT * FROM salaries
WHERE salary > 150000;

-- Select Distinct Section
SELECT DISTINCT hire_date FROM employees;

-- Aggregate function section
SELECT COUNT(*) FROM salaries
WHERE salary >= 100000;

SELECT COUNT(*) FROM dept_manager;

-- Order by section
SELECT * FROM employees
ORDER BY hire_date DESC;

-- Group By and Alias Section
SELECT 
    salary, COUNT(emp_no) AS 'emps_with_same_salary'
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary ASC;

-- Having Section
SELECT emp_no, AVG(salary) AS 'avg_salary' FROM salaries
GROUP BY emp_no
HAVING 'avg_salary' >120000
ORDER BY emp_no;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
