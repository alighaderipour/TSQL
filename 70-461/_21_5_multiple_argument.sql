if OBJECT_ID('nameEmployees', 'p') is not null
    drop PROC nameEmployees
go

CREATE PROC NameEmployees 
(@EmployeeNumberFrom int, @EmployeeNumberTo int)
as
BEGIN
    if exists (select * from tblEmployee where EmployeeNumber BETWEEN @EmployeeNumberFrom and @EmployeeNumberTo)
        BEGIN
            if @EmployeeNumberFrom < 300 
                BEGIN
                    select EmployeeNumber, EmployeeFirstName, EmployeeLastName, 'Employee lower than 300' from tblEmployee
                    where EmployeeNumber BETWEEN @EmployeeNumberFrom and @EmployeeNumberTo
                END
            ELSE
                BEGIN
                    select EmployeeNumber, EmployeeFirstName, EmployeeLastName, Department, 'Employee bigger than 300' from tblEmployee
                    where EmployeeNumber BETWEEN @EmployeeNumberFrom and @EmployeeNumberTo
                END
        End
    ELSE
        BEGIN
            select 'Employee does not exist'
        END
END
GO

exec NameEmployees 213,215
exec NameEmployees @EmployeeNumberFrom = 310 , @EmployeeNumberTo = 320