select val, collatz from (
  select val, (select count(*) from collatz_sequence(val)) collatz 
  from integers(450000, 1000000)
)
order by collatz desc

-- solution 837799
-- runs in 2 mins 30 secs
-- ran a couple of tests and stopped on 450000 lower bound, tried the result and it was correct