$numbers = 1..999

$sum = 0
foreach($n in $numbers)
{
	if ($n % 3 -eq 0 -or $n % 5 -eq 0)
		{$sum += $n}
}

$sum