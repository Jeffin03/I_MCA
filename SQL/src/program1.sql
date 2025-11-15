-- ===========================================================================
-- Program 1: DDL and DML Operations
-- ===========================================================================
-- Aim: To perform the following DDL and DML operations:
--      a) Create table
--      b) Alter table  
--      c) Drop table
--      d) Insertion
--      e) Deletion
--      f) Modify
--      g) Update
--      h) View
-- ===========================================================================

-- Clean up any existing table (optional)
-- DROP TABLE IF EXISTS EMPLOYEES;

-- ---------------------------------------------------------------------------
-- a) CREATE TABLE - Creating the EMPLOYEES table
-- ---------------------------------------------------------------------------
CREATE TABLE EMPLOYEES (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(100) NOT NULL,
    POSITION VARCHAR(50),
    SALARY DECIMAL(10,2)
);

-- Verify table structure
DESCRIBE EMPLOYEES;

-- ---------------------------------------------------------------------------
-- d) INSERTION - Adding employee records
-- ---------------------------------------------------------------------------
INSERT INTO EMPLOYEES (ID, NAME, POSITION, SALARY) VALUES
    ('101', 'ALICE JOHNSON', 'MANAGER', 70000.00),
    ('102', 'RAHUL RAGHAV', 'CLERK', 20000.00),
    ('103', 'JACOB GEORGE', 'CASHIER', 30000.00),
    ('104', 'MOHAN KUMAR', 'ACCOUNTANT', 35000.00),
    ('105', 'ANJANA PRADEEP', 'ACCOUNTANT', 50000.00);

-- Display all records
SELECT * FROM EMPLOYEES;

-- ---------------------------------------------------------------------------
-- b) ALTER TABLE - Modifying table structure
-- ---------------------------------------------------------------------------
-- Increasing POSITION column size from 50 to 150 characters
ALTER TABLE EMPLOYEES MODIFY POSITION VARCHAR(150);

-- Verify the change
DESCRIBE EMPLOYEES;

-- ---------------------------------------------------------------------------
-- e) DELETION - Removing specific records
-- ---------------------------------------------------------------------------
-- Delete employee with ID 102 (RAHUL RAGHAV)
DELETE FROM EMPLOYEES WHERE ID = '102';

-- Display remaining records
SELECT * FROM EMPLOYEES;

-- ---------------------------------------------------------------------------
-- g) UPDATE - Modifying existing records
-- ---------------------------------------------------------------------------
-- Update Alice Johnson's salary to 80,000
UPDATE EMPLOYEES 
SET SALARY = 80000.00 
WHERE NAME = 'ALICE JOHNSON';

-- Display updated records
SELECT * FROM EMPLOYEES;

-- ---------------------------------------------------------------------------
-- h) VIEW - Creating and using views
-- ---------------------------------------------------------------------------
-- Create a view for employees earning more than 60,000
CREATE VIEW HIGH_EARNERS AS 
SELECT NAME, POSITION, SALARY 
FROM EMPLOYEES 
WHERE SALARY > 60000.00;

-- Query the view
SELECT * FROM HIGH_EARNERS;

-- Display view definition (optional)
SHOW CREATE VIEW HIGH_EARNERS;

-- ---------------------------------------------------------------------------
-- c) DROP TABLE - Removing the table (commented out for safety)
-- ---------------------------------------------------------------------------
-- WARNING: This will permanently delete the table and all data
DROP TABLE EMPLOYEES;

-- Also drop the view if dropping table
DROP VIEW IF EXISTS HIGH_EARNERS;

-- ===========================================================================
-- End of Program 1
-- ===========================================================================