/*
Count of orders by hour
(optionally specify date range)
*/
SELECT
date_format(created_at, "%h %p UTC") as time,
count(*) as count
FROM
sales_flat_order
-- WHERE
-- created_at > date_sub(now(), INTERVAL 1 year)
GROUP BY
date_format(created_at, "%h %p UTC")
ORDER BY
date_format(created_at, "%H")
ASC;