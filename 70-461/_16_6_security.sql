   /*
 dbo = database owner = schema
 objects are different for exampe dbo.table1 , dbo.ViewBYDepartment, accounting.table2, etc
 Q. who has permission to this object? that is where schema means

 */
 -- CHAINING
 -- can you access to a view which is join of 2 tables meanwhile you don't have access to the tables? yes you can
 SELECT  * from dbo.ViewBYDepartment

 -- if I have access to dbo and access to view then I have access 
 --to those tables which this view rely on as long as table 1 and table 2 has same owner

 -- withing dbo.view which I have access to, I can get access to all dbo objects.

 -- important note: if you don't have access to those tables it's fine, 
-- since you have access to view, you can use view but your tables are secure

-- if view is related to 3 tables, dbo.t1, dbo.t2 , accounting.t3 .and I have access to dbo.view but I dont have access to accounting
-- then I don't have access to view (remember t1 and t2 and view have same schema which is dbo)

 