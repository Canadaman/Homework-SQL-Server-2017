-- �����������, � ������� �� ���� ������� �� ������ ������ (����� ������� ��� ��� ������ ����� ���������, ������ �������� ����� JOIN)
SELECT PS.*
FROM Purchasing.Suppliers AS PS
LEFT JOIN Purchasing.PurchaseOrders AS PP ON PS.SupplierID=PP.SupplierID
WHERE PP.PurchaseOrderID IS NULL