show databases;
use grocery_project;
show tables;

CREATE TABLE Blinkit (
    Item_Identifier VARCHAR(20),
    Item_Weight FLOAT,
    Item_Fat_Content VARCHAR(20),
    Item_Visibility FLOAT,
    Item_Type VARCHAR(100),
    Item_MRP FLOAT,
    Outlet_Identifier VARCHAR(20),
    Outlet_Establishment_Year INT,
    Outlet_Size VARCHAR(20),
    Outlet_Location_Type VARCHAR(20),
    Outlet_Type VARCHAR(50),
    Item_Outlet_Sales FLOAT
);
select * from Blinkit;
drop table grocery_sales;