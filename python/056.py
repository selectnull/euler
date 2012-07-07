digit_sum = 0
a = range(1, 100)
b = range(1, 100)

for ai in a:
	for bi in b:
		sum = 0
		for digit in str(ai**bi):
			sum += int(digit)
		if sum > digit_sum:
			digit_sum = sum

print digit_sum