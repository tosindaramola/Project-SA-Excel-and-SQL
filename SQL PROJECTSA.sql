---Create Database
Create Database PROJECTSA

---2(a) Total Sales for each product name 

Select* from AdventureWork_Sales
Select* from AdventureWorks_Products

Create view PROJECTSAQ2a
as
Select ProductName, Sum(SalesAmount) as Total_Sales from AdventureWork_Sales
inner Join AdventureWorks_Products
on AdventureWork_Sales.ProductKey=AdventureWorks_Products.Productkey
Group by ProductName

 ---2(b) Total tax amount for each product color

Create view PROJECTSAQ2b 
as
Select ProductColor, Sum(TaxAmt) as Total_TaxAmt from AdventureWork_Sales
inner Join AdventureWorks_Products
on AdventureWork_Sales.ProductKey=AdventureWorks_Products.Productkey
Group by ProductColor

---2(c) Total freight for each product name
Select* from AdventureWork_Sales
Select* from AdventureWorks_Products

Create view PROJECTSAQ2c 
as
Select ProductName, Sum(Freight) as Total_Freight from AdventureWork_Sales
inner Join AdventureWorks_Products
on AdventureWork_Sales.ProductKey=AdventureWorks_Products.Productkey
Group by ProductName


---2(d) The sum of proportion of the sum of total product cost for each product name 
Create view PROJECTSAQ2d
as
Select ProductName, Sum(TotalProductCost) as Total_ProductCost from AdventureWork_Sales
inner join AdventureWorks_Products
on AdventureWork_Sales.ProductKey=AdventureWorks_Products.Productkey
Group by ProductName


---3(a) Total sales amount and total freight from each country 

Select* from AdventureWork_Sales
Select* from AdventureWorks_Territories

Create view PROJECTSAQ3a
as
Select Country, Sum(SalesAmount) as Total_Sales, sum(Freight) as Total_Freight from AdventureWork_Sales
inner join AdventureWorks_Territories
on AdventureWork_Sales.SalesTerritoryKey=AdventureWorks_Territories.SalesTerritoryKey
Group by Country


---3(b) Percentage of Total tax amount for each region 

Create view PROJECTSAQ3b
as
Select Region, Sum(TaxAmt) AS RegionTax, (Sum(TaxAmt)*100.0)/(Select Sum(TaxAmt) from AdventureWork_Sales) as RegionTax_Percentage from AdventureWork_Sales
join AdventureWorks_Territories
on AdventureWork_Sales.SalesTerritoryKey=AdventureWorks_Territories.SalesTerritoryKey
Group by Region

---4(a) United Nations Estimate for each Country Territory in Europe 

Select* from World20GDP

Create view PROJECTSAQ4a
as
Select Country_Territory, United_Nations_Estimate from World20GDP
Where UN_region = 'Europe'


---4(b) Total World Bank Estimate in each UN Region

Create view PROJECTSAQ4b
as
Select UN_Region, Sum(World_Bank_Estimate) as Total_World_Bank_Estimate from World20GDP
Group by UN_Region


---4(c) UN Region with  Average World Bank Estimate greater than 100000

Create view PROJECTSAQ4c
as
Select UN_Region, Avg(World_Bank_Estimate) as Average_World_Bank_Estimate from World20GDP
Group by UN_Region
Having Avg(World_Bank_Estimate) > 100000

---4(d) Country Territory with total World Bank Estimate greater than 2000000
Select* from World20GDP

Create view PROJECTSAQ4d
as
Select Country_Territory, Sum(World_Bank_Estimate) as Total_World_Bank_Estimate from World20GDP
Group by Country_Territory
Having Sum(World_Bank_Estimate) > 2000000

