def permutations(iterable, r=None):
	# permutations('ABCD', 2) --> AB AC AD BA BC BD CA CB CD DA DB DC
	# permutations(range(3)) --> 012 021 102 120 201 210
	pool = tuple(iterable)
	n = len(pool)
	r = n if r is None else r
	indices = range(n)
	cycles = range(n, n-r, -1)
	yield tuple(pool[i] for i in indices[:r])
	while n:
		for i in reversed(range(r)):
			cycles[i] -= 1
			if cycles[i] == 0:
				indices[i:] = indices[i+1:] + indices[i:i+1]
				cycles[i] = n - i
			else:
				j = cycles[i]
				indices[i], indices[-j] = indices[-j], indices[i]
				yield tuple(pool[i] for i in indices[:r])
				break
		else:
			return

from PrimeNumbers import PrimeNumbers
pgen = PrimeNumbers()
c = 0
# the permutations started with 98 and 8 didn't get any prime
for i in permutations('7654321'):
	s = ''
	for x in i:
		s += x
	
	if pgen.is_prime(int(s)):
		print s
		break