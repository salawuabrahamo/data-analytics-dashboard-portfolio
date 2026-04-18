Load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Clean_electronics_sales_dataset.csv'
INTO TABLE clean_electronics_sales_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

Show Variables like 'Secure_file_priv';
Select *
From clean_electronics_sales_dataset;

Set SQL_safe_updates = 0;


Delete from clean_electronics_sales_dataset
Where Order_ID is Null;

delete from clean_electronics_sales_dataset
Where Units_Sold <=0;

Alter TABLE clean_electronics_sales_dataset
Drop Column Revenue;


Update clean_electronics_sales_dataset
Set Unit_Price = (
	Select Avg_Price From (
    SELECT Product, AVG(Unit_Price) as Avg_Price
    From clean_electronics_sales_dataset
    Group by Product
    ) As sub
    Where sub.Product = clean_electronics_sales_dataset.Product
    )
Where Unit_Price is NULL;

Set SQL_safe_Updates = 0;

Update clean_electronics_sales_dataset
SET Order_Date = str_to_date(Order_Date, '%m/%d/%Y');


Create Table Sales_Analysis as
Select *,
	Unit_Price * Units_Sold * (1 - Discount) as Revenue,
	year(Order_Date) as Year,
    month(Order_Date) as Month,
   monthname(Order_Date) as Month_Name
From clean_electronics_sales_dataset;

Select *
From Sales_Analysis;

Drop table Sales_Analysis;

Create View Monthly_Revenue as
Select Year, Month_Name, Month, sum(Revenue) as Total_revenue
From Sales_Analysis
Group by Year, Month_Name, Month;

Create View Product_Performance as
Select Product, sum(Revenue) as Total_revenue, sum(Units_Sold) As Total_Units
From Sales_Analysis
Group by Product;

Create View Region_Performance as
Select Region, sum(Revenue) as Total_revenue
From Sales_Analysis
Group by Region;
