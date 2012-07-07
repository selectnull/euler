select sum(distinct product) from ( --sum(distinct product)
  select products.*,
  cast(substring(pandigital from 1 for 1) as integer) d1, cast(substring(pandigital from 2 for 1) as integer) d2,
  cast(substring(pandigital from 3 for 1) as integer) d3, cast(substring(pandigital from 4 for 1) as integer) d4,
  cast(substring(pandigital from 5 for 1) as integer) d5, cast(substring(pandigital from 6 for 1) as integer) d6,
  cast(substring(pandigital from 7 for 1) as integer) d7, cast(substring(pandigital from 8 for 1) as integer) d8,
  cast(substring(pandigital from 9 for 1) as integer) d9
  from (
    select multiplicand, multiplier, product, multiplicand || multiplier || product pandigital --count(*),
    from (
      with multiplicands as(
        select val from integers(1, 10000)
      ),
      multipliers as(
        select val from integers(1, 10000)
      )
      select multiplicands.val multiplicand, multipliers.val multiplier, multiplicands.val * multipliers.val product
      from multiplicands
      cross join multipliers
    ) 
    where char_length(multiplicand || multiplier || product) = 9
    and position('0' in multiplicand || multiplier || product) = 0
  ) products
)
where 
d1 <> d2 and d1 <> d3 and d1 <> d4 and d1 <> d5 and d1 <> d6 and d1 <> d7 and d1 <> d8 and d1 <> d9
and d2 <> d3 and d2 <> d4 and d2 <> d5 and d2 <> d6 and d2 <> d7 and d2 <> d8 and d2 <> d9
and d3 <> d4 and d3 <> d5 and d3 <> d6 and d3 <> d7 and d3 <> d8 and d3 <> d9
and d4 <> d5 and d4 <> d6 and d4 <> d7 and d4 <> d8 and d4 <> d9
and d5 <> d6 and d5 <> d7 and d5 <> d8 and d5 <> d9
and d6 <> d7 and d6 <> d8 and d6 <> d9
and d7 <> d8 and d7 <> d9
and d8 <> d9

-- runs in 8 mins 3 secs
-- solution 45228
