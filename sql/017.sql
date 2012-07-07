create table numbers_words(
number integer not null,
word varchar(40) not null,
constraint pk_number_word primary key(number)
);

commit;

insert into numbers_words(number, word) values(1, 'one');
insert into numbers_words(number, word) values(2, 'two');
insert into numbers_words(number, word) values(3, 'three');
insert into numbers_words(number, word) values(4, 'four');
insert into numbers_words(number, word) values(5, 'five');
insert into numbers_words(number, word) values(6, 'six');
insert into numbers_words(number, word) values(7, 'seven');
insert into numbers_words(number, word) values(8, 'eight');
insert into numbers_words(number, word) values(9, 'nine');
insert into numbers_words(number, word) values(10, 'ten');
insert into numbers_words(number, word) values(11, 'eleven');
insert into numbers_words(number, word) values(12, 'twelve');
insert into numbers_words(number, word) values(13, 'thirteen');
insert into numbers_words(number, word) values(14, 'fourteen');
insert into numbers_words(number, word) values(15, 'fifteen');
insert into numbers_words(number, word) values(16, 'sixteen');
insert into numbers_words(number, word) values(17, 'seventeen');
insert into numbers_words(number, word) values(18, 'eighteen');
insert into numbers_words(number, word) values(19, 'nineteen');
insert into numbers_words(number, word) values(20, 'twenty');
insert into numbers_words(number, word) values(30, 'thirty');
insert into numbers_words(number, word) values(40, 'forty');
insert into numbers_words(number, word) values(50, 'fifty');
insert into numbers_words(number, word) values(60, 'sixty');
insert into numbers_words(number, word) values(70, 'seventy');
insert into numbers_words(number, word) values(80, 'eighty');
insert into numbers_words(number, word) values(90, 'ninety');
insert into numbers_words(number, word) values(100, 'hundred');
insert into numbers_words(number, word) values(1000, 'thousand');


set term ^;

recreate procedure number_to_word(n integer)
returns (result varchar(2000))
as
declare variable d1 integer;
declare variable d10 integer;
declare variable d100 integer;
declare variable tens varchar(100);
begin
	if (n > 1000) then
	begin
		result = null;
		suspend;
		exit;
	end
	
	if (exists(select null from numbers_words where number = :n)) then
	begin
		select word from numbers_words where number = :n
		into :result;
		if (n in (100, 1000)) then
			result = 'one ' || result;
		suspend;
		exit;
	end
	
	d10 = cast(right(n, 2) as integer) / 10 * 10;
	d1 = cast(right(n, 1) as integer);
	
	select word from numbers_words where number = :d10 + :d1
	into :tens;
	
	if (tens is null) then
		select
		  (select word from numbers_words where number = :d10) || '-' ||
		  (select word from numbers_words where number = :d1)
		from rdb$database	into :tens;	

	if (n < 100) then
	begin		
		result = tens;
		suspend;
		exit;
	end
	
	if (n > 100) then
	begin
		d100 = 100 * cast(substring(cast(n as char(3)) from 1 for 1) as integer);

		if (tens is not null) then
			tens = ' and ' || tens;
		else
			tens = '';

		select
			(select word from numbers_words where number = :d100 / 100) || ' ' ||			
			(select word from numbers_words where number = 100) || :tens
		from rdb$database	into :result;
		suspend;
		exit;
	end
end^

set term ;^

commit;

select sum(char_length(replace(replace((
	select result from number_to_word(val)
), '-', ''), ' ', ''))) 	
from integers(1, 1000)