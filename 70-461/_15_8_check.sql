exec sp_help '_11_tblTransaction'

alter table _11_tblTransaction
add constraint chkAmount check (Amount> -1000 and Amount<1000)


select * from _11_tblTransaction

insert into _11_tblTransaction (Amount,DateOfTransaction, EmployeeNumber) values(1010, '2014-01-01', 1)
--The INSERT statement conflicted with the CHECK constraint "chkAmount". The conflict occurred in database "dbtest", table "dbo._11_tblTransaction", column 'Amount'.
--The statement has been terminated.



select * from _9_tblEmployee

-- add a constraint to stop . in middle name
-- the new inserted value for middle name must not containt any .
-- the middle name can be null
-- since we already have . in middle names we must run query with nocheck
-- you get the middle name, replace . with nothing, compare it with inserted value if it's not same as EmployeeMiddleName
-- it means the inserted value had . in it so it fails
-- if inserted value is not its = null so it's ok
alter table _9_tblEmployee
add constraint chkMiddlename check
(replace(EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null)

--this one works
alter table _9_tblEmployee with nocheck
add constraint chkMiddlename check
(replace(EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null)

select * from _9_tblEmployee

-- will not be added
insert into _9_tblEmployee
values(2003, 'A', 'B.', 'C', 'D', '2014-01-01', 'Accounts')

-- will be added
insert into _9_tblEmployee
values(2003, 'A', 'B', 'C', 'D', '2014-01-01', 'Accounts')

-- will be added
insert into _9_tblEmployee
values(2004, 'A', null, 'C', 'E', '2014-01-01', 'Accounts')


--------- add new constraint

alter table _9_tblEmployee
add constraint chckDateOfBirth check (DateOfBirth between '1900-01-01' and  getdate())


insert into _9_tblEmployee values (2005, 'Ali', null,'Ghaderi','209A223B','2026-01-01','HR')
--Msg 547, Level 16, State 0, Line 54
--The INSERT statement conflicted with the CHECK constraint "chckDateOfBirth".
--The conflict occurred in database "dbtest", table "dbo._9_tblEmployee", column 'DateOfBirth'.
--The statement has been terminated.

create table tblEmployee2
(EmployeeMiddleName varchar (50) null, constraint ck_EmployeeMiddleName check
(replace (EmployeeMiddleName, '.', '') = EmployeeMiddleName or EmployeeMiddleName is null))

drop table tblEmployee2tblEmployee2