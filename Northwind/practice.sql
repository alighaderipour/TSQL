/*
28. High freight charges - last year
We're continuing to work on high freight charges. We now want to get
the three ship countries with the highest average freight charges. But
instead of filtering for a particular year, we want to use the last 12
months of order data, using as the end date the last OrderDate in Orders.
*/
WITH cte AS (
SELECT max(orderdate) maxed_order from orders 
)
SELECT top 3  o.ShipCountry, avg(freight) totalavg from Orders o
WHERE o.OrderDate > DATEADD(year, -1, (SELECT maxed_order from cte))
group BY o.ShipCountry
order BY totalavg desc