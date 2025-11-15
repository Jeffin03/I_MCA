-- ===========================================================================
-- Program 2: SQL Functions Implementation
-- ===========================================================================
-- Aim: To implement different types of functions with suitable examples:
--      a) Number function
--      b) Aggregate function
--      c) Character function
--      d) Conversion function
--      e) Date function
-- ===========================================================================

-- Clean up any existing table
DROP TABLE IF EXISTS MARKLIST;

-- ---------------------------------------------------------------------------
-- TABLE CREATION AND DATA INSERTION
-- ---------------------------------------------------------------------------
CREATE TABLE MARKLIST (
    REG_NO VARCHAR(25),
    STUDNAM CHAR(25),
    STUDADD CHAR(25),
    MOB_NO VARCHAR(12),
    EMAIL VARCHAR(25),
    MARK1 INT(20),
    MARK2 INT(20),
    MARK3 INT(20)
);

-- Insert sample data
INSERT INTO MARKLIST VALUES 
    ('A101', 'VARUN', 'HYDERABAD', '9449875647', 'VARMAH@GMAIL.COM', 45, 46, 43),
    ('A102', 'SUBASH', 'CHENNAI', '8547639278', 'SUBRAJ@GMAIL.COM', 43, 42, 41),
    ('A103', 'LAKSHMI', 'KOCHI', '7856493809', 'LAKRAM@GMAIL.COM', 38, 40, 44),
    ('A104', 'PARVATHY', 'BENGALURU', '8767876568', 'PARJAY@GMAIL.COM', 35, 40, 46),
    ('A105', 'RAVI', 'COIMBATORE', '9874837281', 'RAVMEN@GMAIL.COM', 43, 47, 49);

-- Display inserted data
SELECT * FROM MARKLIST;

-- ===========================================================================
-- a) NUMBER FUNCTIONS
-- ===========================================================================
SELECT '=== NUMBER FUNCTIONS ===' AS 'SECTION';

-- (i) Absolute value function
SELECT ABS(-67) AS 'ABS(-67)';

-- (ii) Ceiling function (smallest integer >= value)
SELECT CEIL(65.7) AS 'CEIL(65.7)';

-- (iii) Floor function (largest integer <= value)
SELECT FLOOR(49.9) AS 'FLOOR(49.9)';

-- Additional number functions
SELECT ROUND(45.678, 2) AS 'ROUND(45.678, 2)',
       POW(2, 3) AS 'POW(2, 3)',
       SQRT(16) AS 'SQRT(16)';

-- ===========================================================================
-- b) AGGREGATE FUNCTIONS
-- ===========================================================================
SELECT '=== AGGREGATE FUNCTIONS ===' AS 'SECTION';

-- (i) Count of students
SELECT COUNT(STUDNAM) AS 'TOTAL_STUDENTS' FROM MARKLIST;

-- (ii-iv) Sum of individual marks
SELECT SUM(MARK1) AS 'SUM_MARK1' FROM MARKLIST;
SELECT SUM(MARK2) AS 'SUM_MARK2' FROM MARKLIST;
SELECT SUM(MARK3) AS 'SUM_MARK3' FROM MARKLIST;

-- (v) Total of all marks combined
SELECT SUM(MARK1 + MARK2 + MARK3) AS 'GRAND_TOTAL' FROM MARKLIST;

-- (vi-viii) Average of individual marks
SELECT AVG(MARK1) AS 'AVG_MARK1' FROM MARKLIST;
SELECT AVG(MARK2) AS 'AVG_MARK2' FROM MARKLIST;
SELECT AVG(MARK3) AS 'AVG_MARK3' FROM MARKLIST;

-- (ix-x) Minimum and Maximum values
SELECT MIN(MARK1) AS 'MIN_MARK1' FROM MARKLIST;
SELECT MAX(MARK3) AS 'MAX_MARK3' FROM MARKLIST;

-- Combined aggregate query
SELECT 
    COUNT(*) AS 'TOTAL_STUDENTS',
    AVG(MARK1 + MARK2 + MARK3) AS 'OVERALL_AVERAGE',
    MIN(MARK1 + MARK2 + MARK3) AS 'LOWEST_TOTAL',
    MAX(MARK1 + MARK2 + MARK3) AS 'HIGHEST_TOTAL'
FROM MARKLIST;

-- ===========================================================================
-- c) CHARACTER FUNCTIONS
-- ===========================================================================
SELECT '=== CHARACTER FUNCTIONS ===' AS 'SECTION';

-- (i) Convert to lowercase
SELECT STUDNAM, LOWER(STUDNAM) AS 'LOWERCASE' FROM MARKLIST;

-- (ii) Convert to uppercase
SELECT STUDNAM, UPPER(STUDNAM) AS 'UPPERCASE' FROM MARKLIST;

-- (iii) Concatenate name and mobile number
SELECT CONCAT(STUDNAM, ' - ', MOB_NO) AS 'NAME_MOBILE' FROM MARKLIST;

-- (iv) String length
SELECT STUDNAM, LENGTH(STUDNAM) AS 'NAME_LENGTH' FROM MARKLIST;

-- (v) Substring extraction (first 4 characters)
SELECT STUDNAM, SUBSTRING(STUDNAM, 1, 4) AS 'FIRST_4_CHARS' FROM MARKLIST;

-- (vi) Reverse string
SELECT STUDNAM, REVERSE(STUDNAM) AS 'REVERSED_NAME' FROM MARKLIST;

-- (vii) Replace characters in string
SELECT STUDNAM, 
       REPLACE(STUDNAM, 'VARUN', 'VARUNMOHAN') AS 'REPLACED_NAME' 
FROM MARKLIST;

-- (viii) Left padding
SELECT LPAD('100', 5, '*') AS 'LEFT_PADDED';

-- (ix) Right padding
SELECT RPAD('5000', 7, '*') AS 'RIGHT_PADDED';

-- (x) Trim whitespace
SELECT TRIM('   KRISTU JAYANTI UNIVERSITY   ') AS 'TRIMMED_STRING';

-- (xi) Find substring position
SELECT INSTR('VARUN MOHAN', 'MOHAN') AS 'POSITION_OF_MOHAN';

-- ===========================================================================
-- d) CONVERSION FUNCTIONS
-- ===========================================================================
SELECT '=== CONVERSION FUNCTIONS ===' AS 'SECTION';

SELECT 
    DATE_FORMAT(NOW(), '%d/%m/%Y') AS 'FORMATTED_DATE',
    CAST(123.45 AS UNSIGNED) AS 'CAST_TO_INT',
    CONVERT('2024-12-25', DATE) AS 'CONVERT_TO_DATE',
    FORMAT(1234.567, 2) AS 'FORMATTED_NUMBER';

-- ===========================================================================
-- e) DATE FUNCTIONS
-- ===========================================================================
SELECT '=== DATE FUNCTIONS ===' AS 'SECTION';

-- (i) Current date and time
SELECT NOW() AS 'CURRENT_DATETIME';

-- (ii) Current date only
SELECT CURDATE() AS 'CURRENT_DATE';

-- (iii) Current year
SELECT YEAR(NOW()) AS 'CURRENT_YEAR';

-- (iv) Current month (number)
SELECT MONTH(NOW()) AS 'CURRENT_MONTH_NUM';

-- (v) Current month (name)
SELECT MONTHNAME(NOW()) AS 'CURRENT_MONTH_NAME';

-- (vi) Current day
SELECT DAY(NOW()) AS 'CURRENT_DAY';

-- Additional date functions
SELECT 
    DAYNAME(NOW()) AS 'DAY_NAME',
    WEEK(NOW()) AS 'WEEK_NUMBER',
    QUARTER(NOW()) AS 'QUARTER',
    DATEDIFF('2024-12-31', NOW()) AS 'DAYS_TO_YEAR_END',
    DATE_ADD(NOW(), INTERVAL 30 DAY) AS 'DATE_PLUS_30_DAYS';

-- ===========================================================================
-- FINAL DATA DISPLAY
-- ===========================================================================
SELECT '=== FINAL TABLE DATA ===' AS 'SECTION';
SELECT * FROM MARKLIST;

-- Optional: Clean up (uncomment if needed)
-- DROP TABLE MARKLIST;

-- ===========================================================================
-- End of Program 2
-- ===========================================================================