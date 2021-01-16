-- The exercise of optimization an SQL-query with CTE
--unoptimized query
SELECT
Invoices.InvoiceID,
Invoices.InvoiceDate,
(SELECT People.FullName
FROM Application.People
WHERE People.PersonID = Invoices.SalespersonPersonID
) AS SalesPersonName,
SalesTotals.TotalSumm AS TotalSummByInvoice,
(SELECT SUM(OrderLines.PickedQuantity*OrderLines.UnitPrice)
FROM Sales.OrderLines
WHERE OrderLines.OrderId = (SELECT Orders.OrderId
FROM Sales.Orders
WHERE Orders.PickingCompletedWhen IS NOT NULL
AND Orders.OrderId = Invoices.OrderId)
) AS TotalSummForPickedItems
FROM Sales.Invoices
JOIN
(SELECT InvoiceId, SUM(Quantity*UnitPrice) AS TotalSumm
FROM Sales.InvoiceLines
GROUP BY InvoiceId
HAVING SUM(Quantity*UnitPrice) > 27000) AS SalesTotals
ON Invoices.InvoiceID = SalesTotals.InvoiceID
ORDER BY TotalSumm DESC;

-- The query with CTE
WITH LineTotal
     AS (SELECT SI.InvoiceID, 
                SUM(SI.Quantity * SI.UnitPrice) AS [TotalSumm]
         FROM Sales.InvoiceLines SI
         GROUP BY SI.InvoiceID
         HAVING SUM(SI.Quantity * SI.UnitPrice) > 27000),
     OrderTotal
     AS (SELECT SO.OrderID, 
                SUM(OrderL.PickedQuantity * OrderL.UnitPrice) AS [TotalSummForPickedItems]
         FROM Sales.Orders SO
              INNER JOIN Sales.OrderLines OrderL ON SO.OrderID = OrderL.OrderID
         WHERE SO.PickingCompletedWhen IS NOT NULL
         GROUP BY SO.OrderID)
     SELECT SI.InvoiceID, 
            SI.InvoiceDate, 
            AP.FullName AS [SalesPersonName], 
            lt.TotalSumm AS [TotalSummByInvoice], 
            ot.TotalSummForPickedItems
     FROM Sales.Invoices SI
          INNER JOIN LineTotal LT ON SI.InvoiceID = LT.InvoiceID
          LEFT JOIN OrderTotal OT ON SI.OrderID = OT.OrderID
          INNER JOIN Application.People AP ON SI.SalespersonPersonID = AP.PersonID
     ORDER BY LT.TotalSumm DESC;