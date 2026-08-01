-- ==========================================================
-- Project : E-commerce Sales & Customer Analytics Dashboard
-- Database: ecommerce_sales
-- Author  : Muhammed Irshad
-- ==========================================================

-- Disconnect any existing connections before dropping (run only if needed)
-- SELECT pg_terminate_backend(pid)
-- FROM pg_stat_activity
-- WHERE datname = 'ecommerce_sales'
--   AND pid <> pg_backend_pid();

DROP DATABASE IF EXISTS ecommerce_sales;

CREATE DATABASE ecommerce_sales;