-- DONE
-- Find the loan numbers `no` shared by at least two different customers. The output should be a table with a "loanNo" column, containing no duplicate values.
select distinct lno as loanNo
from borrower
join loan on lno = no
group by no
having count(*) > 1;