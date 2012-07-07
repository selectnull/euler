select cast(den / num as integer) solution from (
  select cast(exp(sum(ln(num))) as int) num, exp(sum(ln(den))) den from (
    with ints as(
      select val n from integers(10, 99)
    )
    select n1.n num, n2.n den, 
    left(n1.n, 1) num_d1, right(n1.n, 1) num_d2, 
    left(n2.n, 1) den_d1, right(n2.n, 1) den_d2,
    cast(n1.n as double precision) / n2.n divided,

    cast(left(n1.n, 1) as double precision) / nullif(cast(right(n2.n, 1) as double precision), 0) divided_12

    from ints n1
    cross join ints n2

    where n1.n < n2.n
    and (right(n1.n, 1) = left(n2.n, 1) or left(n1.n, 1) = right(n2.n, 1))  
  ) foo
  where abs(divided - divided_12) < 0.0001
)