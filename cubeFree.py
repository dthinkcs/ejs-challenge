def is_perfect_cube(x):
    x = abs(x)
    return int(round(x ** (1. / 3))) ** 3 == x


def cubeFreeIndex(n):
    if n == 1:
        return 1

    if is_perfect_cube(n):
        return -1

    k = 2 # coz we have checked for 1 and n
    # now we check for [2, (n - 1)]
    for i in range(2, n):
        # for all divisors(except 1) MUST BE\
        if not is_perfect_cube(i):
            k += 1
    return k


t = int(input().strip())
for i in range(t):
    n = int(input().strip())
    index = cubeFreeIndex(n)
    if index != -1:
        print("Case {}: {}".format((i + 1), index))
    else:
        print("Case {}: Not Cube Free".format(i + 1))
