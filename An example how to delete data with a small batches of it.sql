DECLARE @rowcount INT,
		@batchsize INT = 1000;

SET @rowcount = @batchsize;

WHILE @rowcount = @batchsize
BEGIN
	DELETE top (@batchsize) FROM Sales.Invoices
	OUTPUT
		deleted.InvoiceID
		,deleted.CustomerID
		,deleted.BillToCustomerID
		,deleted.OrderID
		,deleted.DeliveryMethodID
		,deleted.ContactPersonID
		,deleted.AccountsPersonID
		,deleted.SalespersonPersonID
		,deleted.PackedByPersonID
		,deleted.InvoiceDate
		,deleted.CustomerPurchaseOrderNumber
		,deleted.IsCreditNote
		,deleted.CreditNoteReason
		,deleted.Comments
		,deleted.DeliveryInstructions
		,deleted.InternalComments
		,deleted.TotalDryItems
		,deleted.TotalChillerItems
		,deleted.DeliveryRun
		,deleted.RunPosition
		,deleted.ReturnedDeliveryData
		,deleted.ConfirmedDeliveryTime
		,deleted.ConfirmedReceivedBy
		,deleted.LastEditedBy
		,deleted.LastEditedWhen
	  INTO Sales.Invoices_Archive
		(InvoiceID
		,CustomerID
		,BillToCustomerID
		,OrderID
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
		,ConfirmedDeliveryTime
		,ConfirmedReceivedBy
		,LastEditedBy
		,LastEditedWhen)
	OUTPUT
		deleted.InvoiceID
	WHERE InvoiceDate >= '2016-01-01' 
		AND InvoiceDate < '2016-04-01';

	SET @rowcount = @@ROWCOUNT;
END
