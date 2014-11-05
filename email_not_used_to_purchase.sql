#load in emails to a temp db, then check which ones have ben used to NOT buy (add a where clause to sub for dates)
select emails.email_address from emails WHERE emails.email_address NOT IN (select customer_email from sales_flat_order);

#get disinct count of emails used to order
select count(distinct customer_email) from sales_flat_order;