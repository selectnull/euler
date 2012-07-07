select val from bigints(1, 2*3*4*5*6*7*8*9*10*11*12*13*14*15*16*17*18*19*20)
where 
mod(val, 11) = 0
and mod(val, 12) = 0
and mod(val, 13) = 0
and mod(val, 14) = 0
and mod(val, 15) = 0
and mod(val, 16) = 0
and mod(val, 17) = 0
and mod(val, 18) = 0
and mod(val, 19) = 0
and mod(val, 20) = 0
rows 1

-- solution 232792560
-- very slow solution, 07 mins 30 secs