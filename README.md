# 🧩 Human Resource Management System

### Task 7 – SQL: Tables, Views & Joins

---

## 📘 Project Overview

This project demonstrates how to create core HR tables, various SQL views, and use joins to generate reports from multiple tables. It includes:

1. Creating base tables (`employer`, `department1`)  
2. Populating them with sample data  
3. Defining and using multiple views  
4. Dropping views  
5. Joining across tables via a view

---

## 📂 Database Schema & Sample Data

### 1. Employer table

```sql
CREATE TABLE employer (
  empid    INT PRIMARY KEY,
  ename    VARCHAR(20) NOT NULL,
  dept     VARCHAR(35),
  salary   BIGINT
);

INSERT INTO employer (empid, ename, dept, salary) VALUES
  (101, 'john',  'hr',               230000),
  (102, 'vyom',  'sequal',           120000),
  (103, 'tom',   'it',              200000),
  (104, 'helly', 'order management', 190000),
  (105, 'dolly', 'hr',              320000);

1. employee_view
Shows full employer data:

CREATE VIEW employee_view AS
SELECT * FROM employer;

SELECT * FROM employee_view;

2. emp_view
Displays only employee name and salary:

CREATE VIEW emp_view AS
SELECT ename, salary FROM employer;

SELECT * FROM emp_view;

DROP VIEW emp_view;

3. e_view
Filters employees earning below 200 000 and renames columns:

CREATE VIEW e_view AS
SELECT empid,
       ename AS employee_name,
       dept,
       salary AS department
FROM employer
WHERE salary < 200000;

SELECT * FROM e_view;

📊 Joined Views

Combines employer and department data:

CREATE VIEW report_employees AS
SELECT e.empid,
       e.ename,
       e.salary,
       d.dept,
       d.location
FROM employer e
JOIN department1 d ON e.empid = d.empid;

SELECT * FROM report_employees;

5. report_mumbai
Filters only Mumbai-based employees:

CREATE VIEW report_mumbai AS
SELECT e.empid,
       d.dept,
       d.location
FROM employer e
JOIN department1 d ON e.empid = d.empid
WHERE d.location = 'mumbai';

SELECT * FROM report_mumbai;

🗑️ Dropping a View

DROP VIEW report_employees;
-- You can DROP report_mumbai similarly when testing completes.


✅ What You’ve Accomplished
Designed two relational tables (employer, department1)

Populated them with meaningful data

Created and manipulated five different views to show:

Full row data

Filtered and renamed columns

Joined data from two tables

Dropped views when no longer needed

This exercises abstraction, modular SQL, and join operations for generating reports.

🧠 Why Use Views?
🎯 Abstraction: Simplify complex queries behind reusable views

⚠️ Security: Expose only needed columns (e.g., hiding sensitive info)

🔄 Maintainability: Refactoring base tables won’t break dependent queries

🔗 Modularity: Easily chain views (e.g., view-on-view)

✨ How to Use This Repo
Clone or download this repository

Open your SQL client (SQLite, MySQL, etc.)

Execute table creation and insertion scripts

Run CREATE VIEW, SELECT, and DROP VIEW blocks

Inspect view outputs and experiment further!
