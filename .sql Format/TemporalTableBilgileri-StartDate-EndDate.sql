--TEMPORAL TABLES (System-Versioned Table - Zamansal Tablolar)
--Raporlama ,Veri Kayb�n� �nler,Belirli bir zaman aral���n� izleyebiliriz.
--Zamansal de�i�ikli�i kay�t alt�nda tutar.Veri Geri D�n�� yapmay� sa�lar

-- ++ Bir Verinin Zamansal Takibi --> Veri ilk Kaydedildi�inde | Veri her g�ncellenmesinde | Fiziksel Tablodaki her de�i�ikli�i History Tablosuna kaydedecek.
--TEMPORAL TABLE OLUSTURMAK 0 dan
use ww 
CREATE TABLE DersKayitlari
(
DersID int primary key identity(1,1),
Ders nvarchar(MAX),
Onay Bit,
----2.KISIM----
StartDate DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
EndDate DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
----3.KISIM--- 
PERIOD FOR SYSTEM_TIME(StartDate,EndDate)
)
----4.KISIM----
WITH(SYSTEM_VERSIONING=ON(HISTORY_TABLE=dbo.DersKayitlariLogg))--Burada dbo.DersKayitlariLogg ad�nda bir tablo olusturacak vermezsen oto olusturur
-------------------------------------------
--VAROLAN TABLOYU TEMPORAL TABLEYE CEVIRMEK  --��inde veri var m� yok mu ?  Varsada yoksada [3] ten devam et
--VERI YOKSA =>
ALTER TABLE Ders 
ADD 
StartDate DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL,
EndDate DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL,
PERIOD FOR SYSTEM_TIME(StartDate,EndDate)

--VERI VARSA => StartDate-EndDate tablolar�na DEFAULT deger atamam�z gerek
ALTER TABLE Ders 
ADD 
StartDate DATETIME2 GENERATED ALWAYS AS ROW START NOT NULL
DEFAULT CAST('1900-01-01 00:00:00.0000000' AS DATETIME2),
EndDate DATETIME2 GENERATED ALWAYS AS ROW END NOT NULL
DEFAULT CAST('9999-12-31 23:59:59.9999999' AS DATETIME2),
PERIOD FOR SYSTEM_TIME(StartDate,EndDate)  --Bu collar Gozukmuyor ama Var

--[3]
ALTER TABLE Ders
SET(SYSTEM_VERSIONING=ON(HISTORY_TABLE=dbo.DersLogg))

----------