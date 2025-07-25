-- Drop tables if they exist (for re-runnability)
DROP VIEW IF EXISTS CustomerOrderSummary;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50)
);

-- Create Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Data into Customers
INSERT INTO Customers (first_name, last_name, city) VALUES
('John', 'Doe', 'New York'),
('Alice', 'Smith', 'Chicago'),
('Bob', 'Johnson', 'Houston');

-- Insert Data into Products
INSERT INTO Products (product_name, price) VALUES
('Laptop', 800.00),
('Smartphone', 500.00),
('Tablet', 300.00);

-- Insert Data into Orders
INSERT INTO Orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2025-07-01', 1),
(1, 2, '2025-07-02', 2),
(2, 3, '2025-07-03', 1),
(3, 1, '2025-07-04', 1);

-- Perform JOIN to get full order details
SELECT 
    o.order_id,
    c.first_name,
    c.last_name,
    p.product_name,
    o.quantity,
    p.price,
    (o.quantity * p.price) AS total_price
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id;

-- Create a View to summarize total spent by each customer
CREATE VIEW CustomerOrderSummary AS
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(o.quantity * p.price) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY c.customer_id;

-- Use the view
SELECT * FROM CustomerOrderSummary;

-- Create index on Orders table for performance
CREATE INDEX idx_customer_product ON Orders (customer_id, product_id);
