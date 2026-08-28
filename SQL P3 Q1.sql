----------------------------------------------------------------------------------------------
- Sales Data Analyst
- SQL Portfolio Project
-------------------------------------------------------------------------------------------
Question 1 - What is the total sales generated from all orders 

select sum(sales) as Totalsales
from salesdata;

Question 2- What region generated the highest Totalsales ?

Select region, sum(sales) As Totalsales
from SalesData
group by Region
order by Totalsales Desc;

Question 3- Which year had the highest total sales ?

Select year(order_date) As orderyear, sum(sales) as Totalsales
from SalesData
group by year(Order_Date)
order by Totalsales Desc;

Question 4- Which Month has Highest Totalsales?

Select year(order_date) As orderyear,
Month (order_date) as Ordernmonth, sum(sales) as Totalsales
from SalesData
group by year(Order_Date), Month(Order_Date)
order by Totalsales Desc;

Question 5- What is the average sales value per unique order?

select sum(sales)/ count (distinct Order_id) As averagevalue
from SalesData

question 6- Who are the top 5 customer by total sales ?

select top 5 customer_name, (customer_id), sum(sales)
from SalesData
group by Customer_ID,Customer_Name
order by sum(sales) desc;

Question 7- Which customer generatre more than 10,000 in total sales ?

select customer_name, (customer_id), sum(sales)
from SalesData
group by Customer_ID,Customer_Name
having sum(sales) >10000
order by sum(sales) desc;

Question 8- which 5 product generates the highest totalsales ?

select top 5 product_name, sum(sales) as totalsales
from SalesData
group by Product_Name
order by totalsales desc;

Question 9- What percentage of Totalsales comes from each region?

select category, Sum(sales) * 100/(select sum(sales) from SalesData) As salepercentage
from SalesData
group by Category
order by salepercentage desc;

Question 10- Which category generates the most sale in each region ?

with categoryrank as (
select region,category, sum(sales) as totalsales,
ROW_NUMBER() over (partition by region 
order by sum(sales) desc) as ranknum 
from SalesData
group by region, Category
)
select region, category, totalsales 
from categoryrank
where ranknum = 1 
order by totalsales desc;

Question 11- what percentage of total sales comes from each region ?

select region, sum(sales) *100/
(select sum(sales) from SalesData) as salespercentage
from SalesData
group by Region
order by salespercentage desc;

Question 12- which customer place the most unique order ?

select top 5 customer_id,customer_name, count(distinct order_id) as totalorders
from SalesData
group by Customer_ID, Customer_Name
order by totalorders desc;

question 13- which category has the higjest average sales per row ?

select category, avg(sales) AS averagesales
from SalesData
group by Category
order by averagesales desc;

question 14 - which customer has the highest average sales per unique order ?

select customer_id, customer_name, sum(sales)/ count (distinct order_id) as uniqueid
from SalesData
group by Customer_ID, Customer_Name
order by uniqueid desc;