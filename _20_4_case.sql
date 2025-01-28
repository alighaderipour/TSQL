declare @myOption as varchar(10) = 'Option B'

select case 
              when @myOption = 'Option A' then 'First Option'
              when @myOption = 'Option B' then 'Second Option'
              else 'No Option' 
       end as MyOptions

select CASE @myOption
              when 'Option A' then 'First Option'
              when 'Option B' then 'Second Option'
              else 'No Option' 
       end as MyOption


-------------------

select *, 
case  
       when Year(DateOfBirth)>= 1995 then 'Young'
       WHEN  Year(DateOfBirth)>= 1985 AND  Year(DateOfBirth) <1995 THEN 'middle-aged'
       else 'Old'
end
as status_age
from tblEmployee
       