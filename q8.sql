-- TODO
-- Find the total amount borrowed by "John Smith". If he took out no loans, then output 0. The output should be a table with a `borrowedAmount` column.
select coalesce(sum(l.amount), 0) as borrowedAmount
from customer c
left join borrower b on c.name = b.cname
left join loan l on b.lno = l.no
where c.name = 'John Smith';