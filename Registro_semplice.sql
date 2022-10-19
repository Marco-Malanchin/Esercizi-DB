CREATE DATABASE Register;
USE Register;

CREATE TABLE student(
id int identity(1,1) PRIMARY KEY,
name nvarchar(30) NOT NULL,
surname nvarchar(30) NOT NULL
);

CREATE TABLE teacher(
id_teacher int identity(1,1) PRIMARY KEY,
name nvarchar(30) NOT NULL,
surname nvarchar(30) NOT NULL
);

CREATE TABLE subject(
id_subject int identity(1,1) PRIMARY KEY,
description nvarchar(40) NOT NULL
);

CREATE TABLE class(
id_class int identity(1,1) PRIMARY KEY,
year_class int NOT NULL,
department nvarchar(1) NOT NULL
);

CREATE TABLE student_class(
id_class int FOREIGN KEY REFERENCES class(id_class),			 /*Metto un vincolo sull'integrità referenziale per fare in modo di non eliminare i dati nelle altre tabelle esterne*/
id_student int FOREIGN KEY REFERENCES student(id),
CONSTRAINT pk_class_student PRIMARY KEY(id_class, id_student)    /* Aggiungo più primary key mettendo insieme due dati */
);

CREATE TABLE subject_teacher(
id_class int FOREIGN KEY REFERENCES class(id_class),
id_teacher int FOREIGN KEY REFERENCES teacher(id_teacher),
id_subject int FOREIGN KEY REFERENCES subject(id_subject),
CONSTRAINT pk_class_teacher_subject PRIMARY KEY(id_class, id_teacher, id_subject)
);


