SELECT OBJECT_NAME(OBJECT_ID) AS NameofConstraint,
SCHEMA_NAME(schema_id) AS SchemaName,
OBJECT_NAME(parent_object_id) AS TableName,
type_desc AS ConstraintType
FROM sys.objects
WHERE type_desc LIKE '%CONSTRAINT'


--*********   name='Tablo Adý'ný ver. Butun Constraintleri Verir.
SELECT s.name [Constraint Ismi],Substring(s.type_desc,0,20)+'..' TIPI  from sys.objects s WHERE s.parent_object_id=(Select object_id from Sys.objects  Where name='yeni3') 
AND s.type_desc LIKE '%CONSTRAINT'


Select * FROM sys.objects WHERE type_desc LIKE '%CONSTRAINT'

--sys.objects ile SYSTEM UZERINDEKI TABLOLARI VE KAYITLI VERILERI ALIRIZ.

