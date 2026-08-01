/*
==========================================================
Project : E-commerce Sales & Customer Analytics Dashboard
File    : 09_Views.sql
Author  : Muhammed Irshad
Purpose : Create reusable reporting views
Database: PostgreSQL
==========================================================
*/

-- ==========================================================
-- Remove existing views
-- ==========================================================

DROP VIEW IF EXISTS vw_sales_summary CASCADE;
DROP VIEW IF EXISTS vw_monthly_sales CASCADE;
DROP VIEW IF EXISTS vw_product_performance CASCADE;
DROP VIEW IF EXISTS vw_customer_summary CASCADE;
DROP VIEW IF EXISTS vw_delivery_performance CASCADE;

-- ==========================================================
-- View 1 : Sales Summary
-- ==========================================================

CREATE VIEW vw_sales_summary AS

SELECT

    o.order_id,
    o.order_purchase_timestamp,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,

    ROUND(SUM(op.payment_value),2) AS total_payment

FROM orders o

JOIN customers c
ON o.customer_id = c.customer_id

JOIN order_payments op
ON o.order_id = op.order_id

GROUP BY

    o.order_id,
    o.order_purchase_timestamp,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state;

-- ==========================================================
-- View 2 : Monthly Sales
-- ==========================================================

CREATE VIEW vw_monthly_sales AS

SELECT

    DATE_TRUNC('month',o.order_purchase_timestamp) AS month,

    COUNT(DISTINCT o.order_id) AS total_orders,

    ROUND(SUM(op.payment_value),2) AS revenue

FROM orders o

JOIN order_payments op
ON o.order_id = op.order_id

GROUP BY month

ORDER BY month;

-- ==========================================================
-- View 3 : Product Performance
-- ==========================================================

CREATE VIEW vw_product_performance AS

SELECT

COALESCE(

pct.product_category_name_english,

p.product_category_name,

'Unknown'

) AS product_category,

COUNT(*) AS items_sold,

ROUND(SUM(oi.price),2) AS revenue,

ROUND(AVG(oi.price),2) AS average_price

FROM order_items oi

JOIN products p
ON oi.product_id = p.product_id

LEFT JOIN product_category_translation pct
ON p.product_category_name = pct.product_category_name

GROUP BY product_category;

-- ==========================================================
-- View 4 : Customer Summary
-- ==========================================================

CREATE VIEW vw_customer_summary AS

SELECT

c.customer_unique_id,

COUNT(DISTINCT o.order_id) AS total_orders,

ROUND(SUM(op.payment_value),2) AS total_spent,

ROUND(AVG(op.payment_value),2) AS average_order_value,

MAX(o.order_purchase_timestamp) AS last_purchase

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

JOIN order_payments op
ON o.order_id = op.order_id

GROUP BY c.customer_unique_id;

-- ==========================================================
-- View 5 : Delivery Performance
-- ==========================================================

CREATE VIEW vw_delivery_performance AS

SELECT

order_id,

order_purchase_timestamp,

order_delivered_customer_date,

(order_delivered_customer_date::date -
order_purchase_timestamp::date) AS delivery_days

FROM orders

WHERE order_delivered_customer_date IS NOT NULL;
SELECT * FROM vw_sales_summary LIMIT 10;

SELECT * FROM vw_monthly_sales;

SELECT * FROM vw_product_performance
ORDER BY revenue DESC
LIMIT 10;

SELECT * FROM vw_customer_summary
LIMIT 10;

SELECT * FROM vw_delivery_performance
LIMIT 10;