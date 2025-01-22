/*

In the Customers table, show the total number of customers per Country
and City.

*/


SELECT country, city, count(c.CustomerID) as total from Customers c GROUP BY country, city order by total desc