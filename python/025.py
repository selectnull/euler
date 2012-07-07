
from fibonacci import *

f = fibonacci()
fibonacci_term = 0

for i in f:
	fibonacci_term += 1
	if len(str(i)) >= 1000:
		break	
		
print fibonacci_term
		