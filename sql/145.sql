select * from (
  select val, val + cast(reverse(val) as integer) inversed_sum from integers(1, 1000)
  where right(val, 1) <> 0
)
where 
position('0' in inversed_sum) = 0 and position('2' in inversed_sum) = 0 and position('4' in inversed_sum) = 0
and position('6' in inversed_sum) = 0 and position('8' in inversed_sum) = 0