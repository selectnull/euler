--select val, pos, char_length(val) from big_fibonacci(1, 1, 5000)
--where char_length(val) = 1000
--rows 1;

-- runs in 40 secs

-- or the following runs instantly
select ceiling((1000 - 1 + log10(sqrt(5))) / log10((1+sqrt(5))/2)) from rdb$database;