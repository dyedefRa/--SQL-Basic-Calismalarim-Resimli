use ww
DECLARE @XML AS XML
SET @XML='
<Tarih_Date Tarih="18.12.2018" Date="12/18/2018"  Bulten_No="2018/240" >
	<Currency CrossOrder="0" Kod="USD" CurrencyCode="USD">
			<Unit>1</Unit>
			<Isim>ABD DOLARI</Isim>
			<CurrencyName>US DOLLAR</CurrencyName>
			<ForexBuying>5.3504</ForexBuying>
			<ForexSelling>5.3600</ForexSelling>
			<BanknoteBuying>5.3466</BanknoteBuying>
			<BanknoteSelling>5.3680</BanknoteSelling>
			<CrossRateUSD/>
			<CrossRateOther/>
	</Currency>
	<Currency CrossOrder="1" Kod="AUD" CurrencyCode="AUD">
			<Unit>1</Unit>
			<Isim>AVUSTRALYA DOLARI</Isim>
			<CurrencyName>AUSTRALIAN DOLLAR</CurrencyName>
			<ForexBuying>3.8384</ForexBuying>
			<ForexSelling>3.8634</ForexSelling>
			<BanknoteBuying>3.8207</BanknoteBuying>
			<BanknoteSelling>3.8866</BanknoteSelling>
				<CrossRateUSD>1.3906</CrossRateUSD>
				<CrossRateOther/>
		</Currency>
</Tarih_Date>
'
DECLARE @hDoc int
EXEC sp_xml_preparedocument @hDoc OUTPUT,@XML 
Select * from OPENXML(@hDoc,'Tarih_Date/Currency')
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
