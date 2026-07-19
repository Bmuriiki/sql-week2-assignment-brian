--Creating schema
create schema if not exists greenwood_academy;
--Setting search path
SET search_path TO greenwood_academy;

--Creating students table
create table students(
		student_id INT primary key ,
		first_name VARCHAR(50) not null,
		last_name VARCHAR(50) NOT null,
		gender VARCHAR(1),
		date_of_birth DATE,
		class VARCHAR(10),
		city VARCHAR(50));

--Creating subjects table
CREATE TABLE subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL UNIQUE,
    department VARCHAR(50),
    teacher_name VARCHAR(100),
    credits INT
);

--Creating exams_results table
CREATE TABLE exam_results (
    result_id INT PRIMARY KEY,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    marks INT NOT NULL,
    exam_date DATE,
    grade VARCHAR(2)
);


--Adding a column
alter table students
add column phone_number varchar(20);

--Renaming columns
alter table subjects 
rename column credits to credit_hours;

--Deleting a column
alter table students
drop column phone_number;

--Inserting student data
INSERT INTO students (
    student_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    class,
    city
)
VALUES
    (1, 'Amina', 'Wanjiku', 'F', '2008-03-12', 'Form 3', 'Nairobi'),
    (2, 'Brian', 'Ochieng', 'M', '2007-07-25', 'Form 4', 'Mombasa'),
    (3, 'Cynthia', 'Mutua', 'F', '2008-11-05', 'Form 3', 'Kisumu'),
    (4, 'David', 'Kamau', 'M', '2007-02-18', 'Form 4', 'Nairobi'),
    (5, 'Esther', 'Akinyi', 'F', '2009-06-30', 'Form 2', 'Nakuru'),
    (6, 'Felix', 'Otieno', 'M', '2009-09-14', 'Form 2', 'Eldoret'),
    (7, 'Grace', 'Mwangi', 'F', '2008-01-22', 'Form 3', 'Nairobi'),
    (8, 'Hassan', 'Abdi', 'M', '2007-04-09', 'Form 4', 'Mombasa'),
    (9, 'Ivy', 'Chebet', 'F', '2009-12-01', 'Form 2', 'Nakuru'),
    (10, 'James', 'Kariuki', 'M', '2008-08-17', 'Form 3', 'Nairobi');


--Inserting subjects data
INSERT INTO subjects (
    subject_id,
    subject_name,
    department,
    teacher_name,
    credit_hours
)
VALUES
    (1, 'Mathematics', 'Sciences', 'Mr. Njoroge', 4),
    (2, 'English', 'Languages', 'Ms. Adhiambo', 3),
    (3, 'Biology', 'Sciences', 'Ms. Otieno', 4),
    (4, 'History', 'Humanities', 'Mr. Waweru', 3),
    (5, 'Kiswahili', 'Languages', 'Ms. Nduta', 3),
    (6, 'Physics', 'Sciences', 'Mr. Kamande', 4),
    (7, 'Geography', 'Humanities', 'Ms. Chebet', 3),
    (8, 'Chemistry', 'Sciences', 'Ms. Muthoni', 4),
    (9, 'Computer Studies', 'Sciences', 'Mr. Oduya', 3),
    (10, 'Business Studies', 'Humanities', 'Ms. Wangari', 3);


--Inserting exam_results data
INSERT INTO exam_results (
    result_id,
    student_id,
    subject_id,
    marks,
    exam_date,
    grade
)
VALUES
    (1, 1, 1, 78, '2024-03-15', 'B'),
    (2, 1, 2, 85, '2024-03-16', 'A'),
    (3, 2, 1, 92, '2024-03-15', 'A'),
    (4, 2, 3, 55, '2024-03-17', 'C'),
    (5, 3, 2, 49, '2024-03-16', 'D'),
    (6, 3, 4, 71, '2024-03-18', 'B'),
    (7, 4, 1, 88, '2024-03-15', 'A'),
    (8, 4, 6, 63, '2024-03-19', 'C'),
    (9, 5, 5, 39, '2024-03-20', 'F'),
    (10, 6, 9, 95, '2024-03-21', 'A');

--Querying all data
select *
from students;

select *
from subjects;

select *
from exam_results;

--Updating students table
update students
set city = 'Nairobi'
where student_id= 5;

--Updating marks in exam results table
update exam_results
set marks = 59
where result_id= 5;

--Deleting a row
delete from exam_results
where result_id=5;

-- Querying the Data (Filtering with WHERE)
--Filtering form 4 students
select *
from students
where class= 'Form 4';

--Filtering science department
select *
from subjects
where department= 'Sciences';

--Filtering data where marks is greater or equal to 70
select *
from exam_results
where marks >=70;

--Filtering female gender
select *
from students
where gender='F';

--Filtering form 3 students who are from Nairobi
select *
from students
where class= 'Form 3' and city='Nairobi';

--Filtering form 3 & form 4 students
select *
from students
where class in('Form 3', 'Form 4') ;

-- Range, Membership & Search Operators
--Exam results where marks are between 50 and 80
select *
from exam_results
where marks between 50 and 80;


 --Exams that took place between 15th March 2024 and 18th March 2024.


select *
from exam_results
where exam_date between '2024-03-15' and '2024-03-18';

--Or
select *
from exam_results
where exam_date >= '2024-03-15' and exam_date <='2024-03-18';


--Students who live in Nairobi, Mombasa, or Kisumu

select *
from students
where city in('Nairobi', 'Mombasa', 'Kisumu');

--Students who are NOT in Form 2 or Form 3

select *
from students
where class not in('Form 2', 'Form 3');

--Students whose first name starts with the letter 'A' or 'E'

select *
from students
where first_name like 'A%' or first_name like 'E%';

--Subjects whose subject name contains the word 'Studies'
select *
from subjects
where subject_name like '%Studies%';

--COUNT
--How many students are currently in Form 3? 
select count(*)
from students
where class='Form 3';

--How many exam results have a mark of 70 or above?

select count(*)
from exam_results
where marks >=70;

--CASE WHEN

select *,
		case when marks >=80 then 'Distinction'
			 when marks >=60 then 'Merit'
			 when marks >=40 then 'Pass'
			 when marks <40 then  'Fail'
			 end as performance	 
from exam_results;


select first_name,
	   last_name,
	   class,
	   case when class='Form 3' or class= 'Form 4' then 'Senior'
	   	    when class='Form 2' or class= 'Form 1' then 'Junior'
	   	    end as student_level
from students;











































