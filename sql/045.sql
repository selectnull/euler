with triangles as(
  select val n, val * (val + 1) / 2 tri from integers(1, 400000)
),
pentagonals as(
  select val n, val * (3 * val - 1) / 2 pen from integers(1, 400000)
),
hexagonals as(
  select val n, val * (2 * val - 1) hex from integers(1, 400000)
)
select max(tri) solution
from triangles
cross join pentagonals
cross join hexagonals
where tri = pen and pen = hex

-- runs in 5 secs, which is very surprising
-- 400000 is just another magic number