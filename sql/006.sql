select(
  (select sum(val) * sum(val) from integers(1, 100))
  -
  (select sum(val * val) from integers(1, 100))  
) from rdb$database
