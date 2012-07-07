	
class fibonacci:
	def __init__(self):
		self.s1 = 1
		self.s2 = 1
		
	def next(self):
		(self.s1, self.s2, current) = (self.s1 + self.s2, self.s1, self.s2)
		return current
		
	def __iter__(self):
		return self
		

	