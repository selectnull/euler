
def is_89(i):
	chain = i
	while(1==1):
		new_chain = 0
		for c in str(chain):
			new_chain = new_chain + int(c)**2		
		chain = new_chain
		
		if (new_chain == 1):
			return 0
		if (new_chain == 89):
			return 1
			
how_many = 0
for i in range(1, 10000001):
	how_many += is_89(i)
	
print how_many