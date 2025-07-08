-- Create database (optional)
CREATE DATABASE IF NOT EXISTS school;
USE school;

-- Drop table if it already exists
DROP TABLE IF EXISTS students;

-- Create students table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    grade VARCHAR(5)
);

-- Insert sample data
INSERT INTO students (name, grade) VALUES
('Ayesha', 'A'),
('Karim', 'B'),
('Tanvir', 'C');

-- Update Tanvir's grade to B+
UPDATE students
SET grade = 'B+'
WHERE name = 'Tanvir';

-- Delete Karim's record
DELETE FROM students
WHERE name = 'Karim';

-- View remaining data
SELECT * FROM students;
