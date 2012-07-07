select count(*) from (
  with coins as(
    select 1 p1, 2 p2, 5 p5, 10 p10, 20 p20, 50 p50, 100 p100, 200 p200
    from rdb$database
  )
  select i1.val * p1 ip1, i2.val * p2 ip2, i5.val * p5 ip5, i10.val * p10 ip10,
  i20.val * p20 ip20, i50.val * p50 ip50, i100.val * p100 ip100, i200.val * p200 ip200
  from coins
  cross join integers(0, 200 / 1) i1
  cross join integers(0, 200 / 2) i2
  cross join integers(1, 200 / 5) i5
  cross join integers(1, 200 / 10) i10
  cross join integers(1, 200 / 20) i20
  cross join integers(1, 200 / 50) i50
  cross join integers(1, 200 / 100) i100
  cross join integers(1, 200 / 200) i200  
)
where ip1 + ip2 + ip5 + ip10 + ip20 + ip50 + ip100 + ip200 = 200 --  