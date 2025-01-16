
select * from (select E.EmployeeNumber as ENumber
                    , E.EmployeeFirstName
                    , E.EmployeeLastName
                    , T.EmployeeNumber as TNumber
                    , sum(T.Amount)    as TotalAMount
               from _9_tblEmployee as E
                        right join dbo._11_tblTransaction as T on E.EmployeeNumber = T.EmployeeNumber
               group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
               ) as NewTable
         where ENumber is null  -- you cannot use T.EmployeeNumber
ORDER BY
    ENumber,
    TNumber,
    EmployeeFirstName,
    EmployeeLastName;



    ------------------------
    ------------------------------------ delete
begin transaction

select * from _11_tblTransaction

delete _11_tblTransaction
from _9_tblEmployee as E right join _11_tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeNumber is null
select * from _11_tblTransaction

rollback transaction

select * from _11_tblTransaction


------------------------------------ delete tblTransaction EmployeeNumber

begin transaction
select * from _11_tblTransaction
delete _11_tblTransaction
from _11_tblTransaction
where _11_tblTransaction.EmployeeNumber in (
    select Tnumber from (
select E.EmployeeNumber as Enumber , T.EmployeeNumber as Tnumber,
       E.EmployeeFirstName, E.EmployeeLastName , Sum(T.Amount) as total from
    _9_tblEmployee as E
right join  _11_tblTransaction as T
on t.EmployeeNumber = E.EmployeeNumber
group by E.EmployeeNumber  , T.EmployeeNumber , E.EmployeeFirstName, E.EmployeeLastName ) as NewTale
where Enumber is null
    )

    select * from _11_tblTransaction
rollback transaction
select * from _11_tblTransaction



----
------------------------------------ delete
begin transaction

select * from _11_tblTransaction

delete _11_tblTransaction
from _9_tblEmployee as E right join _11_tblTransaction as T
on E.EmployeeNumber = T.EmployeeNumber
where E.EmployeeNumber is null
select * from _11_tblTransaction

rollback transaction

select * from _11_tblTransaction


------------------------------------ delete tblTransaction EmployeeNumber

begin transaction
select * from _11_tblTransaction
delete _11_tblTransaction
from _11_tblTransaction
where _11_tblTransaction.EmployeeNumber in (
    select Tnumber from (
select E.EmployeeNumber as Enumber , T.EmployeeNumber as Tnumber,
       E.EmployeeFirstName, E.EmployeeLastName , Sum(T.Amount) as total from
    _9_tblEmployee as E
right join  _11_tblTransaction as T
on t.EmployeeNumber = E.EmployeeNumber
group by E.EmployeeNumber  , T.EmployeeNumber , E.EmployeeFirstName, E.EmployeeLastName ) as NewTale
where Enumber is null
    )

    select * from _11_tblTransaction
rollback transaction
select * from _11_tblTransaction