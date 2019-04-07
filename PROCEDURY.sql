DROP PROCEDURE if exists DODAJ_KONIA 
GO

CREATE PROCEDURE DODAJ_KONIA
@nr_paszportu VARCHAR(250),
@imie VARCHAR(250),
@rasa VARCHAR(10),
@wzrost DECIMAL(5,2),
@matka_paszport VARCHAR(250),
@ojciec_paszport VARCHAR(250),
@data_urodzenia date,
@data_padniecia date,
@wlasciciel INT,
@plec CHAR(1)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO KONIE 
	VALUES (@nr_paszportu, @imie, @rasa, @wzrost, @matka_paszport, @ojciec_paszport, @data_urodzenia, @data_padniecia,
			@wlasciciel, @plec)
END
GO

DROP PROCEDURE if exists DODAJ_WLASCICIELA 
GO

CREATE PROCEDURE DODAJ_WLASCICIELA
@nazwa VARCHAR(250),
@ulica VARCHAR(250),
@nr_domu VARCHAR(10),
@nr_mieszkania INT,
@miasto VARCHAR(250),
@telefon VARCHAR(50)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO WLASCICIELE
	VALUES (@nazwa, @ulica, @nr_domu, @nr_mieszkania, @miasto, @telefon)
END
GO

DROP PROCEDURE if exists DODAJ_CHOROBE 
GO

CREATE PROCEDURE DODAJ_CHOROBE 
@nr_paszportu VARCHAR(250),
@choroba VARCHAR(250),
@data_od DATE,
@data_do DATE,
@komentarz VARCHAR(300)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO CHOROBY
	VALUES (@nr_paszportu, @choroba, @data_od, @data_do, @komentarz);
END
GO

DROP PROCEDURE if exists DODAJ_DODATKI_Z
GO

CREATE PROCEDURE DODAJ_DODATKI_Z 
@nazwa VARCHAR(250)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO DODATKI_Z
	VALUES (@nazwa);
END
GO

DROP PROCEDURE if exists DODAJ_DODATKI_ZWIENIOWE
GO

CREATE PROCEDURE DODAJ_DODATKI_ZYWIENIOWE 
@nr_paszportu VARCHAR(250),
@id_dodatek INT,
@dawka DECIMAL(5,2),
@komentarz VARCHAR(300)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO DODATKI_ZYWIENIOWE
	VALUES (@nr_paszportu, @id_dodatek, @dawka, @komentarz);
END
GO

DROP PROCEDURE if exists DODAJ_JEZDZCY
GO

CREATE PROCEDURE DODAJ_JEZDZCY 
@imie VARCHAR(250),
@nazwisko VARCHAR(250),
@nr_telefonu VARCHAR(50),
@masa DECIMAL(5,2),
@wiek INT
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO JEZDZCY
	VALUES (@imie, @nazwisko, @nr_telefonu, @masa, @wiek);
END
GO

DROP PROCEDURE if exists DODAJ_LEKI
GO

CREATE PROCEDURE DODAJ_LEKI 
@id_leku INT,
@id_choroby INT,
@data_podania DATE,
@komentarz VARCHAR(300)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO LEKI
	VALUES (@id_leku, @id_choroby, @data_podania, @komentarz);
END
GO

DROP PROCEDURE if exists DODAJ_PASZA
GO

CREATE PROCEDURE DODAJ_PASZA 
@pasza VARCHAR(250)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO PASZA
	VALUES (@pasza);
END
GO

DROP PROCEDURE if exists DODAJ_SPIS_LEKOW
GO

CREATE PROCEDURE DODAJ_SPIS_LEKOW
@nazwa VARCHAR(250)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO SPIS_LEKOW
	VALUES (@nazwa);
END
GO

DROP PROCEDURE if exists DODAJ_TRENER
GO

CREATE PROCEDURE DODAJ_TRENER
@imie VARCHAR(250),
@nazwisko VARCHAR(250),
@nr_telefonu VARCHAR(50),
@uprawnienia VARCHAR(250),
@nr_legitymacji VARCHAR(50),
@data_uprawnien DATE
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO TRENERZY
	VALUES (@imie, @nazwisko, @nr_telefonu, @uprawnienia, @nr_legitymacji, @data_uprawnien);
END
GO

DROP PROCEDURE if exists DODAJ_TRENING
GO

CREATE PROCEDURE DODAJ_TRENING
@nr_paszportu VARCHAR(250),
@data_treningu DATE,
@jezdziec INT,
@trener INT,
@czas_trwania_h DECIMAL(3,2),
@opis VARCHAR(300)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO TRENINGI
	VALUES (@nr_paszportu, @data_treningu, @jezdziec, @trener, @czas_trwania_h, @opis);
END
GO

DROP PROCEDURE if exists DODAJ_ZAWODY_BAZA
GO

CREATE PROCEDURE DODAJ_ZAWODY_BAZA
@nazwa VARCHAR(250),
@data_wystepu DATE,
@miejsce VARCHAR(50)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO ZAWODY_BAZA
	VALUES (@nazwa, @data_wystepu, @miejsce);
END
GO

DROP PROCEDURE if exists DODAJ_ZAWODY_WYSTEP
GO

CREATE PROCEDURE DODAJ_ZAWODY_WYSTEP
@nr_paszportu VARCHAR(250),
@id_zawodow INT,
@wynik VARCHAR(50),
@id_jezdziec INT,
@id_trener INT
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO ZAWODY_WYSTEPY
	VALUES (@nr_paszportu, @id_zawodow, @wynik, @id_jezdziec, @id_trener);
END
GO

DROP PROCEDURE if exists DODAJ_ZYWIENIE
GO

CREATE PROCEDURE DODAJ_ZYWIENIE 
@nr_paszporu VARCHAR(250),
@pasza INT,
@dawka DECIMAL(5,2),
@komentarz VARCHAR(300)
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO ZYWIENIE
	VALUES (@nr_paszporu, @pasza, @dawka, @komentarz);
END
GO