-- Roll-up: Total Sales by Country and Quarter
SELECT
    c.Country,               -- Select the country
    d.Quarter,               -- Select the quarter
    SUM(s.TotalSales) AS TotalSales  -- Sum up the total sales for each combination of country and quarter
FROM
    sales_fact s
JOIN
    customer_dimension c ON s.CustomerID = c.CustomerID  -- Join with the customer dimension table to get the country
JOIN
    date_dimension d ON s.InvoiceDate = d.Date  -- Join with the date dimension table to get the quarter
GROUP BY
    c.Country, d.Quarter  -- Group by country and quarter to aggregate the sales
ORDER BY
    c.Country, d.Quarter; -- Order the result by country and quarter


-- Drill-down: Sales Details for a Particular Country
SELECT
    s.InvoiceNo,             -- Select the invoice number
    s.CustomerID,            -- Select the customer ID
    s.Quantity,              -- Select the quantity of items sold
    s.UnitPrice,             -- Select the unit price of the items
    s.TotalSales,            -- Select the total sales amount for each transaction
    s.InvoiceDate            -- Select the date of the invoice
FROM
    sales_fact s
JOIN
    customer_dimension c ON s.CustomerID = c.CustomerID  -- Join with customer dimension to get the country
WHERE
    c.Country = 'United Kingdom'  -- Specify the country ('UK' in this case, you can change it)
ORDER BY
    s.InvoiceDate;  -- Order the results by invoice date (chronologically)


-- Slice: Total Sales for a Particular Product Category
SELECT
        p.Description,
        SUM(s.TotalSales) AS TotalSales
    FROM
        sales_fact s
    JOIN
        product_dimension p ON s.StockCode = p.StockCode  -- Join with the product dimension using StockCode
    WHERE
        p.Description = 'ALARM CLOCK BAKELIKE RED '  -- Filter by the product category
    GROUP BY
        p.Description;  -- Group by product description
