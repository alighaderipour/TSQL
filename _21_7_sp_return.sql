if OBJECT_ID('nameEmployees', 'p') is not null
    drop PROC nameEmployees
go

CREATE PROC NameEmployees 
(@EmployeeNumberFrom int, @EmployeeNumberTo int, @NumberOfRows int OUTPUT)
as
BEGIN
    if exists (select * from tblEmployee where EmployeeNumber BETWEEN @EmployeeNumberFrom and @EmployeeNumberTo)
        BEGIN
            select EmployeeNumber, EmployeeFirstName, EmployeeLastName from tblEmployee
            where EmployeeNumber BETWEEN @EmployeeNumberFrom and @EmployeeNumberTo
            set @NumberOfRows = @@ROWCOUNT
            RETURN 0
        END
    ELSE
        BEGIN
            select 'Does Not Exists' Result
            set @NumberOfRows =0
            RETURN 1
        END
END


DECLARE @row int , @Return_status int
exec @Return_status= NameEmployees 2212,215, @row output 
select @row TotalRows
SELECT @Return_status  ReturnStatus

---------



