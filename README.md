# Portfolio Project: Data Analysis and Visualization using SQL and Power BI

## Overview
Welcome to my portfolio project focusing on data analysis and visualization using SQL and Power BI. In this project, I delved into exploring sales trends for Adidas products specifically in the USA. Leveraging SQL for data analysis and Power BI for visualization, I aimed to uncover insightful patterns and drive actionable insights from the data spanning from 2020 to 2021.

## Table of Contents
1. [Introduction](#introduction)
2. [Data Sources](#data-sources)
3. [SQL Analysis](#sql-analysis)
4. [Power BI Visualization](#power-bi-visualization)
5. [Results](#results)
6. [Conclusion](#conclusion)
7. [Limitations](#limitations)
## Introduction
Adidas stands out as a leading manufacturer of sportswear and workout attire globally. This project aims to uncover key growth drivers for Adidas products, addressing specific questions such as average product pricing, profit margins, regional pricing disparities, and year-over-year sales growth trends.

## Data Sources
The dataset was obtained from [Kaggle](https://www.kaggle.com/datasets/heemalichaudhari/adidas-sales-dataset/data) in CSV format. Before analysis, I performed data cleaning using Power Query and subsequently loaded it into PostgreSQL for further analysis.

## SQL Analysis
```sql
-- Query 1: Average price of Adidas products by region
SELECT region, ROUND(AVG(total_sales), 0) AS Average_Sales
FROM ad
GROUP BY region
ORDER BY ROUND(AVG(total_sales), 0) DESC;

-- Query 2: Most expensive Adidas products by region and retailer
SELECT retailer, region, product, MAX(price) AS Most_Expensive
FROM ad
GROUP BY retailer, region, product
ORDER BY MAX(price) DESC;

-- Query 3: Cheapest Adidas product by region
SELECT retailer, region, product, MIN(price) AS Most_Affordable
FROM ad
GROUP BY retailer, region, product
ORDER BY MIN(price) ASC;

-- Query 4: Average price and operating profit per product by region
SELECT region, product, ROUND(AVG(price), 0) AS Average_Price, ROUND(AVG(operating_profit), 0) AS Average_Profit
FROM ad
GROUP BY region, product
ORDER BY ROUND(AVG(operating_profit), 0) DESC;

-- Query 5: Year Over Year Sales Growth
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
```

## Power BI Visualization
[Provide details of the visualizations created using Power BI, explaining the insights represented visually and any interactive features incorporated.]

## Results
The analysis revealed that the top-selling Adidas product is Men’s street footwear, with an average price of $49 and an average operating profit of $71,681. Significant price disparities exist across regions and products, indicating potential pricing strategies and market segmentation opportunities. Adidas demonstrates impressive year-over-year sales growth at 394.23%, with key products driving profitability identified.

## Conclusion
The primary drivers of Adidas’ sales growth appear to be men's products, particularly men’s street footwear and men’s athletic footwear. Despite selling below the average price, these products exhibit higher average operating profits compared to men’s and women’s apparel, suggesting a preference for affordability without compromising quality. This underscores the importance of pricing strategies in influencing consumer behavior and driving sales growth.

## Limitations
It's essential to acknowledge that the dataset only covers the period from 2020 to 2021, potentially limiting the insights derived from recent sales trends.
