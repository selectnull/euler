# unsolved

rsum = 0
for a in range(3, 1001):
	rmax = 0
	#print '___'
	#print a
	#print '___'
	for n in range(1, 20):
		r = ((a - 1)**n + (a + 1)**n) % a**2
		#print r
		if r > rmax:
			rmax = r
	rsum += rmax
	#if a % 50 == 0:
		#print '.'
	
print 'unsolved %d' % rsum
