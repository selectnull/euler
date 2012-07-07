select count(*) from (
  with alo as (
    select letter l from letters
    where letter in ('A', 'L', 'O')  
  )
  select 
    a1.l || a2.l || a3.l || a4.l as foo
  from alo a1
  cross join alo a2
  cross join alo a3
  cross join alo a4
)
where foo not like '%AAA%' and char_length(replace(foo, 'L', '')) >= 3