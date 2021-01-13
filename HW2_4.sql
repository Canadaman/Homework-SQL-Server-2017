
SELECT DM.DeliveryMethodName,po.OrderDate, ST.FinalizationDate, S.SupplierName AS [Supplier]
FROM Purchasing.Suppliers AS S 
INNER JOIN Purchasing.PurchaseOrders AS PO ON S.SupplierID = PO.SupplierID
INNER JOIN Application.DeliveryMethods AS DM ON PO.DeliveryMethodID = DM.DeliveryMethodID
INNER JOIN Application.People AS P ON P.PersonID = PO.ContactPersonID
INNER JOIN Purchasing.SupplierTransactions AS ST ON ST.PurchaseOrderID = PO.PurchaseOrderID
WHERE (DM.DeliveryMethodName = 'Road Freight' OR DM.DeliveryMethodName = 'Post')
	AND DATEPART(YEAR, ST.FinalizationDate) = 2014


/*

INNER JOIN Purchasing.SupplierTransactions AS ST ON ST.PurchaseOrderID = PO.PurchaseOrderID
WHERE (DM.DeliveryMethodName = 'Road Freight' OR DM.DeliveryMethodName = 'Post')
	AND DATEPART(YEAR, ST.FinalizationDate) = 2014*/