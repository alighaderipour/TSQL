------------------------------------------------simple join and a sum --------------------------------------------------------
SELECT e.EmployeeNumber,year(a.AttendanceMonth) AttendanceYear, sum(a.NumberAttendance) TotalAttendance from tblAttendance a
inner join tblEmployee e ON a.EmployeeNumber = e.EmployeeNumber
GROUP BY e.EmployeeNumber, year(a.AttendanceMonth)
ORDER BY E.EmployeeNumber
GO
--------------------------------------------------------------------------------------------------------
SELECT A.EmployeeNumber , A.AttendanceMonth , A.NumberAttendance, SUM(A.NumberAttendance) OVER() AS TotalAttendance,
CONVERT(DECIMAL(18,7), A.NumberAttendance) / SUM(A.NumberAttendance) OVER() * 100.0000 AS PercentageAttendance
FROM tblEmployee e JOIN tblAttendance a ON e.EmployeeNumber = a.EmployeeNumber
--------------------------------------------------------------------------------------------------------
WITH cte AS 
(
SELECT employeenumber , sum(a.NumberAttendance)  totalattenence FROM tblAttendance a GROUP BY employeenumber 
)
SELECT c.EmployeeNumber,e.EmployeeFirstName, e.EmployeeLastName, e.Department,    totalattenence  from tblEmployee  e inner JOIN 
cte c
ON e.EmployeeNumber = c.EmployeeNumber
--------------------------------------------------------------------------------------------------------
SELECT a.EmployeeNumber, sum(a.NumberAttendance)  OVER (partition BY EmployeeNumber ORDER BY EmployeeNumber) total FROM tblAttendance a 
--------------------------------------------------------------------------------------------------------

SELECT DISTINCT
    e.EmployeeNumber, 
    e.EmployeeFirstName, 
    e.EmployeeLastName, 
    e.Department, 
    SUM(a.NumberAttendance) OVER (PARTITION BY e.EmployeeNumber) AS totalAttendance
FROM 
    tblEmployee e
INNER JOIN 
    tblAttendance a ON e.EmployeeNumber = a.EmployeeNumber;
--------------------------------------------------------------------------------------------------------
SELECT 
    e.EmployeeNumber, 
    e.EmployeeFirstName, 
    e.EmployeeLastName, 
    e.Department, 
    SUM(a.NumberAttendance) OVER (PARTITION BY e.EmployeeNumber) AS totalAttendance
FROM 
    tblEmployee e
INNER JOIN 
    tblAttendance a ON e.EmployeeNumber = a.EmployeeNumber
GROUP BY 
    e.EmployeeNumber, e.EmployeeFirstName, e.EmployeeLastName, e.Department;


test