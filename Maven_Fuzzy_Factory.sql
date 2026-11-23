CREATE DATABASE MavenFuzzyFactory;

USE MavenFuzzyFactory;
--1. DATA EXPLORATION & VALIDATION

--Explore the products table

SELECT * FROM products;

--Check the total number of rows in the products table 

SELECT COUNT(*) AS total_rows
FROM products;

--Check whether product_id values are unique

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT product_id) AS unique_product_ids
FROM products;

--Check the date range of products data

SELECT MIN(created_at) AS earliest_product_date,
MAX(created_at) AS latest_product_date
FROM products;

--Explore the website_sessions table

SELECT * FROM website_sessions;

--Check the total number of rows in the website_sessions table

SELECT COUNT(*) AS total_rows
FROM website_sessions;

--Check whether website_session_id values are unique

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT website_session_id) AS unique_webside_session_ids
FROM website_sessions;

--Check the date range of website sessions data

SELECT MIN(created_at) AS earlier_website_session_date,
MAX(created_at) AS latest_website_session_date
FROM website_sessions;

--Explore the website_pageviews table

SELECT * FROM website_pageviews;

--Check the total number of rows in the website_pageviews table

SELECT COUNT(*) AS total_rows
FROM website_pageviews;

--Check whether website_pageview_id values are unique

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT website_pageview_id) AS unique_website_pageview_ids
FROM website_pageviews;

--Check the date range of website pageviews data

SELECT MIN(created_at) AS earlier_website_pageview_date,
MAX(created_at) AS latest_website_pageview_date
FROM website_pageviews;

--Explore the orders table

SELECT * FROM orders;

--Check the total number of rows in the orders table

SELECT COUNT(*) AS total_rows
FROM orders;

-- Check whether order_id values are unique

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT order_id) AS unique_order_ids
FROM orders;

--Check the date range of orders data

SELECT MIN(created_at) AS earliest_order_date,
MAX(created_at) AS latest_order_date
FROM orders;

--Explore the order_items table

SELECT * FROM order_items;

--Check the total number of rows in the order_items table

SELECT COUNT(*) AS total_rows
FROM order_items;

--Check whether order_item_id values are unique

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT order_item_id) AS unique_order_item_ids
FROM order_items;

--Check the date range of order_items data

SELECT MIN(created_at) AS earliest_order_item_date,
MAX(created_at) AS latest_order_item_date
FROM orders;

--Explore the order_item_refunds table

SELECT * FROM order_item_refunds;

--Check the total number of rows in the order_item_refunds table

SELECT COUNT(*) AS total_rows
FROM order_item_refunds;

--Check whether order_item_refund_id values are unique

SELECT COUNT(*) AS total_rows,
COUNT(DISTINCT order_item_refund_id) AS unique_order_item_refund_ids
FROM order_item_refunds;

--Check the date range of refund data

SELECT MIN(created_at) AS earliest_order_item_refund_date,
MAX(created_at) AS latest_order_item_refund_date
FROM order_item_refunds;


--2. DATA RELATIONSHIP VALIDATION

-- Check whether every order_item is linked to a valid order

SELECT order_items.order_id
FROM order_items
LEFT JOIN orders
ON order_items.order_id= orders.order_id
WHERE orders.order_id IS NULL;

-- Check whether every order_item is linked to a valid product

SELECT order_items.product_id
FROM order_items
LEFT JOIN products
ON order_items.product_id= products.product_id
WHERE products.product_id IS NULL;

-- Check whether every refund is linked to a valid order_item

SELECT order_item_refunds.order_item_id
FROM order_item_refunds
LEFT JOIN order_items
ON order_item_refunds.order_item_id= order_items.order_item_id
WHERE order_items.order_item_id IS NULL;

-- Check whether every order is linked to a valid website session

SELECT orders.website_session_id
FROM orders
LEFT JOIN website_sessions
ON orders.website_session_id = website_sessions.website_session_id
WHERE website_sessions.website_session_id IS NULL;

-- Check whether every pageview is linked to a valid website session

SELECT website_pageviews.website_session_id
FROM website_pageviews
LEFT JOIN website_sessions
ON website_pageviews.website_session_id = website_sessions.website_session_id
WHERE website_sessions.website_session_id IS NULL;


--3. SALES & BUSINESS PERFORMANCE ANALYSIS

-- Business Question:
-- How has the number of orders changed over time?
SELECT 
     YEAR(created_at) AS order_year,
	 MONTH(created_at) AS order_month,
	 COUNT(order_id) AS total_orders
FROM orders
GROUP BY YEAR(created_at),
MONTH(created_at)
ORDER BY
     order_year,
	 order_month;

-- How has revenue changed over time?
SELECT 
     YEAR(created_at) AS order_year,
	 MONTH(created_at) AS order_month,
	 COUNT(order_id) AS total_orders,
	 ROUND(SUM(price_usd),2) AS total_revenue
FROM orders
GROUP BY 
       YEAR(created_at),
	   MONTH(created_at)
ORDER BY 
      order_year,
	  order_month;

-- How have revenue, COGS, and profit changed over time?
SELECT 
     YEAR(created_at) AS order_year,
	 MONTH(created_at) AS order_month,
	 COUNT(order_id) AS total_orders,
	 ROUND(SUM(price_usd),2) AS total_revenue,
	 ROUND(SUM(cogs_usd),2) AS total_cogs,
	 ROUND(SUM(price_usd) - SUM(cogs_usd),2) AS total_profit
FROM orders
GROUP BY 
       YEAR(created_at),
	   MONTH(created_at)
ORDER BY 
      order_year,
	  order_month;

-- Did revenue growth come from more orders or higher average order value?
SELECT YEAR(created_at) AS order_year,
MONTH(created_at) AS order_month,
COUNT(order_id) AS total_orders,
ROUND(SUM(price_usd),2) AS total_revenue,
ROUND(SUM(cogs_usd),2) AS total_cogs,
ROUND(SUM(price_usd) - SUM(cogs_usd),2) AS total_profit,
ROUND(SUM(price_usd)/COUNT(order_id),2) AS average_order_value
FROM orders
GROUP BY 
         YEAR(created_at),
         MONTH(created_at)
ORDER BY 
      order_year,
	  order_month;

--4. PRODUCT PERFORMANCE ANALYSIS

-- Which products generate the highest revenue and profit?
SELECT products.product_name,
COUNT(*) AS units_sold,
ROUND(SUM(order_items.price_usd),2) AS total_revenue,
ROUND(SUM(order_items.cogs_usd),2) AS total_cogs,
ROUND(SUM(order_items.price_usd) - SUM(order_items.cogs_usd),2) AS total_profit
FROM order_items
INNER JOIN products
ON order_items.product_id=products.product_id
GROUP BY products.product_name
ORDER BY total_revenue DESC;

-- Which products have the highest profit margins?
SELECT products.product_name,
COUNT(*) AS units_sold,

ROUND(SUM(order_items.price_usd),2) AS total_revenue,
ROUND(SUM(order_items.cogs_usd),2) AS total_cogs,
ROUND(SUM(order_items.price_usd) - SUM(order_items.cogs_usd),2) AS total_profit,
ROUND(((SUM(order_items.price_usd)-SUM(order_items.cogs_usd))/SUM(order_items.price_usd))*100,2) AS profit_margin_percent
FROM order_items

INNER JOIN products
ON order_items.product_id = products.product_id
GROUP BY products.product_name

ORDER BY profit_margin_percent DESC;

--5. REFUND ANALYSIS

-- What is the total refund amount and which products have the highest refund amounts?

SELECT products.product_name,
COUNT(order_item_refunds.order_item_refund_id) AS total_refunds,

ROUND(SUM(order_item_refunds.refund_amount_usd),2) AS total_refund_amount
FROM order_item_refunds

INNER JOIN order_items
ON order_item_refunds.order_item_id = order_items.order_item_id

INNER JOIN products
ON order_items.product_id = products.product_id
GROUP BY products.product_name
ORDER BY total_refund_amount DESC;

-- What is the refund rate and which products have the highest refund rates?

SELECT products.product_name,
COUNT(order_items.order_item_id) AS total_items_sold,
COUNT(order_item_refunds.order_item_refund_id) AS total_refunded_items,
ROUND(COUNT(order_item_refunds.order_item_refund_id)*100.0 / COUNT(order_items.order_item_id),2) AS refund_rate_percent
FROM order_items

LEFT JOIN order_item_refunds
ON order_items.order_item_id = order_item_refunds.order_item_id

INNER JOIN products 
ON order_items.product_id = products.product_id
GROUP BY products.product_name
ORDER BY refund_rate_percent DESC;

--6. WEBSITE TRAFFIC & MARKETING ANALYSIS

-- Which traffic sources generate the most sessions, orders, revenue,
-- and have the highest conversion rates?

SELECT website_sessions.utm_source,
COUNT(website_sessions.website_session_id) AS total_sessions,
COUNT(orders.order_id) AS total_orders,
ISNULL(ROUND(SUM(orders.price_usd),2),0) AS total_revenue,
ROUND(COUNT(orders.order_id)*100.0 / COUNT(website_sessions.website_session_id),2) AS conversion_rate_percent
FROM website_sessions
LEFT JOIN orders
ON website_sessions.website_session_id = orders.website_session_id
GROUP BY website_sessions.utm_source
ORDER BY conversion_rate_percent DESC;

-- Which pages are the most common landing pages?

SELECT website_pageviews.pageview_url,
COUNT(*) AS total_sessions
FROM website_pageviews

INNER JOIN (
SELECT website_session_id,MIN(website_pageview_id) AS first_pageview_id
FROM website_pageviews
GROUP BY website_session_id
) AS first_pageviews

ON website_pageviews.website_pageview_id = first_pageviews.first_pageview_id
GROUP BY website_pageviews.pageview_url
ORDER BY total_sessions DESC;

--7. WEBSITE CONVERSION FUNNEL ANALYSIS

-- How many website sessions reach each stage of the purchase funnel?

SELECT website_session_id,
MAX(CASE WHEN pageview_url = '/home' THEN 1 ELSE 0 END) AS reached_home,
MAX(CASE WHEN pageview_url = '/products' THEN 1 ELSE 0 END) AS reached_products,
MAX(CASE WHEN pageview_url = '/cart' THEN 1 ELSE 0 END) AS reached_cart,
MAX(CASE WHEN pageview_url = '/shipping' THEN 1 ELSE 0 END) AS reached_shipping,
MAX(CASE WHEN pageview_url = '/billing' THEN 1 ELSE 0 END) AS reached_billing,
MAX(CASE WHEN pageview_url = '/thank-you-for-your-order' THEN 1 ELSE 0 END) AS reached_order
FROM website_pageviews
GROUP BY website_session_id;

-- How many sessions progress through each stage of the purchase funnel?

SELECT SUM(reached_home) AS home_sessions,
SUM(reached_products) AS product_sessions,
SUM(reached_cart) AS cart_sessions,
SUM(reached_shipping) AS shipping_sessions,
SUM(reached_billing) AS billing_sessions,
SUM(reached_order) AS order_sessions

FROM (
SELECT website_session_id,
MAX(CASE WHEN pageview_url = '/home' THEN 1 ELSE 0 END) AS reached_home,
MAX(CASE WHEN pageview_url = '/products' THEN 1 ELSE 0 END) AS reached_products,
MAX(CASE WHEN pageview_url = '/cart' THEN 1 ELSE 0 END) AS reached_cart,
MAX(CASE WHEN pageview_url = '/shipping' THEN 1 ELSE 0 END) AS reached_shipping,
MAX(CASE WHEN pageview_url = '/billing' THEN 1 ELSE 0 END) AS reached_billing,
MAX(CASE WHEN pageview_url = '/thank-you-for-your-order' THEN 1 ELSE 0 END) AS reached_order
FROM website_pageviews
GROUP BY website_session_id 
) AS website_funnel;

-- How does website conversion rate change over time?

SELECT YEAR(website_sessions.created_at) AS session_year,
       MONTH(website_sessions.created_at) AS session_month,
COUNT(website_sessions.website_session_id) AS total_sessions,
COUNT(orders.order_id) AS total_orders,
ROUND(COUNT(orders.order_id)*100 / COUNT(website_sessions.website_session_id),2) AS conversion_rate_percent
FROM website_sessions
LEFT JOIN orders
ON website_sessions.website_session_id = orders.website_session_id
GROUP BY YEAR(website_sessions.created_at),
         MONTH(website_sessions.created_at)
ORDER BY session_year,
session_month;