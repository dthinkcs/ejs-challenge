M = 1000000007

def numberOfPossibleDecodings(numstr, ans=dict()):
    if numstr == "":
        return 1
    if numstr in ans:
        return ans[numstr]
    smallAns1 = numberOfPossibleDecodings(numstr[1:], ans)
    smallAns2 = 0
    if len(numstr) > 1 and int(numstr[0:2]) < 27:
        smallAns2 = numberOfPossibleDecodings(numstr[2:], ans)
    finalAns = (smallAns1 % M + smallAns2 % M) % M
    ans[numstr] = finalAns
    return finalAns

while True:
    a = str(input())
    if a == "0":
        break
    print(numberOfPossibleDecodings(a))
