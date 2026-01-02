
They should **NOT** be in the file.

---

## ✅ CORRECT FINAL CONTENT (NO ` ```md ` ANYWHERE)

Below is the **correct version**.  
👉 Paste this **directly** into the file **WITHOUT adding any wrapper**.

---

### ✅ Paste from here ↓↓↓

## COUNT
Used to count the number of rows.

- `COUNT(*)` counts all rows  
- `COUNT(column)` counts only non-NULL values  

```sql
SELECT COUNT(*) AS total_employees
FROM employees;

SUM

Used to calculate the total of a numeric column.

SELECT SUM(salary) AS total_salary
FROM employees;

AVG

Used to calculate the average of a numeric column.

SELECT AVG(salary) AS average_salary
FROM employees;

GROUP BY

Groups rows that share the same value.

SELECT department_id,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department_id;

ORDER BY with Aggregations

Sorts aggregated results.

SELECT department_id,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY avg_salary DESC;

WHERE vs HAVING (VERY IMPORTANT)

WHERE filters rows before aggregation

HAVING filters grouped results after aggregation

SELECT department_id,
       COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 3;

LIKE (%) with Aggregations

LIKE is used with WHERE for pattern-based filtering.

SELECT COUNT(*) AS employees_starting_with_A
FROM employees
WHERE full_name LIKE 'A%';

Interview Explanation (How I Would Say It)

Aggregate functions summarize data across rows. GROUP BY defines grouping logic. WHERE filters rows before grouping, while HAVING filters aggregated results.

Practice Source

W3Schools SQL exercises

Areas to Improve

Combining JOINs with GROUP BY

Choosing HAVING vs WHERE correctly

Explaining aggregated results in business terms
