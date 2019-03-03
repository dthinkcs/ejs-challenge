#include <bits/stdc++.h>
using namespace std;

 //int lis(int arr[], int n) {
 //

int kadane(int arr[], int n)
{
  int curr_sum = 0;
  int max_sum = INT_MIN;

  for (int i = 0; i < n; i ++)
  {
    curr_sum = curr_sum + arr[i];
    if (curr_sum > max_sum)
      max_sum = curr_sum;
    if (curr_sum < 0)
       curr_sum = 0;
  }
  return max_sum;
}

 int kadaneASSUMINGansisPositive(int arr[], int n) {

     // dp[i] represents the LIS with ith index as the LAST ELEEMENT
     // int* dp = new int[n];
     int curr_sum = 0;
     int max_sum = 0;

     for (int i = 0; i < n; i++)
     { // 5 6 -10 4 5
       curr_sum = curr_sum + arr[i];
       if (curr_sum > max_sum)
          max_sum = curr_sum;
       if (curr_sum < 0)
          curr_sum = 0;
     }

     return max_sum;
 }
