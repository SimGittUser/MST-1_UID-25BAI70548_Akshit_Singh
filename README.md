# Course Registration System — SQL Practical

## Overview

This project implements a simple **Course Registration System** using MySQL. It demonstrates database creation, table relationships, integrity constraints, data manipulation, and common DDL/DML operations.

The practical consists of two main tables:

* `course` — stores information about available courses.
* `student` — stores student information and their registered course.

## Objectives

This practical demonstrates:

* Integrity constraints in SQL
* Primary and Foreign Keys
* `NOT NULL`, `UNIQUE`, `DEFAULT`, and `CHECK` constraints
* Database and table creation
* Inserting records using `INSERT`
* Retrieving data using `SELECT`
* Updating records using `UPDATE`
* Deleting records using `DELETE`
* Modifying tables using `ALTER TABLE`
* Renaming tables using `RENAME TABLE`
* Joining related tables

## Database Structure

### Course Table

| Column       | Data Type    | Constraint       | Description                                       |
| ------------ | ------------ | ---------------- | ------------------------------------------------- |
| `courseID`   | INT          | Primary Key      | Unique course identifier                          |
| `courseName` | VARCHAR(100) | NOT NULL, UNIQUE | Name of the course                                |
| `credits`    | INT          | NOT NULL, CHECK  | Course credits, between 1 and 6                   |
| `department` | VARCHAR(100) | DEFAULT          | Department offering the course; defaults to `CSE` |

### Student Table

| Column     | Data Type    | Constraint      | Description                         |
| ---------- | ------------ | --------------- | ----------------------------------- |
| `studID`   | INT          | Primary Key     | Unique student identifier           |
| `name`     | VARCHAR(100) | NOT NULL        | Student's name                      |
| `age`      | INT          | NOT NULL, CHECK | Student's age; must be at least 16  |
| `dob`      | DATE         | —               | Date of birth                       |
| `email`    | VARCHAR(100) | UNIQUE          | Student's email address             |
| `branch`   | VARCHAR(100) | DEFAULT         | Student's branch; defaults to `CSE` |
| `courseID` | INT          | Foreign Key     | References `course(courseID)`       |
| `phone`    | VARCHAR(15)  | UNIQUE          | Added later using `ALTER TABLE`     |

## Relationship

The `student` table has a foreign key relationship with the `course` table:

```text
student.courseID
       │
       ▼
course.courseID
```

This ensures that a student's registered `courseID` must correspond to an existing course.

## Integrity Constraints

The project demonstrates the following constraints:

### PRIMARY KEY

Uniquely identifies every record.

```sql
courseID INT PRIMARY KEY
studID INT PRIMARY KEY
```

### FOREIGN KEY

Maintains referential integrity between students and courses.

```sql
FOREIGN KEY (courseID) REFERENCES course(courseID)
```

### NOT NULL

Prevents required fields from being left empty.

```sql
name VARCHAR(100) NOT NULL
```

### UNIQUE

Prevents duplicate values.

```sql
email VARCHAR(100) UNIQUE
```

### DEFAULT

Automatically provides a value when one is not specified.

```sql
department VARCHAR(100) DEFAULT 'CSE'
```

### CHECK

Restricts values according to a condition.

```sql
credits INT NOT NULL CHECK (credits BETWEEN 1 AND 6)
```

## Operations Performed

### 1. Create Database

```sql
CREATE DATABASE clgg;
USE clgg;
```

### 2. Create Tables

The `course` and `student` tables are created with appropriate attributes and constraints.

### 3. Insert Courses

Four courses are inserted:

* Database Management System
* Data Structures
* Machine Learning
* Computer Networks

### 4. Insert Students

Five students are initially inserted with their respective courses.

### 5. Display Students in a Particular Course

A `JOIN` is used to find students enrolled in **Database Management System**.

```sql
SELECT s.studID, s.name, s.branch, c.courseName
FROM student s
JOIN course c ON s.courseID = c.courseID
WHERE c.courseName = 'Database Management System';
```

### 6. Update a Student's Course

Student `101` is moved to course `203`:

```sql
UPDATE student
SET courseID = 203
WHERE studID = 101;
```

### 7. Delete a Student

Student `105` is deleted:

```sql
DELETE FROM student
WHERE studID = 105;
```

### 8. Add a New Column

A unique phone-number column is added to the student table:

```sql
ALTER TABLE student
ADD phone VARCHAR(15) UNIQUE;
```

### 9. Rename a Table

The `student` table is renamed to `students`:

```sql
RENAME TABLE student TO students;
```

### 10. Display Final Records

The final student and course records are displayed using:

```sql
SELECT * FROM students;
SELECT * FROM course;
```

## DDL and DML Used

### DDL — Data Definition Language

Commands used to define or modify database structures:

* `CREATE DATABASE`
* `CREATE TABLE`
* `ALTER TABLE`
* `RENAME TABLE`

### DML — Data Manipulation Language

Commands used to manipulate records:

* `INSERT`
* `UPDATE`
* `DELETE`

`SELECT` is also used extensively to retrieve and display data.

## How to Run

### Requirements

* MySQL Server
* MySQL Workbench, MySQL CLI, or another MySQL-compatible client

### Steps

1. Open MySQL Workbench or the MySQL command-line client.
2. Open `PracticalMST1.sql`.
3. Execute the complete script.
4. The database `clgg` will be created.
5. The final `SELECT` statements will display the resulting records.

## File Structure

```text
.
├── PracticalMST1.sql
└── README.md
```

## Summary

This practical demonstrates how SQL integrity constraints help maintain valid and consistent data while showing the use of DDL and DML commands in a basic **Course Registration System**. It also demonstrates the relationship between students and courses using a foreign key and SQL `JOIN`.
