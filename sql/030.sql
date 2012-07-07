select sum(val) from (
  select * from (
  with foo as(
    select i.val, 
    null d100000, null d10000, null d1000, left(right(val, 3), 1) d100, left(right(val, 2), 1) d10, right(val, 1) d1
    from integers(100, 999) i
    group by i.val
  )
  select foo.*, 
  power(d100, 5) + power(d10, 5) + power(d1, 5) sum_of_powers
  from foo
  )
  where val = sum_of_powers

  union

  select * from (
  with foo as(
    select i.val, 
    null d100000, null d10000, left(right(val, 4), 1) d1000, left(right(val, 3), 1) d100, left(right(val, 2), 1) d10, right(val, 1) d1
    from integers(1000, 9999) i
    group by i.val
  )
  select foo.*, 
  power(d1000, 5) + power(d100, 5) + power(d10, 5) + power(d1, 5) sum_of_powers
  from foo
  )
  where val = sum_of_powers

  union

  select * from (
  with foo as(
    select i.val, 
    null d100000, left(right(val, 5), 1) d10000, left(right(val, 4), 1) d1000, 
    left(right(val, 3), 1) d100, left(right(val, 2), 1) d10, right(val, 1) d1
    from integers(10000, 99999) i
    group by i.val
  )
  select foo.*, 
  power(d10000, 5) + power(d1000, 5) + power(d100, 5) + power(d10, 5) + power(d1, 5) sum_of_powers
  from foo
  )
  where val = sum_of_powers

  union

  select * from (
  with foo as(
    select i.val, 
    left(right(val, 6), 1) d100000, left(right(val, 5), 1) d10000, left(right(val, 4), 1) d1000, 
    left(right(val, 3), 1) d100, left(right(val, 2), 1) d10, right(val, 1) d1
    from integers(100000, 5 * power(9, 5)) i
    group by i.val
  )
  select foo.*, 
  power(d100000, 5) + power(d10000, 5) + power(d1000, 5) + power(d100, 5) + power(d10, 5) + power(d1, 5) sum_of_powers
  from foo
  )
  where val = sum_of_powers

)
-- runs in 3 secs
-- solution 443839
