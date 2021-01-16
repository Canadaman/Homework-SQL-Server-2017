EXEC sp_configure 'show advanced options', 1;  
GO

EXEC sp_configure 'xp_cmdshell', 1;  
GO 

RECONFIGURE;  
GO  


EXEC master..xp_cmdshell 'bcp "[WideWorldImporters].Sales.Customers" out "D:\SalesCustomers.data" -T -w -t"@eu&$1&" -S LENOVO-PC'
GO



-- Copy table schema
SELECT *  INTO [WideWorldImporters].Sales.Customers2 FROM [WideWorldImporters].Sales.Customers WHERE 1 = 2

--truncate table Sales.customers2
--Drop table [WideWorldImporters].Sales.Customers2 
-- Select * from Sales.customers2
BEGIN TRAN

BULK INSERT [WideWorldImporters].[Sales].[Customers2]
				   FROM "D:\SalesCustomers.data"
				   WITH 
					 (
						BATCHSIZE = 1000, 
						DATAFILETYPE = 'widechar',
						FIELDTERMINATOR = '@eu&$1&',
						ROWTERMINATOR ='\n',
						KEEPNULLS,
						TABLOCK        
					  );
ROLLBACK TRAN