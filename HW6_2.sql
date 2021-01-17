with Itemspermonth AS  --first CTE where I exctract Amount of a product per month
( SELECT SUM(SIL.Quantity * SIL.UnitPrice) [Amount of sale] , MIN(SI.InvoiceDate) AS [FistSale],
  year(SI.InvoiceDate) as [Saleyear], MONTH(SI.InvoiceDate) as [Salemonth],
  SIL.StockItemID,
  WS.StockItemName,
  sum(SIL.Quantity) as [Amount]
FROM Sales.Invoices SI
JOIN Sales.InvoiceLines SIL ON SI.InvoiceID = SIL.InvoiceID
join Warehouse.StockItems WS ON SIL.StockItemID = WS.StockItemID
Where SI.InvoiceDate between '20160101' and '20161231'
GROUP BY  year(SI.InvoiceDate), MONTH(SI.InvoiceDate),  SIL.StockItemID, ws.StockItemName
  ), Topproduct AS  -- The second CTE where I add the rank of Items which depends on the number of sales
  (
  Select IM.Salemonth, IM.Saleyear, IM.StockItemID,
IM.StockItemName,
IM.Amount,
 ROW_NUMBER() OVER (ORDER BY IM.Amount) AS [Rownumber],
 RANK() OVER (PARTITION BY IM.Salemonth  ORDER BY IM.Amount desc) AS [Topsale]
From Itemspermonth IM)
 -- Finally, I take products in accordance with the assignment
Select * 
From Topproduct
where Topsale<=2
Order by Salemonth, Topsale;


/*
Select sum(SIL.Quantity)
FROM Sales.Invoices SI
JOIN Sales.InvoiceLines SIL ON SI.InvoiceID = SIL.InvoiceID
where SIL.StockItemID = 196
and SI.InvoiceDate between '20160201' and '20160229'
Select IM.Salemonth, IM.Saleyear, IM.StockItemID,
IM.StockItemName,
IM.Amount,
ROW_NUMBER() OVER (ORDER BY IM.Amount),
RANK() OVER (PARTITION BY IM.Salemonth  ORDER BY IM.Amount desc) AS Topsale
From Itemspermonth IM*/
