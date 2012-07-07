from PrimeNumbers import PrimeNumbers

def truncated(i):
	result = []
	stri = str(i)	
	leni = len(stri)
	for x in range(1, leni):
		result.append(stri[x:leni])
		result.append(stri[0:x])
	return result

def list_of_11_primes():
	result = []
	c = 0
	
	pgen = PrimeNumbers()	
	for p in pgen:
		prime = p[1]
		if prime < 10:
			continue
		
		truncated_are_primes = True
		for t in truncated(prime):
			if not pgen.is_prime(float(t)):
				truncated_are_primes = False
				break
		if truncated_are_primes:	
			c += 1
			result.append(prime)
			
		if c == 11:
			break
	return result

solution = 0
for x in list_of_11_primes():
	solution += x
	
print solution
