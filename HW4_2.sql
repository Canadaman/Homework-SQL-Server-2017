
-- Choice an item with a minimum price
	SELECT WC.StockItemID, 
       WC.StockItemName ,  WC.UnitPrice
FROM Warehouse.StockItems WC
WHERE WC.UnitPrice = (SELECT  Min (UnitPrice) as Minprice FROM Warehouse.StockItems );

  

WITH MP
AS (SELECT  Min (UnitPrice) as Lowprice FROM Warehouse.StockItems)
SELECT SI.StockItemID, 
    SI.StockItemName, SI.UnitPrice
FROM Warehouse.StockItems SI
 Join MP ON SI.UnitPrice=MP.Lowprice;