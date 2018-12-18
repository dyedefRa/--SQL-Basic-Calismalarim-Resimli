-- TEMPORARY TABLE'LARI ICIN OZEL KULLANIMLAR

-- AS OF <Datetime>
-- 'StartDate'>= Datetime And EndDate <=Datetime þeklinde
SELECT * from Ders  --Fiziksel Tablodan olacak. History'den deðil.
FOR SYSTEM_TIME AS OF '2018-12-18 11:44:34.7196692' WHERE Id=4

-- FROM<startdate> TO <EndDate>
-- StartDate>=1. date >ND EndDate<=2.date
Select * from Ders FOR SYSTEM_TIME FROM '2018-12-18 11:44:34.7196695' TO '9999-12-31 23:59:59.9999999'

--BETWEEN <startdate> AND <enddatetime>
--CONTAINED IN(start_date,end_date)

-------------------------
--TEMPORAL TABLE LISTEMEK
Select s.name Isim,s.object_id ID,s.history_table_id ,OBJECT_NAME(s.history_table_id) [History Tablo Adý] from sys.tables s WHERE OBJECT_NAME(history_table_id) IS NOT NULL


--TEMPORAL TABLE PASSIVE/ACTIVE
--Temporal tablolarýnda Truncate iþlemi yapýlamaz.
--Temporal tablolar silinemez!
ALTER TABLE dbo.DersKayitlari SET(SYSTEM_VERSIONING=OFF)  -- Artýk Temporal tablo deðil . Truncate yapabliriz bu tabloda . Silede bilriz.
