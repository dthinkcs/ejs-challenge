def subsets(arr, output):
  if len(arr) == 0:
    output.append([])
    return # here was a BUG

  subsets(arr[1:], output)
  for i in range(len(output)):
    output.append([arr[0]] + output[i])

def allOfSDivides(s):
    for i in range(len(s) - 1):
        if s[i + 1] % s[i] != 0:
            return False
    return True

t = int(input().strip())

for _ in range(t):
    output = []
    n = int(input().strip())
    arr = sorted(list(map(int, input().strip().split())))
    subsets(arr, output)
    # for i in range(len(output)):
    #   print(output[i])
    count = 0
    for s in output:
        if allOfSDivides(s):
            count += 1

    print(count - 1) # dont take the VACOUS TRUTH
