with primes as(
  select val prime from integers(333739397, 999739397)
)
select prime from primes
where right(prime, 1) in (3, 7) and left(prime, 1) in (3, 7) and prime > 7
and position('0' in prime) = 0 and position('2' in prime) = 0 and position('4' in prime) = 0 and position('5' in prime) = 0
and position('6' in prime) = 0 and position('8' in prime) = 0

and (select result from is_prime(prime)) = 1
and iif(
  ((select result from is_prime(right(prime, 6))) = 1) and ((select result from is_prime(right(prime, 5))) = 1) and
  ((select result from is_prime(right(prime, 4))) = 1) and ((select result from is_prime(right(prime, 3))) = 1) and
  ((select result from is_prime(right(prime, 2))) = 1) and ((select result from is_prime(right(prime, 1))) = 1) and
  ((select result from is_prime(left(prime, 6))) = 1) and ((select result from is_prime(left(prime, 5))) = 1) and
  ((select result from is_prime(left(prime, 4))) = 1) and ((select result from is_prime(left(prime, 3))) = 1) and
  ((select result from is_prime(left(prime, 2))) = 1) and ((select result from is_prime(left(prime, 1))) = 1) and
  ((select result from is_prime(right(prime, 7))) = 1) and ((select result from is_prime(left(prime, 7))) = 1),
  'y', 'n') = 'y'
rows 2