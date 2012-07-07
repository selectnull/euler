set term ^;
recreate procedure prepare_p28(a integer)
as
declare variable cx integer;
declare variable cy integer;
declare variable cval integer;
-- current x, y and val
declare variable line integer;
-- length of line to insert
begin
  cx = 0;
  cy = 0;
  line = 1;
  cval = 1;
  insert into grid (x, y, val) values (:cx, :cy, :cval);
  
  while (line < a) do
  begin
    -- fill right
    insert into grid(x, y, val)
    select :cx + val, :cy, :cval + val from integers(1, :line);
    cval = cval + line;
    cx = cx + line;
    
    -- fill down
    insert into grid(x, y, val)
    select :cx, :cy - val, :cval + val from integers(1, :line);
    cval = cval + line;
    cy = cy - line;

    -- increase line length
    line = line + 1;

    -- fill left
    insert into grid(x, y, val)
    select :cx - val, :cy, :cval + val from integers(1, :line);
    cval = cval + line;
    cx = cx - line;

    -- fill up
    insert into grid(x, y, val)
    select :cx, :cy + val, :cval + val from integers(1, :line);
    cval = cval + line;
    cy = cy + line;

    -- increase line length
    line = line + 1;
  end  

  -- fill right one last time
  insert into grid(x, y, val) 
  select :cx + val, :cy, :cval + val from integers(1, :line - 1);  
end^
set term ;^

commit;
execute procedure prepare_p28(1001);

select sum(val) from grid where abs(x) = abs(y)