-- 10 ��������� �� ���� ������ � ������ ������� � ������ ����������, ������� ������� �����.
SELECT TOP 10 Customer.CustomerName AS [Client], Salesperson.FullName AS [Personnel], O.OrderDate
FROM Sales.Orders AS O
INNER JOIN Sales.Customers AS Customer ON Customer.CustomerID = O.CustomerID
INNER JOIN Application.People AS Salesperson ON Salesperson.PersonID = O.SalespersonPersonID
ORDER BY O.OrderDate DESC

