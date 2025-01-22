GO
alter TRIGGER TR_ViewBYDepartment
ON dbo.ViewBYDepartment
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @EmployeeNumber AS INT
	DECLARE @DateOfTransaction AS SMALLDATETIME
	DECLARE @Amount AS SMALLMONEY
	SELECT
		@EmployeeNumber = EmployeeNumber
	   ,@DateOfTransaction = DateOfTransaction
	   ,@Amount = TotamAmount
	FROM DELETED  
	-- select * from deleted 
	DELETE _11_tblTransaction FROM _11_tblTransaction t   WHERE t.EmployeeNumber = @EmployeeNumber    AND t.DateOfTransaction = @DateOfTransaction    AND t.Amount = @Amount  
END
GO
/*
 imaging you have 4 rows with EmployeeNumber  = 132 and when you try to delete from this trigger
 only  1 will get deleted , you need to fix this trigger
 */
 GO
alter TRIGGER TR_ViewBYDepartment
ON dbo.ViewBYDepartment
INSTEAD OF DELETE
AS
BEGIN
	SELECT * , 'To Be Deleted' FROM DELETED
	DELETE FROM _11_tblTransaction T JOIN DELETED D
	ON  T.EmployeeNumber = D.EmployeeNumber
	AND T.DateOfTransaction = D.DateOfTransaction
	AND T.Amount = D.Amount
END
GO