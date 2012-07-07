/*
-- prepare abundant numbers less than 28123
-- prepare is 10 minutes

delete from big_pairs;

insert into big_pairs(x, y, pair)
select val, 0, 'abundant'
from integers(1, 28123)
where (select sum(divisor) from divisors(val)) > val;


insert into big_pairs(x, y, pair)
select xx.s, 0, 'abundant_sum'
from
  (select distinct a1.x + a2.x s
  from big_pairs a1
  cross join big_pairs a2
  where a1.pair = 'abundant' and a2.pair = 'abundant'
  and a1.x >= a2.x and a1.x + a2.x <= 28123
) xx;

--*/

select sum(val)
from integers(1, 28123) i
left join big_pairs on i.val = big_pairs.x and pair = 'abundant_sum'
where x is null