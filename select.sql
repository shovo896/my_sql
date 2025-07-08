-- Choose the database
USE university;

-- Show all tables in the current database
SHOW TABLES;

-- Show structure of the 'students' table
DESCRIBE students;

-- Select everything from the students table
SELECT * FROM students;

-- Select specific columns
SELECT name, department FROM students;

-- Filter rows using WHERE clause
SELECT * FROM students
WHERE department = 'Computer Science';

-- Use multiple conditions
SELECT name, email FROM students
WHERE department = 'Computer Science'
  AND enrollment_date >= '2024-01-01';

-- Use pattern matching with LIKE
SELECT * FROM students
WHERE name LIKE 'S%'; -- Finds names starting with 'S'

-- Use sorting with ORDER BY
SELECT * FROM students
WHERE department = 'Economics'
ORDER BY enrollment_date DESC;

-- Count how many students in each department
SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department;

-- Bonus: Show all available databases
SHOW DATABASES;
