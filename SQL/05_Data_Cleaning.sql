/*
==========================================================
Project : E-commerce Sales & Customer Analytics Dashboard
File    : 05_Data_Cleaning.sql
Author  : Muhammed Irshad
Purpose : Clean and prepare data for analysis
Database: PostgreSQL
==========================================================
*/

-- ==========================================================
-- 1. Missing Product Categories
-- ==========================================================

SELECT
    COUNT(*) AS missing_category
FROM products
WHERE product_category_name IS NULL;

-- ==========================================================
-- 2. Missing Product Dimensions
-- ==========================================================

SELECT
    COUNT(*) AS missing_weight
FROM products
WHERE product_weight_g IS NULL;

SELECT
    COUNT(*) AS missing_length
FROM products
WHERE product_length_cm IS NULL;

SELECT
    COUNT(*) AS missing_height
FROM products
WHERE product_height_cm IS NULL;

SELECT
    COUNT(*) AS missing_width
FROM products
WHERE product_width_cm IS NULL;

-- ==========================================================
-- 3. Missing Delivery Dates
-- ==========================================================

SELECT
    COUNT(*) AS missing_delivery_date
FROM orders
WHERE order_delivered_customer_date IS NULL;

-- ==========================================================
-- 4. Missing Review Comments
-- ==========================================================

SELECT
    COUNT(*) AS missing_review_title
FROM order_reviews
WHERE review_comment_title IS NULL;

SELECT
    COUNT(*) AS missing_review_message
FROM order_reviews
WHERE review_comment_message IS NULL;

-- ==========================================================
-- 5. Invalid Payments
-- ==========================================================

SELECT *
FROM order_payments
WHERE payment_value <= 0;

-- ==========================================================
-- 6. Invalid Freight Charges
-- ==========================================================

SELECT *
FROM order_items
WHERE freight_value < 0;

-- ==========================================================
-- 7. Duplicate Customer IDs
-- ==========================================================

SELECT
    customer_id,
    COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- ==========================================================
-- 8. Duplicate Order IDs
-- ==========================================================

SELECT
    order_id,
    COUNT(*)
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- ==========================================================
-- 9. Date Consistency Check
-- ==========================================================

SELECT *
FROM orders
WHERE order_delivered_customer_date < order_purchase_timestamp;

-- ==========================================================
-- 10. Product Category Translation Coverage
-- ==========================================================

SELECT
    COUNT(*) AS untranslated_categories
FROM products p
LEFT JOIN product_category_translation pct
ON p.product_category_name = pct.product_category_name
WHERE p.product_category_name IS NOT NULL
  AND pct.product_category_name IS NULL;