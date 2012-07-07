select count(*) 
from dates('1901-01-01', '2000-12-31') 
where extract(weekday from val) = 0 and extract(day from val) = 1 
