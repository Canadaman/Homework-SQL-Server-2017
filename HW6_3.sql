SELECT WS.StockItemID, -- Id of a product
    WS.StockItemName, -- the name of an item
    WS.Brand, -- the brand of commodity
	WS.unitprice, -- the price of a goods
    ROW_NUMBER() OVER(PARTITION BY LEFT(WS.StockItemName, 1) ORDER BY WS.StockItemName) [NumberbyName], 
    COUNT(*) OVER() [TotalCount], -- The whole amount of items 
    COUNT(*) OVER(PARTITION BY LEFT(WS.StockItemName, 1)) [NumberbyFirstsymbol], 
    LEAD(WS.StockItemID) OVER(ORDER BY WS.StockItemName) [NextIdofStuff], 
    LAG(WS.StockItemID) OVER(ORDER BY WS.StockItemName) [PreviousIdOfItem], 
    LAG(WS.StockItemName, 2, 'No items') OVER(ORDER BY WS.StockItemName) [Productname2 stepsback],
    NTILE(30) OVER(ORDER BY WS.TypicalWeightPerUnit) [30GroupbyWeight] -- the list of the products is divided on 30 categories
FROM Warehouse.StockItems WS
ORDER BY WS.stockitemid, WS.StockItemName;

