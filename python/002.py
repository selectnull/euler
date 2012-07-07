
from fibonacci import *

f = fibonacci()
sum_of_even_fibonacci = 0

for i in f:
	if i > 4000000:
		break
	if i % 2 == 0:
		sum_of_even_fibonacci += i
		
print sum_of_even_fibonacci
		