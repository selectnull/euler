create global temporary table pairs(
	x integer not null,
	y integer not null,
  constraint pk_pairs primary key (x)  
) on commit delete rows;

create table letters(
  letter char(1) not null,
  constraint pk_letter primary key (letter)
);

create global temporary table grid(	
	x integer not null,
	y integer not null,
	val integer not null,
	constraint pk_grid primary key (x, y)
) on commit delete rows;

create global temporary table temp_numbers(
  n integer not null
) on commit delete rows;

create global temporary table temp_strings(
  s varchar(200) not null
) on commit delete rows;

commit;

insert into letters(letter)
select ascii_char(ascii_val('A') + val) letter from integers(0, 25);

set term ^:

create procedure integers(from_value integer, to_value integer)
returns(val integer)
as
declare variable temp_value integer;
begin
  if ((from_value is null) or (to_value is null)) then
		exit;

 	if (from_value = to_value) then
 	begin
		val = from_value;
		suspend;
 		exit;
 	end

 	if (from_value < to_value) then
 	begin
 		temp_value = from_value;
 		while (temp_value <= to_value) do
 		begin
 			val = temp_value;
 			temp_value = temp_value + 1;
 			suspend;
 		end
	end else
	begin
		temp_value = from_value;
 		while (temp_value >= to_value) do
 		begin
 			val = temp_value;
 			temp_value = temp_value - 1;
 			suspend;
 		end
	end
end^

create procedure fibonacci (first_term double precision, second_term double precision, terms integer )
returns (val double precision)
as
begin  
  val = first_term;
  suspend;  
  val = second_term;
  suspend;

  while (terms > 2) do
  begin    
    val = second_term + first_term;
    first_term = second_term;
    second_term = val;

    terms = terms - 1;
    suspend;
  end
end^

create procedure big_fibonacci (first_term varchar(7999), second_term varchar(7999), terms integer)
returns (pos integer, val varchar(8000))
as
begin   
  val = first_term; 
  pos = 1; 
  suspend;   
  val = second_term; 
  pos = 2; 
  suspend; 
   
  while (pos <= terms) do 
  begin         
    select result from big_add(:second_term, :first_term) 
    into :val; 
    first_term = second_term; 
    second_term = val; 
    
    pos = pos + 1; 
    suspend; 
  end 
end^

create procedure is_prime (i bigint)
returns (result boolean)
as
declare variable divide_by integer;
begin
	if (i < 2) then
	begin
		result = 0;		
		exit;
	end
	if (i = 2) then
	begin
		result = 1;
		exit;
	end		

	divide_by = 2;
  while(divide_by <= ceiling(sqrt(i))) do
  begin
    if (mod(i, divide_by) = 0) then
    begin            
      result = 0;     
      suspend; 
      exit;
    end
    divide_by = divide_by + 1;    
  end
  
  result = 1;
  suspend;
  exit;
end^


create procedure primes(prime_count integer)
returns (prime bigint)
as
declare variable n bigint;
declare variable is_prime boolean;
begin
	n = 2;
	while (prime_count > 0) do
	begin
		select result from is_prime(:n) into :is_prime;
		if (is_prime = 1) then
		begin
			prime = n;
			prime_count = prime_count - 1;
			suspend;
		end
		n = n + 1;
	end
end^

create procedure primes_bellow(n bigint)
returns (prime bigint)
as
declare variable is_prime boolean;
begin
	prime = 2;
	while (prime < n) do
	begin
		select result from is_prime(:prime) 
		into :is_prime;
		
		if (is_prime = 1) then
			suspend;

		prime = prime + 1;
	end
end^

create procedure split_string(s varchar(8000), separator char(1) = ' ')
returns (pos integer, val varchar(8000))
as
declare variable i integer;
declare variable c char(1);
begin
	i = 1;
	pos = 1;
	val = '';
	while (i <= char_length(s)) do
	begin
		c = substring(s from i for 1);
		if (c = separator) then
		begin
			suspend;
			val = '';
			pos = pos + 1;
		end
		if (c <> separator) then
			val = val || c;
		i = i + 1;
	end
	suspend;
end^

create procedure chars(s varchar(8000))
returns (pos integer, val char(1))
as
begin
	pos = 1;
	while (pos <= char_length(s)) do
	begin
		val = substring(s from pos for 1);
		suspend;
		pos = pos + 1;
	end
end^

create procedure factorial(i integer)
returns (result double)
as
begin
	if (i = 0) then
	begin
		result = 1;
		suspend;
		exit;
	end

	result = i;
	while (i > 1) do
	begin
		i = i - 1;
		result = result * i;		
	end
	suspend;
end^

create procedure collatz_sequence(i bigint)
returns (val bigint)
as
begin
	val = i;
	suspend;
	
	while (val > 1) do
	begin
		if (mod(val, 2) = 0) then
		begin
			val = val / 2;
			suspend;
		end
		else
		begin
			val = 3 * val + 1;
			suspend;
		end
	end
end^

create procedure divisors(i bigint)
returns (divisor bigint)
as
begin
  divisor = 1;
	while (divisor <= (i / 2)) do
	begin
		if (mod(i, divisor) = 0) then
			suspend;			
		
		divisor = divisor + 1;
	end
end^

create procedure dec_to_bin(i integer)
returns (val varchar(32))
as
declare variable bit integer;
begin
  val = '';
  bit = 0;
  while (bit < 32) do
  begin
    val = val || cast(bin_and(bin_shr(i, bit), 1) as char(1));    
    bit = bit + 1;
  end
  val = trim(leading '0' from reverse(val));
  suspend;
end^

create procedure big_add(n1 varchar(7999), n2 varchar(7999))
returns (result varchar(8000))
as
declare variable max_len integer;
declare variable i integer;
declare variable d1 integer;
declare variable d2 integer;
declare variable added integer;
declare variable carryover integer;
begin
	i = maxvalue(char_length(n1), char_length(n2));
	if (char_length(n1) <> char_length(n2)) then
	begin		
		n1 = lpad(n1, i, '0');
		n2 = lpad(n2, i, '0');
	end
		
	result = '';
	carryover = 0;
	while (i > 0) do
	begin
		d1 = substring(n1 from i for 1);
		d2 = substring(n2 from i for 1);
		
		added = d1 + d2 + carryover;
		carryover = 0;
		if (added > 9) then
		begin
			carryover = substring(added from 1 for char_length(added) - 1);
			added = cast(right(added, 1) as integer);
		end
		result = result || added;
		i = i - 1;
	end
	if (carryover > 0) then
		result = result || reverse(carryover);
	result = reverse(result);
	suspend;
end^

create procedure triangle_numbers
returns (triangle_number bigint)
as
declare variable c bigint;
begin
	c = 1;
	triangle_number = c;
	suspend;
	
	while (1 = 1) do
	begin
		c = c + 1;
		triangle_number = triangle_number + c;
		suspend;
	end
end^

create procedure lychrel_numbers(from_number bigint, to_number bigint = null, iterations integer = 49)
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