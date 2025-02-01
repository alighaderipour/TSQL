use dbtest
select name from sys.databases
SELECT *, 
       ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) % 3 AS ShouldDelete
INTO #tblTransactionNEW
FROM tblTransaction

select * from #tblTransactionNEW

DELETE FROM #tblTransactionNEW
WHERE ShouldDelete = 1

UPDATE #tblTransactionNEW
SET DateOfTransaction = DATEADD(day, 1, DateOfTransaction)
WHERE ShouldDelete = 2


ALTER TABLE #tblTransactionNEW DROP COLUMN ShouldDelete

select * from #tblTransactionNEW
----------------------------------
select * from tblTransaction   --2500 rows
select * from #tblTransactionNEW  --1666 rows

--    2500 - 1666 = 334 rows changed
----------------------------------

select * from tblTransaction   
union all
select * from #tblTransactionNEW  

-- union all = 2500 + 1666 = 4166 rows

----------------------------------
select * from tblTransaction   
union 
select * from #tblTransactionNEW  
-- with union its 333 rows mean 833 rows are not same 
----------------------------------
select * from tblTransaction
INTERSECT
select * from #tblTransactionNEW

-- to find those 833 rows we use intersect
----------------------------------
select * from tblTransaction
EXCEPT
select * from #tblTransactionNEW

