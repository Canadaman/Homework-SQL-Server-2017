  
--  ¬се ид и имена клиентов и их контактные телефоны, которые покупали товар Chocolate frogs 250g
SELECT DISTINCT C.CustomerID AS [ClientId], C.CustomerName AS [CustomerName], C.PhoneNumber
FROM Warehouse.StockItems AS WS
INNER JOIN Sales.OrderLines AS OL ON OL.StockItemID = WS.StockItemID
INNER JOIN Sales.Orders AS SO ON SO.OrderID = OL.OrderID
INNER JOIN Sales.Customers AS C ON C.CustomerID = SO.CustomerID
WHERE WS.StockItemName='Chocolate frogs 250g'
