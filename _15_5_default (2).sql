-- default is not actually constraint
-- default constraint it gives a value that a column must have when you add it into a table unless you specify a value for it
-- useful when you have a not null oclumn
alter table _11_tblTransaction
add DateOfEntry datetime


alter table _11_tblTransaction
add constraint defDateOfEntry default getdate() for DateOfEntry


select * from _11_tblTransaction where amount = 1

insert into _11_tblTransaction (Amount,	DateOfTransaction	,EmployeeNumber	)
values (1, '2014-010-1',1)

insert into _11_tblTransaction (Amount,	DateOfTransaction	,EmployeeNumber	,DateOfEntry)
values (1, '2014-01-02',1, '2013-01-01')

select * from _11_tblTransaction where amount = 1

alter table _11_tblTransaction
drop column DateOfEntry

alter table _11_tblTransaction
drop constraint defDateOfEntry