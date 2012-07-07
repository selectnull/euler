/*
insert into positional_binary_tree(tree, row, col, val)
select 'p18' tree, 1 row, pos col, val from split_string('75', ' ') union all
select 'p18' tree, 2 row, pos col, val from split_string('95 64', ' ') union all
select 'p18' tree, 3 row, pos col, val from split_string('17 47 82', ' ') union all
select 'p18' tree, 4 row, pos col, val from split_string('18 35 87 10', ' ') union all
select 'p18' tree, 5 row, pos col, val from split_string('20 04 82 47 65', ' ') union all
select 'p18' tree, 6 row, pos col, val from split_string('19 01 23 75 03 34', ' ') union all
select 'p18' tree, 7 row, pos col, val from split_string('88 02 77 73 07 63 67', ' ') union all
select 'p18' tree, 8 row, pos col, val from split_string('99 65 04 28 06 16 70 92', ' ') union all
select 'p18' tree, 9 row, pos col, val from split_string('41 41 26 56 83 40 80 70 33', ' ') union all
select 'p18' tree, 10 row, pos col, val from split_string('41 48 72 33 47 32 37 16 94 29', ' ') union all
select 'p18' tree, 11 row, pos col, val from split_string('53 71 44 65 25 43 91 52 97 51 14', ' ') union all
select 'p18' tree, 12 row, pos col, val from split_string('70 11 33 28 77 73 17 78 39 68 17 57', ' ') union all
select 'p18' tree, 13 row, pos col, val from split_string('91 71 52 38 17 14 91 43 58 50 27 29 48', ' ') union all
select 'p18' tree, 14 row, pos col, val from split_string('63 66 04 68 89 53 67 30 73 16 69 87 40 31', ' ') union all
select 'p18' tree, 15 row, pos col, val from split_string('04 62 98 27 23 09 70 98 73 93 38 53 60 04 23', ' ')
*/

with recursive tree as(
  select val, row, col, val route_sum
  from positional_binary_tree
  where tree = 'p18' and row = 1 and col = 1
  union all
  select val, row, col, val + tree.route_sum
  from positional_binary_tree c
  join tree on (tree.row = c.row - 1) and (tree.col = c.col or tree.col = c.col - 1)
  where c.tree = 'p18'
)
select max(route_sum) from tree

-- runs in 5 secs