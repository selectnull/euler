from math import ceil
from math import sqrt

# def divisors(number):
	# result = []	
		
	# divisor = 2
	# for i in range(2, math.sqrt(number)):
		# if i % divisor == 0:
			# result.append(divisor)
			# number = number // divisor
			
		# divisor += 1
		
	# return result
	
def divisors(n):
	divisors = set([1])
	for i in range(1, int(ceil(sqrt(n))) + 1):
		if n % i == 0:
			divisors.add(i)
			divisors.add(n / i)
	
	return divisors