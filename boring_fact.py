def fact_modulo(n, p):
  fact = 1
  for i in range(1, n + 1):
    fact = (fact * i) % p
  return fact


t = int(input())
for _ in range(t):
  n, p = tuple(map(int, input().strip().split()))
  print(fact_modulo(n, p))
