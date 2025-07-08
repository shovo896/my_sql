
CREATE TABLE students (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100),
  email VARCHAR(100),
  department VARCHAR(50),
  enrollment_date DATE
);

INSERT INTO students (name, email, department, enrollment_date)
VALUES
  ('Ayesha Rahman', 'ayesha.r@example.com', 'Computer Science', '2024-01-15'),
  ('Sajid Hossain', 'sajid.h@example.com', 'Economics', '2024-02-01'),
  ('Nadia Akter', 'nadia.a@example.com', 'Electrical Engineering', '2024-03-10');
