-- imagine we want to create a simple view
create view vw_employee as
SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName from tblEmployee
GO


--we run view
SELECT * from vw_employee
GO

--we drop view
drop view vw_employee
go

-- creating sp is same as view somehow
create PROC NameEmployees as 
BEGIN
    SELECT EmployeeNumber, EmployeeFirstName, EmployeeLastName from tblEmployee 
END
GO


-- we use exec to run a sp
EXEC NameEmployees
execute NameEmployees
go

-- u can just run the sp without exec/execute
NameEmployees

