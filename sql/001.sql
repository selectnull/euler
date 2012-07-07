select sum(val) from integers(1, 999)
where mod(val, 3) = 0 or mod(val, 5) = 0