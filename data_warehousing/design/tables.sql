---- The Star Schema created below is aligned with the data from the
---- UCI ML dataset. This was done to simulate a real life working schema
---- for an actual dataset.

---- The PNG Diagram is a visual design of the Star Schema used in the ETL
---- Process Implementation stage


---- Customer Dimension Table
CREATE TABLE IF NOT EXISTS customer_dimension (
    CustomerID TEXT PRIMARY KEY,
    Country TEXT
)


---- Date Dimension Table
CREATE TABLE IF NOT EXISTS date_dimension (
    Date TEXT PRIMARY KEY,
    Year INTEGER,
    Month INTEGER,
    Day INTEGER,
    Weekday INTEGER,
    Quarter INTEGER
)


---- Product Dimension Table
CREATE TABLE IF NOT EXISTS product_dimension (
    StockCode TEXT PRIMARY KEY,
    Description TEXT
)
    

---- Sales Fact Table
CREATE TABLE IF NOT EXISTS sales_fact (
    InvoiceNo TEXT PRIMARY KEY,
    CustomerID TEXT,
    StockCode TEXT,               
    Quantity INTEGER,
    UnitPrice REAL,
    TotalSales REAL,
    InvoiceDate TEXT,
    FOREIGN KEY (CustomerID) REFERENCES customer_dimension(CustomerID),
    FOREIGN KEY (StockCode) REFERENCES product_dimension(StockCode)
)
