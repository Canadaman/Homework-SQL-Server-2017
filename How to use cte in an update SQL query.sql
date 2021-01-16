ALTER TABLE Sales.Customers ADD CustomerCategoryName NVARCHAR(50);

WITH Customers AS 
(
	SELECT s.CustomerID,
       s.CustomerName,
       sc.CustomerCategoryName AS sourceCustomerCategoryName,
	   s.CustomerCategoryName
	FROM Sales.Customers AS s
		LEFT JOIN Sales.CustomerCategories AS sc
		ON s.CustomerCategoryID = sc.CustomerCategoryID
)
UPDATE Customers
SET CustomerCategoryName = sourceCustomerCategoryName;

SELECT CustomerCategoryName,*
FROM Sales.Customers;

ALTER TABLE Sales.Customers DROP COLUMN CustomerCategoryName;


