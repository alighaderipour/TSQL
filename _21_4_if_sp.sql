if OBJECT_ID('nameEmployees', 'p') is not null
    drop PROC nameEmployees
go

CREATE PROC NameEmployees 
(@EmployeeNumber int)
as
BEGIN
    if exists (select * from tblEmployee where EmployeeNumber = @EmployeeNumber)
        BEGIN
            if @EmployeeNumber < 300 
                BEGIN
                    select EmployeeNumber, EmployeeFirstName, EmployeeLastName, 'Employee lower than 300' from tblEmployee
                    where EmployeeNumber = @EmployeeNumber
                END
            ELSE
                BEGIN
                    select EmployeeNumber, EmployeeFirstName, EmployeeLastName, Department, 'Employee bigger than 300' from tblEmployee
                    where EmployeeNumber = @EmployeeNumber
                END
        End
    ELSE
        BEGIN
            select 'Employee does not exist'
        END
END
GO
EXEC NameEmployees 4

EXEC NameEmployees 310
exec NameEmployees 210

