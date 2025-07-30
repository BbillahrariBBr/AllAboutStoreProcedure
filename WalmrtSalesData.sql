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
    payment_method VARCHAR(20),  -- ??? ??????? ???? (Cash, Credit card, Ewallet)
    cogs DECIMAL(10, 2),
    gross_margin_percentage FLOAT,
    gross_income DECIMAL(10, 2),
    rating FLOAT
);

SELECT * FROM WalmartSalesData


--- fOR bULK iNSERT CSV TO SSMS
--BULK INSERT WalmartSalesData
--FROM 'C:\Users\Bakibillah\Downloads\WalmartData.csv'
--WITH (
--    FIELDTERMINATOR = ',',
--    ROWTERMINATOR = '\n',
--    FIRSTROW = 2,        -- ????? ???? ??? ???
--    TABLOCK,
--    CODEPAGE = 'ACP'   -- UTF-8 ??????? ???????
--);