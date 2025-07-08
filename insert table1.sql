-- Create the database
CREATE DATABASE IF NOT EXISTS university;
USE university;

-- Create the students table
CREATE TABLE IF NOT EXISTS students (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE,
  department VARCHAR(50),
  enrollment_date DATE
);

-- Insert some example student records
INSERT INTO students (name, email, department, enrollment_date)
VALUES
  ('Ayesha Rahman', 'ayesha.r@example.com', 'Computer Science', '2024-01-15'),
  ('Sajid Hossain', 'sajid.h@example.com', 'Economics', '2024-02-01'),
  ('Nadia Akter', 'nadia.a@example.com', 'Electrical Engineering', '2024-03-10'),
  ('Tariq Islam', 'tariq.i@example.com', 'Computer Science', '2024-02-28');

-- View all records
SELECT * FROM students;

-- Filter by department
SELECT name, email FROM students WHERE department = 'Computer Science';

-- Sort by enrollment date
SELECT * FROM students ORDER BY enrollment_date DESC;

-- Count how many students per department
SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department;

-- Show existing databases and structure
SHOW DATABASES;
SHOW TABLES;
DESCRIBE students;
