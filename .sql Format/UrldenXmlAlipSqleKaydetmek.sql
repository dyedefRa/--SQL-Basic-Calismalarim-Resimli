--drop table #XML  -> Drop #Xml yap
CREATE TABLE #XML(strXml varchar(MAX))--Eklenilecek Tablo
DECLARE @URL varchar(8000) --Url gerekiyor
SET @URL='http://www.tcmb.gov.tr/kurlar/today.xml'

DECLARE @Response varchar(8000)
DECLARE @XML xml
DECLARE @Obj int
DECLARE @Result int
DECLARE @HTTPStatus int
DECLARE @ErrorMsg varchar(MAX)

EXEC @Result=sp_OACreate 'MSXML2.XMLHttp',@Obj OUT
EXEC @Result=sp_OAMethod @Obj,'open',NULL,'GET',@URL,false
EXEC @Result=sp_OAMethod @Obj,send,NULL,''

INSERT #XML(strXml)
EXEC @Result=sp_OAGetProperty @Obj,'responseXML.xml'--,@Response OUT

Select * from #XML

--Sp_configure 'show advanced options',1
--reconfigure with override

--sp_configure 'Ole Automation Procedures',1
--reconfigure with override
--drop table #XML

Select @XML=strXml FROM #XML
DECLARE @hDoc AS INT,@SQL nvarchar(MAX)

EXEC sp_xml_preparedocument @hDoc OUTPUT,@XML 
Select GETDATE() DATE_,* INTO DOVIZKURLARIXML  from OPENXML(@hDoc,'Tarih_Date/Currency')
WITH
(
UNITT varchar(50) 'Unit', --UNITT col name  |'Unit' -> Xml deki tag
Isim varchar(100) 'Isim',
CurrencyName varchar(100) 'CurrencyName',
ForexBuying float 'ForexBuying',
ForexSelling float 'ForexSelling',
BanknoteBuying float 'BanknoteBuying',
BanknoteSelling float 'BanknoteSelling'
)




