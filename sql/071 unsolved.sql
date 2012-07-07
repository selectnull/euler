select numerator, denominator, div,
numerator || '/' || denominator
from (
  with ns as(
    select val from integers(1, 1000)
  )
  select n.val numerator, d.val denominator, cast(n.val as double precision) / d.val div
  from ns n
  cross join ns d
  where n.val < d.val
  
)
where div >= 3.0 / 7
order by div --cast(numerator as double precision) / denominator desc
--rows 1