select max(cast(val as integer)) from (
  select * from (
    select cast(i1.val * i2.val as varchar(10)) val
    from integers(100, 999) i1
    cross join integers(100, 999) i2
  )
  where val = reverse(val)
)

-- runs in 4 secs
-- solution 906609