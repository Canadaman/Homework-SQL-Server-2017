-- 3. Вывести сумму продаж, дату первой продажи и количество проданного по месяцам,
--по товарам, продажи которых менее 50 ед в месяц. 
SELECT SUM(SIL.Quantity * SIL.UnitPrice) [Amount of sale] , MIN(SI.InvoiceDate) AS [FistSale],
  year(SI.InvoiceDate) as [Saleyear], MONTH(SI.InvoiceDate) as [Salemonth],
  SIL.StockItemID,
  sum(sil.Quantity) as [Amount]  
FROM Sales.Invoices SI
JOIN Sales.InvoiceLines SIL ON SI.InvoiceID = SIL.InvoiceID
GROUP BY  year(SI.InvoiceDate), MONTH(SI.InvoiceDate),  SIL.StockItemID
Having sum(sil.Quantity) <  50
ORDER BY year(SI.InvoiceDate), MONTH(SI.InvoiceDate),  SIL.StockItemID

/*
SELECT SUM(SIL.Quantity * SIL.UnitPrice) [Amount of sale] ,
  Count(SIL.Quantity) as quantity, SIL.StockItemID ,MONTH(SI.InvoiceDate) AS [Month],YEAR(SI.InvoiceDate) AS [Year]
FROM Sales.Invoices SI
INNER JOIN Sales.InvoiceLines SIL ON SI.InvoiceID = SIL.InvoiceID
Group by SIL.StockItemID, SIL.StockItemID ,MONTH(SI.InvoiceDate), YEAR(SI.InvoiceDate) 
--Having  Count(SIL.Quantity) <50
order by  YEAR(SI.InvoiceDate), MONTH(SI.InvoiceDate),  sil.StockItemID;




SELECT sum (Quantity), SI.InvoiceDate
FROM Sales.Invoices SI
INNER JOIN Sales.InvoiceLines SIL ON SI.InvoiceID = SIL.InvoiceID
where StockItemID=132
and SI.InvoiceDate between '20130201' and '20130228'
group by SI.InvoiceDate
order by SI.InvoiceDate
*/