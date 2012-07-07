/*
create table p104(
  pos integer not null,
  number big_number not null,
  constraint pk_104 primary key (pos)
);

create unique descending index udx_104 on p104(pos);

commit;

insert into p104(pos, number) values(1, '1');
insert into p104(pos, number) values(2, '1');

*/




insert into p104(pos, number)
select 
  (select max(pos) + 1 from p104), 
  (select result from big_add(
    (select number from p104 order by pos desc rows 1),
    (select number from p104 order by pos desc rows 2 to 2)
  ))
from integers(1, 4000)