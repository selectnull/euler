select prime
/*
case
  when char_length(prime) = 2 then 
    right(prime, 1) || ' ' || left(prime, 1)
  when char_length(prime) = 3 then    
    'right: ' || right(prime, 2) || ' ' || right(prime, 1) || 
    ' left: ' || left(prime, 2) || ' ' || left(prime, 1)
  when char_length(prime) = 4 then
    'right: ' || right(prime, 3) || ' ' || right(prime, 2) || ' ' || right(prime, 1) || 
    ' left: ' || left(prime, 3) || ' ' || left(prime, 2) || ' ' || left(prime, 1)
  when char_length(prime) = 5 then
    'right: ' || right(prime, 4) || ' ' || right(prime, 3) || ' ' || right(prime, 2) || ' ' || right(prime, 1) || 
    ' left: ' || left(prime, 4) || ' ' || left(prime, 3) || ' ' || left(prime, 2) || ' ' || left(prime, 1)
  when char_length(prime) = 6 then
    'right: ' || right(prime, 5) || ' ' || right(prime, 4) || ' ' || right(prime, 3) || ' ' || right(prime, 2) || ' ' || right(prime, 1) || 
    ' left: ' || left(prime, 5) || ' ' || left(prime, 4) || ' ' || left(prime, 3) || ' ' || left(prime, 2) || ' ' || left(prime, 1)
  else 'foo'
end
*/
from primes(400000)
where right(prime, 1) in (3, 7) and left(prime, 1) in (3, 7) and prime > 7
and position('0' in prime) = 0 and position('2' in prime) = 0 and position('4' in prime) = 0 and position('5' in prime) = 0
and position('6' in prime) = 0 and position('8' in prime) = 0

and
case
  when char_length(prime) = 2 then 'y'
  when char_length(prime) = 3 then
    iif(
      ((select result from is_prime(right(prime, 2))) = 1) and ((select result from is_prime(right(prime, 1))) = 1) and
      ((select result from is_prime(left(prime, 2))) = 1) and ((select result from is_prime(left(prime, 1))) = 1),
      'y', 'n')
  when char_length(prime) = 4 then
    iif(
      ((select result from is_prime(right(prime, 3))) = 1) and ((select result from is_prime(right(prime, 2))) = 1) and 
      ((select result from is_prime(right(prime, 1))) = 1) and
      ((select result from is_prime(left(prime, 3))) = 1) and ((select result from is_prime(left(prime, 2))) = 1) and 
      ((select result from is_prime(left(prime, 1))) = 1),
      'y', 'n')
  when char_length(prime) = 5 then
    iif(
      ((select result from is_prime(right(prime, 4))) = 1) and ((select result from is_prime(right(prime, 3))) = 1) and
      ((select result from is_prime(right(prime, 2))) = 1) and ((select result from is_prime(right(prime, 1))) = 1) and
      ((select result from is_prime(left(prime, 4))) = 1) and ((select result from is_prime(left(prime, 3))) = 1) and
      ((select result from is_prime(left(prime, 2))) = 1) and ((select result from is_prime(left(prime, 1))) = 1),
      'y', 'n')
  when char_length(prime) = 6 then
    iif(
      ((select result from is_prime(right(prime, 5))) = 1) and ((select result from is_prime(right(prime, 4))) = 1) and
      ((select result from is_prime(right(prime, 3))) = 1) and ((select result from is_prime(right(prime, 2))) = 1) and
      ((select result from is_prime(right(prime, 1))) = 1) and ((select result from is_prime(left(prime, 5))) = 1) and
      ((select result from is_prime(left(prime, 4))) = 1) and ((select result from is_prime(left(prime, 3))) = 1) and
      ((select result from is_prime(left(prime, 2))) = 1) and ((select result from is_prime(left(prime, 1))) = 1),
      'y', 'n')
    when char_length(prime) = 7 then
    iif(
      ((select result from is_prime(right(prime, 6))) = 1) and ((select result from is_prime(right(prime, 5))) = 1) and
      ((select result from is_prime(right(prime, 4))) = 1) and ((select result from is_prime(right(prime, 3))) = 1) and
      ((select result from is_prime(right(prime, 2))) = 1) and ((select result from is_prime(right(prime, 1))) = 1) and
      ((select result from is_prime(left(prime, 6))) = 1) and ((select result from is_prime(left(prime, 5))) = 1) and
      ((select result from is_prime(left(prime, 4))) = 1) and ((select result from is_prime(left(prime, 3))) = 1) and
      ((select result from is_prime(left(prime, 2))) = 1) and ((select result from is_prime(left(prime, 1))) = 1),
      'y', 'n')
    when char_length(prime) = 8 then
    iif(
      ((select result from is_prime(right(prime, 6))) = 1) and ((select result from is_prime(right(prime, 5))) = 1) and
      ((select result from is_prime(right(prime, 4))) = 1) and ((select result from is_prime(right(prime, 3))) = 1) and
      ((select result from is_prime(right(prime, 2))) = 1) and ((select result from is_prime(right(prime, 1))) = 1) and
      ((select result from is_prime(left(prime, 6))) = 1) and ((select result from is_prime(left(prime, 5))) = 1) and
      ((select result from is_prime(left(prime, 4))) = 1) and ((select result from is_prime(left(prime, 3))) = 1) and
      ((select result from is_prime(left(prime, 2))) = 1) and ((select result from is_prime(left(prime, 1))) = 1) and
      ((select result from is_prime(right(prime, 7))) = 1) and ((select result from is_prime(left(prime, 7))) = 1),
      'y', 'n')
  else 'y'
end = 'y'

--and (select distinct val from chars(prime)) not in ('2', '4', '6', '8', '0')

-- ((select result from is_prime()) = 1)