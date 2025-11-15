-- ===========================================================================
-- Program 13: MySQL Triggers
-- ===========================================================================
-- Aim: To write MySQL queries to create Triggers.
-- ===========================================================================

-- Creating Tables:
CREATE TABLE EMPLOYEE (
    EMPID INT PRIMARY KEY AUTO_INCREMENT,
    EMPNAME VARCHAR(50), 
    SALARY DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS EMPLOYEE_LOG (
    LOGID INT PRIMARY KEY AUTO_INCREMENT, 
    EMPID INT, 
    ACTION VARCHAR(50), 
    ACTIONTIME DATETIME
);

-- Inserting into Table:
INSERT INTO EMPLOYEE (EMPNAME, SALARY) VALUES
    ('Alice', 50000), 
    ('Bob', 60000), 
    ('Charlie', 70000);

-- a) Creating Trigger:
DELIMITER $$

CREATE TRIGGER AFTER_EMPLOYEE_INSERT
AFTER INSERT
ON EMPLOYEE
FOR EACH ROW
BEGIN
    INSERT INTO EMPLOYEE_LOG (EMPID, ACTION, ACTIONTIME) VALUES
        (NEW.EMPID, 'NEW EMPLOYEE ADDED', NOW());
END $$

DELIMITER ;

-- Testing the trigger:
INSERT INTO EMPLOYEE (EMPNAME, SALARY) VALUES ('John Doe', 50000);

-- Viewing the log:
SELECT * FROM EMPLOYEE_LOG;

-- ===========================================================================
-- End of Program 13
-- ===========================================================================