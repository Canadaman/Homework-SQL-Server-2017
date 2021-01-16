

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


