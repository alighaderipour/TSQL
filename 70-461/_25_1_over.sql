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
FROM tblEmployee e JOIN tblAttendance a ON e.EmployeeNumber = a.EmployeeNumber
---------------------------------------------------------
SELECT A.EmployeeNumber , A.AttendanceMonth , A.NumberAttendance, SUM(A.NumberAttendance)
OVER(PARTITION BY a.EmployeeNumber , YEAR(a.AttendanceMonth) ORDER by a.AttendanceMonth
ROWS BETWEEN UNBOUNDED PRECEDING and 0 FOLLOWING
) AS TotalAttendance
FROM tblEmployee e JOIN tblAttendance a ON e.EmployeeNumber = a.EmployeeNumber