
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Gusev Sergei
-- Create date: 2021-16-01
-- Description: It is a test procedure to recall my knowledge in this area
-- =============================================
ALTER PROCEDURE Sales.GetNewInvoices (@batchsize INT = 100, @datestart date,@dateend date )
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TOP (@batchsize) 
		InvoiceID
		,CustomerID
		,BillToCustomerID
		,OrderID + 1000 
		,DeliveryMethodID
		,ContactPersonID
		,AccountsPersonID
		,SalespersonPersonID
		,PackedByPersonID
		,InvoiceDate
		,CustomerPurchaseOrderNumber
		,IsCreditNote
		,CreditNoteReason
		,Comments
		,DeliveryInstructions
		,InternalComments
		,TotalDryItems
		,TotalChillerItems
		,DeliveryRun
		,RunPosition
		,ReturnedDeliveryData
		,[ConfirmedDeliveryTime]
		,[ConfirmedReceivedBy]
		,LastEditedBy
		,GETDATE() [Today]
	FROM Sales.Invoices
	WHERE InvoiceDate >= @datestart 
		AND InvoiceDate < @dateend;
END
GO