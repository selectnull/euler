/*

recreate table p27(
  a integer not null,
  b integer not null,
  prime_count integer,
  constraint pk_27 primary key (a, b)
);

set term ^;

create procedure solve_p27
as
declare variable n integer;
declare variable for_n_is_prime integer;
declare variable a integer;
declare variable b integer;
begin
  for select a, b from p27 where prime_count is null into :a, :b do
  begin
    n = 0;
    for_n_is_prime = 1;
    while (for_n_is_prime = 1) do
    begin
      select result from is_prime(:n * :n + :a * :n + :b)
      into :for_n_is_prime;
      if (for_n_is_prime = 1) then
        n = n + 1;
    end
    update p27 set
    prime_count = :n
    where a = :a and b = :b;
  end
end^

set term ;^

commit;
*/
delete from p27;

insert into p27(a, b)
with ab as(
  select val from integers(-999, 999)
)
select seq_a.val a, seq_b.val b --count(*)--
from ab seq_a
cross join ab seq_b
where (select result from is_prime(seq_b.val)) = 1
--and (select result from is_prime(seq_a.val * 1 + seq_b.val)) = 1
rows 100