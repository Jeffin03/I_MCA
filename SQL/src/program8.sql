-- ===========================================================================
-- Program 8: Conditional Join Operations
-- ===========================================================================
-- Aim: To create appropriate table and perform the following Conditional Join operations.
--      a) List employees who work in 'Finance' department
--      b) Display customers who haven't placed any orders
--      c) List all courses and number of students enrolled in each
--      d) Find employees who earn more than their department average salary
--      e) Find the highest-paid employee in each department
-- ===========================================================================

-- Create tables:
CREATE TABLE DEPARTMENTS (
    DEPT_ID INT PRIMARY KEY, 
    DEPT_NAME VARCHAR(50)
);

CREATE TABLE EMPLOYEES (
    EMP_ID INT PRIMARY KEY, 
    EMP_NAME VARCHAR(50), 
    SALARY DECIMAL(10,2), 
    DEPT_ID INT, 
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENTS (DEPT_ID)
);

CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(50)
);

CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY, 
    CUSTOMER_ID INT,
    ORDER_DATE DATE, 
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID)
);

CREATE TABLE COURSES (
    COURSE_ID INT PRIMARY KEY, 
    COURSE_NAME VARCHAR(50)
);

CREATE TABLE STUDENTS (
    STUDENT_ID INT PRIMARY KEY, 
    STUDENT_NAME VARCHAR(50)
);

CREATE TABLE ENROLLMENTS (
    ENROLL_ID INT PRIMARY KEY, 
    STUDENT_ID INT, 
    COURSE_ID INT, 
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENTS (STUDENT_ID), 
    FOREIGN KEY (COURSE_ID) REFERENCES COURSES (COURSE_ID)
);

-- Inserting data:
INSERT INTO DEPARTMENTS VALUES 
    (1, 'Finance'), 
    (2, 'HR'), 
    (3, 'IT');

INSERT INTO EMPLOYEES VALUES 
    (101, 'Alice', 60000, 1), 
    (102, 'Bob', 55000, 1),
    (103, 'Charlie', 50000, 2), 
    (104, 'David', 75000, 3), 
    (105, 'Eve', 40000, 3);

INSERT INTO CUSTOMERS VALUES 
    (1, 'John Doe'), 
    (2, 'Jane Smith'), 
    (3, 'Mike Johnson');

INSERT INTO ORDERS VALUES 
    (1, 1, '2023-01-10'), 
    (2, 1, '2023-01-12'), 
    (3, 2, '2023-07-08');

INSERT INTO COURSES VALUES 
    (1, 'Maths'), 
    (2, 'Physics'), 
    (3, 'Chemistry');

INSERT INTO STUDENTS VALUES 
    (1, 'Student A'), 
    (2, 'Student B'), 
    (3, 'Student C');

INSERT INTO ENROLLMENTS VALUES 
    (1, 1, 1), 
    (2, 2, 1), 
    (3, 2, 2), 
    (4, 3, 3);

-- a) List employees who work in 'Finance' department
SELECT E.EMP_ID, E.EMP_NAME, D.DEPT_NAME 
FROM EMPLOYEES E 
JOIN DEPARTMENTS D ON E.DEPT_ID = D.DEPT_ID 
WHERE D.DEPT_NAME = 'Finance';

-- b) Display customers who haven't placed any orders
SELECT C.CUSTOMER_ID, C.CUSTOMER_NAME 
FROM CUSTOMERS C 
LEFT JOIN ORDERS O ON C.CUSTOMER_ID = O.CUSTOMER_ID 
WHERE O.ORDER_ID IS NULL;

-- c) List all courses and number of students enrolled in each
SELECT C.COURSE_NAME, COUNT(E.ENROLL_ID) AS STUDENT_COUNT 
FROM COURSES C 
LEFT JOIN ENROLLMENTS E ON C.COURSE_ID = E.COURSE_ID
GROUP BY C.COURSE_ID, C.COURSE_NAME;

-- d) Find employees who earn more than their department average salary
SELECT E.EMP_ID, E.EMP_NAME, E.SALARY, D.DEPT_NAME 
FROM EMPLOYEES E 
JOIN DEPARTMENTS D ON E.DEPT_ID = D.DEPT_ID 
WHERE E.SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPT_ID = E.DEPT_ID);

-- e) Find the highest-paid employee in each department
SELECT E.EMP_ID, E.EMP_NAME, E.SALARY, D.DEPT_NAME 
FROM EMPLOYEES E 
JOIN DEPARTMENTS D ON E.DEPT_ID = D.DEPT_ID 
WHERE E.SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES WHERE DEPT_ID = E.DEPT_ID);

-- ===========================================================================
-- End of Program 8
-- ===========================================================================