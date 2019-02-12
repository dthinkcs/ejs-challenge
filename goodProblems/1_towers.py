

# Python program to find
# maximum amount of water that can
# be trapped within given set of bars.
# Space Complexity : O(1)

def findWater(arr,n):

    # initialize output
    result = 0

    # maximum element on left and right
    left_max = 0
    right_max = 0

    # indices to traverse the array
    lo = 0
    hi = n-1

    while(lo <= hi):

        if(arr[lo] < arr[hi]):

            if(arr[lo] > left_max):

                # update max in left
                left_max = arr[lo]
            else:

                # water on curr element = max - curr
                result += left_max - arr[lo]
            lo+=1

        else:

            if(arr[hi] > right_max):
                # update right maximum
                right_max = arr[hi]
            else:
                result += right_max - arr[hi]
            hi-=1

    return result

# Driver program
n = input()
arr = list(map(int, input().strip().split()))
n = len(arr)


# find the max
maxIndex = arr.index(max(arr))
new_arr = arr[:]
new_arr[maxIndex] = -1
secondMaxIndex = new_arr.index(max(new_arr))
#print(maxIndex, secondMaxIndex)

arr[0], arr[maxIndex] = arr[maxIndex], arr[0]
arr[-1], arr[secondMaxIndex] = arr[secondMaxIndex], arr[-1]
print(findWater(arr, n))


# To show himself superior than Mello, Near challenged him for a task. The task is -
# There are N rectangular pillars which are 1 unit wide and have certain height (say H[i] for ith pillar). Now Mello has to tell the maximum amount of water (in units) that he can hold without overflowing in between these pillars by arranging and joining them together.
# Mello is not as smart as Near so he came to you for help. Can you help him?
# Note : You cannot topple these pillars i.e. pillars should be vertical, they can't be laid horizontally.
# Constraints :
# 2 <= N <= 1000
# 1 <= H[i] <= 10^5
# Input Format :
# Line 1 : An integer N denoting the number of pillars.
#
# Line 2 : N space separated integers denoting the height of these N pillars
#
# Output Format :
# In a single line, print the maximum amount (i.e. units) of water that you can hold in between these pillars.
#
# Sample Input 1 :
# 4
# 1 4 2 4
# Sample Output 1 :
# 5
