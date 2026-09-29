-- A. Theory:
-- Explain the importance of integrity constraints in SQL. Describe how Primary Key, Foreign Key, NOT NULL, UNIQUE, DEFAULT, and CHECK constraints prevent invalid data. Also explain how DDL and DML commands are used to manage the database.
-- B. Practical:
-- Create a Course Registration System using Student and Course tables.
-- 1. Create both tables with suitable attributes.
-- 2. Use a Primary Key for each table and establish a Foreign Key relationship.
-- 3. Apply suitable NOT NULL, UNIQUE, DEFAULT, and CHECK constraints.
-- 4. Insert at least 5 students and 4 courses.
-- 5. Display students enrolled in a particular course.
-- 6. Update the course of a student.
-- 7. Delete a student using a suitable condition.
-- 8. Add a new column using ALTER.
-- 9. Rename one table using RENAME.
-- 10. Display the final records using SELECT.

CREATE DATABASE clgg;
USE clgg;

CREATE TABLE course (
    courseID INT PRIMARY KEY,
    courseName VARCHAR(100) NOT NULL UNIQUE,
    credits INT NOT NULL CHECK (credits BETWEEN 1 AND 6),
    department VARCHAR(100) DEFAULT 'CSE'
);


CREATE TABLE student (
    studID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK (age >= 16),
    dob DATE,
    email VARCHAR(100) UNIQUE,
    branch VARCHAR(100) DEFAULT 'CSE',
    courseID INT,
    FOREIGN KEY (courseID) REFERENCES course(courseID)
);

INSERT INTO course (courseID, courseName, credits, department)
VALUES
(201, 'Database Management System', 4, 'CSE'),
(202, 'Data Structures', 4, 'CSE'),
(203, 'Machine Learning', 5, 'AI/ML'),
(204, 'Computer Networks', 3, 'CSE');

INSERT INTO student (studID, name, age, dob, email, branch, courseID)
VALUES
(101, 'Rahul', 19, '2007-05-12', 'rahul@gmail.com', 'CSE', 201),
(102, 'Priya', 20, '2006-03-18', 'priya@gmail.com', 'CSE', 201),
(103, 'Aman', 19, '2007-08-21', 'aman@gmail.com', 'AI/ML', 203),
(104, 'Neha', 20, '2006-11-05', 'neha@gmail.com', 'CSE', 204),
(105, 'Rohan', 19, '2007-01-25', 'rohan@gmail.com', 'IT', 202);

SELECT s.studID, s.name, s.branch, c.courseName
FROM student s
JOIN course c ON s.courseID = c.courseID
WHERE c.courseName = 'Database Management System';

UPDATE student
SET courseID = 203
WHERE studID = 101;

DELETE FROM student
WHERE studID = 105;

ALTER TABLE student
ADD phone VARCHAR(15) UNIQUE;

RENAME TABLE student TO students;

SELECT * FROM students;

SELECT * FROM course;