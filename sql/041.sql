with d9 as(
	select val from integers(9, 1)
),
d8 as(
	select val from integers(9, 1)
),
d7 as(
	select val from integers(9, 1)
),
d6 as(
	select val from integers(9, 1)
),
d5 as(
	select val from integers(9, 1)
),
d4 as(
	select val from integers(9, 1)
),
d3 as(
	select val from integers(9, 1)
),
d2 as(
	select val from integers(9, 1)
),
d1 as(
	select val from integers(9, 1)
)
select d9.val || d8.val || d7.val || d6.val || d5.val || d4.val || d3.val || d2.val || d1.val
from d9
cross join d8
cross join d7
cross join d6
cross join d5
cross join d4
cross join d3
cross join d2
cross join d1
where d9.val <> d8.val and d9.val <> d7.val and d9.val <> d6.val and d9.val <> d5.val and d9.val <> d4.val and d9.val <> d3.val and d9.val <> d2.val and d9.val <> d1.val 
  and d8.val <> d7.val and d8.val <> d6.val and d8.val <> d5.val and d8.val <> d4.val and d8.val <> d3.val and d8.val <> d2.val and d8.val <> d1.val 
  and d7.val <> d6.val and d7.val <> d5.val and d7.val <> d4.val and d7.val <> d3.val and d7.val <> d2.val and d7.val <> d1.val
  and d6.val <> d5.val and d6.val <> d4.val and d6.val <> d3.val and d6.val <> d2.val and d6.val <> d1.val
  and d5.val <> d4.val and d5.val <> d3.val and d5.val <> d2.val and d5.val <> d1.val 
  and d4.val <> d3.val and d4.val <> d2.val and d4.val <> d1.val 
  and d3.val <> d2.val and d3.val <> d1.val 
  and d2.val <> d1.val
and (select result from is_prime(cast(d9.val || d8.val || d7.val || d6.val || d5.val || d4.val || d3.val || d2.val || d1.val as int))) = 1
rows 1