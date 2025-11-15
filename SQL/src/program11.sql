-- ===========================================================================
-- Program 11: MySQL Functions
-- ===========================================================================
-- Aim: To write a MySQL program to demonstrate Functions.
-- ===========================================================================

-- Creating table:
CREATE TABLE EMPLOYEE (
    EMPID INT PRIMARY KEY AUTO_INCREMENT,
    EMPNAME VARCHAR(50), 
    SALARY DECIMAL(10,2)
);

-- Inserting:
INSERT INTO EMPLOYEE (EMPNAME, SALARY) VALUES 
    ('Alice', 50000), 
    ('Bob', 60000), 
    ('Charlie', 70000);

-- a) Creating a function:
DELIMITER $$

CREATE FUNCTION CALCULATEBONUS(SALARY DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE BONUS DECIMAL(10,2);
    SET BONUS = SALARY * 0.10;
    RETURN BONUS;
END $$

DELIMITER ;

-- Using the function:
SELECT EMPNAME, SALARY, CALCULATEBONUS(SALARY) AS BONUS 
FROM EMPLOYEE;

-- ===========================================================================
-- End of Program 11
-- ===========================================================================