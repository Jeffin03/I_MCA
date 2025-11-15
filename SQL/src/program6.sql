-- ===========================================================================
-- Program 6: String Operations
-- ===========================================================================
-- Aim: To create appropriate table and perform the following string operations.
--      a) Concatenate first name and last name of students
--      b) Convert employee names to uppercase and lowercase
--      c) Find employees whose names start with 'A'
--      d) Format phone numbers with hyphen (e.g., 9876543210 to 98765-43210)
--      e) Capitalize only the first letter of names (title case)
--      f) Create email IDs using student first name and roll number
--      g) Validate email format using string pattern
-- ===========================================================================

-- Table Creation
CREATE TABLE STUDENT (
    ROLL_NO INT PRIMARY KEY, 
    FIRST_NAME VARCHAR(50), 
    LAST_NAME VARCHAR(50), 
    PHONE_NO VARCHAR(15)
);

CREATE TABLE EMPLOYEE (
    EMP_ID INT PRIMARY KEY, 
    EMP_NAME VARCHAR(50)
);

-- Data Insertion
INSERT INTO STUDENT VALUES 
    (1, 'Rahul', 'Sharma', '9876543210'), 
    (2, 'Anita', 'Varma', '9123456789'), 
    (3, 'Karan', 'Patel', '9988776655');

INSERT INTO EMPLOYEE VALUES 
    (101, 'Alice'), 
    (102, 'Bob'), 
    (103, 'Amit'), 
    (104, 'Charlie');

-- a) Concatenate first name and last name of students
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS FULL_NAME 
FROM STUDENT;

-- b) Convert employee names to uppercase and lowercase
SELECT EMP_NAME, 
       UPPER(EMP_NAME) AS UPPER_CASE,
       LOWER(EMP_NAME) AS LOWER_CASE 
FROM EMPLOYEE;

-- c) Find employees whose names start with 'A'
SELECT EMP_NAME 
FROM EMPLOYEE 
WHERE EMP_NAME LIKE 'A%';

-- d) Format phone numbers with hyphen
SELECT PHONE_NO, 
       CONCAT(SUBSTRING(PHONE_NO, 1, 5), '-', SUBSTRING(PHONE_NO, 6)) AS FORMATTED_PHONE 
FROM STUDENT;

-- e) Capitalize only the first letter of names (title case)
SELECT EMP_NAME, 
       CONCAT(UPPER(LEFT(EMP_NAME, 1)), LOWER(SUBSTRING(EMP_NAME, 2))) AS TITLE_CASE_NAME 
FROM EMPLOYEE;

-- f) Create email IDs using student first name and roll number
SELECT FIRST_NAME, 
       ROLL_NO, 
       CONCAT(LOWER(FIRST_NAME), '-', ROLL_NO, '@gmail.com') AS EMAIL_ID 
FROM STUDENT;

-- g) Validate email format using string pattern
SELECT EMAIL_ID 
FROM (
    SELECT CONCAT(LOWER(FIRST_NAME), '-', ROLL_NO, '@gmail.com') AS EMAIL_ID 
    FROM STUDENT
) AS TEMP 
WHERE EMAIL_ID REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';

-- ===========================================================================
-- End of Program 6
-- ===========================================================================