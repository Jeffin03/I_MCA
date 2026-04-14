-- ===========================================================================
-- Program 7: Join Operations
-- ===========================================================================
-- Aim: To create appropriate table and perform the following Join operations.
--      a) List employee names with their department names
--      b) Display all employees and their department names, including those without a department
--      c) Show all departments and the employees in them, even if no employees exist
--      d) List employees along with their manager names
--      e) List student names, course names, and faculty names
-- ===========================================================================

-- Creating Tables:
CREATE TABLE DEPARTMENT (
    DEPT_ID INT PRIMARY KEY AUTO_INCREMENT, 
    DEPT_NAME VARCHAR(50)
);

CREATE TABLE EMPLOYEE (
    EMP_ID INT PRIMARY KEY AUTO_INCREMENT,
    EMP_NAME VARCHAR(50), 
    DEPT_ID INT, 
    MANAGER_ID INT, 
    FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENT(DEPT_ID), 
    FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEE(EMP_ID)
);

CREATE TABLE COURSE (
    COURSE_ID INT PRIMARY KEY AUTO_INCREMENT,
    COURSE_NAME VARCHAR(50)
);

CREATE TABLE FACULTY (
    FACULTY_ID INT PRIMARY KEY AUTO_INCREMENT, 
    FACULTY_NAME VARCHAR(50)
);

CREATE TABLE STUDENT (
    STUDENT_ID INT PRIMARY KEY AUTO_INCREMENT, 
    STUDENT_NAME VARCHAR(50)
);

CREATE TABLE STUDENT_COURSE (
    STUDENT_ID INT, 
    COURSE_ID INT,
    FACULTY_ID INT, 
    FOREIGN KEY (STUDENT_ID) REFERENCES STUDENT(STUDENT_ID), 
    FOREIGN KEY (COURSE_ID) REFERENCES COURSE(COURSE_ID), 
    FOREIGN KEY (FACULTY_ID) REFERENCES FACULTY(FACULTY_ID)
);

-- Inserting data:
INSERT INTO DEPARTMENT (DEPT_NAME) VALUES 
    ('HR'), 
    ('IT'), 
    ('Finance'), 
    ('Marketing');

INSERT INTO EMPLOYEE (EMP_NAME, DEPT_ID, MANAGER_ID) VALUES 
    ('Alice', 1, NULL), 
    ('Bob', 2, 2), 
    ('Charlie', 2, 2), 
    ('David', NULL, 3), 
    ('Emma', 3, 2);

INSERT INTO STUDENT (STUDENT_NAME) VALUES 
    ('Kumar'), 
    ('Lakshmi'), 
    ('Sudha');

INSERT INTO COURSE (COURSE_NAME) VALUES 
    ('B.Sc CS'), 
    ('BCA'), 
    ('BBA');

INSERT INTO FACULTY (FACULTY_NAME) VALUES 
    ('Kumar'), 
    ('Rajeev'), 
    ('Aishwarya');

INSERT INTO STUDENT_COURSE VALUES 
    (1, 1, 1), 
    (2, 2, 2), 
    (3, 3, 3);

-- a) List employee names with their department names
SELECT E.EMP_NAME, D.DEPT_NAME 
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID;

-- b) Display all employees and their department names, including those without a department
SELECT E.EMP_NAME, D.DEPT_NAME 
FROM EMPLOYEE E 
LEFT JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID;

-- c) Show all departments and the employees in them, even if no employees exist
SELECT E.EMP_NAME, D.DEPT_NAME 
FROM EMPLOYEE E 
RIGHT JOIN DEPARTMENT D ON E.DEPT_ID = D.DEPT_ID;

-- d) List employees along with their manager names
SELECT E.EMP_NAME AS EMPLOYEE, M.EMP_NAME AS MANAGER 
FROM EMPLOYEE E 
LEFT JOIN EMPLOYEE M ON E.MANAGER_ID = M.EMP_ID;

-- e) List student names, course names, and faculty names
SELECT S.STUDENT_NAME, C.COURSE_NAME, F.FACULTY_NAME 
FROM STUDENT AS S 
    JOIN STUDENT_COURSE AS SC ON S.STUDENT_ID = SC.STUDENT_ID 
    JOIN COURSE AS C ON SC.COURSE_ID = C.COURSE_ID 
    JOIN FACULTY AS F ON SC.FACULTY_ID = F.FACULTY_ID;