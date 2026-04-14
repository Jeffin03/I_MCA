-- ===========================================================================
-- Program 12: MySQL Procedures
-- ===========================================================================
-- Aim: To write MySQL queries to create Procedures.
-- ===========================================================================

-- Creating Table:
CREATE TABLE EMPLOYEE (
    EMPID INT PRIMARY KEY AUTO_INCREMENT,
    EMPNAME VARCHAR(50), 
    SALARY DECIMAL(10,2)
);

-- Inserting in Table:
INSERT INTO EMPLOYEE (EMPNAME, SALARY) VALUES
    ('Alice', 50000), 
    ('Bob', 60000), 
    ('Charlie', 70000);

-- a) Creating Procedure:
DELIMITER $$

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT * FROM EMPLOYEE;
END $$

DELIMITER ;

-- Calling the procedure:
CALL GetAllEmployees();

-- ===========================================================================
-- End of Program 12
-- ===========================================================================