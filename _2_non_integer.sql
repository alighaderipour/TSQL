/*
decimal and numeric
float and real
tinyint, smallint, int, bigint
money, smallmoney
--------------------------------
decimal and numeric are exactly same.
--------------------------------
declare @my_var as numeric(18,8) >> 10 digit left side of decimal points and 8 digit right side of decimal points

Precision	Storage bytes
1 - 9	         5
10-19	         9
20-28	         13
29-38	         17
since it is 18 digit then we need 9 bytes storage to save @my_var
--------------------------------
money and samllmoney are 4 decimal and that is fixed
Data type                                   	Range                                                     	Storage
money	                         -922,337,203,685,477.5808 to 922,337,203,685,477.5807                    	8 bytes
smallmoney	                                -214,748.3648 to 214,748.3647	                                4 bytes
--------------------------------
float and real are approximate numbers so do not use them
*/

declare @my_var as numeric(18,8)
set @my_var = 1234567890.12345678
select @my_var
go



Declare @my_smallmoney as smallmoney
set @my_smallmoney = 123456.7891
select @my_smallmoney as smallmoney

-- if you try  set @my_smallmoney = 123456.78912 it will get rounded to nearest fourth decimal place