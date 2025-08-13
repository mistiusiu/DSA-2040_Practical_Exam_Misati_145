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
    strftime('%Y', s.InvoiceDate) AS Year,           -- Extract year
    strftime('%m', s.InvoiceDate) AS Month,          -- Extract month
    SUM(s.TotalSales) AS TotalSales                  -- Aggregate total sales
FROM
    sales_fact s
JOIN
    customer_dimension c ON s.CustomerID = c.CustomerID
WHERE
    c.Country = 'United Kingdom'
GROUP BY
    strftime('%Y', s.InvoiceDate),                  -- Group by year
    strftime('%m', s.InvoiceDate)                   -- Group by month
ORDER BY
    Year ASC, Month ASC;                             -- Order chronologically


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
