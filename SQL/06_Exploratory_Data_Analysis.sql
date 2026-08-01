/*
==========================================================
Project : E-commerce Sales & Customer Analytics Dashboard
File    : 06_Exploratory_Data_Analysis.sql
Author  : Muhammed Irshad
Purpose : Exploratory Data Analysis (EDA)
Database: PostgreSQL
==========================================================
*/

-- ==========================================================
-- 1. Total Revenue
-- ==========================================================

SELECT
    ROUND(SUM(payment_value),2) AS total_revenue
FROM order_payments;

-- ==========================================================
-- 2. Total Orders
-- ==========================================================

SELECT
    COUNT(*) AS total_orders
FROM orders;

-- ==========================================================
-- 3. Total Customers
-- ==========================================================

SELECT
    COUNT(DISTINCT customer_unique_id) AS total_customers
FROM customers;

-- ==========================================================
-- 4. Total Sellers
-- ==========================================================

SELECT
    COUNT(*) AS total_sellers
FROM sellers;

-- ==========================================================
-- 5. Total Products
-- ==========================================================

SELECT
    COUNT(*) AS total_products
FROM products;

-- ==========================================================
-- 6. Order Status Distribution
-- ==========================================================

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- ==========================================================
-- 7. Payment Method Distribution
-- ==========================================================

SELECT
    payment_type,
    COUNT(*) AS transactions,
    ROUND(SUM(payment_value),2) AS revenue
FROM order_payments
GROUP BY payment_type
ORDER BY revenue DESC;

-- ==========================================================
-- 8. Review Score Distribution
-- ==========================================================

SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;

-- ==========================================================
-- 9. Average Order Value
-- ==========================================================

SELECT
    ROUND(AVG(payment_value),2) AS average_order_value
FROM order_payments;

-- ==========================================================
-- 10. Monthly Sales Trend
-- ==========================================================

SELECT
    DATE_TRUNC('month', order_purchase_timestamp) AS month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;