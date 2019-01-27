def isPrime(n):
	if n == 1:
		return False
	for i in range(2, n):
		if n % i == 0:
			return False
	return True

def numOfDistinctPrimeFactors(n):
	count = 0
	for i in range(2, n):
		if n % i == 0 and isPrime(i):
			count += 1
	return count

def numOfNFactorfulBetween(a, b, n):
	count = 0
	for i in range(a, b + 1):
		if numOfDistinctPrimeFactors(i) == n:
			count += 1
	return count


t = int(input().strip())
for i in range(t):
	a, b, n = tuple(map(int, input().strip().split()))
	ans = numOfNFactorfulBetween(a, b, n)
	print(ans)
