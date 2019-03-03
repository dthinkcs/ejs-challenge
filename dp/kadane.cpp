#include <bits/stdc++.h>
using namespace std;

 //int lis(int arr[], int n) {
 int kadane(int arr[], int n) {

     // dp[i] represents the LIS with ith index as the LAST ELEEMENT
     // int* dp = new int[n];
     for (int i = 0; i < n; i++)
         dp[i] = 1;

     for (int i = 1; i < n; i++)
         for (int j = i - 1; j >= 0; j--)
             if (arr[j] < arr[i] && dp[j] + 1 > dp[i])
                 dp[i] = dp[j] + 1;

     return *max_element(dp, dp + n);
 }
