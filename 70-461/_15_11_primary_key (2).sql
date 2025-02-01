--unique 
--not null
--usually linked to foreign key
--table internally ordered by primary key
-- only 1 per table
-- can some columns together be PK
alter TABLE _9_tblEmployee
add CONSTRAINT PK_tblEmployee PRIMARY KEY (EmployeeNumber)

SELECT employeenumber , count(*) from _9_tblEmployee group BY employeenumber HAVING count(*)>1
SELECT * FROM _9_tblEmployee WHERE EmployeeNumber = 131
--remove duplicat
Delete FROM _9_tblEmployee WHERE EmployeeNumber=131 AND Department='Litigation'

alter TABLE _9_tblEmployee
add CONSTRAINT PK_tblEmployee PRIMARY KEY (EmployeeNumber)

insert into _9_tblEmployee (EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeGovernmentID,
DateOfBirth, Department) VALUES (2004, 'FirstName', 'MiddleName', 'LastName', '123ABCD123','Accounts')

SELECT * from _9_tblEmployee WHERE EmployeeNumber=2004

delete from _9_tblEmployee WHERE EmployeeNumber=2004

insert into _9_tblEmployee (EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeLastName, EmployeeGovernmentID,
DateOfBirth, Department) VALUES (2004, 'FirstName', 'MiddleName', 'LastName', '123ABCD123','2014-01-01','Accounts')


CREATE table tblEmployee2
(EmployeeNumber INT CONSTRAINT PK_tblEmployee2 PRIMARY KEY IDENTITY(1,1))



alter table tblEmployee2
ADD EmployeeName nvarchar(30)

insert into tblEmployee2
values('name'), ('name')

SELECT * from tblEmployee2 

select @@IDENTITY -- the last identity used
SELECT SCOPE_IDENTITY()  --for functions, sp, etc

insert into tblEmployee2 (EmployeeNumber, EmployeeName)
values(20, 'name'), (21, 'name')    --this query will raise error 


--if we want to add manual EmployeeNumber we must set IDENTITY_INSERT is set to ON for explicity EmployeeNumber
SET IDENTITY_INSERT tblEmployee2 ON


insert into tblEmployee2 (EmployeeNumber, EmployeeName)
values(20, 'name'), (21, 'name')    --succeed

select @@IDENTITY
SELECT SCOPE_IDENTITY()  --for functions, sp, etc

-- identity is now 21

SET IDENTITY_INSERT tblEmployee2 OFF

delete from tblEmployee2 WHERE EmployeeNumber IN (20,21)

--guess what is identity is now? 

select @@IDENTITY
SELECT SCOPE_IDENTITY()  --for functions, sp, etc

--still 21 
-- now if you add new rows 
insert into tblEmployee2 (EmployeeName)
values('name'), ('name')   

select @@IDENTITY
SELECT SCOPE_IDENTITY()  --for functions, sp, etc

-- it doesn't matter if you delete 20, 21 you explicity added

--even truncate won't reset identity
TRUNCATE TABLE tblEmployee2


select @@IDENTITY
SELECT SCOPE_IDENTITY()  --for functions, sp, etc

SELECT IDENT_CURRENT('dbo.tblEmployee2') 

drop table tblEmployee2