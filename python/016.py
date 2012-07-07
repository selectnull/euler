# 1st try
solution = 0
for char in str(2**1000):
	solution += int(char)
print solution

# 2nd try
solution = 0
for i in map(int, [c for c in str(2**1000)]):
	solution += i
print solution

# 3rd try
print sum(map(int, [c for c in str(2**1000)]))
