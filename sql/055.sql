/*

set term ^;

recreate procedure lychrel_numbers(from_number bigint, to_number bigint = null, iterations integer = 49)
returns (result bigint)
as
declare variable i integer;
declare variable is_palindrome integer;
declare variable reversed_number bigint;
begin
  if (to_number is null) then
    to_number = from_number;

  while (from_number <= to_number) do
  begin
    i = 1;
    is_palindrome = 0;
    reversed_number = from_number;
    
    while (i <= iterations) do
    begin
      reversed_number = reversed_number + cast(reverse(reversed_number) as bigint);
      if (cast(reverse(reversed_number) as bigint) = reversed_number) then
      begin
        is_palindrome = 1;
        break;
      end
      
      i = i + 1;

      when sqlcode -901 do
      begin
        break;
      end
    end

    if (is_palindrome = 0) then
    begin
      result = from_number;
      suspend;
    end

    from_number = from_number + 1;
  end
end^

set term ;^

*/

select count(*) solution from lychrel_numbers(1, 10000)