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