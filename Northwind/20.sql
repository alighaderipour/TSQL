/*

For this problem, we�d like to see the total number of products in each
category. Sort the results by the total number of products, in descending
order.
*/

SELECT c.CategoryID ,count(ProductID) as total FROM Categories c inner join Products p ON c.CategoryID = p.CategoryID GROUP BY c.CategoryID
order by total DESC

--
go
with cte as 
 (select CategoryID,COUNT(ProductID) as total from Products group by 
CategoryID )
select c.categoryname, c1.total from Categories c
inner join cte as c1
on c.CategoryID = c1.CategoryID
order by total desc
