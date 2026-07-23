# ALTER
# QUESTIONS 1: Add a new column blood_group to the students table 
DESCRIBE STUDENTS;

ALTER TABLE STUDENTS 
ADD COLUMN bloodgroup varchar(3);

# Question 2: Add a column experience to the Faculty Table 

Describe Faculty;
ALTER TABLE Faculty
ADD EXPERIENCE TINYINT unsigned;
# Question 3: Add a Column fees to the Course table 

ALTER TABLE COURSES
ADD COLUMN fees DECIMAL(10,2);
# Question 4: increase the length of faculty_name from 100 to 150 characters
 
DESCRIBE FACULTY;
ALTER TABLE FACULTY 
MODIFY faculty_name varchar(150);
# Question 5: Change the data type of the phone in the students table to varchar(20)

ALTER TABLE STUDENTS
MODIFY PHONE VARCHAR(20);
# Question 6: Rename the column cgpa to current_cgpa 

ALTER TABLE STUDENTS
RENAME COLUMN CGPA TO CURRENT_CGPA;
# Question 7: Rename the table Faculty to Professors 

ALTER TABLE Faculty 
rename to Professor;
# Question 8: remove bloodgroup from the students table 
ALTER TABLE STUDENTS
DROP COLUMN bloodgroup;
# Question 9: make the email column not null 
ALTER TABLE STUDENTS 
modify email VARCHAR(100) NOT NULL;
DESCRIBE STUDENTS;
# Question 10: Set the default CGPA to 6.00 
ALTER TABLE STUDENTS 
ALTER CURRENT_CGPA SET DEFAULT 6.00;

ALTER TABLE STUDENTS 
RENAME COLUMN CURRENT_CGPA TO CGPA;

# ADD, DROP, RENAME, MODIFY 
# SET DEFAULT, ALTER 

