-- TODO
-- Find pairs (name1, name2) of customers who share the same loan.
-- Avoid listing a customer with themselves i.e. (Alice, Alice) should not exist in the output.
-- Avoid non-distinct pairs, including modulo swapping.
-- E.g. {(Alice, Bob), (Bob, Alice), (Alice, Bob)} -> {(Alice, Bob)}
-- Sort the output pairs by column1 then column2
-- Columns should be `name1` and `name2`

select c1.name as name1, c2.name as name2
from 
    (select distinct name, no
    from customer
    join borrower on cname = name
    join loan on lno = no) c1, 
    (select distinct name, no
    from customer
    join borrower on cname = name
    join loan on lno = no) c2
where c1.no = c2.no and c1.name != c2.name;


-- find loan numbers with shared borrowers
select * 
from borrower
join loan on lno = no
where lno in (
    select lno
    from borrower
    group by lno
    having count(*) > 1
);

-- for each loan number with shared borrowers, find the names of the borrowers that 

select distinct b1.cname, b2.cname
from borrower b1, (select * 
    from borrower
    join loan on lno = no
    where lno in (
        select lno
        from borrower
        group by lno
        having count(*) > 1
    )) b2
where 
    b1.lno = b2.lno 
    and b1.cname != b2.cname 
order by b1.cname asc, b2.cname asc;

-- the right query, but we need to filter out pairs that are swapped
-- that is "modulo swapping"
-- E.g. (Bob, Grace) appears as well as (Grace, Bob)
-- When checking Grace, we can check if we have already matched with Bob, if so then we do not need to add ourself. To generalize a bit, lets check name2 appears in the name1 list with (name2, name1) as an entry. If so, skip else add.