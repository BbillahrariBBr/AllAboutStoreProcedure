CREATE TABLE WalmartSalesData (
    invoice_id VARCHAR(30),
    branch VARCHAR(5),
    city VARCHAR(30),
    customer_type VARCHAR(30),
    gender VARCHAR(10),
    product_line VARCHAR(100),
    unit_price DECIMAL(10, 2),
    quantity INT,
    VAT FLOAT,
    total DECIMAL(10, 2),
    [date] DATE,
    [time] TIME,
    payment_method VARCHAR(20),  -- Paymentype (Cash, Credit card, Ewallet)
    cogs DECIMAL(10, 2),
    gross_margin_percentage FLOAT,
    gross_income DECIMAL(10, 2),
    rating FLOAT
);



--- fOR bULK iNSERT CSV TO SSMS
BULK INSERT WalmartSalesData
FROM 'C:\Users\Bakibillah\Downloads\WalmartData.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,        -- Header line escape
    TABLOCK,
    CODEPAGE = 'ACP'   -- UTF-8 encoding
);
--- server version
--select @@VERSION

SELECT * FROM WalmartSalesData

--run this query to check if any NULL exists in any critical column:

SELECT 
    COUNT(*) AS TotalRows,
    COUNT(CASE WHEN invoice_id IS NULL THEN 1 END) AS NullInvoiceID,
    COUNT(CASE WHEN branch IS NULL THEN 1 END) AS NullBranch,
    COUNT(CASE WHEN city IS NULL THEN 1 END) AS NullCity,
    COUNT(CASE WHEN customer_type IS NULL THEN 1 END) AS NullCustomerType,
    COUNT(CASE WHEN gender IS NULL THEN 1 END) AS NullGender,
    COUNT(CASE WHEN product_line IS NULL THEN 1 END) AS NullProductLine,
    COUNT(CASE WHEN unit_price IS NULL THEN 1 END) AS NullUnitPrice,
    COUNT(CASE WHEN quantity IS NULL THEN 1 END) AS NullQuantity,
    COUNT(CASE WHEN VAT IS NULL THEN 1 END) AS NullVAT,
    COUNT(CASE WHEN total IS NULL THEN 1 END) AS NullTotal,
    COUNT(CASE WHEN [date] IS NULL THEN 1 END) AS NullDate,
    COUNT(CASE WHEN [time] IS NULL THEN 1 END) AS NullTime,
    COUNT(CASE WHEN payment_method IS NULL THEN 1 END) AS NullPaymentMethod,
    COUNT(CASE WHEN cogs IS NULL THEN 1 END) AS NullCOGS,
    COUNT(CASE WHEN gross_margin_percentage IS NULL THEN 1 END) AS NullGrossMargin,
    COUNT(CASE WHEN gross_income IS NULL THEN 1 END) AS NullGrossIncome,
    COUNT(CASE WHEN rating IS NULL THEN 1 END) AS NullRating
FROM WalmartSalesData;

--To see all rows where at least one column is NULL:
SELECT *
FROM WalmartSalesData
WHERE invoice_id IS NULL
   OR branch IS NULL
   OR city IS NULL
   OR customer_type IS NULL
   OR gender IS NULL
   OR product_line IS NULL
   OR unit_price IS NULL
   OR quantity IS NULL
   OR VAT IS NULL
   OR total IS NULL
   OR [date] IS NULL
   OR [time] IS NULL
   OR payment_method IS NULL
   OR cogs IS NULL
   OR gross_margin_percentage IS NULL
   OR gross_income IS NULL
   OR rating IS NULL;

   -------------------------------------------------------------------------------------------------------------
   --------------Feature Engineering-----------------------------------
   -----time_of_day-----

SELECT [time],
case 
when [time] < '12:00:00' then 'Morning'
when [time] < '16:00:00' then 'Afternoon' 
else 'Evening' 
end
as time_of_day, * FROM WalmartSalesData

--Add Column Name like  time_of_day
ALTER TABLE WalmartSalesData
ADD time_of_day VARCHAR(20);
-- updte new clmn data
update WalmartSalesData set time_of_day = case 
when [time] < '12:00:00' then 'Morning'
when [time] < '16:00:00' then 'Afternoon' 
else 'Evening' 
end
--
select [time], time_of_day, * from WalmartSalesData 

------day_name-------
--select [date], FORMAT([date], 'ddd') as day_name from WalmartSalesData

alter table WalmartSalesData
add day_name varchar(5);

update WalmartSalesData set day_name = FORMAT([date], 'ddd')

--select [date], day_name, * from WalmartSalesData


   -----  ------------




