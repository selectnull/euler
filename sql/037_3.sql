with digits as(
  select 1 digit from rdb$database union all
  select 3 digit from rdb$database union all
  select 7 digit from rdb$database union all
  select 9 digit from rdb$database
)
select d1.digit || d2.digit || d3.digit || d4.digit || d5.digit || d6.digit || d7.digit || d8.digit || d9.digit
from digits d1
cross join digits d2
cross join digits d3
cross join digits d4
cross join digits d5
cross join digits d6
cross join digits d7
cross join digits d8
cross join digits d9
where 
(select result from is_prime(d1.digit || d2.digit || d3.digit || d4.digit || d5.digit || d6.digit || d7.digit || d8.digit || d9.digit)) = 1
and (select result from is_prime(d2.digit || d3.digit || d4.digit || d5.digit || d6.digit || d7.digit || d8.digit || d9.digit)) = 1
and (select result from is_prime(d3.digit || d4.digit || d5.digit || d6.digit || d7.digit || d8.digit || d9.digit)) = 1
and (select result from is_prime(d4.digit || d5.digit || d6.digit || d7.digit || d8.digit || d9.digit)) = 1
and (select result from is_prime(d5.digit || d6.digit || d7.digit || d8.digit || d9.digit)) = 1
and (select result from is_prime(d6.digit || d7.digit || d8.digit || d9.digit)) = 1
and (select result from is_prime(d7.digit || d8.digit || d9.digit)) = 1
and (select result from is_prime(d8.digit || d9.digit)) = 1
and (select result from is_prime(d9.digit)) = 1
rows 1


-- 1 found: 933739397
