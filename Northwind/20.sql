/*

For this problem, we�d like to see the total number of products in each
category. Sort the results by the total number of products, in descending
order.
*/

SELECT c.CategoryName, p.ProductID  FROM Products p INNER JOIN Categories c ON p.CategoryID = c.CategoryID
SELECT DISTINCT
    c.CategoryName, COUNT(p.ProductID) OVER (PARTITION BY c.CategoryName) AS TotalProducts
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
ORDER BY TotalProducts DESC;


-------------------------------------



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

----
Select
CategoryName
,TotalProducts = count(*)
From Products
Join Categories
on Products.CategoryID = Categories.CategoryID
Group by
CategoryName
Order by
count(*) desc