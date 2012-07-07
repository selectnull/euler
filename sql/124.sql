/*

create table p124(  
  n integer not null,
  rad_n double precision not null,  
  constraint pk_124 primary key (n)
);

commit;

insert into p124(n, rad_n) values (1, 1);
insert into p124(n, rad_n)
select val, (select exp(sum(ln(foo))) from (select distinct val foo from prime_factors(val)))
from integers(2, 100000)

commit;

create index ix_124 on p124(rad_n);

commit;

*/

select * from p124
order by rad_n, n
rows 10000 to 10000
