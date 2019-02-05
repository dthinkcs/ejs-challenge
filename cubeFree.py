from math import floor

input_limit = 10** 6
arr_size = input_limit + 1
ans = [0] * arr_size

# find cubes -> mark them as -1
last_check = int(floor(input_limit ** 1/3))
for i in range(2, last_check + 1):
    ans[i**3] = -1

# travel along the arr and find wherever -1 then use the sieve to
# // 2
for i in range(2, len(ans)):
    if ans[i] == -1:
        k = 2
        j = 2 * i
        while j < len(ans):
            ans[j] = -1
            k += 1
            j = k * i

# cumulative frequencies
prev_non_zero = 0
for i in range(1, len(ans)):
    if arr[i] != -1:
        arr[i] = prev_non_zero + 1
        prev_non_zero = arr[i]

t = int(input().strip())
for i in range(t):
    n = int(input().strip())
    #index = cubeFreeIndex(n)
    if ans[n] != -1:
        print("Case {}: {}".format((i + 1), ans[n]))
    else:
        print("Case {}: Not Cube Free".format(i + 1))
