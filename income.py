def f(f0, f1, n):
  curr = f0
  M = pow(10, 9) + 7
  for i in range(n):
      if i == 0:
          prev, curr = f0, f1
      else:
          prev, curr = curr, ((curr + prev)%M + (curr * prev)%M)%M
  return curr


t = int(input())
for i in range(t):
  f0, f1, n = tuple(map(int, input().strip().split()))
  print(f(f0, f1, n))
