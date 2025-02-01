--view must be in a batch to be created
CREATE VIEW ViewBYDepartment AS 
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotamAmount
FROM _11_tblDepartment AS D
left JOIN _9_tblEmployee  AS E
ON d.Department = E.Department
left JOIN _11_tblTransaction AS T
ON E.EmployeeNumber =T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 and 139
go

SELECT * from ViewBYDepartment 


-- if you want to know a view exists already to alter it or drop it
SELECT * from sys.views 


--drop a view to create it again
IF EXISTS ( SELECT * from sys.views WHERE name = 'ViewsBYDEpartment')
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
go

--another way
if EXISTS(SELECT * from INFORMATION_SCHEMA.VIEWS 
WHERE [TABLE_NAME] = 'ViewsBYDepartment' AND [TABLE_SCHEMA] ='dbo')
DROP VIEW dbo.ViewBYDepartment
go



