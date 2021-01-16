  
-- 1. Calculate the average price of  products, the total amount of sales by months
SELECT MONTH(SI.InvoiceDate) AS [Month],
       YEAR(SI.InvoiceDate) AS [Year],
	  cast(round(AVG(SIL.UnitPrice),2) as numeric(4,2)) AS [AVGPrice],
	   SUM(SIL.UnitPrice * SIL.Quantity) AS [Total]
FROM Sales.InvoiceLines SIL
INNER JOIN Sales.Invoices SI ON SIL.InvoiceID = SI.InvoiceID
GROUP BY YEAR(SI.InvoiceDate), MONTH(SI.InvoiceDate)
ORDER BY YEAR(SI.InvoiceDate), MONTH(SI.InvoiceDate);
  