select E.EmployeeNumber as ENumber , E.EmployeeFirstName, E.EmployeeLastName
       ,T.EmployeeNumber as TNumber, sum(T.Amount) as TotalAMount
from _9_tblEmployee as E
left join dbo._11_tblTransaction as T on E.EmployeeNumber = T.EmployeeNumber
group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
         order by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName



--- which employee has no transaction
select E.EmployeeNumber as ENumber , E.EmployeeFirstName, E.EmployeeLastName
       ,T.EmployeeNumber as TNumber, sum(T.Amount) as TotalAMount
from _9_tblEmployee as E
left join dbo._11_tblTransaction as T on E.EmployeeNumber = T.EmployeeNumber
where T.EmployeeNumber is null
group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
         order by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName



--Derived Table
select * from (select E.EmployeeNumber as ENumber
                    , E.EmployeeFirstName
                    , E.EmployeeLastName
                    , T.EmployeeNumber as TNumber
                    , sum(T.Amount)    as TotalAMount
               from _9_tblEmployee as E
                        left join dbo._11_tblTransaction as T on E.EmployeeNumber = T.EmployeeNumber
               where T.EmployeeNumber is null
               group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
               ) as NewTable

--derived table with order by
select * from (select E.EmployeeNumber as ENumber
                    , E.EmployeeFirstName
                    , E.EmployeeLastName
                    , T.EmployeeNumber as TNumber
                    , sum(T.Amount)    as TotalAMount
               from _9_tblEmployee as E
                        left join dbo._11_tblTransaction as T on E.EmployeeNumber = T.EmployeeNumber
               where T.EmployeeNumber is null
               group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
               ) as NewTable
ORDER BY
    ENumber,
    TNumber,
    EmployeeFirstName,
    EmployeeLastName;

--put where outside
select * from (select E.EmployeeNumber as ENumber
                    , E.EmployeeFirstName
                    , E.EmployeeLastName
                    , T.EmployeeNumber as TNumber
                    , sum(T.Amount)    as TotalAMount
               from _9_tblEmployee as E
                        left join dbo._11_tblTransaction as T on E.EmployeeNumber = T.EmployeeNumber
               group by E.EmployeeNumber, T.EmployeeNumber, E.EmployeeFirstName, E.EmployeeLastName
               ) as NewTable
         where TNumber is null  -- you cannot use T.EmployeeNumber
ORDER BY
    ENumber,
    TNumber,
    EmployeeFirstName,
    EmployeeLastName;


---