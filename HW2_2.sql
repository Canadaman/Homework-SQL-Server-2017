-- ѕоставщиков, у которых не было сделано ни одного заказа (потом покажем как это делать через подзапрос, сейчас сделайте через JOIN)
SELECT PS.*
FROM Purchasing.Suppliers AS PS
LEFT JOIN Purchasing.PurchaseOrders AS PP ON PS.SupplierID=PP.SupplierID
WHERE PP.PurchaseOrderID IS NULL