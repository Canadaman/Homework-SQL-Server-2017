  
/* 2. Calculate the average price of  products, the total amount of sales by months where
 where total sales of a month exceeded 10,000 
*/
SELECT MONTH(SI.InvoiceDate) AS [Month],
       YEAR(SI.InvoiceDate) AS [Year],
	  cast(round(AVG(SIL.UnitPrice),2) as numeric(4,2)) AS [AVGPrice],
	   SUM(SIL.UnitPrice * SIL.Quantity) AS [Total]
FROM Sales.Invoices SI
INNER JOIN Sales.InvoiceLines SIL ON SI.InvoiceID = SIL.InvoiceID
GROUP BY YEAR(SI.InvoiceDate), MONTH(SI.InvoiceDate)
HAVING SUM(SIL.Quantity * SIL.UnitPrice) > 10000
ORDER BY YEAR(SI.InvoiceDate), MONTH(SI.InvoiceDate);
  
/*
  Select avg(SIL.UnitPrice) as AVPrice, sum(SIL.Quantity * SIL.UnitPrice)
FROM Sales.Invoices SI
INNER JOIN Sales.InvoiceLines SIL ON SI.InvoiceID = SIL.InvoiceID
where SI.InvoiceDate between '2014-01-01' and '2014-01-31' */