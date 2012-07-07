with cte as(
select prime n, 
(select cast(val as int) * cast(val as int) from chars(prime) where pos = 1) +
(select cast(val as int) * cast(val as int) from chars(prime) where pos = 2) +
(select cast(val as int) * cast(val as int) from chars(prime) where pos = 3) +
(select cast(val as int) * cast(val as int) from chars(prime) where pos = 4) hash_n
from primes_bellow(9999)
where prime > 1000
)
select s1.n n1, s2.n n2, s3.n n3, s1.n || s2.n || s3.n
from cte s1
cross join cte s2
cross join cte s3
where s1.hash_n = s2.hash_n and s1.hash_n = s3.hash_n and s2.hash_n = s3.hash_n
and s1.n < s2.n and s1.n < s3.n and s2.n < s3.n
and s2.n - s1.n = s3.n - s2.n

-- runs in 1 sec, it's not complete solution, but gives only 6 results from which the final solution is clear
-- hash_n is a hack and serves to trim down the result set to manageable number