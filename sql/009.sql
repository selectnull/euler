select
a.val, b.val, c.val, a.val * b.val * c.val result
from integers(200, 425) a
cross join integers(200, 425) b
cross join integers(200, 425) c
where 
a.val + b.val + c.val = 1000
and a.val < b.val and b.val < c.val
and (a.val * a.val) + (b.val * b.val) = (c.val * c.val)

-- cheated a little bit, found the magic numbers 200 and 425 by try and guess
-- solution 31875000
-- just under 30 secs