-- all department
select Department from _9_tblEmployee

--all distinct department with count
select Department, count(*) as total from _9_tblEmployee group by Department

--distinct department only
select distinct (Department) from _9_tblEmployee

------------------------------------------------derived table ---------------------------
select Department as NameOfUniqueDepartment from (select Department, count(*) as total from _9_tblEmployee group by Department) as NewTable

select count(*) as NumberOfDepartment from (select Department, count(*) as total from _9_tblEmployee group by Department) as NewTable


--select into
-- select distinct(Department) from _9_tblEmployee  into _11_