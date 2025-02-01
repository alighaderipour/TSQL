/*
original table                                   new table
target table                                    source table
tblTransaction                                  tblTransactionNew

*/
/*
select * from tblTransaction
SELECT * from tbltransactionnew
*/


BEGIN TRANSACTION;

MERGE INTO tblTransaction AS T
USING tblTransactionNEW AS N
ON T.EmployeeNumber = N.EmployeeNumber 
   AND T.DateOfTransaction = N.DateOfTransaction

WHEN MATCHED THEN
    UPDATE SET T.Amount = T.Amount + N.Amount 

WHEN NOT MATCHED THEN
    INSERT (Amount, DateOfTransaction, EmployeeNumber) 
    VALUES (N.Amount, N.DateOfTransaction, N.EmployeeNumber);

ROLLBACK TRANSACTION;

-- rows that appeared more than once
SELECT tn.EmployeeNumber, tn.DateOfTransaction, count(*) as total from tblTransactionNEW tn
GROUP BY tn.EmployeeNumber, tn.DateOfTransaction
having count(*)>1

-- let's sum amount
SELECT tn.EmployeeNumber, tn.DateOfTransaction, sum(tn.Amount) as TotalAmount from tblTransactionNEW tn
GROUP BY tn.EmployeeNumber, tn.DateOfTransaction
HAVING count(*)>1



-- disable trigger on tblTransaction
DISABLE TRIGGER tr_tblTransactopm on tblTransaction


--change code to sum
BEGIN TRANSACTION;
MERGE INTO tblTransaction AS T
USING 
(
SELECT EmployeeNumber, DateOfTransaction, sum(Amount) AS Amount from tblTransactionNEW tn GROUP BY EmployeeNumber, DateOfTransaction
) as N
ON T.EmployeeNumber = N.EmployeeNumber 
   AND T.DateOfTransaction = N.DateOfTransaction

WHEN MATCHED THEN
    UPDATE SET T.Amount = T.Amount + N.Amount 

WHEN NOT MATCHED THEN
    INSERT (Amount, DateOfTransaction, EmployeeNumber) 
    VALUES (N.Amount, N.DateOfTransaction, N.EmployeeNumber)
OUTPUT inserted.*,'inserted', deleted.Amount, 'deleted';

ROLLBACK TRANSACTION;