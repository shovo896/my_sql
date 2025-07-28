-- ============================================
-- TRIGGER DEMO SCRIPT
-- Created for learning and demonstration
-- Covers: BEFORE INSERT, AFTER INSERT, BEFORE UPDATE, AFTER UPDATE, AFTER DELETE
-- ============================================

-- ====== Initial Setup ======

-- Drop database if exists
DROP DATABASE IF EXISTS trigger_demo_db;

-- Create new database
CREATE DATABASE trigger_demo_db;

-- Use the database
USE trigger_demo_db;

-- Create a customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    created_at DATETIME,
    updated_at DATETIME
);

-- Create an audit log table to track changes
CREATE TABLE audit_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(50),
    action_time DATETIME,
    old_data TEXT,
    new_data TEXT,
    description TEXT
);

-- ====== BEFORE INSERT Trigger ======
DELIMITER //

CREATE TRIGGER before_customer_insert
BEFORE INSERT ON customers
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
    SET NEW.updated_at = NOW();
END;
//

DELIMITER ;

-- ====== AFTER INSERT Trigger ======
DELIMITER //

CREATE TRIGGER after_customer_insert
AFTER INSERT ON customers
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs(action_type, action_time, new_data, description)
    VALUES('INSERT', NOW(), 
           CONCAT('Name: ', NEW.name, ', Email: ', NEW.email), 
           'Customer added');
END;
//

DELIMITER ;

-- ====== BEFORE UPDATE Trigger ======
DELIMITER //

CREATE TRIGGER before_customer_update
BEFORE UPDATE ON customers
FOR EACH ROW
BEGIN
    SET NEW.updated_at = NOW();
END;
//

DELIMITER ;

-- ====== AFTER UPDATE Trigger ======
DELIMITER //

CREATE TRIGGER after_customer_update
AFTER UPDATE ON customers
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs(action_type, action_time, old_data, new_data, description)
    VALUES(
        'UPDATE',
        NOW(),
        CONCAT('Old Name: ', OLD.name, ', Old Email: ', OLD.email),
        CONCAT('New Name: ', NEW.name, ', New Email: ', NEW.email),
        'Customer updated'
    );
END;
//

DELIMITER ;

-- ====== AFTER DELETE Trigger ======
DELIMITER //

CREATE TRIGGER after_customer_delete
AFTER DELETE ON customers
FOR EACH ROW
BEGIN
    INSERT INTO audit_logs(action_type, action_time, old_data, description)
    VALUES(
        'DELETE',
        NOW(),
        CONCAT('Deleted Name: ', OLD.name, ', Deleted Email: ', OLD.email),
        'Customer deleted'
    );
END;
//

DELIMITER ;

-- ====== Part 2: Insert Sample Data ======

-- Insert new customers
INSERT INTO customers(name, email) VALUES('Alice Smith', 'alice@example.com');
INSERT INTO customers(name, email) VALUES('Bob Johnson', 'bob@example.com');
INSERT INTO customers(name, email) VALUES('Charlie Brown', 'charlie@example.com');

-- ====== Update Customer ======
UPDATE customers SET email = 'alice2025@example.com' WHERE name = 'Alice Smith';

-- ====== Delete Customer ======
DELETE FROM customers WHERE name = 'Bob Johnson';

-- ====== Insert Another Customer ======
INSERT INTO customers(name, email) VALUES('Daisy Parker', 'daisy@example.com');

-- ====== Another Update ======
UPDATE customers SET name = 'Charles Brown' WHERE name = 'Charlie Brown';

-- ====== Conclusion: View Table Data ======

-- View current customer records
SELECT * FROM customers;

-- View audit logs to see what the triggers did
SELECT * FROM audit_logs;

-- ====== End of Script ======
-- This script demonstrates a full lifecycle of MySQL Triggers with audit logging
-- Useful for learning and practical applications like monitoring or enforcing business rules
