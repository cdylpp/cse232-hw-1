-- Find the names of customer who took out a `jumbo mortgage` loan. The output should be a table with `name` column. 
select name
from customer
join borrower on name = cname
join loan on lno = no
where type = 'jumbo mortgage';

-- done