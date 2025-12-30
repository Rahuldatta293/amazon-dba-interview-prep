# Day 1 – SQL Fundamentals (Amazon DBA Prep)

## What is SQL?
SQL (Structured Query Language) is used to store, retrieve, and manipulate data in relational databases.

---

## Relational vs Non-Relational Databases

### Relational Databases
- Data stored in tables (rows & columns)
- Fixed schema
- Examples: MySQL, PostgreSQL, Oracle

### Non-Relational Databases
- Schema-less or flexible schema
- Data stored as documents, key-value, etc.
- Examples: MongoDB, DynamoDB

---

## Database Basics
- **Table**: Collection of rows and columns
- **Column**: Attribute of data
- **Row (Record)**: Single entry in a table
- **Field**: Individual data value

---

## SQL Keywords & Clauses Covered

### SELECT
Used to retrieve data from a table.

### FROM
Specifies the table to query.

### WHERE
Filters rows based on conditions.

### AS
Used to give an alias to columns.

### DISTINCT
Removes duplicate values.

---

## Operators
- Comparison: `=`, `>`, `<`, `>=`, `<=`, `!=`
- Logical: `AND`, `OR`, `NOT`
- Range: `BETWEEN`, `NOT BETWEEN`
- Set: `IN`, `NOT IN`
- Pattern: `LIKE`, `%`

---

## Sorting Data
- `ORDER BY`
- `ASC` (ascending)
- `DESC` (descending)

---

## Example Queries

```sql
SELECT * FROM employees;

SELECT name AS employee_name, salary
FROM employees
WHERE salary >= 60000;

SELECT DISTINCT department
FROM employees;

SELECT *
FROM employees
WHERE department IN ('IT', 'HR');

SELECT *
FROM employees
WHERE name LIKE 'A%';

SELECT *
FROM employees
ORDER BY salary DESC;

