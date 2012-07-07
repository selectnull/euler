select sum(val) from (
select a.val, 
(select sum(divisor) from divisors(a.val)) an1,
(select sum(divisor) from divisors((select sum(divisor) from divisors(a.val)))) an2
from integers(2, 10000) a
)
where val = an2 and val <> an1

-- solution 31626
-- runs in just over a minute