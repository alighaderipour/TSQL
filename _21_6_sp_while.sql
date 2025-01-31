if OBJECT_ID('nameEmployees', 'p') is not null
    drop PROC nameEmployees
go

CREATE PROC NameEmployees 
(@EmployeeNumberFrom int, @EmployeeNumberTo int)
as
BEGIN
    if exists (select * from tblEmployee where EmployeeNumber BETWEEN @EmployeeNumberFrom and @EmployeeNumberTo)
        BEGIN
            if @EmployeeNumberFrom <= @EmployeeNumberTo
                while @EmployeeNumberFrom <= @EmployeeNumberTo
                BEGIN
                    select EmployeeNumber, EmployeeFirstName, EmployeeLastName from tblEmployee
                    where EmployeeNumber BETWEEN @EmployeeNumberFrom and @EmployeeNumberTo
                    set @EmployeeNumberFrom = @EmployeeNumberFrom +1
                END
            ELSE
                BEGIN
                    select 'Wrong Arguments'
                End
        End
    ELSE
        BEGIN
            select 'Employee does not exist'
        END
END


--exec NameEmployees 213,215


--you can use BREAK , CONTINUE too

