-- DONE
-- Find the loans with the maximal amount (return all ties). The output should be a table with `name` column.
select l.no as loanNo
from loan l, (select max(amount) as maxAmount from loan) maxLoan
where l.amount = maxLoan.maxAmount;
