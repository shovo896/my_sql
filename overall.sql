-- Create and use database
DROP DATABASE IF EXISTS sales_db;
CREATE DATABASE sales_db;
USE sales_db;

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Orders table with ON DELETE CASCADE
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- Stored Procedure to insert customer and order
DELIMITER //

CREATE PROCEDURE InsertCustomerOrder(
    IN cust_name VARCHAR(100),
    IN cust_email VARCHAR(100),
    IN order_amt DECIMAL(10,2)
)
BEGIN
    DECLARE cust_id INT;

    INSERT INTO customers(name, email)
    VALUES(cust_name, cust_email);
    
    SET cust_id = LAST_INSERT_ID();

    INSERT INTO orders(customer_id, order_date, amount)
    VALUES(cust_id, CURDATE(), order_amt);
END //

DELIMITER ;

-- Call the stored procedure
CALL InsertCustomerOrder('Alice', 'alice@example.com', 1000.00);
CALL InsertCustomerOrder('Bob', 'bob@example.com', 2000.00);
CALL InsertCustomerOrder('Alice', 'alice@example.com', 1500.00);

-- View orders
SELECT * FROM orders;

-- Use ROLLUP to get customer sales summary
SELECT 
    c.name AS customer_name,
    SUM(o.amount) AS total_sales
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY 
    c.name WITH ROLLUP;

-- Delete a customer to test ON DELETE CASCADE
DELETE FROM customers WHERE name = 'Alice';

-- Check orders table after deletion
SELECT * FROM orders;
