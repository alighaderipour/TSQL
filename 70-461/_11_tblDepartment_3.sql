--we want all transaction for each department

select [9tE].Department, sum(Amount) from _11_tblDepartment left join dbo._9_tblEmployee [9tE] on _11_tblDepartment.Department = [9tE].Department
left join dbo._11_tblTransaction [11tT] on [9tE].EmployeeNumber = [11tT].EmployeeNumber
group by [9tE].Department


select * from _11_tblDepartment

update _11_tblDepartment set DepartmentHead = 'Andrew' where Department = 'Customer Relations'


----we want all transaction for each departmenthead

select [9tE].DepartmentHead, sum(Amount) from _11_tblDepartment left join dbo._9_tblEmployee [9tE] on _11_tblDepartment.Department = [9tE].Department
left join dbo._11_tblTransaction [11tT] on [9tE].EmployeeNumber = [11tT].EmployeeNumber
group by [9tE].DepartmentHead


-----------
select _11_tblDepartment.Department,DepartmentHead, sum(Amount) as total from _11_tblDepartment
    left join dbo._9_tblEmployee [9tE] on _11_tblDepartment.Department = [9tE].Department
left join dbo._11_tblTransaction [11tT] on [9tE].EmployeeNumber = [11tT].EmployeeNumber
group by _11_tblDepartment.Department, DepartmentHead

select * from _11_tblDepartment
-------------------------

