CREATE DATABASE prova_5f_db;

USE prova_5f_db;

CREATE TABLE studenti(cognome nvarchar(30) not null, nome nvarchar(30) not null, data_nascita datetime);
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Alex', 'Ferrari', '01/01/2001');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Giovanni', 'Marchetto', '02/01/2001');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Francesco', 'Di lena', '01/02/2001');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Mattia', 'Gallinaro', '01/01/2002');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Matteo', 'Rigolin', '02/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Marco', 'Malanchin', '03/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Simone', 'Giuriato', '04/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Alberto', 'Pavarin', '06/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Andrea', 'Marchetto', '05/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Diego', 'Albertin', '07/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Enrico', 'Toso', '08/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Alessio', 'Donini', '09/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Mattia', 'Zanini', '10/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Alessio', 'Modonesi', '11/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Cristian', 'Mondini', '12/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Matteo', 'Orifiammi', '13/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Federico', 'Rossi', '15/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Michele', 'Gabrieli', '14/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Angelo', 'Pavan', '16/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Daniel', 'Veronese', '18/02/2003');
INSERT INTO studenti (nome, cognome, data_nascita)
VALUES('Andrea', 'Lavezzi', '19/02/2003');
ALTER TABLE studenti ADD secondo_nome nvarchar(30);