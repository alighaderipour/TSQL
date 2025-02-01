------------------------------------------------sarg (search argument) ---------------------------
select * from _9_tblEmployee where DateOfBirth  between '19760101' and '19861231'

select * from _9_tblEmployee where DateOfBirth >= '19760101' and DateOfBirth < '19861231'

select * from _9_tblEmployee where year(DateOfBirth) between  1976 and 1986

------------------------------------------------summarizing ---------------------------

-- group by is non-deterministic
-- you cannot use aliases in group by
select year(DateOfBirth) as YearofDateOfBirth, count(*) as NumberBorn from _9_tblEmployee
where 1=1
group by year(DateOfBirth)


--you can use order by
select year(DateOfBirth) as YearofDateOfBirth, count(*) as NumberBorn from _9_tblEmployee
where 1=1
group by year(DateOfBirth)
order by year(DateOfBirth)


--how many employee that start with different letter
select left(EmployeeLastName, 1) as first_letter, count(*) as 'number of occurrence' from _9_tblEmployee
group by left(EmployeeLastName, 1)
--order by left(EmployeeLastName, 1)
order by count(*) asc



--top 5 rows
select top 5 left(EmployeeLastName, 1) as first_letter, count(*) as 'number of occurrence' from _9_tblEmployee
group by left(EmployeeLastName, 1)
--order by left(EmployeeLastName, 1)
order by count(*) desc


-------------------------HAVING
select top 2 left(EmployeeLastName, 1) as first_letter, count(*) as 'number of occurrence' from _9_tblEmployee
where left(EmployeeLastName, 1) in ('S','P','R','G')
group by left(EmployeeLastName, 1)
Having count(*) between 30 and 55
order by 'number of occurrence' asc