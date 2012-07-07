select n1 from (
  with ns as (
    select val n1, 2 * val n2, 3 * val n3, 4 * val n4, 5 * val n5, 6 * val n6 
    --from integers(100000, floor(1000000 / 6))
    from integers(140000, floor(1000000 / 6))
  )
  select ns.*, ' ' sep,
  (select list(val, '') from (
    select val from chars(n1)
    order by val)
  ) o1,
  (select list(val, '') from (
    select val from chars(n2)
    order by val)
  ) o2,
  (select list(val, '') from (
    select val from chars(n3)
    order by val)
  ) o3,
  (select list(val, '') from (
    select val from chars(n4)
    order by val)
  ) o4,
  (select list(val, '') from (
    select val from chars(n5)
    order by val)
  ) o5,
  (select list(val, '') from (
    select val from chars(n6)
    order by val)
  ) o6
  from ns
)
where o1 = o2 and o2 = o3 and o3 = o4 and o4 = o5 and o5 = o6
rows 1
-- runs in 2 secs, but original version with full range allocates over 1gb of ram and that's the reason it was run in fragments of 20000 integers, 
-- otherwise server raises "unable to allocate memory from operating system" exception
-- solution 142857
