-- DONE
-- Find the customers who borrowed a total of at least 13000. The output should be a table with a `name` column.
select name
from customer
join borrower on name = cname
join loan on lno = no
group by name
having sum(amount) >= 13000;
