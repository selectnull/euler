from math import sqrt
from math import ceil
	
class PrimeNumbers:
	def __init__(self):
		self.prime = 1
		self.n = 0
		self.cache = {2: True}
		
	def is_prime(self, number):
		if number < 2:
			return False
			
		if number in self.cache:
			return self.cache[number]
					
		divisor = 2
		while divisor <= ceil(sqrt(number)):
			if number % divisor == 0:
				self.cache[number] = False
				return False
			else:
				divisor += 1
		
		self.cache[number] = True
		return True
		
	def next(self):
		while True:			
			self.prime += 1
			if self.is_prime(self.prime):
				self.n += 1
				return (self.n, self.prime)

	def __iter__(self):
		return self
		

def PrimeFactors(number):
	result = []	
	
	divisor = 2	
	while divisor <= number:
		if number % divisor == 0:
			result.append(divisor)			
			#print number, divisor
			number = number // divisor
		else:
			divisor += 1
		
	return result