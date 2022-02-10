/*
Count and revenue of promotions
(optionally specify date range)
*/
SELECT
sr.`name` as rule_name,
count(*) as total_orders,
SUM(sfo.`total_paid`) as revenue,
sr.`rule_id`,
sfo.`applied_rule_ids`
FROM
`sales_flat_order` sfo,
`salesrule` sr
WHERE
sfo.`status` NOT LIKE 'closed'
-- AND
-- sfo.`created_at` >= '2013-01-29'
-- AND
-- sfo.`created_at` <= '2013-02-01'
AND
sfo.`applied_rule_ids` != ''
AND
sr.`rule_id` IN (sfo.`applied_rule_ids`)
GROUP BY
sr.`rule_id`
ORDER BY rule_name DESC
;