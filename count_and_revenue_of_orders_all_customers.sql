/*
Count and revenue of orders by ALL customers

optionally specify date range
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