def is_prime(n):
  if n == 1:
    return False
  for i in range(2, n):
    if n % i == 0:
      return False

  return True

def primes_between(n, m):
  count = 0
  for i in range(n, m + 1):
      if is_prime(i):
	       count+=1

  return count

t = int(input())
for i in range(t):
	n, m = tuple(map(int, input().strip().split()))
	print(primes_between(n, m))
