select sum(d) from (
  select d, (select val from dec_to_bin(d)) b from (
    select val d from (
      select val
      from integers(1, 1000000)
      where cast(val as varchar(7)) = reverse(cast(val as varchar(7)))
    )
  )
)
where cast(b as varchar(32)) = reverse(cast(b as varchar(32)))

