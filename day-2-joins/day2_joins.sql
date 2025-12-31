-- Day 2: SQL JOINs Practice
-- Sample tables assumed:
-- employees(id, name, department_id, salary)
-- departments(id, department_name)

--------------------------------------------------
-- INNER JOIN
-- Returns only matching rows from both tables
--------------------------------------------------
SELECT e.id,
       e.name,
       d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.id;

--------------------------------------------------
-- LEFT JOIN
-- Returns all employees, even if they have no department
--------------------------------------------------
SELECT e.id,
       e.name,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.id;

--------------------------------------------------
-- LEFT JOIN with NULL filter
-- Find employees without a department
--------------------------------------------------
SELECT e.id,
       e.name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.id
WHERE d.id IS NULL;

--------------------------------------------------
-- RIGHT JOIN
-- Returns all departments, even if they have no employees
--------------------------------------------------
SELECT e.name,
       d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.id;

--------------------------------------------------
-- RIGHT JOIN rewritten as LEFT JOIN (recommended style)
--------------------------------------------------
SELECT e.name,
       d.department_name
FROM departments d
LEFT JOIN employees e
ON e.department_id = d.id;

--------------------------------------------------
-- OUTER JOIN (Conceptual – if supported by DB)
-- Returns all rows from both tables
--------------------------------------------------
SELECT e.name,
       d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.id;

--------------------------------------------------
-- JOIN with WHERE condition
--------------------------------------------------
SELECT e.name,
       d.department_name,
       e.salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.id
WHERE e.salary > 60000;

--------------------------------------------------
-- JOIN with ORDER BY
--------------------------------------------------
SELECT e.name,
       d.department_name,
       e.salary
FROM employees e
INNER JOIN departments d
ON e.department_id = d.id
ORDER BY e.salary DESC;

