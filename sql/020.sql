
select rdb$set_context('USER_TRANSACTION', 'fact100', 
  '93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000')
from rdb$database;

select --val,
sum(cast(substring((select rdb$get_context('USER_TRANSACTION', 'fact100') from rdb$database) from val for 1)
  as integer))
from integers(1, char_length((select rdb$get_context('USER_TRANSACTION', 'fact100') from rdb$database)))

-- cheated, googled for 100! and hardcoded a value as a string