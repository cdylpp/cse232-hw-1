-- TODO
-- Among the loans taken by a borrower named "John Smith", find those with highest `minCredit` requirement. If John took out no loans, the result is empty. The output should be a table with a `loanNo` column.

select l.no as loanNo
from borrower b, loan l
where b.cname = 'John Smith'
    and b.lno = l.no
    and l.minCredit = (
        select max(l2.minCredit)
        from borrower b2, loan l2
        where b2.cname = 'John Smith'
            and b2.ln0 = l2.no
    );