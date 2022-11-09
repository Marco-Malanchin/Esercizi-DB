CREATE DATABASE legue;
USE legue;

CREATE TABLE serie_a(
id_atleta int,
nome nvarchar(30),
squadra nvarchar(30),
id_squadra int
);

CREATE TABLE stipendio(
id_atleta int,
mese nvarchar(30),
anno int,
stipendio int
)

CREATE TABLE atleta(
id_atleta int PRIMARY KEY,
nome nvarchar(30) NOT NULL
);

CREATE TABLE tesseramento(
id int identity(1,1) PRIMARY KEY,
id_atleta int FOREIGN KEY references atleta(id_atleta),
id_squadra int FOREIGN KEY references squadre(id_squadra),
);

CREATE TABLE squadre(
id_squadra int PRIMARY KEY,
nome nvarchar(30) NOT NULL
);

CREATE TABLE stipendi(
id int identity(1,1) PRIMARY KEY,
id_atleta int FOREIGN KEY references atleta(id_atleta),
mese nvarchar(30),
anno int,
stipendio decimal(8,3)
);

INSERT INTO atleta (id_atleta, nome)
SElECT DISTINCT id_atleta , nome 
FROM serie_a;

INSERT INTO squadre (id_squadra, nome)
SElECT DISTINCT id_squadra , squadra
FROM serie_a;

INSERT INTO tesseramento  (id_atleta, id_squadra)
SElECT DISTINCT id_atleta , id_squadra  
FROM serie_a;

INSERT INTO stipendi (id_atleta, mese, anno, stipendio)
SElECT DISTINCT id_atleta , mese, anno, stipendio 
FROM stipendio;

SELECT * FROM atleta a ;

--Ordine alfabetico
SELECT * FROM atleta a
ORDER BY a.nome;

--squadre
SELECT * FROM squadre s;

--Ordine alfabetico
SELECT * FROM squadre s ORDER BY s.nome;

--Unione atleti con squadre attraverso "Tesseramento"
SELECT * FROM tesseramento t
INNER JOIN atleta a on t.id_atleta = a.id_atleta 
INNER JOIN squadre s on t.id_squadra = s.id_squadra; 

--Unione atleti con squadre attraverso "Tesseramento"
--attraverso tesseramento con selezione verticale
SELECT a.nome, s.nome FROM tesseramento t 
INNER JOIN atleta a on t.id_atleta = a.id_atleta 
INNER JOIN squadre s on t.id_squadra = s.id_squadra; 

--Quanti calciatori sono tesserati
SELECT count(* )FROM tesseramento t 
INNER JOIN atleta a on t.id_atleta = a.id_atleta 
INNER JOIN squadre s on t.id_squadra = s.id_squadra; 

--quanti calciatori sono presenti in ogni squadra
SELECT s.id_squadra , COUNT(s.id_squadra) FROM tesseramento t 
INNER JOIN atleta a on t.id_atleta = a.id_atleta 
INNER JOIN squadre s on t.id_squadra = s.id_squadra 
GROUP BY s.id_squadra;

SELECT s.nome , COUNT(s.id_squadra) FROM tesseramento t 
INNER JOIN atleta a on t.id_atleta = a.id_atleta 
INNER JOIN squadre s on t.id_squadra = s.id_squadra 
GROUP BY s.nome
ORDER BY COUNT(s.id_squadra) ASC;

--stipendio totale e media stipendio versato dalle società per i propri atleti
SELECT SUM(s.stipendio), AVG(s.stipendio)
FROM stipendi s 
INNER JOIN tesseramento t ON s.id_atleta = t.id_atleta
INNER JOIN squadre s2 ON t.id_squadra = s2.id_squadra;

--quale'è lo stipendio totale versato dalle societa
SELECT s.nome, SUM(s2.stipendio) as "stipendio totale", AVG(s2.stipendio) as "Stipendio medio", COUNT(*) as "totale conti"
FROM stipendio s2 
INNER JOIN tesseramento t ON s2.id_atleta = t.id_atleta
INNER JOIN squadre s ON t.id_squadra = s.id_squadra
GROUP BY s.nome
ORDER BY SUM(s2.stipendio) ASC; 


