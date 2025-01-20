SELECT
	@@NESTLEVEL nestlevel
-- how deep into the triggers we are


/*

NESTLEVEL		
0	                                           1	                            2
		
		
insert into view		
	                                 instead of view trigger	
									 trigger modifies table	

																			alter table trigger
																			select statement
																			end of trigger

	                                 trigger modfies table					
																			after table trigger
																			select statement
																			end of trigger
								     end of trigger
		
statement end		

*/

ALTER TRIGGER tr_tblTransactopm
ON _11_tblTransaction
AFTER DELETE, UPDATE, INSERT
AS
BEGIN
	IF @@NESTLEVEL = 1
BEGIN
	SELECT @@NESTLEVEL AS NESTLEVEVL
	SELECT
		*
	FROM INSERTED
	SELECT
		*
	FROM DELETED
END
	
END
GO


BEGIN TRAN
INSERT INTO _11_tblTransaction (Amount, DateOfTransaction, EmployeeNumber)
	VALUES (123, '2015-07-10', 123)
ROLLBACK TRAN


-- now try to delete from view
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

