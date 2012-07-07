
from FigurateNumbers import Triangles
from Numbers import divisors

triangles = Triangles()

for triangle in triangles:
	n, value = triangle
	
	if len(divisors(value)) > 500:
		print value
		break
	
	
