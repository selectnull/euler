select count(distinct p) from (
  with ns as (
    select val n from integers(2, 100)
  )
  select ns1.n n1, ns2.n n2, power(ns1.n, ns2.n) p
  from ns ns1
  cross join ns ns2
)


-- runs sub second
-- solution 9183