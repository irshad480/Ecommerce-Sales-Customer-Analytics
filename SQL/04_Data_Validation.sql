/*
==========================================================
Project : E-commerce Sales & Customer Analytics Dashboard
File    : 04_Data_Validation.sql
Author  : Muhammed Irshad
Purpose : Validate data quality before analysis
Database: PostgreSQL
==========================================================
*/

-- ==========================================================
-- 1. Row Count Validation
-- ==========================================================

SELECT 'customers' AS table_name, COUNT(*) AS total_rows FROM customers
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'product_category_translation', COUNT(*) FROM product_category_translation
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation
ORDER BY table_name;

-- ==========================================================
-- 2. Check for NULL Values
-- ==========================================================

SELECT
    COUNT(*) AS total_rows,
    COUNT(customer_id) AS customer_id,
    COUNT(customer_unique_id) AS customer_unique_id,
    COUNT(customer_zip_code_prefix) AS zip_code,
    COUNT(customer_city) AS city,
    COUNT(customer_state) AS state
FROM customers;

SELECT
    COUNT(*) AS total_rows,
    COUNT(product_id) AS product_id,
    COUNT(product_category_name) AS category_name,
    COUNT(product_name_length) AS product_name_length,
    COUNT(product_description_length) AS description_length,
    COUNT(product_photos_qty) AS photos_qty,
    COUNT(product_weight_g) AS weight,
    COUNT(product_length_cm) AS length,
    COUNT(product_height_cm) AS height,
    COUNT(product_width_cm) AS width
FROM products;

SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS order_id,
    COUNT(customer_id) AS customer_id,
    COUNT(order_status) AS order_status,
    COUNT(order_purchase_timestamp) AS purchase_time,
    COUNT(order_approved_at) AS approved_at,
    COUNT(order_delivered_carrier_date) AS carrier_date,
    COUNT(order_delivered_customer_date) AS delivered_date,
    COUNT(order_estimated_delivery_date) AS estimated_delivery
FROM orders;

-- ==========================================================
-- 3. Duplicate Primary Key Check
-- ==========================================================

SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT seller_id, COUNT(*)
FROM sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;

SELECT product_id, COUNT(*)
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;

SELECT order_id, COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- ==========================================================
-- 4. Date Validation
-- ==========================================================

SELECT
    MIN(order_purchase_timestamp) AS first_order,
    MAX(order_purchase_timestamp) AS last_order
FROM orders;

-- ==========================================================
-- 5. Payment Statistics
-- ==========================================================

SELECT
    MIN(payment_value) AS minimum_payment,
    MAX(payment_value) AS maximum_payment,
    ROUND(AVG(payment_value),2) AS average_payment
FROM order_payments;

-- ==========================================================
-- 6. Review Score Distribution
-- ==========================================================

SELECT
    review_score,
    COUNT(*) AS total_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;

-- ==========================================================
-- 7. Order Status Distribution
-- ==========================================================

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- ==========================================================
-- 8. Referential Integrity Validation
-- ==========================================================

-- Orders without customers
SELECT COUNT(*) AS missing_customers
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Order items without products
SELECT COUNT(*) AS missing_products
FROM order_items oi
LEFT JOIN products p
ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- Order items without sellers
SELECT COUNT(*) AS missing_sellers
FROM order_items oi
LEFT JOIN sellers s
ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;

-- Payments without orders
SELECT COUNT(*) AS missing_orders
FROM order_payments op
LEFT JOIN orders o
ON op.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Reviews without orders
SELECT COUNT(*) AS missing_review_orders
FROM order_reviews r
LEFT JOIN orders o
ON r.order_id = o.order_id
WHERE o.order_id IS NULL;