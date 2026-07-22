
# CREATE DATABASE COLLEGE DB 

CREATE DATABASE COLLEGEDB;
USE COLLEGEDB;

CREATE TABLE Department(
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
department_name varchar(50) NOT NULL,
hod_name VARCHAR(50) NOT NULL,
block CHAR(1) NOT NULL );

CREATE TABLE Students(
student_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50),
email VARCHAR(50) UNIQUE,
phone VARCHAR(17) UNIQUE,
age TINYINT UNSIGNED CHECK(AGE>=17),
gender CHAR(1) CHECK(gender IN ("M","F")),
CGPA DECIMAL DEFAULT 0.00,
DEPARTMENT_ID INT UNSIGNED,
ADMISSION_DATE DATE NOT NULL,
FOREIGN KEY (DEPARTMENT_ID)
references Department(department_id));

DESCRIBE DEPARTMENT;

CREATE TABLE Faculty(
faculty_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
faculty_name VARCHAR(50) NOT NULL,
email VARchar(50) UNIQUE,
salary DECIMAL(10,2) UNSIGNED NOT NULL,
department_id INT UNSIGNED,
joining_date DATE DEFAULT(CURRENT_DATE),

FOREIGN KEY(department_id)
references Department(department_id));


DESCRIBE faculty;
drop table if exists courses;
CREATE TABLE Courses(
course_id INT unsigned AUTO_INCREMENT PRIMARY KEY,
course_name varchar(30) NOT NULL,
department_id int unsigned,

foreign key(department_id)
references DEpartment(department_id ));

CREATE TABLE Enrollment(
enrollment_id int unsigned auto_increment primary key,
student_id int unsigned,
course_id int unsigned,
semester tinyint unsigned check(semester between 1 and 8),
grade char(2) default 'NA',

foreign key (student_id)
references students(student_id),

foreign key (course_id)
references	Courses(course_id));
