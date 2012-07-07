
  select n, 
  iif(triangle > 1000 and triangle <= 9999, triangle, null) triangle,
  iif(square > 1000 and square <= 9999, square, null) square,
  iif(pentagonal > 1000 and pentagonal <= 9999, pentagonal, null) pentagonal,
  iif(hexagonal > 1000 and hexagonal <= 9999, hexagonal, null) hexagonal,
  iif(heptagonal > 1000 and heptagonal <= 9999, heptagonal, null) heptagonal,
  iif(octagonal > 1000 and octagonal <= 9999, octagonal, null) octagonal
  from (
    with numbers as(
      select val n from integers(1, 140)
    )
    select n,
    n * (n + 1) / 2 triangle,
    n * n square,
    n * (3 * n - 1) / 2 pentagonal,
    n * (2 * n - 1) hexagonal,
    n * (5 * n - 3) / 2 heptagonal,
    n * (3 * n - 2) octagonal
    from numbers
  ) numbers
