-- same number of columns , compatible data type
SELECT convert(char(5), 'hi') AS Salute
UNION
SELECT convert(char(11), 'hello there')


-- SELECT * FROM Inserted UNION SELECT * FROM Deleted


-- alphabetically ordered
SELECT convert(char(5), 'hi') AS Salute
UNION
SELECT convert(char(11), 'hello there')
UNION
SELECT CONVERT(char(11), 'bonjour')


-- union will drop duplication
SELECT convert(char(5), 'hi') AS Salute
UNION
SELECT convert(char(11), 'hello there')
UNION
SELECT CONVERT(char(11), 'bonjour')
union
SELECT convert(char(5), 'hi') 
UNION
SELECT convert(char(11), 'hello there')
UNION
SELECT CONVERT(char(11), 'bonjour')

-- union all won't drop any duplication
SELECT convert(char(5), 'hi') AS Salute
UNION ALL
SELECT convert(char(11), 'hello there')
UNION ALL
SELECT CONVERT(char(11), 'bonjour')
UNION ALL
SELECT convert(char(5), 'hi') 
UNION ALL
SELECT convert(char(11), 'hello there')
UNION ALL
SELECT CONVERT(char(11), 'bonjour')


--largest always 
with cte as (
    select convert(tinyint, 45) as MyColumn
    UNION
    select CONVERT(bigint, 456)
)
select Mycolumn 
into tblTemp
from cte

-- Check if the table exists
SELECT *
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_NAME = 'tblTemp';

SELECT MyColumn
FROM tblTemp;

SELECT 
    COLUMN_NAME AS ColumnName,
    DATA_TYPE AS DataType
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'tblTemp'
    AND COLUMN_NAME = 'MyColumn';