Show DATABASES ;



DROP DATABASE vhs;


CREATE DATABASE vhs;

Use vhs;




CREATE TABLE teilnehmer (
    id int primary key auto_increment ,
    vorname varchar(50),
    nachname varchar(50),
    lebensalter int
);

CREATE TABLE kurs(
    id int primary key auto_increment,
    namen varchar(50)
);

CREATE TABLE kursbelegung(
                             id int primary key auto_increment,
                             teilnehmerid int,
                             kursid int,
                             FOREIGN KEY (teilnehmerid) REFERENCES teilnehmer (id)
);


ALTER TABLE kursbelegung
ADD FOREIGN KEY (kursid) REFERENCES kurs(id);

INSERT INTO teilnehmer (vorname, nachname, lebensalter) VALUES ('Peter' , 'Pan', 30);
INSERT INTO teilnehmer (vorname, nachname, lebensalter) VALUES ('Tina' , 'Turner', 40);
INSERT INTO teilnehmer (vorname, nachname, lebensalter) VALUES ('Kater' , 'Karlo', 50);
INSERT INTO teilnehmer (vorname, nachname, lebensalter) VALUES ('Frank' , 'Froh', 60);

UPDATE teilnehmer SET lebensalter= 16 where vorname = 'Peter' and nachname = 'Pan' ;

ALTER TABLE teilnehmer ADD COLUMN email varchar(50) UNIQUE ;


UPDATE teilnehmer set email = 'peter.pan@pan.de' where id = 1 ;
UPDATE teilnehmer set email = 'tina.turner@turner.de' where id = 2 ;
UPDATE teilnehmer set email = 'kater.karlo@karlo.de' where id = 3 ;
UPDATE teilnehmer set email = 'frank.Froh@froh.de' where id = 4 ;

INSERT INTO kurs (namen) VALUES ('Englisch');
INSERT INTO kurs (namen) VALUES ('Kochen');
INSERT INTO kurs (namen) VALUES ('PHP');


INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (1,1);
INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (1,2);
INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (2,1);
INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (4,3);

SELECT t.vorname , t.nachname, k.namen
FROM kursbelegung
left join teilnehmer t on t.id = kursbelegung.teilnehmerid
left join kurs k on k.id = kursbelegung.kursid
;

# fügt 2 teilnehmer hinzu Bernd Brot 27 , Anna Arsch 29
#
INSERT INTO teilnehmer (vorname, nachname, lebensalter) VALUES ('Bernd', 'Brot', 27);
INSERT INTO teilnehmer (vorname, nachname, lebensalter) VALUES ('Anna', 'Arsch', 29);

UPDATE teilnehmer set teilnehmer.email = 'bernd.brot@brot.de' where id = 5;
UPDATE teilnehmer set teilnehmer.email = 'anna.arsch@arsch.de' where id = 6;

# fügt einen Kurs Java hinzu
INSERT INTO kurs (namen) VALUES ('Java');
# Anna belegt den Kurs Java und Englisch
INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (6,4);
INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (6,1);
# Bernd belegt den Kurs Kochen und PHP
INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (5,2),(5,3);
# Kater Karlo hat seinen Namen in Karl geändert
UPDATE teilnehmer set nachname = 'Karl' where email = 'kater.karlo@karlo.de';
# Tina Turner ist leider verstorben und muss aus der Datenbank entfernt werden
DELETE From kursbelegung where teilnehmerid = 2;
DELETE FROM teilnehmer where id = 2;





select year(now())-30;






update teilnehmer set lebensalter = year(now()) - lebensalter;

ALTER TABLE teilnehmer
CHANGE COLUMN lebensalter  geburtsjahr int;