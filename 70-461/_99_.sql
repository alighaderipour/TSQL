SELECT A.EmployeeNumber , A.AttendanceMonth, A.NumberAttendance
, sum(A.NumberAttendance) OVER () TotalAttendance
, convert(decimal(7,4),A.NumberAttendance) / sum(A.NumberAttendance) OVER () TotalAttendance  
FROM tblEmployee E INNER JOIN tblAttendance A
on  E.EmployeeNumber = A.EmployeeNumber
go
