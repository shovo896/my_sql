-- Step 1: Drop existing tables if they exist (for re-runs)
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

-- Step 2: Create the departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Step 3: Create the students table with foreign key reference to departments
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Step 4: Insert data into departments
INSERT INTO departments (dept_name) VALUES 
('Computer Science'),
('Electrical Engineering'),
('Mechanical Engineering');

-- Step 5: Insert data into students (linked by dept_id)
INSERT INTO students (student_name, dept_id) VALUES 
('Alice', 1),
('Bob', 2),
('Charlie', 3),
('David', 1),
('Eve', NULL);  -- Eve not assigned to any department

-- Step 6: Join and display data from both tables
SELECT 
    students.student_id,
    students.student_name,
    departments.dept_name AS department
FROM 
    students
LEFT JOIN 
    departments ON students.dept_id = departments.dept_id;
