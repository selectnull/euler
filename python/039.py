#unsolved

solutions = 0
max_solutions = 0
pindex = 0

for p in range(120, 121):
	solutions = 0
	for a in range(1, 1000):
		for b in range(a, 1000):
			for c in range(b, 1000):
				if a + b + c == p and a*a + b*b == c*c:
					solutions += 1
	print '%d -> %d' % (p, solutions)
	if solutions > max_solutions:
		max_solutions = solutions
		pindex = p
		
print p