from PrimeNumbers import PrimeNumbers

def quadratic(a, b, n):
	return (n * n + a * n + b)

result = []
check = PrimeNumbers()
	
for a in range(-999, 1000):
	for b in range(-999, 1000):
		n = 0
		while check.is_prime(quadratic(a, b, n)):
			n += 1
			
		result.append((a, b, n))
	
max_n = 0
for r in result:
	aa, bb, nn = r
	if nn > max_n:		
		max_n, result_a, result_b = nn, aa, bb
		
print result_a * result_b
