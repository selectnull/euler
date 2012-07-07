with tiles as(
  select 1 black, 2 red, 3 green, 4 blue from rdb$database
)
select max_black.val || '*black',  max_red.val || '*red', max_green.val || '*green',  max_blue.val || '*blue'  --count(*)
from tiles
cross join integers(0, 5 / black) max_black
cross join integers(0, 5 / red) max_red
cross join integers(0, 5 / green) max_green
cross join integers(0, 5 / blue) max_blue
where max_black.val * tiles.black + max_red.val * tiles.red + max_green.val * tiles.green + max_blue.val * tiles.blue = 5
