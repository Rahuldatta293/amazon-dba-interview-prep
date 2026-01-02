-- Day 3: Aggregation Practice

-- MIN and MAX salary
SELECT MIN(salary) AS min_salary,
       MAX(salary) AS max_salary
FROM employees;

-- Total employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Total salary per department
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;

-- Average salary per department
SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id;

-- Departments with more than 3 employees
SELECT department_id, COUNT(*) AS emp_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 3;

-- Employees with names starting with 'A'
SELECT COUNT(*) 
FROM employees
WHERE full_name LIKE 'A%';

