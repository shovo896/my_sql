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

-- Call the procedure
CALL InsertCustomerOrder('Alice', 'alice@example.com', 1000.00);
CALL InsertCustomerOrder('Bob', 'bob@example.com', 2000.00);
CALL InsertCustomerOrder('Alice', 'alice@example.com', 1500.00);  -- Another order from Alice
