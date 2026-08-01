/*
==========================================================
Project : E-commerce Sales & Customer Analytics Dashboard
File    : 10_Indexes.sql
Author  : Muhammed Irshad
Purpose : Improve query performance using indexes
Database: PostgreSQL
==========================================================
*/

-- ==========================================================
-- Drop indexes if they already exist
-- ==========================================================

DROP INDEX IF EXISTS idx_orders_customer_id;
DROP INDEX IF EXISTS idx_orders_purchase_date;

DROP INDEX IF EXISTS idx_order_items_order_id;
DROP INDEX IF EXISTS idx_order_items_product_id;
DROP INDEX IF EXISTS idx_order_items_seller_id;

DROP INDEX IF EXISTS idx_order_payments_order_id;

DROP INDEX IF EXISTS idx_order_reviews_order_id;

DROP INDEX IF EXISTS idx_customers_unique_id;
DROP INDEX IF EXISTS idx_customers_state;

DROP INDEX IF EXISTS idx_products_category;

DROP INDEX IF EXISTS idx_sellers_state;

-- ==========================================================
-- Orders
-- ==========================================================

CREATE INDEX idx_orders_customer_id
ON orders(customer_id);

CREATE INDEX idx_orders_purchase_date
ON orders(order_purchase_timestamp);

-- ==========================================================
-- Order Items
-- ==========================================================

CREATE INDEX idx_order_items_order_id
ON order_items(order_id);

CREATE INDEX idx_order_items_product_id
ON order_items(product_id);

CREATE INDEX idx_order_items_seller_id
ON order_items(seller_id);

-- ==========================================================
-- Order Payments
-- ==========================================================

CREATE INDEX idx_order_payments_order_id
ON order_payments(order_id);

-- ==========================================================
-- Order Reviews
-- ==========================================================

CREATE INDEX idx_order_reviews_order_id
ON order_reviews(order_id);

-- ==========================================================
-- Customers
-- ==========================================================

CREATE INDEX idx_customers_unique_id
ON customers(customer_unique_id);

CREATE INDEX idx_customers_state
ON customers(customer_state);

-- ==========================================================
-- Products
-- ==========================================================

CREATE INDEX idx_products_category
ON products(product_category_name);

-- ==========================================================
-- Sellers
-- ==========================================================

CREATE INDEX idx_sellers_state
ON sellers(seller_state);


SELECT
    schemaname,
    tablename,
    indexname
FROM pg_indexes
WHERE schemaname = 'public'
ORDER BY tablename, indexname;