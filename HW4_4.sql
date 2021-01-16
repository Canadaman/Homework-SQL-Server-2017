

Select distinct AC.CityID, AC.CityName, AP.FullName, sol.StockItemID
From Sales.Orders  SO
left join Application.People AP ON SO.PickedByPersonID=AP.PersonID
INNER JOIN Sales.Customers SC ON SO.CustomerID = SC.CustomerID
inner join Application.Cities AC ON SC.DeliveryCityID= AC.CityID
left join Sales.OrderLines as SOL on SO.OrderID = SOL.OrderID 

Where SOL.StockItemID in  (Select StockItemID  FROM Warehouse.StockItems WS
where UnitPrice in (select top 3 MP.UnitPrice From Warehouse.StockItems MP order by mp.UnitPrice desc))
and Ap.FullName is not null ;


With Topprice as  
 (select top 3 MP.UnitPrice From Warehouse.StockItems MP order by mp.UnitPrice desc)

Select distinct AC.CityID, AC.CityName, AP.FullName, sol.StockItemID
From Sales.Orders  SO
left join Application.People AP ON SO.PickedByPersonID=AP.PersonID
INNER JOIN Sales.Customers SC ON SO.CustomerID = SC.CustomerID
inner join Application.Cities AC ON SC.DeliveryCityID= AC.CityID
left join Sales.OrderLines as SOL on SO.OrderID = SOL.OrderID 
inner join Topprice on SOL.UnitPrice = Topprice.UnitPrice
where Ap.FullName is not null ;
