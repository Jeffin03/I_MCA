-- ===========================================================================
-- Program 3: SQL Operators and Queries
-- ===========================================================================
-- Aim: To demonstrate various SQL operators and query operations:
--      a) Arithmetic operators (+, -, *, /, %)
--      b) Logical operators (AND, OR, NOT, IN, LIKE)
--      c) Comparison operators (>, <, =, >=, <=, !=)
--      d) BETWEEN operator
--      e) UNION operator
-- ===========================================================================

-- Clean up any existing tables
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS CONTRACTOR;

-- ---------------------------------------------------------------------------
-- TABLE CREATION
-- ---------------------------------------------------------------------------

-- Create EMPLOYEE table
CREATE TABLE EMPLOYEE (
    EMP_ID VARCHAR(25),
    EMP_NAME CHAR(25),
    EMP_DPT CHAR(25),
    EMP_CITY CHAR(25),
    EMP_CNTRY CHAR(25),
    EMP_EML_ID VARCHAR(25),
    EMP_MOB VARCHAR(10),
    EMP_SALARY INT(25)
);

-- Create CONTRACTOR table
CREATE TABLE CONTRACTOR (
    EMP_ID VARCHAR(25),
    EMP_NAME CHAR(25),
    EMP_DPT CHAR(25),
    EMP_CITY CHAR(25),
    EMP_CNTRY CHAR(25),
    EMP_EML_ID VARCHAR(25),
    EMP_MOB VARCHAR(10),
    EMP_SALARY INT(25)
);

-- ---------------------------------------------------------------------------
-- DATA INSERTION
-- ---------------------------------------------------------------------------

-- Insert data into EMPLOYEE table
INSERT INTO EMPLOYEE (EMP_ID, EMP_NAME, EMP_DPT, EMP_CITY, EMP_CNTRY, EMP_EML_ID, EMP_MOB, EMP_SALARY) VALUES 
    ('A101', 'SUGHIL', 'HR', 'BENGALURU', 'INDIA', 'SUGMEN@GMAIL.COM', '8574637283', 40000),
    ('A102', 'MUKESH', 'MANAGER', 'MUMBAI', 'INDIA', 'MUKMEH@GMAIL.COM', '7648372637', 45000),
    ('A103', 'MAHIMA', 'HR', 'NEW YORK', 'US', 'MAHDAS@GMAIL.COM', '8473627483', 35000),
    ('A104', 'MARIYA', 'SALES EXECUTIVE', 'KOCHI', 'INDIA', 'MARJAC@GMAIL.COM', '8473628473', 43000),
    ('A105', 'SACHIN', 'HR', 'BENGALURU', 'INDIA', 'SACMEN@GMAIL.COM', '7584738274', 50000);

-- Insert data into CONTRACTOR table
INSERT INTO CONTRACTOR (EMP_ID, EMP_NAME, EMP_DPT, EMP_CITY, EMP_CNTRY, EMP_EML_ID, EMP_MOB, EMP_SALARY) VALUES 
    ('A101', 'SUJITH', 'HR', 'CHENNAI', 'INDIA', 'SUJMEN@GMAIL.COM', '7584739274', 55000),
    ('A102', 'MARIYA', 'MANAGER', 'TAIPEI', 'CHINA', 'MARMEN@GMAIL.COM', '7584739574', 25000),
    ('A103', 'GEETHU', 'HR', 'BENGALURU', 'INDIA', 'GEEDAV@GMAIL.COM', '7564739574', 33000),
    ('A104', 'CHARLES', 'MANAGER', 'KOCHI', 'INDIA', 'CHARDAV@GMAIL.COM', '7554739574', 39000),
    ('A105', 'LUKE', 'SALES EXECUTIVE', 'LONDON', 'UK', 'LUKESMITH@GMAIL.COM', '7444739574', 48000);

-- Display inserted data
SELECT * FROM EMPLOYEE;
SELECT * FROM CONTRACTOR;

-- ===========================================================================
-- a) ARITHMETIC OPERATORS
-- ===========================================================================
SELECT '=== ARITHMETIC OPERATORS ===' AS 'SECTION';

-- (i) Addition - Salary increase by 10000
SELECT EMP_NAME, EMP_SALARY, EMP_SALARY + 10000 AS "REVISED SALARY" 
FROM EMPLOYEE;

-- (ii) Subtraction - Salary decrease by 1000
SELECT EMP_NAME, EMP_SALARY, EMP_SALARY - 1000 AS "REVISED SALARY" 
FROM EMPLOYEE;

-- (iii) Multiplication - Salary increase by 5%
SELECT EMP_NAME, EMP_SALARY, EMP_SALARY * 1.05 AS "REVISED SALARY" 
FROM EMPLOYEE;

-- (iv) Division - Salary in thousands
SELECT EMP_NAME, EMP_SALARY, EMP_SALARY / 1000 AS "SALARY IN THOUSANDS" 
FROM EMPLOYEE;

-- (v) Modulus - Remainder when salary divided by 1000
SELECT EMP_NAME, EMP_SALARY, EMP_SALARY % 1000 AS "REMAINDER" 
FROM EMPLOYEE;

-- ===========================================================================
-- b) LOGICAL OPERATORS
-- ===========================================================================
SELECT '=== LOGICAL OPERATORS ===' AS 'SECTION';

-- (i) AND operator - Employees from Bengaluru, India
SELECT * FROM EMPLOYEE 
WHERE EMP_CITY = 'BENGALURU' AND EMP_CNTRY = 'INDIA';

-- (ii) OR operator - Employees from Bengaluru OR India
SELECT * FROM EMPLOYEE 
WHERE EMP_CITY = 'BENGALURU' OR EMP_CNTRY = 'INDIA';

-- (iii) NOT operator - Employees not from India
SELECT * FROM EMPLOYEE 
WHERE NOT EMP_CNTRY = 'INDIA';

-- (iv) IN operator - Employees with specific salaries
SELECT * FROM EMPLOYEE 
WHERE EMP_SALARY IN (40000, 43000);

-- (v) LIKE operator - Cities starting with 'B'
SELECT * FROM EMPLOYEE 
WHERE EMP_CITY LIKE 'B%';

-- ===========================================================================
-- c) COMPARISON OPERATORS
-- ===========================================================================
SELECT '=== COMPARISON OPERATORS ===' AS 'SECTION';

-- (i) Greater than - Salary > 40000
SELECT * FROM EMPLOYEE WHERE EMP_SALARY > 40000;

-- (ii) Less than - Salary < 40000
SELECT * FROM EMPLOYEE WHERE EMP_SALARY < 40000;

-- (iii) Equal to - Salary = 40000
SELECT * FROM EMPLOYEE WHERE EMP_SALARY = 40000;

-- (iv) Greater than or equal to - Salary >= 40000
SELECT * FROM EMPLOYEE WHERE EMP_SALARY >= 40000;

-- (v) Less than or equal to - Salary <= 40000
SELECT * FROM EMPLOYEE WHERE EMP_SALARY <= 40000;

-- (vi) Not equal to - Salary != 40000
SELECT * FROM EMPLOYEE WHERE EMP_SALARY != 40000;

-- ===========================================================================
-- d) BETWEEN OPERATOR
-- ===========================================================================
SELECT '=== BETWEEN OPERATOR ===' AS 'SECTION';

-- Employees with IDs between A101 and A104
SELECT * FROM EMPLOYEE 
WHERE EMP_ID BETWEEN 'A101' AND 'A104';

-- Employees with salary between 35000 and 45000
SELECT * FROM EMPLOYEE 
WHERE EMP_SALARY BETWEEN 35000 AND 45000;

-- ===========================================================================
-- e) UNION OPERATOR
-- ===========================================================================
SELECT '=== UNION OPERATOR ===' AS 'SECTION';

-- Union of employee and contractor names and departments
SELECT EMP_NAME, EMP_DPT, 'EMPLOYEE' AS TYPE FROM EMPLOYEE
UNION
SELECT EMP_NAME, EMP_DPT, 'CONTRACTOR' AS TYPE FROM CONTRACTOR
ORDER BY EMP_NAME;

-- Union of all cities from both tables
SELECT DISTINCT EMP_CITY FROM EMPLOYEE
UNION
SELECT DISTINCT EMP_CITY FROM CONTRACTOR
ORDER BY EMP_CITY;

-- ===========================================================================
-- ADDITIONAL QUERIES FOR BETTER UNDERSTANDING
-- ===========================================================================
SELECT '=== ADDITIONAL QUERIES ===' AS 'SECTION';

-- Count employees by department
SELECT EMP_DPT, COUNT(*) AS EMPLOYEE_COUNT 
FROM EMPLOYEE 
GROUP BY EMP_DPT;

-- Average salary by country
SELECT EMP_CNTRY, AVG(EMP_SALARY) AS AVG_SALARY 
FROM EMPLOYEE 
GROUP BY EMP_CNTRY;

-- Highest paid employee
SELECT * FROM EMPLOYEE 
WHERE EMP_SALARY = (SELECT MAX(EMP_SALARY) FROM EMPLOYEE);

-- Optional: Clean up tables (uncomment if needed)
-- DROP TABLE EMPLOYEE;
-- DROP TABLE CONTRACTOR;

-- ===========================================================================
-- End of Program 3
-- ===========================================================================