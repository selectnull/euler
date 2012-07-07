select val + 145 from (
with foo as(
  select i.val, 
  left(right(val, 5), 1) d10000, left(right(val, 4), 1) d1000, left(right(val, 3), 1) d100, left(right(val, 2), 1) d10, right(val, 1) d1
  from integers(10000, 99999) i
  group by i.val
)
select foo.*, 
(select result from factorial(d10000)) +
(select result from factorial(d1000)) +
(select result from factorial(d100)) +
(select result from factorial(d10)) +
(select result from factorial(d1)) sum_of_facts
from foo
)
where val = sum_of_facts

-- runs in 7 secs
-- solution 40730
-- 145 in select is an example from website
