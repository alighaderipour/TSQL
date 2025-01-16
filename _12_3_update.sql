----------------------------------------------------------------- update -------------------------
begin transaction
select * from _11_tblTransaction

update _11_tblTransaction
set EmployeeNumber = 194
from _11_tblTransaction
where EmployeeNumber  in (3,4,5,44)

select * from _11_tblTransaction
rollback transaction


-- what those rows that we are going to change are?
----------------------------------------------------------------- output -------------------------
begin transaction
select * from _11_tblTransaction

update _11_tblTransaction
set EmployeeNumber = 194
output inserted.* , deleted.*
from _11_tblTransaction
where EmployeeNumber  in (3,4,5,44)

select * from _11_tblTransaction
rollback transaction
---------------

