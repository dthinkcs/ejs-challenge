
def feed(candiesArr, choice_num_candies, k):
    curr_sum = 0
    for num_candies in candiesArr:
        curr_sum += num_candies // choice_num_candies
        if curr_sum >= k:
            return True
            
    return False

def solution(candiesArr, k):
    choicesArr = [i for i in range(1, max(candiesArr) + 1)]

    # change the sub-algorithm of giving a choice (instead of linear make it logatihmic) here
    best_choice = 0
    l = 0
    h = len(choicesArr) - 1
    while l <= h:
        mid = (l + h) // 2
        choice = choicesArr[mid]
        if feed(candiesArr, choice, k):
            best_choice = choice
            l = mid + 1
        else:
            h = mid - 1

    print(best_choice)



t = int(input())
for _ in range(t):
    n, k = tuple(map(int, input().strip().split()))
    candiesArr = list(map(int, input().strip().split()))
    solution(candiesArr, k)
