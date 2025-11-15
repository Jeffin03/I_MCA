-- ===========================================================================
-- Program 9: Transaction Control Language (TCL) Operations
-- ===========================================================================
-- Aim: To create Teacher table with the following fields (Name, Dept_No, Date of joining,
--      Dept_Name, Location, Salary).
--      a) Insert ten records
--      b) Give increment of 25% salary for Mathematics Department
--      c) Perform Rollback command
--      d) Give increment of 15% salary for Commerce Department
--      e) Perform commit command
--      f) Perform save point
-- ===========================================================================

-- Creating table:
CREATE TABLE TEACHER (
    NAME VARCHAR(50), 
    DEPT_NO INT, 
    DOJ DATE,
    DEPT_NAME VARCHAR(50), 
    LOCATION VARCHAR(50), 
    SALARY DECIMAL(10,2)
);

-- a) Insert ten records
INSERT INTO TEACHER VALUES
    ('Amit', 101, '2022-06-15', 'Mathematics', 'Delhi', 50000), 
    ('Sneha', 102, '2020-03-02', 'Commerce', 'Mumbai', 48000), 
    ('Rahman', 103, '2018-11-06', 'Mathematics', 'Chennai', 45000), 
    ('Priya', 104, '2020-08-23', 'Science', 'Delhi', 47000), 
    ('Vikas', 105, '2018-09-10', 'Commerce', 'Kolkata', 52000), 
    ('Rina', 106, '2020-07-15', 'Mathematics', 'Hyderabad', 46000), 
    ('Kranti', 107, '2013-07-13', 'Humanities', 'Kochi', 43000), 
    ('Surjit', 108, '2015-09-14', 'Mathematics', 'Bengaluru', 40000), 
    ('Manoj', 109, '2017-04-18', 'Commerce', 'Delhi', 52000), 
    ('Lakshmi', 110, '2016-09-28', 'Commerce', 'Chandigarh', 49000);

-- b) Give increment of 25% salary for Mathematics Department
UPDATE TEACHER 
SET SALARY = SALARY * 1.25 
WHERE DEPT_NAME = 'Mathematics';

-- c) Perform Rollback command
SET AUTOCOMMIT = 0;
UPDATE TEACHER 
SET SALARY = SALARY * 1.25 
WHERE DEPT_NAME = 'Mathematics';
ROLLBACK;

-- d) Give increment of 15% salary for Commerce Department
UPDATE TEACHER 
SET SALARY = SALARY * 1.15 
WHERE DEPT_NAME = 'Commerce';

-- e) Perform commit command
COMMIT;

-- f) Perform save point
SAVEPOINT SP1;
ROLLBACK TO SP1;

-- ===========================================================================
-- End of Program 9
-- ===========================================================================