-- Find the names of customers who took out a `jumbo mortgage` loan and a `student` loan. The output should be a table with a `name` column
select name
from customer
join borrower on name = cname
join loan on lno = no
where type = 'jumbo mortgage'
intersect
select name
from customer
join borrower on name = cname
join loan on lno = no
where type = 'student';

-- done

