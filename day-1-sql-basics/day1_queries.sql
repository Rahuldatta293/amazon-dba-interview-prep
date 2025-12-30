-- Day 1: SQL Basics Practice

-- Select all columns
SELECT * FROM employees;

-- Select specific columns
SELECT name, department
FROM employees;

-- Using WHERE clause
SELECT *
FROM employees
WHERE department = 'IT';

-- Comparison operators
SELECT *
FROM employees
WHERE salary >= 60000;

-- AND operator
SELECT *
FROM employees
WHERE department = 'IT'
AND salary >= 60000;

-- OR operator
SELECT *
FROM employees
WHERE department = 'HR'
OR department = 'Finance';

-- NOT operator
SELECT *
FROM employees
WHERE NOT department = 'Sales';

-- BETWEEN
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 80000;

-- IN
SELECT *
FROM employees
WHERE department IN ('IT', 'HR');

-- LIKE with wildcard
SELECT *
FROM employees
WHERE name LIKE 'A%';

-- DISTINCT
SELECT DISTINCT department
FROM employees;

-- ORDER BY
SELECT *
FROM employees
ORDER BY salary DESC;

