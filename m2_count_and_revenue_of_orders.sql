/*
Count and revenue of orders by: ALL customers
(optionally specify date range)
*/
SELECT
count(*) as total_orders,
SUM(so.`total_paid`) as revenue
FROM
`sales_order` so
WHERE
-- so.`created_at` >= '2020-01-01'
-- AND
-- so.`created_at` <= '2020-12-31'
-- AND
so.`status` != 'closed'
;

/*
Count and revenue of orders by: customers
(optionally specify date range)
*/
SELECT
count(*) as total_orders,
SUM(so.`total_paid`) as revenue
FROM
`sales_order` so
WHERE
-- so.`created_at` >= '2020-01-01'
-- AND
-- so.`created_at` <= '2020-12-31'
-- AND
so.`customer_id` IS NOT NULL
AND
so.`status` != 'closed'
;

/*
Count and revenue of orders by: non-customers
(optionally specify date range)
*/
SELECT
count(*) as total_orders,
SUM(so.`total_paid`) as revenue
FROM
`sales_order` so
WHERE
-- so.`created_at` >= '2020-01-01'
-- AND
-- so.`created_at` <= '2020-12-31'
-- AND
so.`customer_id` IS NULL
AND
so.`status` != 'closed'
;

/*
Count and revenue of orders by: returning customers (more than 1 order)
(optionally specify date range)
*/
SELECT
count(*) as total_orders,
SUM(so.`total_paid`) as revenue
FROM
`sales_order` so
WHERE
-- so.`created_at` >= '2020-01-01'
-- AND
-- so.`created_at` <= '2020-12-31'
-- AND
so.`customer_id` IS NOT NULL
AND
so.`status` != 'closed'
AND
(SELECT count(*) FROM `sales_order` so2 WHERE so2.`customer_id` = so.`customer_id`) > 1
;
