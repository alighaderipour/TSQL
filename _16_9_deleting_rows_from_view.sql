CREATE VIEW ViewBYDepartment
AS
    SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotamAmount
    FROM _11_tblDepartment AS D left JOIN _9_tblEmployee  AS E ON d.Department = E.Department 
    left JOIN _11_tblTransaction AS T ON E.EmployeeNumber =T.EmployeeNumber
    WHERE T.EmployeeNumber BETWEEN 120 and 139 with CHECK option 
GO

SELECT * FROM ViewBYDepartment

-- can we delete rows from views? no!
delete from ViewBYDepartment where EmployeeNumber = 132 and TotamAmount = 999.99
/*
Msg 4405, Level 16, State 1, Line 1
View or function 'ViewBYDepartment' is not updatable because the modification affects multiple base tables.
*/

-- you can delete from a view if view is based on  1 table