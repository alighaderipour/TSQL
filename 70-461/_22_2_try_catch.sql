if OBJECT_ID('average_employee_amount', 'p') is not null
    drop PROC average_employee_amount
go
create proc average_employee_amount
(@EmployeeFrom int, @EmployeeTo int , @AVG_Amount money OUTPUT, @TotalEmployee int OUTPUT)
AS
BEGIN
    DECLARE @Total_Amount money
    IF @EmployeeTo >= @EmployeeFrom
        BEGIN
            select @Total_Amount = sum(Amount) from tblTransaction where EmployeeNumber between @EmployeeFrom and @EmployeeTo
            select @TotalEmployee = count(distinct(EmployeeNumber)) from tblTransaction where EmployeeNumber BETWEEN @EmployeeFrom and @EmployeeTo
            BEGIN TRY
                IF @Total_Amount is null or @TotalEmployee = 0
                    BEGIN
                        SET @Total_Amount = 0 
                        SET @TotalEmployee = 0
                        SET @AVG_Amount = @Total_Amount / @TotalEmployee
                    END
            END TRY
            BEGIN CATCH
                set @AVG_Amount = -1
                set @TotalEmployee = -1
                SELECT ERROR_MESSAGE() as ERROR , ERROR_LINE() ERROR_LINE, ERROR_NUMBER() ERROR_NUMBER,
                ERROR_PROCEDURE() ERROR_PROCEDURE, ERROR_SEVERITY() ERROR_SEVERITY,ERROR_STATE() ERROR_STATE
            END CATCH
           
        END
    ELSE
        SELECT 'Wrong Input Parameters'

END



--divid by zero
go
DECLARE @AVG_Amount MONEY, @TotalEmployee int;
EXEC average_employee_amount @EmployeeFrom = 44000, @EmployeeTo = 55000, @AVG_Amount = @AVG_Amount OUTPUT , @TotalEmployee = @TotalEmployee output;
SELECT @AVG_Amount AVG
SELECT @TotalEmployee as TotalEmployee



go
DECLARE @AVG_Amount MONEY, @TotalEmployee int;
EXEC average_employee_amount @EmployeeFrom = 123, @EmployeeTo = 222, @AVG_Amount = @AVG_Amount OUTPUT , @TotalEmployee = @TotalEmployee output;
SELECT @AVG_Amount AVG
SELECT @TotalEmployee as TotalEmployee
