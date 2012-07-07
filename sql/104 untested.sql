set term ^;

create procedure is_pandigital(n bigint)
returns (result smallint)
as
declare variable d1 smallint;
declare variable d2 smallint;
declare variable d3 smallint;
declare variable d4 smallint;
declare variable d5 smallint;
declare variable d6 smallint;
declare variable d7 smallint;
declare variable d8 smallint;
declare variable d9 smallint;
begin
	/*
	select list((select val from chars(n) order by val))
	*/

	if (char_length(n) <> 9)
	begin
		result = 0;
		suspend;
		exit;
	end
	
	result = 0;
	d1 = cast(left(n, 1) as smallint);
	d2 = cast(right(left(n, 2), 1) as smallint);
	if (d2 = d1) then
	begin
		suspend;
		exit;
	end
	d3 = cast(right(left(n, 3), 1) as smallint);
	if (d3 = d2 or d3 = d1) then
	begin
		suspend;
		exit;
	end
	d4 = cast(right(left(n, 4), 1) as smallint);
	if (d4 = d3 or d4 = d2 or d4 = d1) then
	begin
		suspend;
		exit;
	end
	d5 = cast(right(left(n, 5), 1) as smallint);
	if (d5 = d4 or d5 = d3 or d5 = d2 or d5 = d1) then
	begin
		suspend;
		exit;
	end
	d6 = cast(right(left(n, 6), 1) as smallint);
	if (d6 = d5 or d6 = d4 or d6 = d3 or d6 = d2 or d6 = d1) then
	begin
		suspend;
		exit;
	end
	d7 = cast(right(left(n, 7), 1) as smallint);
	if (d7 = d6 or d7 = d5 or d7 = d4 or d7 = d3 or d7 = d2 or d7 = d1) then
	begin
		suspend;
		exit;
	end
	d8 = cast(right(left(n, 8), 1) as smallint);
	if (d8 = d7 or d8 = d6 or d8 = d5 or d8 = d4 or d8 = d3 or d8 = d2 or d8 = d1) then
	begin
		suspend;
		exit;
	end
	d9 = cast(right(left(n, 9), 1) as smallint);
	if (d9 = d8 or d9 = d7 or d9 = d6 or d9 = d5 or d9 = d4 or d9 = d3 or d9 = d2 or d9 = d1) then
	begin
		suspend;
		exit;
	end
	
	result = 1;
	suspend;
end^


set term ;^

select pos from big_fibonacci(1, 1, 10000)
where (select result from is_pandigital(cast(left(val, 9) as bigint)) = 1)
and (select result from is_pandigital(cast(right(val, 9) as bigint)) = 1)