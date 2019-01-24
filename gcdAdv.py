def gcd(a, b):
    if b == 0:
        return a
    return gcd(b, a % b)

t = int(input().strip())
for _ in range(t):
    a, b = tuple(map(int, input().strip().split()))
    print(gcd(a, b))
