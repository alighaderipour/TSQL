-- creating an "AFTER" trinnger
-- for after trigger you can use UPDATE, DELETE, INSERT

CREATE TRIGGER tr_tblTransactopm
ON dbo._11_tblTransaction
AFTER UPDATE, INSERT, DELETE
AS
BEGIN
	SELECT
		*
	FROM inserted
	SELECT
		*
	FROM deleted
	SET NOCOUNT ON
END
GO




-- creating an "Instead Of" trigger
-- when you create instead of trigger, you an only choose one of "update insert delete"
-- instead of doing , it does something else
CREATE TRIGGER TR_ViewBYDepartment
ON ViewBYDepartment
INSTEAD OF DELETE
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	   ,'ViewBYDepartment'
	FROM DELETED
END
GO



-- now we try to remove something from view
-- instead of error ( cause view is based on 2 tables) we get instead of trigger 
DELETE FROM ViewBYDepartment
WHERE TotamAmount = -2.77
	AND EmployeeNumber = 132




BEGIN TRAN
SELECT
	*
FROM ViewBYDepartment vb
WHERE vb.TotamAmount = -2.77
AND vb.EmployeeNumber = 132

DELETE FROM ViewBYDepartment
WHERE TotamAmount = -2.77
	AND EmployeeNumber = 132

SELECT
	*
FROM ViewBYDepartment vb
WHERE vb.TotamAmount = -2.77
AND vb.EmployeeNumber = 132
ROLLBACK TRAN

GO



-- now let's write some code that actually delete it


GO
ALTER TRIGGER TR_ViewBYDepartment
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
	DELETE _11_tblTransaction
		FROM _11_tblTransaction t
	WHERE t.EmployeeNumber = @EmployeeNumber
		AND t.DateOfTransaction = @DateOfTransaction
		AND t.Amount = @Amount
END
GO


-- remember we had a trigger on tblTransaction
BEGIN TRAN
DELETE FROM ViewBYDepartment
WHERE TotamAmount = -2.77
	AND EmployeeNumber = 132
ROLLBACK TRAN
