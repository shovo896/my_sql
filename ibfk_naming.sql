-- Step 1: Drop existing tables (for safe re-run)
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

-- Step 2: Create 'departments' table (parent)
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Step 3: Create 'students' table (child) with NAMED FOREIGN KEY
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    dept_id INT,

    --  NAMED FOREIGN KEY (instead of ibfk_1)
    CONSTRAINT fk_student_department
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Step 4: Insert department data
INSERT INTO departments (dept_name) VALUES
('Computer Science'),
('Electrical Engineering'),
('Mechanical Engineering');

-- Step 5: Insert student data
INSERT INTO students (student_name, dept_id) VALUES
('Alice', 1),
('Bob', 2),
('Charlie', 3),
('David', 1),
('Eve', NULL);

-- Step 6: View joined data
SELECT 
    s.student_id,
    s.student_name,
    d.dept_name AS department
FROM 
    students s
LEFT JOIN 
    departments d ON s.dept_id = d.dept_id;
