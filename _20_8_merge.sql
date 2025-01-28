/*
original table                                   new table
target table                                    source table
tblTransaction                                  tblTransactionNew

*/
/*
select * from tblTransaction
SELECT * from tbltransactionnew
*/

BEGIN TRANSACTION
MERGE INTO tblTransaction T
USING tblTransactionNEW  N
on T.EmployeeNumber = N.EmployeeNumber AND T.DateOfTransaction = N.DateOfTransaction
WHEN MATCHED THEN
    UPDATE SET Amount = T.Amount + S.Amount
WHEN NOT MATCHED 
    INSERT (Amount, DateOfTransaction , EmployeeNumber) VALUE (N.Amount, N.DateOfTransaction, N.EmployeeNumber);

ROLLBACK TRANSACTION