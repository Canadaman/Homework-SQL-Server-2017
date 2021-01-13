
Select  o.OrderID,convert(nvarchar(16), o.OrderDate, 104) as [Orderdate], FORMAT (O.OrderDate, 'MMMM' ) AS [Month], DATEPART(QUARTER, O.OrderDate) AS [Quarter],
CASE
        WHEN MONTH(o.OrderDate) BETWEEN 1  AND 4  THEN 1
        WHEN MONTH(o.OrderDate) BETWEEN 5  AND 8  THEN 2
        WHEN MONTH(o.OrderDate) BETWEEN 9  AND 12  THEN 3
     END AS [Third]
, sc.CustomerName
FROM Sales.Orders AS O
INNER JOIN Sales.OrderLines AS OL ON OL.OrderID=O.OrderID
left join Sales.Customers AS SC on o.CustomerID=sc.CustomerID
WHERE O.PickingCompletedWhen IS NOT NULL and (OL.UnitPrice > 100 OR (OL.Quantity>20))
Order by [Quarter], [Third], o.OrderDate


