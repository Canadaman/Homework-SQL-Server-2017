
Select top 5 SC.CustomerID, SC.CustomerName, CT.TransactionAmount
FROM    Sales.Customers SC
left Join Sales.CustomerTransactions CT ON SC.CustomerID = CT.CustomerID 
Order by TransactionAmount desc;
go

Select SC.CustomerID, SC.CustomerName, CT.TransactionAmount
from Sales.Customers SC
 join (Select top 5 TransactionAmount, CustomerID FROM Sales.CustomerTransactions  order by TransactionAmount desc) as CT
on SC.CustomerID = CT.CustomerID;
go

With NumberedTransactions AS 
(Select Top 5 CT.TransactionAmount, CT.CustomerID From [Sales].[CustomerTransactions] as CT order by CT.TransactionAmount desc)
Select sc.CustomerID, sc.CustomerName, NumberedTransactions.TransactionAmount From Sales.Customers as SC
join NumberedTransactions on SC.CustomerID= NumberedTransactions.CustomerID;



WITH NumberedTransactions AS (
	SELECT c.CustomerID, c.CustomerName, ct.TransactionAmount, ROW_NUMBER() OVER (ORDER BY ct.TransactionAmount DESC) AS [RowNumber]
	FROM Sales.Customers c
	INNER JOIN Sales.CustomerTransactions ct ON c.CustomerID = ct.CustomerID
)
SELECT * FROM NumberedTransactions nt WHERE nt.RowNumber <= 5;


