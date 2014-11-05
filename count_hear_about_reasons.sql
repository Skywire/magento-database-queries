/*
Count hear about reasons
(optionally specify date range)
*/
SELECT
cei.`value` as id,
eaov.`value` as option_name,
count(*) as total
FROM
`customer_entity_int` cei,
`eav_attribute_option_value` eaov,
`customer_entity` ce
WHERE
cei.`attribute_id` = 182 -- the id of the customer attribute
AND
cei.`entity_id` = ce.`entity_id`
-- AND
-- ce.`created_at` >= '2012-10-29'
-- AND
-- ce.`created_at` <= '2012-11-01'
AND
eaov.`option_id` = cei.`value`
GROUP BY
cei.`value`
ORDER BY
option_name DESC
;