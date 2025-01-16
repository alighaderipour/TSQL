-------------------------------------------------name of tables in a database ----------------------
use dbtest
select name as 'table name'
from sys.tables
go
--or
use dbtest
SELECT table_name
FROM INFORMATION_SCHEMA.TABLES
WHERE table_type = 'BASE TABLE';
go
-------------------------------------------------name of databases ----------------------
select name from sys.databases
-------------------------------------------------change table name  ----------------------
use dbtest
EXEC sp_rename 'old_table_name', 'new_table_name';
-------------------------------------------------add column to table   ----------------------
ALTER TABLE table_name
ADD column_name data_type;
-------------------------------------------------change column name  ----------------------
EXEC sp_rename 'tblEmployee.EmployeeFamily', 'EmployeeSurname', 'COLUMN';
-------------------------------------------------change column data type  ----------------------
ALTER TABLE table_name
ALTER COLUMN column_name new_data_type;


------------------------------------------------- table info ----------------------
exec sp_help '_4_String_data_types_and_functions'

-------------------------------------------------- type of sth in table ----------------------
SELECT
    age,
    SQL_VARIANT_PROPERTY(age, 'BaseType') AS DataType,
    SQL_VARIANT_PROPERTY(age, 'Length') AS Length,
    SQL_VARIANT_PROPERTY(age, 'Precision') AS Precision,
    SQL_VARIANT_PROPERTY(age, 'Scale') AS Scale,
    SQL_VARIANT_PROPERTY(age, 'IsNullable') AS IsNullable
FROM
    _4_String_data_types_and_functions;


-- or for example base type of a function's output
SELECT SQL_VARIANT_PROPERTY(GETDATE(), 'BaseType') AS DataType;

------------------------------------------------- collation of a database ----------------------
SELECT name AS DatabaseName, collation_name AS Collation
FROM sys.databases
WHERE name = 'dbtest';
