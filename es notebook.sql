create database register;
use register;

create table notebook(
date_day date,
student_number nvarchar(10),
student_name nvarchar(35),
student_surname nvarchar(35),
subject nvarchar(35),
valutation decimal,
teacher_name nvarchar(35),
teacher_surname nvarchar(35),
class nvarchar(10),
department nvarchar(10),
note text
);

select * from notebook n;

create table student(
student_id nvarchar(10) primary KEY,
student_name nvarchar(30) NOT NULL,
student_surname nvarchar(30) NOT NULL,
id_class int
);

create table class(
id_class int primary key auto_increment,
class nvarchar(2) NOT NULL,
department nvarchar(2) NOT NULL
);

create table teacher(
teacher_id int primary key auto_increment,
teacher_name nvarchar(30) NOT NULL,
teacher_surname nvarchar(30) NOT NULL
);

create table valutation(
id_valutation int primary key auto_increment,
date_day date NOT NULL,
valutation decimal NOT NULL,
subject nvarchar(30) NOT NULL,
id_teacher int NOT NULL,
student_number nvarchar(2) NOT NULL,
note text
);

CREATE TABLE subject(
id_subject int primary key auto_increment,
subject_name nvarchar(30) NOT NULL,
id_teacher int NOT NULL
);

insert into class( class, department)
select distinct class, department 
from notebook;

select * from class c ;

INSERT INTO teacher(teacher_name, teacher_surname)
SELECT DISTINCT teacher_name, teacher_surname
FROM notebook;

select * from teacher t ;

insert into subject (subject_name, id_teacher)
select distinct subject, teacher_id
from notebook , teacher
WHERE notebook.teacher_surname = teacher.teacher_surname;

select * from subject s ;

insert into student(student_id, student_name, student_surname, id_class)
select distinct student_number, student_name, student_surname, id_class 
from notebook , class
where notebook.department = class.department and notebook.class = class.class ;

select * from student s;

insert into valutation (date_day, valutation, subject, id_teacher ,student_number, note)
select distinct date_day, valutation , id_subject, teacher_id, student_number, note
from notebook , subject , teacher
where teacher.teacher_surname = notebook.teacher_surname 
and notebook.subject = subject.subject_name
and teacher.teacher_id = subject.id_teacher;



select * from valutation v ;

