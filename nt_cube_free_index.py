def is_perfect_cube(x):
    x = abs(x)
    return int(round(x ** (1. / 3))) ** 3 == x

def is_cube_free(n, ht):
    for i in range(2, n + 1):
        if n % i == 0:
            if i in ht:
                if ht[i] == 0:
                    return False
            else:
                if is_perfect_cube(i):
                    return False
    return True

def cubeFreeIndex(n,ht):
    if n in ht:
        return ht[n]

    if n == 1:
        return 1

    if not is_cube_free(n, ht):
        ht[n] = 0
        return 0

    # since i am sure that I am myself a cube_free_number
    for i in range(1, n):
        small_ans = cubeFreeIndex(n - i)
        if small_ans != 0: # if the small_ans is zero then it is not_cube_free
            new_ans = 1 + small_ans
            ht[n] = new_ans
            return new_ans



# def cubeFreeIndex(n, ht):
#     if n == 1:
#         return 1
#
#     # 16 ->  2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
#     if not is_cube_free(n):
#       return 0
#
#     k = 2 # coz we have checked for 1 and n
#     # now we check for [2, (n - 1)]
#     for i in range(n - 1, 1, -1):
#           if is_cube_free(i):
#               k += 1
#
#     # first improtvement
#     ht[n] = k
#     return k
#

t = int(input().strip())
for i in range(t):
    n = int(input().strip())
    ht = {}
    index = cubeFreeIndex(n, ht)
    if index != 0:
        print("Case {}: {}".format((i + 1), index))
    else:
        print("Case {}: Not Cube Free".format(i + 1))
