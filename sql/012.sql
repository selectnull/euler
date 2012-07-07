select triangle_number
from triangle_numbers
where (
	select exp(sum(ln(result))) 
	from (
		select count(*) + 1 result 
		from prime_factors(triangle_number) group by val
	)
) > 500
rows 1

-- 28 secs


/*
select triangle_number
from triangle_numbers
where (select 1 + count(*) from divisors(triangle_number)) > 100

-- too slow solution, it ran over 2 minutes for 150 divisors

*/