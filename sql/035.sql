select count(*) from (
  select * from (
  with ints as(  
    select prime from primes_bellow(1000000)
  )
  select prime n,
  case 
    when char_length(prime) = 1 then null
    when char_length(prime) = 2 then cast(right(prime, 1) || left(prime, 1) as integer)
    when char_length(prime) = 3 then cast(right(prime, 2)  || left(prime, 1) as integer)
    when char_length(prime) = 4 then cast(right(prime, 3)  || left(prime, 1) as integer)
    when char_length(prime) = 5 then cast(right(prime, 4)  || left(prime, 1) as integer)
    when char_length(prime) = 6 then cast(right(prime, 5)  || left(prime, 1) as integer)  
    else null
  end r1,
  case 
    when char_length(prime) = 1 then null
    when char_length(prime) = 2 then null
    when char_length(prime) = 3 then cast(right(prime, 1)  || left(prime, 2) as integer)
    when char_length(prime) = 4 then cast(right(prime, 2)  || left(prime, 2) as integer)
    when char_length(prime) = 5 then cast(right(prime, 3)  || left(prime, 2) as integer)
    when char_length(prime) = 6 then cast(right(prime, 4)  || left(prime, 2) as integer)  
    else null
  end r2,
  case 
    when char_length(prime) = 1 then null
    when char_length(prime) = 2 then null
    when char_length(prime) = 3 then null
    when char_length(prime) = 4 then cast(right(prime, 1)  || left(prime, 3) as integer)
    when char_length(prime) = 5 then cast(right(prime, 2)  || left(prime, 3) as integer)
    when char_length(prime) = 6 then cast(right(prime, 3)  || left(prime, 3) as integer)  
    else null
  end r3,
  case 
    when char_length(prime) = 1 then null
    when char_length(prime) = 2 then null
    when char_length(prime) = 3 then null
    when char_length(prime) = 4 then null
    when char_length(prime) = 5 then cast(right(prime, 1)  || left(prime, 4) as integer)
    when char_length(prime) = 6 then cast(right(prime, 2)  || left(prime, 4) as integer)  
    else null
  end r4,
  case 
    when char_length(prime) = 1 then null
    when char_length(prime) = 2 then null
    when char_length(prime) = 3 then null
    when char_length(prime) = 4 then null
    when char_length(prime) = 5 then null
    when char_length(prime) = 6 then cast(right(prime, 1)  || left(prime, 5) as integer)  
    else null
  end r5

  from ints
  )
)
where
iif(r1 is null, 1, (select result from is_prime(r1))) = 1
and iif(r2 is null, 1, (select result from is_prime(r2))) = 1
and iif(r3 is null, 1, (select result from is_prime(r3))) = 1
and iif(r4 is null, 1, (select result from is_prime(r4))) = 1
and iif(r5 is null, 1, (select result from is_prime(r5))) = 1

-- runs in 1 min 33 secs
-- solution 55