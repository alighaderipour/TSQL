/*

For this problem, we’d like to see the total number of products in each
category. Sort the results by the total number of products, in descending
order.
*/

SELECT c.CategoryID ,count(ProductID) as total FROM Categories c inner join Products p ON c.CategoryID = p.CategoryID GROUP BY c.CategoryID
order by total DESC
