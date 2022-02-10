/*
load in emails to a temp table `emails`, then check which ones have NOT been used to buy
(optionally specify date range)
*/
SELECT
emails.`email_address`
FROM
emails
WHERE
emails.`email_address` NOT IN (SELECT `customer_email` FROM `sales_flat_order`)
-- AND
-- emails.`created_at` >= '2012-10-29'
-- AND
-- emails.`created_at` <= '2012-11-01'
;

/*
get distinct count of emails used to place orders
(optionally specify date range)
*/
SELECT
count(DISTINCT `customer_email`) as count
FROM
`sales_flat_order`
WHERE
-- `created_at` >= '2012-10-29'
-- AND
-- `created_at` <= '2012-11-01'
;