College Database ER Diagram

Author: Anshum Banga

Overview

This project demonstrates a simple College Database Management System
(DBMS) designed for teaching SQL and database design concepts.

The schema includes five entities: - Department - Students - Faculty -
Courses - Enrollment

Learning Objectives

-   Database creation
-   Table creation using DDL
-   Primary Keys
-   Foreign Keys
-   AUTO_INCREMENT
-   NOT NULL
-   UNIQUE
-   DEFAULT
-   CHECK constraints
-   One-to-Many relationships
-   Many-to-Many relationships using a junction table

Entity Relationships

Department (1) —- (M) Students Department (1) —- (M) Faculty Department
(1) —- (M) Courses Students (M) —- (M) Courses Enrollment resolves the
Many-to-Many relationship between Students and Courses.

Tables

1.  Department Stores department information.

2.  Students Stores student records and links each student to a
    department.

3.  Faculty Stores faculty information and department assignments.

4.  Courses Stores course information offered by each department.

5.  Enrollment Stores student enrollments, semester details, and grades.

Technologies

-   MySQL
-   SQL (DDL)
-   Entity Relationship (ER) Modeling

Educational Purpose

This project is intended for classroom demonstrations to help students
understand database normalization, relationships, constraints, and
relational schema design.

Happy Learning!
