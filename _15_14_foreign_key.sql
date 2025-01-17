/*
the PK sort(cluster) the table  by the PK,
the FK uses the resulting index. it uses the dictionary that the pk on unique constraint has created
and it goes through the order of the table in the pk => SEEKING
*/

-- FK Sticks to constraint that PK hold
-- a FK can be NULL

 /*
 when we change a PK into a table we might want to decide what to do with FK in another table
 1- no action   =>   raise error
 2- cascade
 3- set null
 4- set default
 */


begin TRAN
alter TABLE _11_tblTransaction alter COLUMN EmployeeNumber int NULL
alter table _11_tblTransaction add CONSTRAINT df_tblTransaction DEFAULT 123 for EmployeeNumber
ALTER table _11_tblTransaction WITH NOCHECK ADD CONSTRAINT fk_tblTransaction_EmployeeNumber foreign KEY (EmployeeNumber)
REFERENCES _9_tblEmployee (EmployeeNumber)
ON UPDATE CASCADE
-- ON UPDATE SET NULL
-- ON UPDATE SET DEFAULT

--ON DELETE NO ACTION
--ON DELETE SET NULL
--ON DELETE SET DEFAULT


UPDATE _9_tblEmployee set EmployeeNumber = 9123 where EmployeeNumber = 123
--delete _9_tblEmployee where EmployeeNumber = 123

SELECT * FROM _11_tblTransaction where EmployeeNumber = 123

SELECT E.EmployeeNumber, T.*
from _9_tblEmployee AS E
RIGHT JOIN _11_tblTransaction AS T
ON E.EmployeeNumber = T.EmployeeNumber
where T.Amount IN (-179.47, 786.22, -967.36,957.03)

ROLLBACK tran