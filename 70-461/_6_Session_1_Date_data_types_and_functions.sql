------------------------------ date data types  and extraction ------------------------------
declare @my_date as datetime
set @my_date = '2015-06-24 12:34:56.124'
select @my_date as date


declare @my_date2 as datetime2(5) = '20150624 12:34:56.124'
select @my_date2 as date


select datefromparts(2015,06,24) as thisdate

select datetime2fromparts(2015,06,24,12,34,56,124,3) as date

select year(@my_date) as myYear, month(@my_date) as myMounth, day(@my_date) as myDay


------------------------------ today's date  ------------------------------

select current_timestamp as right_now_date
SELECT SQL_VARIANT_PROPERTY(GETDATE(), 'BaseType') AS DataType;

select getdate() as right_now_date
SELECT SQL_VARIANT_PROPERTY(GETDATE(), 'BaseType') AS DataType;

select sysdatetime() as right_now_date
SELECT SQL_VARIANT_PROPERTY(sysdatetime(), 'BaseType') AS DataType;


select dateadd(year, 5, '2014-01-01 03:34:24') as added_year
select datepart(hour,'2014-01-01 03:34:24') as hour

select datediff(second ,'2014-01-01 03:34:24', '2014-01-01 03:34:34' ) as second_elapsed



------ type of getdate()
