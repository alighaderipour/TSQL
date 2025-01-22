SELECT *,
       ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 3 AS ShouldDelete
INTO tblTransactionNEW
FROM tblTransaction

DELETE FROM tblTransactionNEW
WHERE ShouldDelete = 1

UPDATE tblTransactionNEW
SET DateOfTransaction = DATEADD(day, 1, DateOfTransaction)
WHERE ShouldDelete = 2


ALTER TABLE tblTransactionNEW DROP COLUMN ShouldDelete


