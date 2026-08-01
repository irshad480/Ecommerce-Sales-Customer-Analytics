/*
==========================================================
Project : E-commerce Sales & Customer Analytics Dashboard
File    : 08_RFM_Customer_Segmentation.sql
Author  : Muhammed Irshad
Purpose : Customer Segmentation using RFM Analysis
Database: PostgreSQL
==========================================================
*/

-- ==========================================================
-- Step 1 : Calculate RFM Metrics
-- ==========================================================

WITH customer_rfm AS (

SELECT

    c.customer_unique_id,

    MAX(o.order_purchase_timestamp) AS last_purchase,

    (
        SELECT MAX(order_purchase_timestamp)
        FROM orders
    ) - MAX(o.order_purchase_timestamp) AS recency,

    COUNT(DISTINCT o.order_id) AS frequency,

    ROUND(SUM(op.payment_value),2) AS monetary

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

JOIN order_payments op
ON o.order_id = op.order_id

GROUP BY c.customer_unique_id

),

-- ==========================================================
-- Step 2 : Assign Quartile Scores
-- ==========================================================

rfm_scores AS (

SELECT

*,

NTILE(4) OVER (ORDER BY recency DESC) AS r_score,

NTILE(4) OVER (ORDER BY frequency) AS f_score,

NTILE(4) OVER (ORDER BY monetary) AS m_score

FROM customer_rfm

)

-- ==========================================================
-- Step 3 : Customer Segmentation
-- ==========================================================

SELECT

customer_unique_id,

last_purchase,

recency,

frequency,

monetary,

r_score,

f_score,

m_score,

CASE

WHEN r_score = 4
AND f_score = 4
AND m_score = 4
THEN 'Champions'

WHEN r_score >=3
AND f_score >=3
AND m_score >=3
THEN 'Loyal Customers'

WHEN r_score =4
AND frequency =1
THEN 'New Customers'

WHEN r_score <=2
AND f_score >=3
THEN 'At Risk'

ELSE 'Others'

END AS customer_segment

FROM rfm_scores

ORDER BY monetary DESC;
WITH customer_rfm AS (

SELECT

    c.customer_unique_id,

    MAX(o.order_purchase_timestamp) AS last_purchase,

    (
        SELECT MAX(order_purchase_timestamp)
        FROM orders
    ) - MAX(o.order_purchase_timestamp) AS recency,

    COUNT(DISTINCT o.order_id) AS frequency,

    SUM(op.payment_value) AS monetary

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

JOIN order_payments op
ON o.order_id = op.order_id

GROUP BY c.customer_unique_id

),

rfm_scores AS (

SELECT

*,

NTILE(4) OVER (ORDER BY recency DESC) AS r_score,

NTILE(4) OVER (ORDER BY frequency) AS f_score,

NTILE(4) OVER (ORDER BY monetary) AS m_score

FROM customer_rfm

)

SELECT

CASE

WHEN r_score = 4
AND f_score = 4
AND m_score = 4
THEN 'Champions'

WHEN r_score >=3
AND f_score >=3
AND m_score >=3
THEN 'Loyal Customers'

WHEN r_score =4
AND frequency =1
THEN 'New Customers'

WHEN r_score <=2
AND f_score >=3
THEN 'At Risk'

ELSE 'Others'

END AS customer_segment,

COUNT(*) AS customers,

ROUND(AVG(monetary),2) AS avg_customer_value

FROM rfm_scores

GROUP BY customer_segment

ORDER BY customers DESC;