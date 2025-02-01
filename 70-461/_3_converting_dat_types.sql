select 3/2 as 'integer output'

select 3.0 /2 as 'float output'

-- converting is with this 2 ways: implicit and explicit
-- 1. implicit
declare @my_var as decimal(5,3) = 3
select @my_var /2

-- 2. explicit
declare @my_var2 as integer = 3
select convert(decimal(5,3),@my_var2) /2

select cast(@my_var2 as decimal(5,3))/2

select convert(int, 1.34534534) + convert(int,2.234234234)