alter table _9_tblEmployee
add constraint unqGovernmentID unique (EmployeeGovernmentID)

-- if error we need to delete duplicates
select EmployeeGovernmentID, count(*) from _9_tblEmployee group by EmployeeGovernmentID having count(*)>1


-- found duplicate
select * from _9_tblEmployee where EmployeeGovernmentID = 'TX593671R'

--delete duplicate
delete from _9_tblEmployee where EmployeeGovernmentID = 'TX593671R' and EmployeeNumber = 2



-- check constraints
exec  sp_help '_9_tblEmployee'




--add constraint on more than one column

--first check duplicates

select amount, DateOfTransaction, EmployeeNumber , count(*) from _11_tblTransaction
group by amount, DateOfTransaction, EmployeeNumber having count(*) >1

-- assign constraint
alter table _11_tblTransaction
add constraint unqTransaction unique (Amount, DateOfTransaction, EmployeeNumber)


exec  sp_help '_11_tblTransaction'
-- unqTransaction,"nonclustered, unique, unique key located on PRIMARY","Amount, DateOfTransaction, EmployeeNumber"


--- to drop constraint
alter table _11_tblTransaction drop constraint unqTransaction


-- assign constraint on creating table
create table _11_tblTransaction2 (
    Amount smallmoney not null,
    DateOfTransaction smalldatetime not null,
    EmployeeNumber int not null,
    constraint unqTransaction2 unique (Amount, DateOfTransaction, EmployeeNumber)

)

drop table _11_tblTransaction2