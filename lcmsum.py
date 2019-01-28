## Read input as specified in the question.
## Print output as specified in the question.

def gcd(a, b):
  if b == 0:
    return a
  return gcd(b, a % b)

def lcm(a, b):
  return ((a * b) // gcd(a, b))

def soln(n):
  summation = 0
  for i in range(1, n + 1):
    summation += lcm(i, n)
  return summation


print(soln(int(input())))
