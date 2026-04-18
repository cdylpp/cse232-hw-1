-- TODO
-- Find pairs (name1, name2) of customers who share the same loan.
-- Avoid listing a customer with themselves i.e. (Alice, Alice) should not exist in the output.
-- Avoid non-distinct pairs, including modulo swapping.
-- E.g. {(Alice, Bob), (Bob, Alice), (Alice, Bob)} -> {(Alice, Bob)}
-- Sort the output pairs by column1 then column2
-- Columns should be `name1` and `name2`

select b1.cname as name1, b2.cname as name2
from borrower b1, borrower b2
where b1.lno = b2.lno and b1.cname < b2.cname
order by name1, name2;