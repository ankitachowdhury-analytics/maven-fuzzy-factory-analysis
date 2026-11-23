# Maven Fuzzy Factory — E-commerce & Sales Analysis

## Project Overview

Maven Fuzzy Factory is an e-commerce analytics project focused on understanding sales performance, product performance, website traffic, marketing sources, and conversion behavior.

The project uses SQL Server for data exploration, data validation, relationship checks, and business analysis, followed by Power BI for interactive dashboard development.

The analysis brings together e-commerce sales data and website and marketing data to identify key business trends, performance patterns, and actionable opportunities.

## Business Objectives

The analysis was designed to answer the following business objectives:

- Evaluate overall sales and profit performance over time
- Identify products contributing the most revenue and profit
- Compare product profitability and refund performance
- Analyze website traffic and marketing source performance
- Measure website conversion performance and identify changes over time
- Identify opportunities to improve profitability, reduce refunds, strengthen marketing attribution, and improve conversion efficiency

## Tools & Technologies

- **SQL Server** — Data exploration, validation, relationship checks, and business analysis
- **Power BI** — Interactive dashboard development and data visualization

## Dataset

The project uses the **Maven Fuzzy Factory** e-commerce database from **Maven Analytics Data Playground**.

The dataset contains information on website sessions, pageviews, orders, products, and refunds, supporting analysis of:

- E-commerce sales and profitability
- Product performance
- Website traffic and conversion
- Marketing source performance
- Refund activity

Data Source: Maven Analytics Data Playground — Maven Fuzzy Factory

## Analysis Areas

The analysis focused on the following areas:

- **Sales & Financial Performance** — Orders, revenue, COGS, profit, profit margin, and average order value
- **Product Performance** — Product-level revenue, profit, margins, and sales contribution
- **Refund Analysis** — Refund amounts and refund rates by product
- **Website Traffic & Marketing** — Sessions, traffic sources, orders, and marketing performance
- **Conversion Funnel** — Website sessions progressing through the purchase funnel and conversion rate trends
- **Landing Page Performance** — Analysis of the most common website landing pages

## Key Insights

- Revenue and profit showed overall growth over time but fluctuated significantly across months, with the highest revenue and profit recorded in **September 2014** at **$8,564.27 revenue** and **$5,313.50 profit**.
- **December 2014** recorded the highest number of orders at **2,314**, showing that the month with the highest order volume did not generate the highest revenue or profit.
- **Original Mr. Fuzzy** generated the highest revenue and profit but had the lowest profit margin at **61.01%**, while **Birthday Sugar Panda** had the highest profit margin at **68.49%**.
- **Original Mr. Fuzzy** had the highest total refund amount at approximately **$62K**, while **Birthday Sugar Panda** had the highest refund rate at **6.04%**.
- Monthly website sessions increased over time, reaching **29,722 sessions in December 2014**.
- The highest monthly conversion rate was **8.69% in February 2015**, indicating improved conversion efficiency despite lower overall traffic than the December 2014 peak.
- **gsearch** generated the highest traffic and order volume with **316,035 sessions** and **21,333 orders**, while **NULL/unattributed traffic** had the highest conversion rate at **7.34%**.
- **83,328 sessions** were associated with NULL/unattributed traffic, highlighting a significant marketing attribution gap.


## Business Recommendations

- **Improve Product Profitability:** Review pricing, product costs, and promotional strategies for products with lower profit margins, particularly Original Mr. Fuzzy.
- **Investigate Product Refunds:** Investigate the reasons behind the high refund amount for Original Mr. Fuzzy and the high refund rate for Birthday Sugar Panda to identify opportunities to reduce refunds.
- **Balance Marketing Scale and Efficiency:** Evaluate marketing sources using both traffic volume and conversion efficiency, rather than focusing only on sessions or order volume.
- **Improve Marketing Attribution:** Investigate the large volume of NULL/unattributed traffic and strengthen campaign tracking to improve visibility into marketing channel performance.
- **Investigate Order Value and Product Mix:** Examine why the highest order volume did not coincide with the highest revenue and profit, including differences in average order value and product mix.


## Power BI Dashboard

The analysis was presented through an interactive Power BI dashboard covering three main areas:

### 1. Executive Overview
Provides a high-level view of sales and financial performance, including orders, revenue, COGS, profit, profit margin, and trends over time.

### 2. Product Analysis
Examines product-level revenue, profit, profit margins, and refund performance to identify differences in product contribution and profitability.

### 3. Website & Marketing
Analyzes website traffic, marketing sources, landing pages, and conversion performance to evaluate traffic volume and marketing efficiency.

### Dashboard Screenshots

**Executive Overview**

![Executive Overview](Power%20BI/Executive%20Overview.png)

**Product Analysis**

![Product Analysis](Power%20BI/Product%20Analysis.png)

**Website & Marketing**

![Website & Marketing](Power%20BI/Website%20%26%20Marketing.png)


## Repository Structure

```text
Maven Fuzzy Factory Analysis
│
├── README.md
│
├── SQL
│   └── Maven_Fuzzy_Factory.sql
│
├── Power BI
│   ├── Maven_Fuzzy_Factory.pbix
│   ├── Executive Overview.png
│   ├── Product Analysis.png
│   └── Website & Marketing.png
│
└── Documentation
    └── Maven_Fuzzy_Factory_Project_Documentation.docx
```

### Files & Folders

- **SQL** — Contains the SQL Server analysis and validation queries.
- **Power BI** — Contains the Power BI dashboard file and dashboard screenshots.
- **Documentation** — Contains the detailed project documentation covering the methodology, validation checks, business questions, findings, recommendations, and conclusion.


## Conclusion

The Maven Fuzzy Factory project combines **e-commerce sales analysis with website and marketing performance analysis** to understand sales trends, product performance, website traffic, marketing sources, and conversion behavior.

SQL Server was used for data validation and analysis, while Power BI was used to present the findings through an interactive dashboard. The analysis highlighted opportunities to improve product profitability, reduce refunds, strengthen marketing attribution, and improve marketing and website conversion performance.

The analysis also showed that **higher sales volume does not always mean higher profitability, and higher traffic does not always mean better conversion efficiency**. Looking at these measures together provides a clearer understanding of where the business is performing well and where further investigation and improvement may be needed.