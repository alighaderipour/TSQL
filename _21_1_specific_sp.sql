if exists( select name from sys.procedures where name = 'nameEmployees')
    drop PROC nameEmployees
go
CREATE PROC NameEmployees as
BEGIN
    select EmployeeNumber, EmployeeFirstName, EmployeeLastName from tblEmployee
    
END
GO

--to check if a sp exists or not ( you can use p, v ,...)
select OBJECT_ID('nameEmployees', 'p') procedure_id



-- another way to check if an object exists to create it again is to use object_id() method
go
if OBJECT_ID('nameEmployees', 'p') is not null
    drop PROC nameEmployees
go
CREATE PROC NameEmployees as
BEGIN
    select EmployeeNumber, EmployeeFirstName, EmployeeLastName from tblEmployee
END
GO


--let's create sp with parameters

go
if OBJECT_ID('nameEmployees', 'p') is not null
    drop PROC nameEmployees
go

CREATE PROC NameEmployees 
(@EmployeeNumber int)
as
BEGIN
    if exists (select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
        BEGIN
            select EmployeeNumber, EmployeeFirstName, EmployeeLastName from tblEmployee
            where EmployeeNumber = @EmployeeNumber
        End
END
GO

go
exec NameEmployees 123
exec NameEmployees 124
go

go

NameEmployees 4
