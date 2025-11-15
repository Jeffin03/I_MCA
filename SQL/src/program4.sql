-- ===========================================================================
-- Program 4: Employee Table Operations
-- ===========================================================================
-- Aim: To write queries to create a table for Employee details with Employee 
--      Number as Primary Key and following fields: Name, Designation, Gender, 
--      Age, Date of Joining and Salary.
--      a) Insert at least ten rows
--      b) Group By and Having Clause
--      c) Order by Clause
--      d) Indexing
-- ===========================================================================

-- Clean up any existing table
DROP TABLE IF EXISTS EMPLOYEES;

-- ---------------------------------------------------------------------------
-- TABLE CREATION
-- ---------------------------------------------------------------------------
CREATE TABLE EMPLOYEES (
    EMP_NO INT PRIMARY KEY, 
    NAME VARCHAR(100), 
    DESIG VARCHAR(50), 
    GENDER ENUM('MALE', 'FEMALE', 'OTHER'), 
    AGE INT, 
    DATE_OF_JOIN DATE, 
    SALARY DECIMAL(10,2)
);

-- ===========================================================================
-- a) INSERT AT LEAST TEN ROWS
-- ===========================================================================
INSERT INTO EMPLOYEES (EMP_NO, NAME, DESIG, GENDER, AGE, DATE_OF_JOIN, SALARY) VALUES 
    (101, 'ALICE JOHNSON', 'MANAGER', 'FEMALE', 35, '2015-06-20', 85000),
    (102, 'BOB SMITH', 'DEVELOPER', 'MALE', 28, '2019-03-15', 60000), 
    (103, 'CAROL WHITE', 'DEVELOPER', 'FEMALE', 26, '2020-08-10', 58000), 
    (104, 'DAVID BROWN', 'HR', 'MALE', 40, '2010-11-05', 75000), 
    (105, 'EVA GREEN', 'MANAGER', 'FEMALE', 45, '2008-01-25', 95000), 
    (106, 'FRANK BLACK', 'SUPPORT', 'MALE', 30, '2018-09-12', 40000), 
    (107, 'GRACE LEE', 'DEVELOPER', 'FEMALE', 27, '2021-04-01', 62000), 
    (108, 'HENRY ADAMS', 'SUPPORT', 'MALE', 32, '2017-01-31', 58000),
    (109, 'GRACY ADAMS', 'MANAGER', 'FEMALE', 35, '2022-05-03', 42000), 
    (110, 'HENRY ALAN', 'DEVELOPER', 'MALE', 30, '2020-04-03', 35000);

-- Display all records
SELECT * FROM EMPLOYEES;

-- ===========================================================================
-- b) GROUP BY AND HAVING CLAUSE
-- ===========================================================================
SELECT DESIG, AVG(SALARY) AS AVG_SALARY 
FROM EMPLOYEES 
GROUP BY DESIG 
HAVING AVG(SALARY) > 60000;

-- ===========================================================================
-- c) ORDER BY CLAUSE
-- ===========================================================================
SELECT * FROM EMPLOYEES ORDER BY SALARY DESC;

-- ===========================================================================
-- d) INDEXING
-- ===========================================================================
CREATE INDEX IDX_DESIG ON EMPLOYEES(DESIG);

-- Show indexes
SHOW INDEX FROM EMPLOYEES;

-- ===========================================================================
-- End of Program 4
-- ===========================================================================