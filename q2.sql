-- DONE
-- Find the names of customers who took out a `jumbo mortgage` loan or have a credit rating of at least 750. The output should be a table with a `name` column.
select distinct name
from customer
join borrower on name = cname
join loan on lno = no
where type = 'jumbo mortgage'
union
select name
from customer
where credit >= 750;


