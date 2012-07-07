select count(*) from (
	with ns as(
		select n.val n, r.val r
		from integers(1, 100) n
		cross join integers(1, 99) r
		where r.val <= n.val
	)
	select n, r, 
	(select result from factorial(n)) fact_of_n, 
	(select result from factorial(r)) fact_of_r, 
	(select result from factorial(n - r)) fact_of_n_minus_r
	from ns
)
where fact_of_n / fact_of_r / fact_of_n_minus_r > 1000000
		