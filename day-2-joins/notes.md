Day 2 – SQL Joins (Amazon DBA Prep)
What is a JOIN?

A JOIN combines rows from two or more tables using a related column (join key) between them.

INNER JOIN (or JOIN)

Returns only the rows where there is a match in both tables.

Example
SELECT e.name, d.department_name
FROM employees e.
INNER JOIN departments d
ON e.department_id = d.id;


✅ Use when: you only want records that exist in both tables (matched data only).

LEFT JOIN (LEFT OUTER JOIN)

Returns all rows from the left table + matching rows from the right table.
If there is no match, right table columns become NULL.

Example
SELECT e.name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.id;


✅ Use when: you want all left-side records, even if related data is missing.
Example: “List all employees, even those without a department.”

RIGHT JOIN (RIGHT OUTER JOIN)

Returns all rows from the right table + matching rows from the left table.
If there is no match, left table columns become NULL.

Example
SELECT e.name, d.department_name
FROM employees e
RIGHT JOIN departments d
ON e.department_id = d.id;


✅ Use when: you want all right-side records, even if left-side data is missing.
Example: “Show all departments, even those with no employees.”

Note: Many teams prefer rewriting RIGHT JOIN as a LEFT JOIN by swapping table order (same result, easier readability).

OUTER JOIN (Concept)

“Outer join” means returning rows even when there isn’t a match.

LEFT JOIN = Left Outer Join

RIGHT JOIN = Right Outer Join

FULL OUTER JOIN = rows from both sides, matched when possible, otherwise NULLs on the missing side
(Some databases support FULL OUTER JOIN directly; some don’t.)

FULL OUTER JOIN example (if supported)
SELECT e.name, d.department_name
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.id;


✅ Use when: you want everything from both tables, matched where possible.

Key Differences (Interview Friendly)

INNER JOIN → only matching rows

LEFT JOIN → all left rows + matches (NULL if no match)

RIGHT JOIN → all right rows + matches (NULL if no match)

FULL OUTER JOIN → all rows from both sides, matched when possible

Interview Explanation (How I Would Say It)

“INNER JOIN returns only matched records between tables. LEFT JOIN is useful when I need all rows from my main table even if related data is missing, which helps identify gaps like employees without departments. RIGHT JOIN is similar but keeps all rows from the right table. Outer joins include non-matching rows.”

Practice Source

YouTube tutorial videos

W3Schools SQL JOIN exercises

What I Still Need to Practice

Choosing the correct join type based on the question

Understanding NULLs from outer joins

Avoiding mistakes when combining JOIN + WHERE filters
