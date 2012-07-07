	
class Triangles:
	def __init__(self):
		self.value = 1		
		self.n = 0
		
	def next(self):				
		self.value = self.n * (self.n + 1) / 2
		self.n += 1
		return (self.n, self.value)
		
	def __iter__(self):
		return self
		
class Squares:
	def __init__(self):
		self.value = 1
		self.n = 0
		
	def next(self):
		self.value = self.next ** 2
		self.n += 1
		return (self.n, self.value)
	
	def __iter__(self):
		return self
		