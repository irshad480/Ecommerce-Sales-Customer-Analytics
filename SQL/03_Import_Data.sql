/*
==========================================================
Project : E-commerce Sales & Customer Analytics Dashboard
File    : 03_Import_Data.sql
Author  : Muhammed Irshad
Purpose : Import all CSV files into PostgreSQL
==========================================================
*/

-- ==========================================================
-- Product Category Translation
-- ==========================================================

COPY product_category_translation
FROM 'C:/Users/irshad/Documents/interview/projects/Ecommerce-Sales-Analytics/Data/Raw/product_category_name_translation.csv'
DELIMITER ','
CSV HEADER;

-- ==========================================================
-- Customers
-- ==========================================================

COPY customers
FROM 'C:/Users/irshad/Documents/interview/projects/Ecommerce-Sales-Analytics/Data/Raw/olist_customers_dataset.csv'
DELIMITER ','
CSV HEADER;

-- ==========================================================
-- Sellers
-- ==========================================================

COPY sellers
FROM 'C:/Users/irshad/Documents/interview/projects/Ecommerce-Sales-Analytics/Data/Raw/olist_sellers_dataset.csv'
DELIMITER ','
CSV HEADER;

-- ==========================================================
-- Products
-- ==========================================================

COPY products
FROM 'C:/Users/irshad/Documents/interview/projects/Ecommerce-Sales-Analytics/Data/Raw/olist_products_dataset.csv'
DELIMITER ','
CSV HEADER;

-- ==========================================================
-- Orders
-- ==========================================================

COPY orders
FROM 'C:/Users/irshad/Documents/interview/projects/Ecommerce-Sales-Analytics/Data/Raw/olist_orders_dataset.csv'
DELIMITER ','
CSV HEADER;

-- ==========================================================
-- Order Items
-- ==========================================================

COPY order_items
FROM 'C:/Users/irshad/Documents/interview/projects/Ecommerce-Sales-Analytics/Data/Raw/olist_order_items_dataset.csv'
DELIMITER ','
CSV HEADER;

-- ==========================================================
-- Order Payments
-- ==========================================================

COPY order_payments
FROM 'C:/Users/irshad/Documents/interview/projects/Ecommerce-Sales-Analytics/Data/Raw/olist_order_payments_dataset.csv'
DELIMITER ','
CSV HEADER;

-- ==========================================================
-- Order Reviews
-- ==========================================================

COPY order_reviews
FROM 'C:/Users/irshad/Documents/interview/projects/Ecommerce-Sales-Analytics/Data/Raw/olist_order_reviews_dataset.csv'
DELIMITER ','
CSV HEADER;

-- ==========================================================
-- Geolocation
-- ==========================================================

COPY geolocation
FROM 'C:/Users/irshad/Documents/interview/projects/Ecommerce-Sales-Analytics/Data/Raw/olist_geolocation_dataset.csv'
DELIMITER ','
CSV HEADER;