
SELECT A.EmployeeNumber,A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER () TotalAttendance 
FROM _9_tblEmployee E
INNER JOIN tblAttendance A
on e.EmployeeNumber = A.EmployeeNumber



SELECT A.EmployeeNumber,A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY E.EmployeeNumber) TotalAttendance 
FROM _9_tblEmployee E
INNER JOIN tblAttendance A
on e.EmployeeNumber = A.EmployeeNumber

SELECT A.EmployeeNumber,A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY E.EmployeeNumber, YEAR(A.AttendanceMonth)) TotalAttendance 
FROM _9_tblEmployee E
INNER JOIN tblAttendance A
on e.EmployeeNumber = A.EmployeeNumber


SELECT A.EmployeeNumber, A.NumberAttendance, MONTH(A.AttendanceMonth) Month,
SUM(A.NumberAttendance) OVER (PARTITION BY E.EmployeeNumber) TotalAttendance 
FROM _9_tblEmployee E
INNER JOIN tblAttendance A
on e.EmployeeNumber = A.EmployeeNumber


SELECT A.EmployeeNumber,A.AttendanceMonth, Month(A.AttendanceMonth) Month,A.NumberAttendance,
SUM(A.NumberAttendance)  OVER (PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth) RunningTotal 
FROM _9_tblEmployee E
INNER JOIN tblAttendance A
on e.EmployeeNumber = A.EmployeeNumber

SELECT A.EmployeeNumber,A.AttendanceMonth, Month(A.AttendanceMonth) Month,A.NumberAttendance,
SUM(A.NumberAttendance)  OVER (PARTITION BY A.EmployeeNumber ORDER BY A.AttendanceMonth DESC) RunningTotal 
FROM _9_tblEmployee E
INNER JOIN tblAttendance A
on e.EmployeeNumber = A.EmployeeNumber



SELECT A.EmployeeNumber , A.AttendanceMonth , A.NumberAttendance, SUM(A.NumberAttendance)
OVER(PARTITION BY a.EmployeeNumber , YEAR(a.AttendanceMonth) ORDER by a.AttendanceMonth
ROWS BETWEEN 1 PRECEDING and 1 FOLLOWING
) AS TotalAttendance
FROM tblEmployee e JOIN tblAttendance a ON e.EmployeeNumber = a.EmployeeNumber
---------------------------------------------------------

SELECT A.EmployeeNumber , A.AttendanceMonth , A.NumberAttendance, SUM(A.NumberAttendance)
OVER(PARTITION BY a.EmployeeNumber , YEAR(a.AttendanceMonth) ORDER by a.AttendanceMonth
ROWS BETWEEN 0 PRECEDING and 1 FOLLOWING
) AS TotalAttendance
FROM tblEmployee e JOIN tblAttendance a ON e.EmployeeNumber = a.EmployeeNumber
---------------------------------------------------------

SELECT A.EmployeeNumber , A.AttendanceMonth , A.NumberAttendance, SUM(A.NumberAttendance)
OVER(PARTITION BY a.EmployeeNumber , YEAR(a.AttendanceMonth) ORDER by a.AttendanceMonth
ROWS BETWEEN 1 PRECEDING and 0 FOLLOWING
) AS TotalAttendance
FROM tblEmployee e JOIN tblAttendance a ON e.EmployeeNumber =  a.EmployeeNumber
---------------------------------------------------------
SELECT A.EmployeeNumber , A.AttendanceMonth , A.NumberAttendance, SUM(A.NumberAttendance)
OVER(PARTITION BY a.EmployeeNumber , YEAR(a.AttendanceMonth) ORDER by a.AttendanceMonth
ROWS BETWEEN UNBOUNDED PRECEDING and 0 FOLLOWING
) AS TotalAttendance
FROM tblEmployee e JOIN tblAttendance a ON e.EmployeeNumber = a.EmployeeNumber



