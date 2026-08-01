/*
==========================================================
Project : E-commerce Sales & Customer Analytics Dashboard
File    : 07_Business_Analysis.sql
Author  : Muhammed Irshad
Purpose : Business KPI Analysis
Database: PostgreSQL
==========================================================
*/

-- ==========================================================
-- Executive KPI Dashboard
-- ==========================================================

SELECT
    ROUND(SUM(payment_value),2) AS total_revenue,
    ROUND(AVG(payment_value),2) AS average_order_value,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT order_id) AS unique_orders
FROM order_payments;
-- ==========================================================
-- Monthly Revenue Trend
-- ==========================================================

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    ROUND(SUM(op.payment_value),2) AS revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY month
ORDER BY month;
-- ==========================================================
-- Top Product Categories
-- ==========================================================

SELECT
    COALESCE(pct.product_category_name_english,
             p.product_category_name,
             'Unknown') AS category,
    ROUND(SUM(oi.price),2) AS revenue,
    COUNT(*) AS items_sold
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN product_category_translation pct
    ON p.product_category_name = pct.product_category_name
GROUP BY category
ORDER BY revenue DESC
LIMIT 10;
-- ==========================================================
-- Revenue by State
-- ==========================================================

SELECT
    c.customer_state,
    ROUND(SUM(op.payment_value),2) AS revenue,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_payments op
    ON o.order_id = op.order_id
GROUP BY c.customer_state
ORDER BY revenue DESC
LIMIT 10;
-- ==========================================================
-- Top Sellers
-- ==========================================================

SELECT
    s.seller_id,
    ROUND(SUM(oi.price),2) AS revenue,
    COUNT(*) AS products_sold
FROM sellers s
JOIN order_items oi
    ON s.seller_id = oi.seller_id
GROUP BY s.seller_id
ORDER BY revenue DESC
LIMIT 10;
-- ==========================================================
-- Payment Analysis
-- ==========================================================

SELECT
    payment_type,
    COUNT(*) AS transactions,
    ROUND(SUM(payment_value),2) AS revenue,
    ROUND(AVG(payment_value),2) AS average_payment
FROM order_payments
GROUP BY payment_type
ORDER BY revenue DESC;
-- ==========================================================
-- Delivery Performance
-- ==========================================================

SELECT
    ROUND(
        AVG(
            order_delivered_customer_date::date -
            order_purchase_timestamp::date
        ),
        2
    ) AS average_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;
-- ==========================================================
-- Review Score Analysis
-- ==========================================================

SELECT
    review_score,
    COUNT(*) AS total_reviews,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;