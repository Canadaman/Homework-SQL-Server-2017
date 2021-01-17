SET STATISTICS TIME ON;
Declare @datestart date, @enddate date ;
set @datestart = '20150101';
set	@enddate = '20151231';
SELECT
	SI.InvoiceID AS [InvoiceId],
	  SI.CustomerID,
	  SC.CustomerName AS [NameofCustomer],
	  SI.InvoiceDate AS [InvoiceDate],
	  SUM(SIL.Quantity * SIL.UnitPrice) OVER (PARTITION BY SI.InvoiceID) [OrderSum],
	  SUM(SIL.Quantity * SIL.UnitPrice) OVER (ORDER BY DATEPART(YEAR, SI.InvoiceDate), DATEPART(MONTH, SI.InvoiceDate)) [TotalofMonth]
FROM Sales.Invoices SI
INNER JOIN Sales.Customers SC ON SC.CustomerID = SI.CustomerID
INNER JOIN Sales.InvoiceLines SIL ON SI.InvoiceID = SIL.InvoiceID
WHERE SI.InvoiceDate >= @datestart AND SI.InvoiceDate <= @enddate
ORDER BY SI.InvoiceDate, SI.CustomerID;

-- The second option where I do not use windows functions

SET STATISTICS TIME ON;
Declare @datestart date, @enddate date ;
set @datestart = '20150101';
set	@enddate = '20151231';

SELECT SI.InvoiceID, 
    SC.CustomerName, 
    SI.InvoiceDate, 
(
    SELECT SUM(SIL.Quantity * SIL.UnitPrice)
    FROM Sales.InvoiceLines AS SIL
    WHERE SIL.InvoiceID = SI.InvoiceID
) AS [OrderSum], 
(
    SELECT SUM(SIL2.Quantity * SIL2.UnitPrice)
    FROM Sales.InvoiceLines AS SIL2
        INNER JOIN Sales.Invoices AS SI2 ON SIL2.InvoiceID = SI2.InvoiceID
    WHERE SI2.InvoiceDate <= EOMONTH(SI.InvoiceDate)
        AND (SI2.InvoiceDate between @datestart AND @enddate)
) [TotalofMonth]
FROM Sales.Invoices AS SI
    INNER JOIN Sales.Customers SC ON SI.CustomerID = SC.CustomerID
    INNER JOIN Sales.InvoiceLines SIL ON SI.InvoiceID = SIL.InvoiceID
WHERE SI.InvoiceDate between @datestart AND @enddate
ORDER BY SI.InvoiceDate, SI.CUstomerID;