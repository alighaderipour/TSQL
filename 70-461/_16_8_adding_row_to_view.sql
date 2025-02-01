CREATE VIEW ViewBYDepartment
AS
SELECT
	D.Department
   ,T.EmployeeNumber
   ,T.DateOfTransaction
   ,T.Amount AS TotamAmount
FROM _11_tblDepartment AS D
LEFT JOIN _9_tblEmployee AS E
	ON d.Department = E.Department
LEFT JOIN _11_tblTransaction AS T
	ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 AND 139
GO

-- can we add some rows to view ? doe's it affect tables related to view?

SELECT * FROM ViewBYDepartment vb

-- let's go back to originam ViewBYDeparment
drop view ViewBYDepartment
go

-- again create ViewBYDepartment
CREATE VIEW ViewBYDepartment AS 
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotamAmount
FROM _11_tblDepartment AS D
left JOIN _9_tblEmployee  AS E
ON d.Department = E.Department
left JOIN _11_tblTransaction AS T
ON E.EmployeeNumber =T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 and 139
go


select * from ViewBYDepartment


insert into ViewBYDepartment (EmployeeNumber, DateOfTransaction, TotamAmount) values(
132, '2015-07-07', 999.99)




select * from ViewBYDepartment where EmployeeNumber = 132
select * from _11_tblTransaction where EmployeeNumber = 132


insert into ViewBYDepartment (Department, DateOfTransaction, TotamAmount) values('HR',
133, '2015-07-07', 999.99)

--Msg 4405, Level 16, State 1, Line 2
--View or function 'ViewBYDepartment' is not updatable because the modification affects multiple base tables




--if there is "with check option" we cannot do this , the update that violate our view
update ViewBYDepartment set EmployeeNumber = 142 where EmployeeNumber=132



drop VIEW ViewBYDepartment
go
CREATE VIEW ViewBYDepartment AS 
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotamAmount
FROM _11_tblDepartment AS D
left JOIN _9_tblEmployee  AS E
ON d.Department = E.Department
left JOIN _11_tblTransaction AS T
ON E.EmployeeNumber =T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 and 139
with CHECK option
go

select * from ViewBYDepartment order by EmployeeNumber
update ViewBYDepartment set EmployeeNumber = 142 where EmployeeNumber=133
/*
Msg 550, Level 16, State 1, Line 1
The attempted insert or update failed because the target view either specifies WITH CHECK OPTION
 or spans a view that specifies WITH CHECK OPTION and one or more rows resulting from the operation did not qualify under the CHECK OPTION constraint.
*/
insert into ViewBYDepartment ( DateOfTransaction, TotamAmount) values(
1, '2015-07-07', 999.99)
/*
Started executing query at Line 83
Msg 110, Level 15, State 1, Line 1
There are fewer columns in the INSERT statement 
than values specified in the VALUES clause. The number of values in the VALUES clause must match the number of columns specified in the INSERT statement.
*/