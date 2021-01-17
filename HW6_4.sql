SELECT AP.PersonID, 
       AP.FullName, 
       SClient.CustomerID, 
       SClient.CustomerName, 
       DTran.TransactionDate, 
       DTran.TransactionAmount
FROM
(
    SELECT SC.CustomerID, 
           SI.SalespersonPersonID, 
           SC.TransactionDate, 
           SC.TransactionAmount, 
           ROW_NUMBER() OVER(PARTITION BY SalespersonPersonID ORDER BY TransactionDate DESC) AS [TransperManager]
    FROM Sales.CustomerTransactions SC
         INNER JOIN Sales.Invoices SI ON SC.InvoiceID = SI.InvoiceID
) AS DTran
 JOIN Application.People AP ON DTran.SalespersonPersonID = AP.PersonID
 JOIN Sales.Customers SClient ON DTran.CustomerID = SClient.CustomerID
WHERE DTran.[TransperManager] = 1;