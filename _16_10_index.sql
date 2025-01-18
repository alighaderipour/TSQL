-- Estimaded Executed Plan 
-- seek = there is index
-- shortcut for EEP in Azure Data Studio is ctrl+L

select * from dbo.ViewBYDepartment

/*
The first index created on a view must be a unique clustered index. After the unique clustered index has been created, you can create more nonclustered indexes.
*/

-- clustering physically sort the views
/*
Rules for Creating a Clustered Indexed View
The view must be created with the SCHEMABINDING option.

All tables referenced in the view must use two-part names (e.g., dbo.TableName).

The view cannot use DISTINCT, TOP, UNION, GROUP BY, or HAVING (unless GROUP BY is used with an aggregate function).

The view must reference only base tables (not other views).

The view must use deterministic functions (functions that always return the same result for the same input).
*/
/*
if you create a indexed views for example sth like select EmployeeNumber from tblEmployee and no other column
since the EmployeeNumber is indexed, the query won't even go through table, it goes only to index 
but if you involve another column like Select EmployeeNumber, Department from ....
then in orderd to find Department it has to go through the table
*/

GO
create UNIQUE CLUSTERED index Inx_ViewByDepartment on dbo.ViewBYDepartment
(EmployeeNumber, Department)
go
-- Cannot create index on view 'dbo.ViewBYDepartment' because the view is not schema bound.

drop view ViewBYDepartment


-- create view again, with dbo. before table names and adding keyword "WITH SCHEMABINDING "
go
CREATE VIEW ViewBYDepartment WITH SCHEMABINDING 
AS  SELECT D.Department, T.EmployeeNumber, T.DateOfTransaction, T.Amount AS TotamAmount
 FROM dbo._11_tblDepartment AS D 
 inner JOIN dbo._9_tblEmployee  AS E ON d.Department = E.Department 
 inner JOIN dbo._11_tblTransaction AS T 
ON E.EmployeeNumber =T.EmployeeNumber WHERE T.EmployeeNumber BETWEEN 120 and 139 with CHECK option 
go

GO
create UNIQUE CLUSTERED index Inx_ViewByDepartment on dbo.ViewBYDepartment
(EmployeeNumber, Department, DateOfTransaction)
go

select * from Inx_ViewByDepartment