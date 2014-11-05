/*
Count and revenue of orders by: ALL customers
(optionally specify date range)
*/
SELECT
count(*) as total_orders,
SUM(sfo.`total_paid`) as revenue
FROM
`sales_flat_order` sfo
WHERE
-- sfo.`created_at` >= '2012-10-29'
-- AND
-- sfo.`created_at` <= '2012-11-01'
-- AND
sfo.`status` != 'closed'
;

/*
Count and revenue of orders by: returning customers
(optionally specify date range)
*/
SELECT
count(*) as total_orders,
SUM(sfo.`total_paid`) as revenue
FROM
`sales_flat_order` sfo
WHERE
-- sfo.`created_at` >= '2012-10-29'
-- AND
-- sfo.`created_at` <= '2012-11-01'
-- AND
sfo.`customer_id` IS NOT NULL
AND
sfo.`status` != 'closed'
AND
(SELECT count(*) FROM `sales_flat_order` sfo2 WHERE sfo2.`customer_id` = sfo.`customer_id`) > 1
;

/*
Count and revenue of orders by: non-customers
(optionally specify date range)
*/
SELECT
count(*) as total_orders,
SUM(sfo.`total_paid`) as revenue
FROM
`sales_flat_order` sfo
WHERE
-- sfo.`created_at` >= '2012-10-29'
-- AND
-- sfo.`created_at` <= '2012-11-01'
-- AND
sfo.`customer_id` IS NULL
AND
sfo.`status` != 'closed'
;