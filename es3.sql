CREATE DATABASE esercizio1;
USE esercizio1;

CREATE TABLE  report0(
 cognome nvarchar(30) not null,
 nome nvarchar(30) not null,
 data_stipendio datetime not null,
 stipendio decimal(19,2) not null,
 );
/* importare i dati da un file CSV */
 SELECT * FROM  report0 r;

 CREATE TABLE employees  (
 id int identity(1,1) PRIMARY KEY,
 last_name nvarchar(30) NOT NULL,
 name nvarchar(30) NOT NULL
);

CREATE TABLE salaries  (
 id int identity(1,1) PRIMARY KEY,
 date_salarie datetime not null,
 salarie decimal(19,2) NOT NULL,
);

/* popolare tramite la tabella report0 le due tabelle */

INSERT INTO employees (last_name, name)
SELECT DISTINCT cognome, nome
FROM report0;

SELECT * FROM employees e

INSERT INTO salaries (date_salarie,salarie)
SELECT DISTINCT data_stipendio, stipendio
FROM report0;

/* Aggiungere il campo data_nascita alla tabella employees */

ALTER TABLE employees
ADD  birth_date datetime;

/* importare i dati da un file CSV */

CREATE TABLE report1  (
 id int PRIMARY KEY,
 birth_date datetime NOT NULL
);

UPDATE e
SET  e.birth_date =r.birth_date
FROM employees e LEFT JOIN report1 r
ON e.id  = r.id ;
