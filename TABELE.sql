use BazaKoni;

DROP TABLE IF EXISTS WLASCICIELE
CREATE TABLE WLASCICIELE
(
	ID_WLASCICIEL INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NAZWA VARCHAR(250) NOT NULL,
	ULICA VARCHAR(250) NOT NULL,
	NR_DOMU VARCHAR(10) NOT NULL,
	NR_MIESZKANIA INT,
	MIASTO VARCHAR(250),
	TELEFON VARCHAR(50)
)

DROP TABLE IF EXISTS KONIE;
CREATE TABLE KONIE
(
	NR_PASZPORTU VARCHAR(250) NOT NULL PRIMARY KEY,
	IMIE VARCHAR(250) NOT NULL,
	RASA VARCHAR(10) NOT NULL,
	WZROST DECIMAL(5,2) NOT NULL,
	MATKA_PASZPORT VARCHAR(250) NOT NULL,
	OJCIEC_PASZPORT VARCHAR(250) NOT NULL,
	DATA_URODZENIA DATE,
	DATA_PADNIECIA DATE,
	WLASCICIEL INT NOT NULL FOREIGN KEY REFERENCES WLASCICIELE(ID_WLASCICIEL)
)

DROP TABLE IF EXISTS CHOROBY;
CREATE TABLE CHOROBY
(
	ID_CHOROBY INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NR_PASZPORTU VARCHAR(250) NOT NULL FOREIGN KEY REFERENCES KONIE(NR_PASZPORTU),
	CHOROBA VARCHAR(250) NOT NULL,
	DATA_OD DATE,
	DATA_DO DATE,
	KOMENTARZ VARCHAR(300)
)

DROP TABLE IF EXISTS SPIS_LEKOW
CREATE TABLE SPIS_LEKOW
(
	ID_LEKU INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NAZWA VARCHAR(250) NOT NULL
)

DROP TABLE IF EXISTS LEKI
CREATE TABLE LEKI
(
	ID_PODANIA_LEKU INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ID_LEKU INT NOT NULL FOREIGN KEY REFERENCES SPIS_LEKOW(ID_LEKU),
	ID_CHOROBY INT FOREIGN KEY REFERENCES CHOROBY(ID_CHOROBY),
	DATA_PODANIA DATE NOT NULL,
	KOMENTARZ VARCHAR(300),
)

DROP TABLE IF EXISTS PASZA
CREATE TABLE PASZA
(
	ID_PASZY INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	PASZA VARCHAR(250) NOT NULL
)

DROP TABLE IF EXISTS ZYWIENIE
CREATE TABLE ZYWIENIE
(
	ID_ZYWIENIE INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NR_PASZPORTU VARCHAR(250) NOT NULL FOREIGN KEY REFERENCES KONIE(NR_PASZPORTU),
	PASZA INT NOT NULL FOREIGN KEY REFERENCES PASZA(ID_PASZY),
	DAWKA DECIMAL(5,2) NOT NULL,
	KOMENTARZ VARCHAR(300)
)

DROP TABLE IF EXISTS DODATKI_Z
CREATE TABLE DODATKI_Z
(
	ID_DODATEK INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NAZWA VARCHAR(250) NOT NULL
)

DROP TABLE IF EXISTS DODATKI_ZYWIENIOWE
CREATE TABLE DODATKI_ZYWIENIOWE
(
	ID_DODATKI_ZYWIENIOWE INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NR_PASZPORTU VARCHAR(250) NOT NULL FOREIGN KEY REFERENCES KONIE(NR_PASZPORTU),
	ID_DODATEK INT NOT NULL FOREIGN KEY REFERENCES DODATKI_Z(ID_DODATEK),
	DAWKA DECIMAL(5,2) NOT NULL,
	KOMENTARZ VARCHAR(300)
)

DROP TABLE IF EXISTS JEZDZCY
CREATE TABLE JEZDZCY
(
	ID_JEZDZCA INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	IMIE VARCHAR(250) NOT NULL,
	NAZWISKO VARCHAR(250) NOT NULL,
	NR_TELEFONU VARCHAR(50) NOT NULL,
	MASA DECIMAL(5,2)
)

DROP TABLE IF EXISTS TRENERZY
CREATE TABLE TRENERZY
(
	ID_TRENERA INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	IMIE VARCHAR(250) NOT NULL,
	NAZWISKO VARCHAR(250) NOT NULL,
	NR_TELEFONU VARCHAR(50) NOT NULL,
	UPRAWNIENIA VARCHAR(250) NOT NULL,
	NR_LEGITYMACJI VARCHAR(50) NOT NULL,
	DATA_UZYKANIA_UPRAWNIEN DATE NOT NULL
)

DROP TABLE IF EXISTS TRENINGI
CREATE TABLE TRENINGI
(
	ID_TRENINGI INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NR_PASZPORTU VARCHAR(250) NOT NULL FOREIGN KEY REFERENCES KONIE(NR_PASZPORTU),
	DATA_TRENINGU DATE NOT NULL,
	JEZDZIEC INT NOT NULL FOREIGN KEY REFERENCES JEZDZCY(ID_JEZDZCA),
	TRENER INT FOREIGN KEY REFERENCES TRENERZY(ID_TRENERA),
	CZAS_TRWANIA_H DECIMAL(3,2) NOT NULL,
	OPIS VARCHAR(300)
)

DROP TABLE IF EXISTS ZAWODY_BAZA
CREATE TABLE ZAWODY_BAZA
(
	ID_ZAWODOW INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NAZWA VARCHAR(250) NOT NULL,
	DATA_WYSTEPU DATE NOT NULL,
	MIEJSCE VARCHAR(50) NOT NULL
)
	
DROP TABLE IF EXISTS ZAWODY_WYSTEPY
CREATE TABLE ZAWODY_WYSTEPY
(
	ID_WYSTEPU INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	NR_PASZPORTU VARCHAR(250) NOT NULL FOREIGN KEY REFERENCES KONIE(NR_PASZPORTU),
	ID_ZAWODOW INT NOT NULL FOREIGN KEY REFERENCES ZAWODY_BAZA(ID_ZAWODOW),
	WYNIK VARCHAR(50) NOT NULL,
	ID_JEZDZIEC INT NOT NULL FOREIGN KEY REFERENCES JEZDZCY(ID_JEZDZCA),
	ID_TRENER INT FOREIGN KEY REFERENCES TRENERZY(ID_TRENERA)
)