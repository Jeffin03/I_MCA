-- ===========================================================================
-- Program 10: MySQL Cursors
-- ===========================================================================
-- Aim: To write a MySQL program to demonstrate Cursors.
-- ===========================================================================

-- Creating table:
CREATE TABLE IF NOT EXISTS EMPLOYEES (
    EMPLOYEE_ID INT AUTO_INCREMENT PRIMARY KEY, 
    EMPLOYEE_NAME VARCHAR(100),
    DEPARTMENT VARCHAR(50)
);

-- Inserting data:
INSERT INTO EMPLOYEES (EMPLOYEE_NAME, DEPARTMENT) VALUES
    ('Alice', 'HR'),
    ('Bob', 'Engineering'), 
    ('Charlie', 'Sales'), 
    ('David', 'Engineering'), 
    ('Eve', 'Marketing');

-- a) Declaring the cursor:
DELIMITER $$

CREATE PROCEDURE DEMONSTRATE_CURSOR()
BEGIN
    DECLARE EMP_NAME VARCHAR(100);
    DECLARE DONE INT DEFAULT 0;
    
    DECLARE EMP_CURSOR CURSOR FOR
        SELECT EMPLOYEE_NAME FROM EMPLOYEES;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET DONE = 1;
    
    OPEN EMP_CURSOR;
    
    READ_LOOP: LOOP
        FETCH EMP_CURSOR INTO EMP_NAME;
        
        IF DONE THEN
            LEAVE READ_LOOP;
        END IF;
        
        SELECT EMP_NAME AS `EMPLOYEE NAME`;
    END LOOP READ_LOOP;
    
    CLOSE EMP_CURSOR;
END $$

DELIMITER ;

-- Call the procedure:
CALL DEMONSTRATE_CURSOR();

-- ===========================================================================
-- End of Program 10
-- ===========================================================================