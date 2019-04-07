DROP VIEW if exists konie_w_stajni 
GO

CREATE VIEW konie_w_stajni AS
SELECT NR_PASZPORTU, IMIE, WZROST, PLEC  FROM KONIE 
go

DROP VIEW if exists zywienie_koni
GO

CREATE VIEW zywienie_koni AS
SELECT k.NR_PASZPORTU, k.IMIE, 
	(SELECT PASZA FROM PASZA WHERE ID_PASZY = 
		(SELECT PASZA FROM ZYWIENIE WHERE NR_PASZPORTU = k.NR_PASZPORTU)) AS PASZA,
	(SELECT DAWKA FROM ZYWIENIE WHERE NR_PASZPORTU = k.NR_PASZPORTU) AS DAWKA_PASZY,
	(SELECT KOMENTARZ FROM ZYWIENIE WHERE NR_PASZPORTU = k.NR_PASZPORTU) AS KOMENTARZ_PASZA,
	(SELECT z.NAZWA FROM DODATKI_Z z WHERE z.ID_DODATEK = d.ID_DODATEK) AS DODATEK,
	d.DAWKA,
	d.KOMENTARZ
FROM DODATKI_ZYWIENIOWE d JOIN KONIE k ON d.NR_PASZPORTU = k.NR_PASZPORTU
GO

SELECT * FROM [dbo].zywienie_koni
GO

CREATE VIEW leczenie AS
SELECT ch.NR_PASZPORTU, 
		(SELECT IMIE FROM KONIE k WHERE k.NR_PASZPORTU = ch.NR_PASZPORTU) AS IMIE, 
		ch.CHOROBA, l.DATA_PODANIA,
		(SELECT s.NAZWA FROM SPIS_LEKOW s WHERE s.ID_LEKU = l.ID_LEKU) AS LEK
FROM LEKI l JOIN CHOROBY ch ON l.ID_CHOROBY = ch.ID_CHOROBY
GO

SELECT * FROM [dbo].leczenie
GO

DROP VIEW if exists zywienie_koni_pasza
GO

CREATE VIEW zywienie_koni_pasza AS
SELECT k.NR_PASZPORTU, k.IMIE,
	(SELECT PASZA FROM PASZA WHERE ID_PASZY = z.PASZA) AS PASZA,
	z.DAWKA, z.KOMENTARZ
FROM KONIE k JOIN ZYWIENIE z ON k.NR_PASZPORTU = z.NR_PASZPORTU
GO

SELECT * FROM [dbo].zywienie_koni_pasza
GO

DROP VIEW if exists zywienie_koni_dodatki
GO

CREATE VIEW zywienie_koni_dodatki AS
SELECT k.NR_PASZPORTU, k.IMIE,
	(SELECT NAZWA FROM DODATKI_Z WHERE ID_DODATEK = d.ID_DODATEK) AS DODATEK,
	d.DAWKA, d.KOMENTARZ
FROM KONIE k JOIN DODATKI_ZYWIENIOWE d ON k.NR_PASZPORTU = d.NR_PASZPORTU
GO

SELECT * FROM [dbo].zywienie_koni_dodatki
GO

DROP VIEW IF EXISTS zawody 
GO

CREATE VIEW zawody AS
SELECT k.NR_PASZPORTU, k.IMIE, 
	(SELECT (IMIE + ' ' + NAZWISKO) FROM JEZDZCY WHERE ID_JEZDZCA = zw.ID_JEZDZIEC) AS JEZDZIEC, 
	(SELECT (IMIE + ' ' + NAZWISKO) FROM TRENERZY WHERE ID_TRENERA = zw.ID_TRENER) AS TRENER, 
	(SELECT NAZWA FROM ZAWODY_BAZA WHERE ID_ZAWODOW = zw.ID_ZAWODOW) AS ZAWODY, 
	zw.WYNIK
FROM KONIE k JOIN ZAWODY_WYSTEPY zw ON k.NR_PASZPORTU = zw.NR_PASZPORTU
GO

SELECT * FROM [dbo].zawody
GO