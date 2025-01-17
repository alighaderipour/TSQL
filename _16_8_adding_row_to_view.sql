CREATE VIEW ViewBYDepartment
AS
SELECT
	D.Department
   ,T.EmployeeNumber
   ,T.DateOfTransaction
   ,T.Amount AS TotamAmount
FROM _11_tblDepartment AS D
LEFT JOIN _9_tblEmployee AS E
	ON d.Department = E.Department
LEFT JOIN _11_tblTransaction AS T
	ON E.EmployeeNumber = T.EmployeeNumber
WHERE T.EmployeeNumber BETWEEN 120 AND 139
GO

-- can we add some rows to view ? doe's it affect tables related to view?

SELECT * FROM ViewBYDepartment vb
