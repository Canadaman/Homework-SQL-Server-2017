

SELECT ap.PersonID, 
       ap.FullName
	   FROM Application.People AP
WHERE AP.PersonId NOT IN (SELECT SalespersonPersonID FROM Sales.Invoices)
and AP.IsSalesperson = 1;

Go

WITH SalesPersons AS (
	SELECT DISTINCT si.SalespersonPersonID 
	FROM Sales.Invoices si
)
SELECT * /* AP.PersonID, 
       AP.FullName */
FROM Application.People AP
LEFT JOIN SalesPersons SP ON AP.PersonID = SP.SalespersonPersonID
WHERE AP.IsSalesperson = 1 and SP.SalespersonPersonID is null ;


	