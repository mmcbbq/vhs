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
UPDATE teilnehmer set email = 'kater.karlo' where id = 3 ;
UPDATE teilnehmer set email = 'frank.Froh@froh.de' where id = 4 ;

INSERT INTO kurs (namen) VALUES ('Englisch');
INSERT INTO kurs (namen) VALUES ('Kochen');
INSERT INTO kurs (namen) VALUES ('PHP');


INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (1,1);
INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (1,2);
INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (2,1);
INSERT INTO kursbelegung (teilnehmerid, kursid) VALUES (4,3);



DESC teilnehmer;