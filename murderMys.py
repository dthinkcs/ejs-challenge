
def solution(stairs, index=0):
    if index == len(stairs):
        return 0

    curr_sum = 0
    for i in range(index):
        if stairs[i] < stairs[index]:
            curr_sum += stairs[i]

    return curr_sum + solution(stairs, index + 1)

t = int(input())
for _ in range(t):
    n = int(input())
    stairs = list(map(int, input().strip().split()))
    print(solution(stairs))
