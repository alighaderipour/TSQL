/*
char  > works in ASCII range  1 byte
varchar > works in ASCII range 1 byte
nchar > works in UNICODE range 2 bytes
nvarchar > > works in UNICODE range 2 bytes

 */
-- if you want to use a fixed length like national code better use char , if you want to store something like names its better to use varchar
-- if you use char(10) regardless of how many character you use it will cost you 10 bytes
-- if you use varchar(10) maximum space that will be used is 20 bytes , for example 'ali' will be 3*2 = 6 bytes
 declare  @my_var nchar(9)
 set @my_var = 'Johnson'
 select @my_var as name
 select len(@my_var) as len
 select DATALENGTH(@my_var) as 'size in bytes'

-- there are some built-in string function in sql like "replace", "rtrim","ltrim" etc
-- https://learn.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver16
-- just google string function sql



select try_convert (tinyint, age*10) as new_age from _4_String_data_types_and_functions
select try_cast (age*10 as tinyint ) as new_age from _4_String_data_types_and_functions

------------------------------ SUBSTRING ------------------------------
--SUBSTRING(expression, start, length) start is 1 index
select name from sys.all_columns
--remove first char
select substring(name, 2, len(name)-1) from sys.all_columns
--remove last char
select substring(name, 1,len(name)-1) from sys.all_columns

------------------------------ REPLACE ------------------------------
--REPLACE(string, old_substring, new_substring)
--we want to names which ends with "id" end to "$$"

--first solution using left / right
select
    case
        when right(name, 2) = 'id' then left(name, len(name)-2) + '$$'
        else name
    end as example1
from sys.all_columns



--second solution using substring
select
    case
        when right(name, 2) = 'id' then substring(name,1, len(name)-2) + '$$'
        else name
    end as example2
from sys.all_columns

--third solution using replace
SELECT
    CASE
        WHEN RIGHT(name, 2) = 'id' THEN REPLACE(name, RIGHT(name, 2), '$$')
        ELSE name
    END AS example3
FROM
    sys.all_columns;


------------------------------ fill table  ------------------------------
--RAND() is a function that generates a random floating-point number between 0 and 1
DECLARE @Counter INT = 1;

-- List of real names
DECLARE @Names TABLE (Name CHAR(50));

INSERT INTO @Names (Name) VALUES
    ('John'), ('Emily'), ('Michael'), ('Sarah'), ('David'),
    ('Jessica'), ('James'), ('Linda'), ('Robert'), ('Maria'),
    ('Paul'), ('Karen'), ('William'), ('Lisa'), ('Andrew'),
    ('Nancy'), ('Mark'), ('Betty'), ('Charles'), ('Helen');

-- Insert random names into the table with a random age between 20 and 70
WHILE @Counter <= 100
BEGIN
    INSERT INTO _4_String_data_types_and_functions (row_number, name, age)
    SELECT
        @Counter,
        Name,
        CAST(20 + (RAND() * 50) AS DECIMAL(5, 2))  -- random age between 20 and 70
    FROM
        (SELECT TOP 1 Name FROM @Names ORDER BY NEWID()) AS RandomNames;

    SET @Counter = @Counter + 1;
END;


select * from _4_String_data_types_and_functions

