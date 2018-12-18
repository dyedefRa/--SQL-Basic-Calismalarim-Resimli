-- Masking için iþe yarar (Kullanýcýya göre Kolonlardaki veri bilgilerini gizleme)

CREATE USER YeniUser2 WITHOUT LOGIN --Kullanýcý olusturma

GRANT SELECT ON MaskedTablosu TO YeniUser2 --Bir Kullanýcýya yetki verme



GRANT UNMASK TO YeniUser2 --MASKý Kaldýrma


EXECUTE AS USER='YeniUser2' -- Kullanýcýya geçme
Alter Table MaskedTablosu ADD YeniKolonn nvarchar(MAX) MASKED WITH(Function='default()') --Var olan tabloya yeni Kol ekleyip Mask olayýný ekleme. ='default()'|'email()'|'partial(4,"XX",4)'
Alter Table MaskedTablosu Alter Column Email Drop Masked -- MaskedTablosundaki Email kolonun Masked'ýný kaldýr
Alter Table MaskedTablosu Alter Column Kolon2 Add Masked With(Function='partial(2,"XXX",2)') --Kolon2 kolonunun maskedini bu þekilde deðiþ , ilk 2 son iki ve araya XXX yazsýn.
--