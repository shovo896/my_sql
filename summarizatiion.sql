
-- Drop and create the database
DROP DATABASE IF EXISTS full_course_demo;
CREATE DATABASE full_course_demo;
USE full_course_demo;


-- SECTION 1: TABLES AND CONSTRAINTS

CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) CHECK(salary >= 0),
    join_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


-- SECTION 2: INSERTION


-- Insert Departments
INSERT INTO departments(dept_name) VALUES ('HR'), ('Engineering'), ('Finance');

-- Insert Employees
INSERT INTO employees(emp_name, email, salary, join_date, dept_id) VALUES
('Alice', 'alice@example.com', 70000, '2021-03-01', 1),
('Bob', 'bob@example.com', 90000, '2022-05-21', 2),
('Charlie', 'charlie@example.com', 60000, '2023-01-10', 3),
('David', 'david@example.com', 120000, '2020-12-15', 2),
('Eva', 'eva@example.com', 95000, '2023-07-18', 1);


-- SECTION 3: SELECT & FILTERING

-- Basic Select
SELECT * FROM employees;

-- WHERE clause
SELECT emp_name, salary FROM employees WHERE salary > 80000;

-- ORDER BY
SELECT emp_name, join_date FROM employees ORDER BY join_date DESC;

-- GROUP BY & HAVING
SELECT dept_id, COUNT(*) AS total_employees, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 70000;

-- ===========================================
-- SECTION 4: JOIN OPERATIONS
-- ===========================================

-- INNER JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;

-- LEFT JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id;

-- RIGHT JOIN
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;

-- FULL OUTER JOIN simulation using UNION
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN departments d ON e.dept_id = d.dept_id
UNION
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN departments d ON e.dept_id = d.dept_id;


-- SECTION 5: SUBQUERIES


-- Scalar Subquery
SELECT emp_name FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);

-- Correlated Subquery
SELECT emp_name, salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary) FROM employees e2 WHERE e2.dept_id = e1.dept_id
);



CREATE VIEW high_earners AS
SELECT emp_name, salary FROM employees WHERE salary > 80000;

SELECT * FROM high_earners;

-- ===========================================
-- SECTION 7: INDEXES
-- ===========================================

CREATE INDEX idx_salary ON employees(salary);


-- SECTION 8: STORED PROCEDURE


DELIMITER //

CREATE PROCEDURE GetEmployeeCountByDept(IN d_id INT)
BEGIN
    SELECT COUNT(*) AS total FROM employees WHERE dept_id = d_id;
END;
//

DELIMITER ;

CALL GetEmployeeCountByDept(2);


-- SECTION 9: FUNCTIONS

DELIMITER //

CREATE FUNCTION YearJoined(join_date DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN YEAR(join_date);
END;
//

DELIMITER ;

SELECT emp_name, YearJoined(join_date) FROM employees;


-- Triggers 

CREATE TABLE emp_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    action_type VARCHAR(20),
    action_time DATETIME
);

DELIMITER //

CREATE TRIGGER after_emp_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO emp_audit(emp_id, action_type, action_time)
    VALUES (NEW.emp_id, 'INSERT', NOW());
END;
//

CREATE TRIGGER after_emp_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO emp_audit(emp_id, action_type, action_time)
    VALUES (NEW.emp_id, 'UPDATE', NOW());
END;
//

CREATE TRIGGER after_emp_delete
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO emp_audit(emp_id, action_type, action_time)
    VALUES (OLD.emp_id, 'DELETE', NOW());
END;
//

DELIMITER ;

-- Test Triggers
UPDATE employees SET salary = salary + 5000 WHERE emp_name = 'Alice';
DELETE FROM employees WHERE emp_name = 'Charlie';


-- SECTION 11: TRANSACTIONS


START TRANSACTION;
UPDATE employees SET salary = salary - 10000 WHERE emp_name = 'David';
ROLLBACK;

START TRANSACTION;
UPDATE employees SET salary = salary - 5000 WHERE emp_name = 'David';
COMMIT;


-- SECTION 12: CONTROL FLOW


-- Using CASE
SELECT emp_name, 
CASE 
    WHEN salary > 100000 THEN 'High'
    WHEN salary BETWEEN 70000 AND 100000 THEN 'Medium'
    ELSE 'Low'
END AS salary_band
FROM employees;


-- SECTION 13: USER & PRIVILEGES
-- (only works with root/admin privileges)


-- CREATE USER 'course_user'@'localhost' IDENTIFIED BY 'demo123';
-- GRANT SELECT, INSERT ON full_course_demo.* TO 'course_user'@'localhost';


-- SECTION 14: FINAL CHECKS

-- Final View of All Tables
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM emp_audit;

-- Drop everything if needed (cleanup)
-- DROP DATABASE full_course_demo;


-- END OF SCRIPT




