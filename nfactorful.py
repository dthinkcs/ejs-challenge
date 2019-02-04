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

input_limit = 10**6  + 1
ans_arr = [0] * (input_limit)
#ans_arr[i] represents the number of distinct prime fators
ans_arr[0], ans_arr[1] = 0, 0
for i in range(2, len(ans_arr)):
	if ans_arr[i] == 0: # this means we found a prime number
		#ans_arr[i] = 1
		# DO THE SIEVE
		j = i
		k = 2
		while j < len(ans_arr):
			ans_arr[j] += 1
			j = i * k # multiplying the i index example 2 with 2, 2 with 3 and so on
			k += 1
#print(ans_arr)

ans_matrix = []
#ans_matrix[i] [j] = cumulative frequency(how many numbers) from 1 to including j that have i distinct prime factors
ans_matrix.append([0] + [1] * (input_limit - 1))
for i in range(10):
	ans_matrix.append([0] * (input_limit)) # change this to 10**6

#print(ans_matrix)
for i in range(1, 10 + 1):
	for j in range(1, input_limit):
		if ans_arr[j] == i:
			ans_matrix[i][j] = 1 + ans_matrix[i][j - 1]
		else:
			ans_matrix[i][j] = ans_matrix[i][j - 1]
#print(ans_matrix)

t = int(input().strip())
for i in range(t):
	a, b, n = tuple(map(int, input().strip().split()))
	#ans = numOfNFactorfulBetween(a, b, n)


	#print(ans_matrix)

	ans = ans_matrix[n][b] - ans_matrix[n][a - 1]
	print(ans)
