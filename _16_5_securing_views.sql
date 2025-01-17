-- to see a creating of a view from sql server 
USE [dbtest]
GO

/****** Object:  View [dbo].[ViewBYDepartment]    Script Date: 1/17/2025 2:50:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ViewBYDepartment] AS 
SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotamAmount
FROM _11_tblDepartment AS D
left JOIN _9_tblEmployee  AS E
ON d.Department = E.Department
left JOIN _11_tblTransaction AS T
ON E.EmployeeNumber =T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 and 139
GO

--it's not secure at all cause you can see the code
-- there are otherways to see a defintion of a view
select * from sys.objects  --all objects



SELECT * from sys.syscomments 
SELECT * from sys.views

SELECT * FROM sys.syscomments s
INNER join sys.views v
ON s.id = v.object_id


SELECT OBJECT_DEFINITION(OBJECT_ID('ViewBYDepartment'))
SELECT * from sys.sql_modules 


-- if you want to encrypt a view use WITH ENCRYPTION
go
CREATE VIEW ViewBYDepartmentEncrypted WITH ENCRYPTION AS  
SELECT D.Department, 
T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotamAmount 
FROM _11_tblDepartment AS D  left JOIN _9_tblEmployee  AS E  
ON d.Department = E.Department 
left JOIN _11_tblTransaction AS T  ON E.EmployeeNumber =T.EmployeeNumber 
WHERE T.EmployeeNumber BETWEEN 120 and 139
go

SELECT OBJECT_DEFINITION(OBJECT_ID('ViewBYDepartmentEncrypted')) --definition is null
SELECT * from sys.sql_modules 