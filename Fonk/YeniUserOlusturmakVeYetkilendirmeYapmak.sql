-- Masking i�in i�e yarar (Kullan�c�ya g�re Kolonlardaki veri bilgilerini gizleme)

CREATE USER YeniUser2 WITHOUT LOGIN --Kullan�c� olusturma

GRANT SELECT ON MaskedTablosu TO YeniUser2 --Bir Kullan�c�ya yetki verme



GRANT UNMASK TO YeniUser2 --MASK� Kald�rma


EXECUTE AS USER='YeniUser2' -- Kullan�c�ya ge�me
Alter Table MaskedTablosu ADD YeniKolonn nvarchar(MAX) MASKED WITH(Function='default()') --Var olan tabloya yeni Kol ekleyip Mask olay�n� ekleme. ='default()'|'email()'|'partial(4,"XX",4)'
Alter Table MaskedTablosu Alter Column Email Drop Masked -- MaskedTablosundaki Email kolonun Masked'�n� kald�r
Alter Table MaskedTablosu Alter Column Kolon2 Add Masked With(Function='partial(2,"XXX",2)') --Kolon2 kolonunun maskedini bu �ekilde de�i� , ilk 2 son iki ve araya XXX yazs�n.
--