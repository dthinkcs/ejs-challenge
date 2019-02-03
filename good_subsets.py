t = int(input().strip())

for _ in range(t):
    output = []
    n = int(input().strip())
    arr = sorted(list(map(int, input().strip().split())))


    M = pow(10, 9) + 7

    outputArr = [0] * (arr[-1] + 1)
	#initializing all values with one
    for num in arr:
      outputArr[num] += 1

    # for every num in arr start with 2*num if outpp
    for num in arr:
      idx = num + num
      while idx <= len(outputArr) - 1:
        if (outputArr[idx] != 0):
          outputArr[idx] = (outputArr[idx] + outputArr[num]) % M
        idx += num

    print(sum(outputArr) % M)
