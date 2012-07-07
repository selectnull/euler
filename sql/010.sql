select sum(val)
from integers(2, 2000000)
where (select result from is_prime(val)) = 1

-- solution 142913828922