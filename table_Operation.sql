USE mydb;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5,2),
    hire_date DATE
);

1. Insert records
INSERT INTO employees (employee_id, first_name, last_name, hourly_pay, hire_date)
VALUES 
    (1, 'John', 'Doe', 20.50, '2024-06-01'),
    (2, 'Jane', 'Smith', 22.75, '2023-09-15'),
    (3, 'Alice', 'Johnson', 19.00, '2025-01-10');
2. Select all records
SELECT * FROM employees;

 5. Select specific columns
SELECT first_name, hourly_pay FROM employees;


3. Update a record
UPDATE employees
SET hourly_pay = 25.00
WHERE employee_id = 2;

 4. Delete a record
DELETE FROM employees
WHERE employee_id = 3;

5. Show structure of the table
DESCRIBE employees;

6. Drop the table (CAUTION: deletes everything)
DROP TABLE employees;
