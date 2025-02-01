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

GO


-- if we don't set @@ROWCOUNT then if we try to delete a data which is not in table still the 2 select from "inserted/deleted" will run
GO
alter TRIGGER tr_tblTransactopm
ON _11_tblTransaction
AFTER DELETE, UPDATE, INSERT
AS
BEGIN
	BEGIN
		SELECT @@NESTLEVEL AS NESTLEVEVL

		IF @@ROWCOUNT >0
		BEGIN
			SELECT 
				*, 'inserted to table' AS  'inserted to table'
			FROM INSERTED
			SELECT
				*, 'deleted from table' AS 'deleted from table'
			FROM DELETED
		END
	END
END
GO


SELECT * FROM ViewBYDepartment vb WHERE vb.EmployeeNumber = 132 and vb.TotamAmount = -2.77



BEGIN TRAN
INSERT INTO _11_tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
	VALUES (123, '2015-07-10', 123)
ROLLBACK TRAN



-- now try to delete from view
BEGIN TRAN
--SELECT * from ViewBYDepartment vb where vb.EmployeeNumber = 132 and vb.TotamAmount = -2.77
DELETE FROM ViewBYDepartment
WHERE TotamAmount = -2.77
	AND EmployeeNumber = 132
--SELECT * from ViewBYDepartment vb where vb.EmployeeNumber = 132 and vb.TotamAmount = -2.77
ROLLBACK TRAN

--try delete for- real
DELETE FROM ViewBYDepartment
WHERE TotamAmount = -2.77
	AND EmployeeNumber = 132
-- it's been deleted
SELECT * FROM ViewBYDepartment vb WHERE vb.EmployeeNumber = 132 and vb.TotamAmount = -2.77

--what happened to tblTransaction's trigger?
SELECT * from _11_tblTransaction t where t.EmployeeNumber = 132


-- if you try to delete this particular again you can do it still you get some select statement which are empty
-- to avoid that we add @@rowcount


-- if we want to see a particualr column actually updated 
/*
IF UPDATE(DateOfTransaction)
begin
	select ...
	select ..
end
*/

/*
columns_updated()  && 2=2

*/