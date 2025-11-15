USE testdb;

INSERT INTO students (roll_number, name, percentage) VALUES
('CS001', 'Alice Johnson', 85),
('CS002', 'Bob Smith', 92),
('CS003', 'Carol Davis', 78),
('CS004', 'David Wilson', 88),
('CS005', 'Eva Brown', 95)
ON DUPLICATE KEY UPDATE 
    name = VALUES(name), 
    percentage = VALUES(percentage);