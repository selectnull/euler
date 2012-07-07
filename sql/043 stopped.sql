with ns as(
  select val, 
  left(val, 1) d1, right(left(val, 2), 1) d2, right(left(val, 3), 1) d3,
  right(left(val, 4), 1) d4, right(left(val, 5), 1) d5, right(left(val, 6), 1) d6,
  right(left(val, 7), 1) d7, right(left(val, 8), 1) d8, right(left(val, 9), 1) d9, right(val, 1) d10,
  cast(substring(val from 2 for 3) as integer) d234,
  cast(substring(val from 3 for 3) as integer) d345,
  cast(substring(val from 4 for 3) as integer) d456,
  cast(substring(val from 5 for 3) as integer) d567,
  cast(substring(val from 6 for 3) as integer) d678,
  cast(substring(val from 7 for 3) as integer) d789,
  cast(substring(val from 8 for 3) as integer) d890
  --from bigints(1023456789, 9876543210)
  from bigints(1406357289, 1406357289)
)
select * from ns
where
mod(d4, 2) = 0 and (d6 = 0 or d6 = 5)
and d1 <> d2 and d1 <> d3 and d1 <> d4 and d1 <> d5 and d1 <> d6 and d1 <> d7 and d1 <> d8 and d1 <> d9 and d1 <> d10
and d2 <> d3 and d2 <> d4 and d2 <> d5 and d2 <> d6 and d2 <> d7 and d2 <> d8 and d2 <> d9 and d2 <> d10
and d3 <> d4 and d3 <> d5 and d3 <> d6 and d3 <> d7 and d3 <> d8 and d3 <> d9 and d3 <> d10
and d4 <> d5 and d4 <> d6 and d4 <> d7 and d4 <> d8 and d4 <> d9 and d4 <> d10
and d5 <> d6 and d5 <> d7 and d5 <> d8 and d5 <> d9 and d5 <> d10
and d6 <> d7 and d6 <> d8 and d6 <> d9 and d6 <> d10
and d7 <> d8 and d7 <> d9 and d7 <> d10
and d8 <> d9 and d8 <> d10
and d9 <> d10

and mod(d234, 2) = 0
and mod(d345, 3) = 0
and mod(d456, 5) = 0
and mod(d567, 7) = 0
and mod(d678, 11) = 0
and mod(d789, 13) = 0
and mod(d890, 17) = 0

-- ran for more than 10 minutes and was killed
-- example number works fine