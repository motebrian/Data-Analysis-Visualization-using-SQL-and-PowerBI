select * from ad;
--1.Which retailers are making the most sales and what products are hotcakes?
SELECT retailer,region,product,round(AVG(total_sales),0) AS AVERAGE_SALES
FROM ad
GROUP BY region,retailer,product
ORDER BY round(avg(total_sales),0) DESC;
--2.What is the avarage sales by region
SELECT region, round(avg(total_sales),0) AS Average_Sales
FROM ad
GROUP BY region
ORDER BY round(avg(total_sales),0) DESC;

--3.What are the most affordable addidas products sold by retailers
SELECT retailer,region,product, min(price) AS Most_Affordable
FROM ad
GROUP BY retailer,region,product
ORDER BY min(price)  ASC;
--What are the most Expensive Addidas products sold by retailers
SELECT retailer,region,product, max(price) AS Most_Expensive
FROM ad
GROUP BY retailer,region,product
ORDER BY max(price)  DESC;


--4.What products have the most sales
SELECT product, COUNT(*) AS Number_Sales
FROM ad
GROUP BY product
ORDER BY COUNT(*)DESC;

--5.What is the average price and  operating profit per product by region
SELECT region,product, round(avg(price),0) AS Average_Price,round(avg(operating_profit),0)AS Average_Profit
FROM ad
GROUP BY region,product
ORDER BY round(avg(operating_profit),0) DESC;

--6 What is the number of sales per sales method in different region?
SELECT region, sales_method,COUNT(*)
FROM ad
GROUP BY sales_method,region
ORDER BY COUNT(*) DESC;

--7.What is the Year Over Year Sales
SELECT
    EXTRACT(YEAR FROM invoice_date) AS year,
    SUM(total_sales) AS total_sales,
    ROUND(
        ((SUM(total_sales) - LAG(SUM(total_sales)) OVER (ORDER BY EXTRACT(YEAR FROM invoice_date))) / 
        LAG(SUM(total_sales)) OVER (ORDER BY EXTRACT(YEAR FROM invoice_date))) * 100,
    2) AS yoy_sales_percentage_change
FROM
    ad
GROUP BY
    EXTRACT(YEAR FROM invoice_date)
ORDER BY
    EXTRACT(YEAR FROM invoice_date);


