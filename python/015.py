
def walk_the_path(x, y, max, result):		
	if x < max:
		result = walk_the_path(x + 1, y, max, result)
	if y < max:
		result = walk_the_path(x, y + 1, max, result)
		
	if x == max and y == max:
		result += 1
		
	return result


#result = 0
#for i in range(0, 12):
#i=2
#print walk_the_path(0, 0, i, result = 0)

#print paths.count((max, max))
#print result

#solution is 137846528820

def fact(x): return (1 if x==0 else x * fact(x-1))

print fact(20+20) / (fact(20) * fact(20))