-- ===========================================================================
-- Program 5: Student Management System
-- ===========================================================================
-- Aim: To write queries for creating student, subject, Internal_Mark and 
--      External_Mark tables and perform the following operations:
--      a) Add, edit and delete student records
--      b) Add, edit, and delete subject details
--      c) Input internal and external marks for students in various subjects
--      d) View individual student marks, subject-wise marks or aggregated results
-- ===========================================================================

-- Table Creation
CREATE TABLE STUDENT (
    STD_ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100) NOT NULL, 
    DOB DATE, 
    COURSE VARCHAR(50)
);

CREATE TABLE SUBJECT (
    SUBJECT_ID INT PRIMARY KEY AUTO_INCREMENT,
    SUBJ_NAME VARCHAR(100) NOT NULL, 
    MAX_INTERNAL INT DEFAULT 30,
    MAX_EXTERNAL INT DEFAULT 70
);

CREATE TABLE INTERNAL_MARK (
    INTRL_ID INT PRIMARY KEY AUTO_INCREMENT, 
    STD_ID INT, 
    SUBJECT_ID INT, 
    ASSES_NO INT,
    MARKS_OBTAINED INT, 
    FOREIGN KEY (STD_ID) REFERENCES STUDENT(STD_ID) ON DELETE CASCADE, 
    FOREIGN KEY (SUBJECT_ID) REFERENCES SUBJECT(SUBJECT_ID) ON DELETE CASCADE
);

CREATE TABLE EXTERNAL_MARK (
    EXTRL_ID INT PRIMARY KEY AUTO_INCREMENT, 
    STD_ID INT, 
    SUBJ_ID INT, 
    EXAM_TYPE VARCHAR(50),
    MARKS_OBTAINED INT, 
    FOREIGN KEY (STD_ID) REFERENCES STUDENT(STD_ID) ON DELETE CASCADE, 
    FOREIGN KEY (SUBJ_ID) REFERENCES SUBJECT(SUBJECT_ID) ON DELETE CASCADE
);

-- a) Student Operations
-- Add Student:
INSERT INTO STUDENT (NAME, DOB, COURSE) VALUES 
    ('Arati Sharma', '2003-07-21', 'BSc CS'), 
    ('Sudha Mohan', '2002-06-23', 'BCA'), 
    ('Mohan Kumar', '2004-12-21', 'BBA');

-- Edit Student:
UPDATE STUDENT SET COURSE = 'BCA' WHERE STD_ID = 1;

-- Delete Student:
DELETE FROM STUDENT WHERE STD_ID = 2;

-- b) Subject Operations
-- Add Subject:
INSERT INTO SUBJECT (SUBJ_NAME, MAX_INTERNAL, MAX_EXTERNAL) VALUES 
    ('Database Systems', 30, 70), 
    ('Data Structure', 50, 90), 
    ('Business Analytics', 40, 85);

-- Edit Subject:
UPDATE SUBJECT SET SUBJ_NAME = 'Advanced Database Systems' WHERE SUBJECT_ID = 2;

-- Delete Subject:
DELETE FROM SUBJECT WHERE SUBJECT_ID = 2;

-- c) Marks Operations
-- Add Internal Marks:
INSERT INTO INTERNAL_MARK (STD_ID, SUBJECT_ID, ASSES_NO, MARKS_OBTAINED) VALUES 
    (1, 1, 1, 25), 
    (2, 2, 2, 30), 
    (3, 3, 3, 35);

-- Add External Marks:
INSERT INTO EXTERNAL_MARK (STD_ID, SUBJ_ID, EXAM_TYPE, MARKS_OBTAINED) VALUES 
    (1, 1, 'Final', 60), 
    (2, 2, 'Mid Sem', 30), 
    (3, 3, 'Final', 70);

-- Edit Marks:
UPDATE INTERNAL_MARK SET MARKS_OBTAINED = 28 WHERE INTRL_ID = 1;

-- Delete Marks:
DELETE FROM EXTERNAL_MARK WHERE EXTRL_ID = 2;

-- d) View Operations
-- View Individual Student Marks:
SELECT S.NAME, SUB.SUBJ_NAME, IM.ASSES_NO, IM.MARKS_OBTAINED AS INTERNAL_MARKS, 
       EM.MARKS_OBTAINED AS EXTERNAL_MARKS 
FROM STUDENT S 
    JOIN INTERNAL_MARK IM ON S.STD_ID = IM.STD_ID 
    JOIN EXTERNAL_MARK EM ON S.STD_ID = EM.STD_ID AND IM.SUBJECT_ID = EM.SUBJ_ID 
    JOIN SUBJECT SUB ON SUB.SUBJECT_ID = IM.SUBJECT_ID 
WHERE S.STD_ID = 2;

-- View Subject-wise Marks:
SELECT SUB.SUBJ_NAME, S.NAME, IM.MARKS_OBTAINED AS INTERNAL_MARKS, 
       EM.MARKS_OBTAINED AS EXTERNAL_MARKS 
FROM SUBJECT SUB 
    JOIN INTERNAL_MARK IM ON SUB.SUBJECT_ID = IM.SUBJECT_ID 
    JOIN EXTERNAL_MARK EM ON SUB.SUBJECT_ID = EM.SUBJ_ID AND IM.STD_ID = EM.STD_ID 
    JOIN STUDENT S ON S.STD_ID = IM.STD_ID 
WHERE SUB.SUBJECT_ID = 3;

-- View Aggregated Results:
SELECT S.NAME, SUB.SUBJ_NAME, SUM(IM.MARKS_OBTAINED) AS TOTAL_INTERNAL, 
       EM.MARKS_OBTAINED AS EXTERNAL_MARKS,
       (SUM(IM.MARKS_OBTAINED) + EM.MARKS_OBTAINED) AS TOTAL 
FROM STUDENT S 
    JOIN INTERNAL_MARK IM ON S.STD_ID = IM.STD_ID 
    JOIN EXTERNAL_MARK EM ON S.STD_ID = EM.STD_ID AND IM.SUBJECT_ID = EM.SUBJ_ID
    JOIN SUBJECT SUB ON SUB.SUBJECT_ID = IM.SUBJECT_ID 
GROUP BY S.NAME, SUB.SUBJ_NAME, EM.MARKS_OBTAINED;