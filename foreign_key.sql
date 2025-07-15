--  Drop existing tables first (if any)
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;

--  Create the 'departments' table (parent table)
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

--  Create the 'students' table (child table) with a FOREIGN KEY
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    dept_id INT,  -- 🔗 This will be the FOREIGN KEY

    --  Foreign Key Constraint
    FOREIGN KEY (dept_id) 
        REFERENCES departments(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Insert sample departments
INSERT INTO departments (dept_name) VALUES 
('Computer Science'), 
('Electrical Engineering'), 
('Mechanical Engineering');

--  Insert students linked to departments using dept_id
INSERT INTO students (student_name, dept_id) VALUES
('Alice', 1),
('Bob', 2),
('Charlie', 3),
('David', 1),
('Eve', NULL);  -- Eve has no department

--  View students with their department names using JOIN
SELECT 
    s.student_id,
    s.student_name,
    d.dept_name AS department
FROM 
    students s
LEFT JOIN 
    departments d ON s.dept_id = d.dept_id;
