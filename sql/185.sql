/*

create table p185
(row int not null, 
c1 int not null, 
c2 int not null, 
c3 int not null, 
c4 int not null, 
c5 int not null, 
c6 int not null, 
c7 int not null, 
c8 int not null, 
c9 int not null, 
c10 int not null, 
c11 int not null, 
c12 int not null, 
c13 int not null, 
c14 int not null, 
c15 int not null, 
c16 int not null, 
correct int not null,
constraint pk_185 primary key(row)
);

insert into p185 (row, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, correct)
select 1 row, 5 c1, 6 c2, 1 c3, 6 c4, 1 c5, 8 c6, 5 c7, 6 c8, 5 c9, 0 c10, 5 c11, 1 c12, 8 c13, 2 c14, 9 c15, 3 c16, 2 correct from rdb$database union all
select 2 row, 3 c1, 8 c2, 4 c3, 7 c4, 4 c5, 3 c6, 9 c7, 6 c8, 4 c9, 7 c10, 2 c11, 9 c12, 3 c13, 0 c14, 4 c15, 7 c16, 1 correct from rdb$database union all
select 3 row, 5 c1, 8 c2, 5 c3, 5 c4, 4 c5, 6 c6, 2 c7, 9 c8, 4 c9, 0 c10, 8 c11, 1 c12, 0 c13, 5 c14, 8 c15, 7 c16, 3 correct from rdb$database union all
select 4 row, 9 c1, 7 c2, 4 c3, 2 c4, 8 c5, 5 c6, 5 c7, 5 c8, 0 c9, 7 c10, 0 c11, 6 c12, 8 c13, 3 c14, 5 c15, 3 c16, 3 correct from rdb$database union all
select 5 row, 4 c1, 2 c2, 9 c3, 6 c4, 8 c5, 4 c6, 9 c7, 6 c8, 4 c9, 3 c10, 6 c11, 0 c12, 7 c13, 5 c14, 4 c15, 3 c16, 3 correct from rdb$database union all
select 6 row, 3 c1, 1 c2, 7 c3, 4 c4, 2 c5, 4 c6, 8 c7, 4 c8, 3 c9, 9 c10, 4 c11, 6 c12, 5 c13, 8 c14, 5 c15, 8 c16, 1 correct from rdb$database union all
select 7 row, 4 c1, 5 c2, 1 c3, 3 c4, 5 c5, 5 c6, 9 c7, 0 c8, 9 c9, 4 c10, 1 c11, 4 c12, 6 c13, 1 c14, 1 c15, 7 c16, 2 correct from rdb$database union all
select 8 row, 7 c1, 8 c2, 9 c3, 0 c4, 9 c5, 7 c6, 1 c7, 5 c8, 4 c9, 8 c10, 9 c11, 0 c12, 8 c13, 0 c14, 6 c15, 7 c16, 3 correct from rdb$database union all
select 9 row, 8 c1, 1 c2, 5 c3, 7 c4, 3 c5, 5 c6, 6 c7, 3 c8, 4 c9, 4 c10, 1 c11, 1 c12, 8 c13, 4 c14, 8 c15, 3 c16, 1 correct from rdb$database union all
select 10 row, 2 c1, 6 c2, 1 c3, 5 c4, 2 c5, 5 c6, 0 c7, 7 c8, 4 c9, 4 c10, 3 c11, 8 c12, 6 c13, 8 c14, 9 c15, 9 c16, 2 correct from rdb$database union all
select 11 row, 8 c1, 6 c2, 9 c3, 0 c4, 0 c5, 9 c6, 5 c7, 8 c8, 5 c9, 1 c10, 5 c11, 2 c12, 6 c13, 2 c14, 5 c15, 4 c16, 3 correct from rdb$database union all
select 12 row, 6 c1, 3 c2, 7 c3, 5 c4, 7 c5, 1 c6, 1 c7, 9 c8, 1 c9, 5 c10, 0 c11, 7 c12, 7 c13, 0 c14, 5 c15, 0 c16, 1 correct from rdb$database union all
select 13 row, 6 c1, 9 c2, 1 c3, 3 c4, 8 c5, 5 c6, 9 c7, 1 c8, 7 c9, 3 c10, 1 c11, 2 c12, 1 c13, 3 c14, 6 c15, 0 c16, 1 correct from rdb$database union all
select 14 row, 6 c1, 4 c2, 4 c3, 2 c4, 8 c5, 8 c6, 9 c7, 0 c8, 5 c9, 5 c10, 0 c11, 4 c12, 2 c13, 7 c14, 6 c15, 8 c16, 2 correct from rdb$database union all
select 15 row, 2 c1, 3 c2, 2 c3, 1 c4, 3 c5, 8 c6, 6 c7, 1 c8, 0 c9, 4 c10, 3 c11, 0 c12, 3 c13, 8 c14, 4 c15, 5 c16, 0 correct from rdb$database union all
select 16 row, 2 c1, 3 c2, 2 c3, 6 c4, 5 c5, 0 c6, 9 c7, 4 c8, 7 c9, 1 c10, 2 c11, 7 c12, 1 c13, 4 c14, 4 c15, 8 c16, 2 correct from rdb$database union all
select 17 row, 5 c1, 2 c2, 5 c3, 1 c4, 5 c5, 8 c6, 3 c7, 3 c8, 7 c9, 9 c10, 6 c11, 4 c12, 4 c13, 3 c14, 2 c15, 2 c16, 2 correct from rdb$database union all
select 18 row, 1 c1, 7 c2, 4 c3, 8 c4, 2 c5, 7 c6, 0 c7, 4 c8, 7 c9, 6 c10, 7 c11, 5 c12, 8 c13, 2 c14, 7 c15, 6 c16, 3 correct from rdb$database union all
select 19 row, 4 c1, 8 c2, 9 c3, 5 c4, 7 c5, 2 c6, 2 c7, 6 c8, 5 c9, 2 c10, 1 c11, 9 c12, 0 c13, 3 c14, 0 c15, 6 c16, 1 correct from rdb$database union all
select 20 row, 3 c1, 0 c2, 4 c3, 1 c4, 6 c5, 3 c6, 1 c7, 1 c8, 1 c9, 7 c10, 2 c11, 2 c12, 4 c13, 6 c14, 3 c15, 5 c16, 3 correct from rdb$database union all
select 21 row, 1 c1, 8 c2, 4 c3, 1 c4, 2 c5, 3 c6, 6 c7, 4 c8, 5 c9, 4 c10, 3 c11, 2 c12, 4 c13, 5 c14, 8 c15, 9 c16, 3 correct from rdb$database union all
select 22 row, 2 c1, 6 c2, 5 c3, 9 c4, 8 c5, 6 c6, 2 c7, 6 c8, 3 c9, 7 c10, 3 c11, 1 c12, 6 c13, 8 c14, 6 c15, 7 c16, 2 correct from rdb$database ;


*/


select *
--min(c1), min(c2), min(c3), min(c4), min(c5), min(c6), min(c7), min(c8), min(c9), min(c10), min(c11), min(c12), min(c13), min(c14), min(c15), min(c16)
from (
  select row,
  nullif(c1, (select c1 from p185 where correct = 0)) c1, 
  nullif(c2, (select c2 from p185 where correct = 0)) c2,
  nullif(c3, (select c3 from p185 where correct = 0)) c3,
  nullif(c4, (select c4 from p185 where correct = 0)) c4,
  nullif(c5, (select c5 from p185 where correct = 0)) c5,
  nullif(c6, (select c6 from p185 where correct = 0)) c6,
  nullif(c7, (select c7 from p185 where correct = 0)) c7,
  nullif(c8, (select c8 from p185 where correct = 0)) c8,
  nullif(c9, (select c9 from p185 where correct = 0)) c9,
  nullif(c10, (select c10 from p185 where correct = 0)) c10,
  nullif(c11, (select c11 from p185 where correct = 0)) c11,
  nullif(c12, (select c12 from p185 where correct = 0)) c12,
  nullif(c13, (select c13 from p185 where correct = 0)) c13,
  nullif(c14, (select c14 from p185 where correct = 0)) c14,
  nullif(c15, (select c15 from p185 where correct = 0)) c15,
  nullif(c16, (select c16 from p185 where correct = 0)) c16,
  correct
  from p185
)







