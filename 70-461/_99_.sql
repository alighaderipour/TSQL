SELECT A.EmployeeNumber,A.AttendanceMonth, A.NumberAttendance,
SUM(A.NumberAttendance) OVER (PARTITION BY A.EmployeeNumber, YEAR(A.AttendanceMonth)) TotalAttendance 
FROM _9_tblEmployee E
 INNER JOIN tblAttendance A
 on e.EmployeeNumber = A.EmployeeNumber
