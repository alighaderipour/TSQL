select * from tblEmployee where EmployeeMiddleName is null

------------------------------------------------------------------------------------------------
declare @myOption as varchar(20)
select isnull(@myOption, 'your variable is null') as MyOptions
go

-- coalesce can take many arguemnts
declare @myFirstOption as varchar(10) --= 'Option A'
declare @mySecondOption as varchar(10) --= 'Option B'

select coalesce(@myFirstOption, @mySecondOption, 'No option') as MyOptions
go

------------------------------------------------------------------------------------------------
select isnull('ABC',1) as MyAnswer  -- isnull returns first non-null 
select coalesce('ABC',1) as MyOtherAnswer -- coalesce check all arguments, since string can't be compared to int it raises error
-- Msg 245, Level 16, State 1, Line 1
-- Conversion failed when converting the varchar value 'ABC' to data type int.
go
------------------------------------------------------------------------------------------------
select isnull(null,null) as MyAnswer
select coalesce(null,null) as MyOtherAnswer
--Msg 4127, Level 16, State 1, Line 1
--At least one of the arguments to COALESCE must be an expression that is not the NULL constant.
go
------------------------------------------------------------------------------------------------
create table tblExample
(myOption nvarchar(10) null)
go
insert into tblExample (myOption)
values ('Option A')

select coalesce(myOption, 'No option') as MyOptions
into tblIsCoalesce
from tblExample 
select case when myOption is not null then myOption else 'No option' end as myOptions from tblExample
go
select isnull(myOption, 'No option') as MyOptions
into tblIsNull
from tblExample 
go
select * from tblExample
select * from tblIsCoalesce
select * from tblIsNull



drop table tblExample
drop table tblIsCoalesce
drop table tblIsNull
