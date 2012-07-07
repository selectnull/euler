from PrimeNumbers import PrimeNumbers

for i in PrimeNumbers():
	n, prime = i
	if n == 10001:
		print prime
		break