
INSERT INTO Sales.Customers (
		CustomerID
		, CustomerName
		, BillToCustomerId
		, CustomerCategoryID
		, PrimaryContactPersonID
		, DeliveryMethodID
		, DeliveryCityID
		, PostalCityID
		, AccountOpenedDate
		, StandardDiscountPercentage
		, IsStatementSent
		, IsOnCreditHold
		, PaymentDays
		, PhoneNumber
		, FaxNumber
		, WebsiteURL
		, DeliveryAddressLine1
		, DeliveryPostalCode
		, PostalAddressLine1
		, PostalPostalCode
		, LastEditedBy)
OUTPUT inserted.CustomerId  
VALUES (NEXT VALUE FOR Sequences.CustomerID -- Customer Id
	, 'Supernic3 HomeWork #2 (#1 Row)' -- CustomerName
	, 1 -- BillToCustomerId
	, 3 -- CustomerCategoryId
	, 1001 -- PrimaryContactPersonId
	, 3 -- DeliveryMethodID
	, 15 -- DeliveryCityId
	, 15 -- PostalCityId
	, '20190529' -- Account Opened Date
	, 0.0 -- Standard Discount Percentage
	, 0 -- IsStatementSent
	, 0 -- IsOnCreditHold
	, 7 -- PaymentDays
	, '(977) 555-66-66' -- PhoneNumber
	, '(977) 555-66-55' -- FaxNumber
	, 'http://supernic3.homework' -- WebsiteURL
	, 'Shop 10' -- DeliveryAddressLine1
	, 90002 -- DeliveryPostalCode
	,' PO Box 101' -- PostalAddressLine1
	, 90002 -- PostalPostalCode
	, 15) -- LastEditedBy -- Вставляю одну и ту же запись, но с разным именем

	-- #2
	, (NEXT VALUE FOR Sequences.CustomerID -- Customer Id
	, 'Supernic3 HomeWork #2 (#2 Row)' -- CustomerName
	, 1 -- BillToCustomerId
	, 3 -- CustomerCategoryId
	, 1001 -- PrimaryContactPersonId
	, 3 -- DeliveryMethodID
	, 15 -- DeliveryCityId
	, 15 -- PostalCityId
	, '20190529' -- Account Opened Date
	, 0.0 -- Standard Discount Percentage
	, 0 -- IsStatementSent
	, 0 -- IsOnCreditHold
	, 7 -- PaymentDays
	, '(977) 555-66-66' -- PhoneNumber
	, '(977) 555-66-55' -- FaxNumber
	, 'http://supernic3.homework' -- WebsiteURL
	, 'Shop 10' -- DeliveryAddressLine1
	, 90002 -- DeliveryPostalCode
	,' PO Box 101' -- PostalAddressLine1
	, 90002 -- PostalPostalCode
	, 15) -- LastEditedBy

	-- #3
	, (NEXT VALUE FOR Sequences.CustomerID -- Customer Id
	, 'Supernic3 HomeWork #2 (#3 Row)' -- CustomerName
	, 1 -- BillToCustomerId
	, 3 -- CustomerCategoryId
	, 1001 -- PrimaryContactPersonId
	, 3 -- DeliveryMethodID
	, 15 -- DeliveryCityId
	, 15 -- PostalCityId
	, '20190529' -- Account Opened Date
	, 0.0 -- Standard Discount Percentage
	, 0 -- IsStatementSent
	, 0 -- IsOnCreditHold
	, 7 -- PaymentDays
	, '(977) 555-66-66' -- PhoneNumber
	, '(977) 555-66-55' -- FaxNumber
	, 'http://supernic3.homework' -- WebsiteURL
	, 'Shop 10' -- DeliveryAddressLine1
	, 90002 -- DeliveryPostalCode
	,' PO Box 101' -- PostalAddressLine1
	, 90002 -- PostalPostalCode
	, 15) -- LastEditedBy

	-- #4
	, (NEXT VALUE FOR Sequences.CustomerID -- Customer Id
	, 'Supernic3 HomeWork #2 (#4  Row)' -- CustomerName
	, 1 -- BillToCustomerId
	, 3 -- CustomerCategoryId
	, 1001 -- PrimaryContactPersonId
	, 3 -- DeliveryMethodID
	, 15 -- DeliveryCityId
	, 15 -- PostalCityId
	, '20190529' -- Account Opened Date
	, 0.0 -- Standard Discount Percentage
	, 0 -- IsStatementSent
	, 0 -- IsOnCreditHold
	, 7 -- PaymentDays
	, '(977) 555-66-66' -- PhoneNumber
	, '(977) 555-66-55' -- FaxNumber
	, 'http://supernic3.homework' -- WebsiteURL
	, 'Shop 10' -- DeliveryAddressLine1
	, 90002 -- DeliveryPostalCode
	,' PO Box 101' -- PostalAddressLine1
	, 90002 -- PostalPostalCode
	, 15) -- LastEditedBy

	-- #5
	, (NEXT VALUE FOR Sequences.CustomerID -- Customer Id
	, 'Supernic3 HomeWork #2 (#5  Row)' -- CustomerName
	, 1 -- BillToCustomerId
	, 3 -- CustomerCategoryId
	, 1001 -- PrimaryContactPersonId
	, 3 -- DeliveryMethodID
	, 15 -- DeliveryCityId
	, 15 -- PostalCityId
	, '20190529' -- Account Opened Date
	, 0.0 -- Standard Discount Percentage
	, 0 -- IsStatementSent
	, 0 -- IsOnCreditHold
	, 7 -- PaymentDays
	, '(977) 555-66-66' -- PhoneNumber
	, '(977) 555-66-55' -- FaxNumber
	, 'http://supernic3.homework' -- WebsiteURL
	, 'Shop 10' -- DeliveryAddressLine1
	, 90002 -- DeliveryPostalCode
	,' PO Box 101' -- PostalAddressLine1
	, 90002 -- PostalPostalCode
	, 15) -- LastEditedBy
	;

-- task 2
	Delete From Sales.Customers
	where CustomerID = 1066
-- task 3

UPDATE Sales.Customers SET CustomerName = 'Example - Update for the second time'
WHERE CustomerID = (SELECT top (1) * FROM  sales.Customers order by CustomerID desc);

SELECT * FROM  sales.Customers 



MERGE Sales.Customers AS target 
	USING (Select 1088, 'New Comapany' /*Customerid, Customername From Sales.Customers where Customername= @CustomerName*/) 
		AS source (Customerid, Customername) 
		ON
	 (target.CustomerName = source.Customername) 
	WHEN MATCHED 
		THEN UPDATE SET Customername = source.Customername
				
						
	WHEN NOT MATCHED 
	THEN INSERT (
		CustomerID
		, CustomerName
		, BillToCustomerId
		, CustomerCategoryID
		, PrimaryContactPersonID
		, DeliveryMethodID
		, DeliveryCityID
		, PostalCityID
		, AccountOpenedDate
		, StandardDiscountPercentage
		, IsStatementSent
		, IsOnCreditHold
		, PaymentDays
		, PhoneNumber
		, FaxNumber
		, WebsiteURL
		, DeliveryAddressLine1
		, DeliveryPostalCode
		, PostalAddressLine1
		, PostalPostalCode
		, LastEditedBy) 

	VALUES (source.Customerid -- Customer Id
		, source.CustomerName -- CustomerName from source
		, 1 -- BillToCustomerId
		, 3 -- CustomerCategoryId
		, 1001 -- PrimaryContactPersonId
		, 3 -- DeliveryMethodID
		, 15 -- DeliveryCityId
		, 15 -- PostalCityId
		, '20190529' -- Account Opened Date
		, 0.0 -- Standard Discount Percentage
		, 0 -- IsStatementSent
		, 0 -- IsOnCreditHold
		, 7 -- PaymentDays
		, '(977) 555-66-66' -- PhoneNumber
		, '(977) 555-66-55' -- FaxNumber
		, 'http://supernic3.homework' -- WebsiteURL
		, 'Shop 10' -- DeliveryAddressLine1
		, 90002 -- DeliveryPostalCode
		,' PO Box 101' -- PostalAddressLine1
		, 90002 -- PostalPostalCode
		, 15) -- LastEditedBy
		 
	OUTPUT deleted.*, $action, inserted.*;