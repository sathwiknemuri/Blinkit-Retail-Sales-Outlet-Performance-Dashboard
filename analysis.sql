-- 1. Total Sales
SELECT SUM(Item_Outlet_Sales) AS Total_Sales
FROM Blinkit;

-- 2. Average Sales
SELECT AVG(Item_Outlet_Sales) AS Average_Sales
FROM Blinkit;

-- 3. Total Number of Products
SELECT COUNT(*) AS Total_Products
FROM Blinkit;

-- 4. Distinct Item Types
SELECT DISTINCT Item_Type
FROM Blinkit;

-- 5. Sales by Item Type
SELECT Item_Type,
       SUM(Item_Outlet_Sales) AS Total_Sales
FROM Blinkit
GROUP BY Item_Type
ORDER BY Total_Sales DESC;

-- 6. Top 10 Selling Products
SELECT Item_Identifier,
       SUM(Item_Outlet_Sales) AS Sales
FROM Blinkit
GROUP BY Item_Identifier
ORDER BY Sales DESC
LIMIT 10;

-- 7. Sales by Outlet Type
SELECT Outlet_Type,
       SUM(Item_Outlet_Sales) AS Total_Sales
FROM Blinkit
GROUP BY Outlet_Type
ORDER BY Total_Sales DESC;

-- 8. Sales by Outlet Size
SELECT Outlet_Size,
       SUM(Item_Outlet_Sales) AS Total_Sales
FROM Blinkit
GROUP BY Outlet_Size
ORDER BY Total_Sales DESC;

-- 9. Sales by Location Type
SELECT Outlet_Location_Type,
       SUM(Item_Outlet_Sales) AS Total_Sales
FROM Blinkit
GROUP BY Outlet_Location_Type
ORDER BY Total_Sales DESC;

-- 10. Average Sales by Item Type
SELECT Item_Type,
       AVG(Item_Outlet_Sales) AS Avg_Sales
FROM Blinkit
GROUP BY Item_Type
ORDER BY Avg_Sales DESC;

-- 11. Highest MRP Product
SELECT *
FROM Blinkit
ORDER BY Item_MRP DESC
LIMIT 1;

-- 12. Lowest MRP Product
SELECT *
FROM Blinkit
ORDER BY Item_MRP ASC
LIMIT 1;

-- 13. Sales by Fat Content
SELECT Item_Fat_Content,
       SUM(Item_Outlet_Sales) AS Total_Sales
FROM Blinkit
GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC;

-- 14. Average MRP by Item Type
SELECT Item_Type,
       AVG(Item_MRP) AS Avg_MRP
FROM Blinkit
GROUP BY Item_Type
ORDER BY Avg_MRP DESC;

-- 15. Outlet-wise Product Count
SELECT Outlet_Identifier,
       COUNT(*) AS Product_Count
FROM Blinkit
GROUP BY Outlet_Identifier
ORDER BY Product_Count DESC;

-- 16. Sales by Outlet Establishment Year
SELECT Outlet_Establishment_Year,
       SUM(Item_Outlet_Sales) AS Total_Sales
FROM Blinkit
GROUP BY Outlet_Establishment_Year
ORDER BY Outlet_Establishment_Year;

-- 17. Top 5 Outlet Identifiers by Sales
SELECT Outlet_Identifier,
       SUM(Item_Outlet_Sales) AS Total_Sales
FROM Blinkit
GROUP BY Outlet_Identifier
ORDER BY Total_Sales DESC
LIMIT 5;

-- 18. Products with Sales Above Average
SELECT *
FROM Blinkit
WHERE Item_Outlet_Sales >
      (SELECT AVG(Item_Outlet_Sales) FROM Blinkit);

-- 19. Average Visibility by Item Type
SELECT Item_Type,
       AVG(Item_Visibility) AS Avg_Visibility
FROM Blinkit
GROUP BY Item_Type
ORDER BY Avg_Visibility DESC;

-- 20. Top 10 Most Visible Products
SELECT Item_Identifier,
       Item_Visibility
FROM Blinkit
ORDER BY Item_Visibility DESC
LIMIT 10;
