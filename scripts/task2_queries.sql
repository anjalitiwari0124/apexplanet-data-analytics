-- ============================================================
-- TASK 2: SQL FOR DATA EXTRACTION
-- ApexPlanet Data Analytics Internship
-- Author:Anjali Tiwari
-- Date: 2026-07-13
-- ============================================================
-- 
-- HOW TO USE THIS FILE:
-- 1. Open SQLite (or any SQL editor like DBeaver, DB Browser)
-- 2. Load the superstore.db database
-- 3. Run each query one by one to see results
--
-- ============================================================


-- ============================================================
-- SECTION 1: BASIC QUERIES (Day 7-8)
-- ============================================================

-- QUERY 1: View all data (first 5 rows)
-- SELECT * means "show all columns"
-- LIMIT 5 means "only show first 5 rows"
-- Use this to quickly inspect your data
SELECT * FROM sales LIMIT 5;


-- QUERY 2: Select specific columns only
-- Instead of SELECT *, we pick only the columns we need
-- This is faster and cleaner when you don't need everything
SELECT 
    Order_ID, 
    Customer_Name, 
    Category, 
    Sales, 
    Profit 
FROM sales 
LIMIT 10;


-- QUERY 3: Filter data with WHERE clause
-- WHERE is like a filter - only rows matching the condition are shown
-- This query shows only high-value orders (sales > $15,000)
SELECT 
    Order_ID, 
    Customer_Name, 
    Category, 
    Sales, 
    Profit 
FROM sales 
WHERE Sales > 15000
ORDER BY Sales DESC;


-- QUERY 4: Filter by category
-- Use WHERE with text values (put text in single quotes)
-- This shows only Technology products
SELECT 
    Order_ID,
    Product_Name,
    Sales,
    Profit
FROM sales
WHERE Category = 'Technology'
ORDER BY Sales DESC
LIMIT 10;


-- QUERY 5: Multiple conditions with AND/OR
-- AND = both conditions must be true
-- OR = at least one condition must be true
-- This shows profitable Technology orders in the West region
SELECT 
    Order_ID,
    Product_Name,
    Region,
    Sales,
    Profit
FROM sales
WHERE Category = 'Technology' 
  AND Profit > 0 
  AND Region = 'West'
ORDER BY Profit DESC
LIMIT 10;


-- QUERY 6: Sort results with ORDER BY
-- ORDER BY column_name ASC = lowest to highest (A to Z)
-- ORDER BY column_name DESC = highest to lowest (Z to A)
-- This shows the 10 most profitable orders
SELECT 
    Order_ID, 
    Customer_Name, 
    Category, 
    Sales, 
    Profit 
FROM sales 
ORDER BY Profit DESC
LIMIT 10;


-- QUERY 7: Group data with GROUP BY
-- GROUP BY groups rows that have the same values
-- Use with aggregate functions: SUM(), AVG(), COUNT(), MAX(), MIN()
-- This summarizes sales by category
SELECT 
    Category,
    COUNT(*) as Total_Orders,           -- Count number of rows
    SUM(Sales) as Total_Sales,          -- Add up all sales
    AVG(Sales) as Avg_Sales,            -- Calculate average
    SUM(Profit) as Total_Profit,        -- Add up all profit
    AVG(Profit) as Avg_Profit           -- Average profit
FROM sales 
GROUP BY Category
ORDER BY Total_Sales DESC;


-- QUERY 8: Filter groups with HAVING
-- WHERE filters rows BEFORE grouping
-- HAVING filters groups AFTER grouping
-- This shows only states with more than 250 orders
SELECT 
    State,
    COUNT(*) as Total_Orders,
    SUM(Sales) as Total_Sales,
    AVG(Sales) as Avg_Order_Value
FROM sales 
GROUP BY State
HAVING COUNT(*) > 250
ORDER BY Total_Sales DESC;


-- QUERY 9: JOIN two tables
-- JOIN combines rows from two tables based on a related column
-- INNER JOIN = only matching rows from both tables
-- This joins sales data with region manager information
SELECT 
    s.Region,
    rm.Manager,
    rm.Target_Sales,
    SUM(s.Sales) as Actual_Sales,
    ROUND((SUM(s.Sales) / rm.Target_Sales) * 100, 2) as Achievement_Pct
FROM sales s
INNER JOIN region_managers rm ON s.Region = rm.Region
GROUP BY s.Region, rm.Manager, rm.Target_Sales
ORDER BY Actual_Sales DESC;


-- ============================================================
-- SECTION 2: ADVANCED QUERIES (Day 9-10)
-- ============================================================

-- QUERY 10: Subquery - query inside a query
-- First, the inner query calculates the average sales
-- Then, the outer query shows orders above that average
SELECT 
    Order_ID,
    Customer_Name,
    Category,
    Sales,
    Profit
FROM sales
WHERE Sales > (SELECT AVG(Sales) FROM sales)
ORDER BY Sales DESC
LIMIT 15;


-- QUERY 11: CTE (Common Table Expression) with WITH clause
-- CTE creates a temporary result set you can reference
-- Makes complex queries easier to read and debug
-- This calculates monthly performance metrics
WITH monthly_summary AS (
    SELECT 
        Order_Year,
        Order_Month,
        Order_Month_Name,
        COUNT(*) as Total_Orders,
        SUM(Sales) as Total_Sales,
        SUM(Profit) as Total_Profit
    FROM sales
    GROUP BY Order_Year, Order_Month, Order_Month_Name
)
SELECT 
    Order_Year,
    Order_Month_Name,
    Total_Orders,
    ROUND(Total_Sales, 2) as Total_Sales,
    ROUND(Total_Profit, 2) as Total_Profit,
    ROUND((Total_Profit / Total_Sales) * 100, 2) as Profit_Margin_Pct
FROM monthly_summary
ORDER BY Total_Sales DESC
LIMIT 10;


-- QUERY 12: Window Function - ROW_NUMBER()
-- ROW_NUMBER() assigns a unique number to each row
-- OVER (PARTITION BY ... ORDER BY ...) defines the window
-- This ranks products within each category by sales
SELECT * FROM (
    SELECT 
        Order_ID,
        Customer_Name,
        Category,
        Sales,
        Profit,
        ROW_NUMBER() OVER (PARTITION BY Category ORDER BY Sales DESC) as Rank_in_Category
    FROM sales
) ranked
WHERE Rank_in_Category <= 3
ORDER BY Category, Rank_in_Category;


-- QUERY 13: Window Function - RANK()
-- RANK() is similar to ROW_NUMBER() but handles ties
-- If two rows have the same value, they get the same rank
SELECT 
    Order_ID,
    Customer_Name,
    Category,
    Sales,
    RANK() OVER (ORDER BY Sales DESC) as Overall_Rank
FROM sales
LIMIT 15;


-- QUERY 14: Window Function - LAG() for growth analysis
-- LAG(column, n) gets the value from n rows before
-- Perfect for calculating month-over-month growth
SELECT 
    Order_Year,
    Order_Month,
    Order_Month_Name,
    Total_Sales,
    LAG(Total_Sales, 1) OVER (ORDER BY Order_Year, Order_Month) as Prev_Month_Sales,
    ROUND(
        ((Total_Sales - LAG(Total_Sales, 1) OVER (ORDER BY Order_Year, Order_Month)) 
         / LAG(Total_Sales, 1) OVER (ORDER BY Order_Year, Order_Month)) * 100, 2
    ) as Growth_Pct
FROM (
    SELECT 
        Order_Year,
        Order_Month,
        Order_Month_Name,
        SUM(Sales) as Total_Sales
    FROM sales
    GROUP BY Order_Year, Order_Month, Order_Month_Name
)
ORDER BY Order_Year, Order_Month;


-- ============================================================
-- SECTION 3: 10 BUSINESS QUESTIONS (Day 11-13)
-- ============================================================

-- BUSINESS QUESTION 1: Top 5 Products by Sales
-- Purpose: Identify best-selling products for inventory planning
SELECT 
    Product_Name,
    Category,
    SUM(Sales) as Total_Sales,
    SUM(Profit) as Total_Profit,
    COUNT(*) as Times_Ordered
FROM sales
GROUP BY Product_Name, Category
ORDER BY Total_Sales DESC
LIMIT 5;


-- BUSINESS QUESTION 2: Monthly Sales Trend
-- Purpose: Identify seasonal patterns and growth trends
SELECT 
    Order_Year || '-' || printf('%02d', Order_Month) as Year_Month,
    Order_Year,
    Order_Month,
    Order_Month_Name,
    SUM(Sales) as Total_Sales,
    SUM(Profit) as Total_Profit,
    COUNT(*) as Order_Count
FROM sales
GROUP BY Order_Year, Order_Month, Order_Month_Name
ORDER BY Order_Year, Order_Month;


-- BUSINESS QUESTION 3: Customer Segmentation by Spend
-- Purpose: Identify VIP customers vs regular customers
SELECT 
    Customer_Name,
    Segment,
    COUNT(*) as Total_Orders,
    SUM(Sales) as Total_Spent,
    AVG(Sales) as Avg_Order_Value,
    SUM(Profit) as Total_Profit
FROM sales
GROUP BY Customer_Name, Segment
ORDER BY Total_Spent DESC
LIMIT 15;


-- BUSINESS QUESTION 4: Regional Performance vs Targets
-- Purpose: Compare actual sales against targets
SELECT 
    s.Region,
    rm.Manager,
    rm.Target_Sales,
    SUM(s.Sales) as Actual_Sales,
    SUM(s.Profit) as Total_Profit,
    ROUND((SUM(s.Sales) / rm.Target_Sales) * 100, 2) as Achievement_Pct,
    CASE 
        WHEN SUM(s.Sales) >= rm.Target_Sales THEN 'Target Met ✅'
        ELSE 'Below Target ❌'
    END as Status
FROM sales s
INNER JOIN region_managers rm ON s.Region = rm.Region
GROUP BY s.Region, rm.Manager, rm.Target_Sales
ORDER BY Achievement_Pct DESC;


-- BUSINESS QUESTION 5: Profit Margin by Sub-Category
-- Purpose: Identify which product lines are most/least profitable
SELECT 
    Category,
    Sub_Category,
    SUM(Sales) as Total_Sales,
    SUM(Profit) as Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) as Profit_Margin_Pct,
    COUNT(*) as Order_Count
FROM sales
GROUP BY Category, Sub_Category
ORDER BY Profit_Margin_Pct DESC;


-- BUSINESS QUESTION 6: Discount Impact on Profitability
-- Purpose: Analyze if discounts actually help or hurt profits
SELECT 
    CASE 
        WHEN Discount = 0 THEN 'No Discount'
        WHEN Discount <= 0.1 THEN 'Low Discount (1-10%)'
        WHEN Discount <= 0.2 THEN 'Medium Discount (11-20%)'
        ELSE 'High Discount (>20%)'
    END as Discount_Level,
    COUNT(*) as Order_Count,
    AVG(Sales) as Avg_Sales,
    AVG(Profit) as Avg_Profit,
    SUM(Profit) as Total_Profit
FROM sales
GROUP BY Discount_Level
ORDER BY Avg_Profit DESC;


-- BUSINESS QUESTION 7: Shipping Mode Efficiency
-- Purpose: Find the most efficient shipping method
SELECT 
    Ship_Mode,
    COUNT(*) as Total_Orders,
    AVG(Shipping_Days) as Avg_Shipping_Days,
    SUM(Sales) as Total_Sales,
    AVG(Profit) as Avg_Profit
FROM sales
GROUP BY Ship_Mode
ORDER BY Avg_Shipping_Days;


-- BUSINESS QUESTION 8: Quarterly Performance Analysis
-- Purpose: Track performance by quarter for seasonal planning
SELECT 
    Order_Year,
    Order_Quarter,
    'Q' || Order_Quarter as Quarter_Name,
    COUNT(*) as Total_Orders,
    SUM(Sales) as Total_Sales,
    SUM(Profit) as Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) as Profit_Margin_Pct
FROM sales
GROUP BY Order_Year, Order_Quarter
ORDER BY Order_Year, Order_Quarter;


-- BUSINESS QUESTION 9: Loss-Making Orders Analysis
-- Purpose: Identify and analyze orders that lost money
SELECT 
    Order_ID,
    Customer_Name,
    Category,
    Sub_Category,
    Sales,
    Profit,
    Discount,
    Region,
    Ship_Mode
FROM sales
WHERE Profit < 0
ORDER BY Profit ASC
LIMIT 20;


-- BUSINESS QUESTION 10: Year-over-Year Growth Analysis
-- Purpose: Track annual growth trends
WITH yearly_sales AS (
    SELECT 
        Order_Year,
        SUM(Sales) as Total_Sales,
        SUM(Profit) as Total_Profit,
        COUNT(*) as Total_Orders
    FROM sales
    GROUP BY Order_Year
)
SELECT 
    Order_Year,
    Total_Sales,
    Total_Profit,
    Total_Orders,
    LAG(Total_Sales, 1) OVER (ORDER BY Order_Year) as Prev_Year_Sales,
    ROUND(
        ((Total_Sales - LAG(Total_Sales, 1) OVER (ORDER BY Order_Year)) 
         / LAG(Total_Sales, 1) OVER (ORDER BY Order_Year)) * 100, 2
    ) as YoY_Growth_Pct
FROM yearly_sales
ORDER BY Order_Year;


-- ============================================================
-- BONUS: Create a reusable VIEW
-- A VIEW is like a saved query that you can use like a table
-- ============================================================

-- Create view for monthly performance
CREATE VIEW IF NOT EXISTS vw_monthly_performance AS
SELECT 
    Order_Year,
    Order_Month,
    Order_Month_Name,
    COUNT(*) as Total_Orders,
    SUM(Sales) as Total_Sales,
    SUM(Profit) as Total_Profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) as Profit_Margin_Pct
FROM sales
GROUP BY Order_Year, Order_Month, Order_Month_Name;

-- Now you can use the view like a table:
-- SELECT * FROM vw_monthly_performance WHERE Order_Year = 2017;


-- Create view for customer summary
CREATE VIEW IF NOT EXISTS vw_customer_summary AS
SELECT 
    Customer_Name,
    Segment,
    COUNT(*) as Total_Orders,
    SUM(Sales) as Total_Spent,
    AVG(Sales) as Avg_Order_Value,
    SUM(Profit) as Total_Profit,
    MAX(Order_Date) as Last_Order_Date
FROM sales
GROUP BY Customer_Name, Segment;

-- Use it: SELECT * FROM vw_customer_summary ORDER BY Total_Spent DESC LIMIT 10;


-- ============================================================
-- END OF SQL FILE
-- ============================================================
-- 
