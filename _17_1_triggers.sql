create trigger tr_tblDepartment
on dbo._11_tblDepartment
after UPDATE , INSERT, DELETE
as 
BEGIN
    select * from inserted
    select * from deleted
set NOCOUNT on
end
