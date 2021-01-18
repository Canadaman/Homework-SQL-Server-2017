With CTE1 AS ( SELECT     Inv.CustomerID, 
           SI.StockItemID, 
           WS.StockItemName, 
           WS.UnitPrice, 
           Inv.InvoiceDate, 
           ROW_NUMBER() OVER(PARTITION BY Inv.CustomerID ORDER BY WS.UnitPrice DESC) AS [RankOfItem]
    FROM Sales.InvoiceLines SI
          JOIN Sales.Invoices Inv ON SI.InvoiceID = Inv.InvoiceID
          JOIN Warehouse.StockItems WS ON SI.StockItemID = WS.StockItemID)
Select SC.CustomerID, sc.CustomerName, cte1.StockItemID, cte1.UnitPrice, cte1.InvoiceDate
From CTE1
Join Sales.Customers SC ON CTE1.CustomerID = SC.CustomerID
where CTE1.RankOfItem <3;

