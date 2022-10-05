/* Creazione di una library*/
/*CREATE DATABASE db_name;*/
CREATE DATABASE quinta_f_library;
/* database di lavoro db_name
*USE db_name;
*/
USE quinta_f_library;

/*
* CREATE TABLE table_name(
* attribute_name type attrybute_constraint,
* attribute_name type attrybute_constraint,
* attribute_name type attrybute_constraint,
*....,
* table_constraint);
* attribute NOT NULL & UNIQUE => PRIMARY KEY
*/

CREATE TABLE book (ISBN nvarchar(13) PRIMARY KEY, title nvarchar(100) NOT NULL); 

)

/* Popolamaneto tabella
* INSERT INTO table_name(attribute1,....,attributeN)
* VALUES (value1,...,valueN);
*/

INSERT INTO book (ISBN, title)
VALUES ('9788836997745', 'SQL&PHP');

/*
* oooo mannag\gia mi sono dimenticato un attribute come faccio?
* modifichiamo la tabella con
* ALTER TABLE table_name
* ADD attribute_name type attribute_constraint
*/

 ALTER TABLE book 
 DROP COLUMN publishing_house; /* elimina una colonna*/

ALTER TABLE book
ADD publishing_house nvarchar(20);


INSERT INTO book (ISBN, title)
VALUES ('9788836997745', 'SQL&PHP');

/* inserire casa publishing name HOEPLI al libro con specifico
* ISBN
* UPDATE table_name
* SET column1 = value, column2 = value2,...
* WHERE condition;
*/
UPDATE book 
SET publishing_house = 'HOEPLI'
WHERE ISBN = '9788836997745';

INSERT INTO book (ISBN, title,publishing_house)
VALUES ('9788826823317', 'Nuovo Scienze e Tecnologie Apllicate con Arduino', 'ATLAS');

INSERT INTO book (ISBN, title,publishing_house)
VALUES ('9788826823327', 'Data game', 'HOEPLI');

SELECT * FROM book b;

/* tabella case esitrici*/

CREATE TABLE publishing_house (
id int identity(1,1) PRIMARY KEY,
publishing_house nvarchar(20) NOT NULL
);

INSERT INTO publishing_house (publishing_house)
SELECT DISTINCT publishing_house /* prendo i dati case di pubblicazione dalla tabella book*/
FROM book;

SELECT *
FROM publishing_house;

SELECT b.ISBN as 'Codice ISBN', b.title as 'Titolo', ph.id as 'Codice Casa Editrice'		/*Unione delle due tabelle (A * B = C)*/
FROM book b 
FULL JOIN publishing_house ph 
ON b.publishing_house = ph.publishing_house 
WHERE 1=1;

/*Importo la join in una nuova tabella*/
/*Ipotesi 1: nuova tabella*/
SELECT b.ISBN as 'ISBN', b.title as 'title', ph.id as 'id_publishin_house'
INTO book_new
FROM book b 
FULL JOIN publishing_house ph 
ON b.publishing_house = ph.publishing_house 
WHERE 1=1;

SELECT *
FROM book_new;
/*ipotesi 2: aggiornamento dei dati sulla tabella esistente*/
/*1 passaggio: creo l'attributo id_publishing_name sulla tabella book
 * 2 passaggio: aggiorno le tuple prelevando le informazioni dalla tabella publishing_name
 * N:B nel nostro caso l'attributo publishing_house di book non deve essere UNIQUE
 * */

ALTER TABLE book 
ADD id_publishing_name int;

SELECT * FROM 
book;

ALTER TABLE publishing_house 
ADD UNIQUE(publishing_house);

UPDATE b
SET b.id_publishing_name = ph.id
FROM book b 
LEFT JOIN publishing_house ph 
ON b.publishing_house = ph.publishing_house;






